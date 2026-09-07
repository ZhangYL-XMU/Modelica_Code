within SFR_Striling.Fluid.Pipes;
model pipe_new "圆管（液态金属）自包含版本：物性层不引入 ThermodynamicState record 数组（T/p 标量数组），兼容 ph 版介质（Sodium）与常物性介质"
  import SFR_Striling.Utilities.Functions;
  import Modelica.Constants;
  import SI = Modelica.SIunits;

  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium 
    annotation(choicesAllMatching = true);

  /******************************/
  /*           参数             */
  /******************************/
  //几何参数
  parameter Integer N(min = 2) = 2 "节点数";
  final parameter Integer Nw = N - 1 "控制体数量";
  final parameter Integer[Nw] n_channels(each min = 1.0) = fill(n_pipe, Nw) "平行管数量" annotation(Dialog(group = "几何参数"));
  parameter Integer n_pipe = 1 "平行管数量" annotation(Dialog(group = "几何参数"));
  parameter Modelica.Units.SI.Length L_total = 10 "管道总长" annotation(Dialog(group = "几何参数"));
  parameter SI.Length L_heat = L_total "加热段长度" annotation(Dialog(group = "结构参数"));
  parameter Modelica.Units.SI.Length Dh = 0.05 "单管道水力直径" annotation(Dialog(group = "几何参数"));
  parameter Modelica.Units.SI.Length height_ab = 0 "高度差(a-b)" annotation(Dialog(group = "几何参数"));
  parameter Real roughness = 0.0015 "管壁粗糙度" annotation(Dialog(group = "几何参数"));

  final parameter Modelica.Units.SI.PerUnit e = roughness / Dh "相对粗糙度";    annotation(Dialog(group = "几何参数"));
  final parameter Modelica.Units.SI.Area A_cross = Constants.pi * Dh ^ 2 / 4 "单管道横截面积"     annotation(Dialog(group = "几何参数"));
  final parameter Modelica.Units.SI.Length[Nw] L = ones(Nw) * L_total / Nw "每一段的长度"   annotation(Dialog(group = "几何参数"));
  final parameter Modelica.Units.SI.Length[Nw] Dhyd = ones(Nw) * Dh "每一段的水力直径（单管道）"     annotation(Dialog(group = "几何参数"));
  final parameter Modelica.Units.SI.Height[Nw] height = ones(Nw) * height_ab / Nw "每一段的高度差"    annotation(Dialog(group = "几何参数"));
  final parameter Modelica.Units.SI.Area[Nw] A = ones(Nw) * A_cross "每一段的横截面积 (单管道)"     annotation(Dialog(group = "几何参数"));
  final parameter Modelica.Units.SI.Volume[Nw] V = n_channels .* A .* L "每一段管道的总容积"     annotation(Dialog(group = "几何参数"));
  final parameter Modelica.Units.SI.Volume V_tot = sum(V) "管道总容积";
  final parameter Modelica.Units.SI.Area A_mean = sum(A) / Nw "平均横截面积";

  parameter Boolean wallHeatTransfer = true "是否考虑换热" annotation(Dialog(group = "壁面传热"));
  parameter Modelica.Fluid.Types.Dynamics momentumDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial "动量方程形式：SteadyState=稳态压降（泵锁总流量+并联分流场景用），否则动态动量" annotation(Dialog(group = "流阻模型"));

  /******************************/
  /*           初始化            */
  /******************************/
  parameter SI.Pressure p_start = 1e5 "初始压力" annotation(Dialog(tab = "初始化", group = "压力"));
  parameter Boolean initFromEnthalpy = true "true-使用比焓进行初始化，false-使用温度进行初始化" annotation(Dialog(tab = "初始化", group = "比焓"));
  parameter SI.SpecificEnthalpy h_start = 500e3 "初始比焓" annotation(Dialog(enable = initFromEnthalpy, tab = "初始化", group = "比焓"));
  parameter SI.Temperature T_start = 298.15 "流体初始化温度" annotation(Dialog(enable = not initFromEnthalpy, tab = "初始化", group = "温度"));
  parameter SI.Temperature T_wall_start = T_start "壁面初始温度" annotation(Dialog(tab = "初始化", group = "温度"));
  parameter SI.MassFlowRate m_flow_start = 0.1 "初始质量流量" annotation(Dialog(tab = "初始化", group = "质量流量"));
  parameter SI.MassFraction[Medium.nXi] X_start = Medium.reference_X "初始组分" annotation(Dialog(tab = "初始化", group = "组分"));

  /******************************/
  /*          修正系数           */
  /******************************/
  parameter Real CF_PressureLoss = 1.0 "压降修正系数" annotation(Dialog(group = "流阻模型"));
  parameter Real CF_HeatTransfer = 1.0 "传热修正系数" annotation(Dialog(group = "壁面传热"));

  final parameter Modelica.Units.SI.Area A_H = Constants.pi * Dh * L_heat / Nw "每一段管道的换热面积 (单管道) " annotation(Dialog(group = "换热"));
  final parameter Modelica.Units.SI.Area[Nw] A_heat = ones(Nw) * A_H "每一段管道的换热面积 (单管道)" annotation(Dialog(group = "换热"));

  /******************************/
  /*           接口             */
  /******************************/
  Modelica.Fluid.Interfaces.FluidPort_a portA(
    redeclare package Medium = Medium,
    m_flow = m_flow[1] * n_pipe,
    p = p[1],
    h_outflow(start = h_start) = inStream(portA.h_outflow))
    "流体入口" annotation(Placement(transformation(origin = {-99.7774, -0.180755},
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Interfaces.FluidPort_b portB(
    redeclare package Medium = Medium,
    m_flow = -m_flow[N] * n_pipe,
    p = p[N],
    h_outflow(start = h_start) = h[N])
    "流体出口" annotation(Placement(transformation(origin = {100, 0},
    extent = {{10, -10}, {-10, 10}})));
  Modelica.Fluid.Interfaces.HeatPorts_a[Nw] wall if wallHeatTransfer
    "热流接口" annotation(Placement(transformation(origin = {0, 38},
    extent = {{-40, -10}, {40, 10}})));

  /******************************/
  /*           点变量            */
  /******************************/
  SI.Temperature[N] T(each start = T_start, each stateSelect = StateSelect.never) "流体温度";
  SI.SpecificEnthalpy[N] h(each start = h_start) "流体焓流";
  SI.Pressure[N] p(each start = p_start) "流体压力";
  Medium.MassFlowRate m_flow[N](each start = m_flow_start) "单管质量流";

  /******************************/
  /*         控制体变量          */
  /******************************/
  SI.Temperature[Nw] T_wall(each start = T_wall_start) "壁面温度";
  SI.Power[Nw] Q "壁面流入热流量";
  SI.ReynoldsNumber[Nw] Re "单控制体雷诺数";
  Medium.DynamicViscosity[Nw] mu "动力粘度";
  Medium.MassFlowRate m_flow_avg[Nw](each start = m_flow_start) "质量流";
  Medium.SpecificInternalEnergy IE[Nw] "流体内能";
  SI.Density[Nw] rho "单控制体平均密度";
  SI.Velocity[Nw] u "液体流速";
  Medium.SpecificHeatCapacity[Nw] cp "定压比热";
  Medium.ThermalConductivity[Nw] k "热导率";
  Medium.Temperature[Nw] Tf "液体温度(控制体平均)";
  SI.Pressure[Nw] Dpf "摩擦压降";
  SI.Pressure[Nw] Dpele "提升压降(浮力/静压)";
  Real[Nw] f_W "摩擦系数";

  initial equation
    for i in 2:N loop
      h[i] = h_start;
    end for;

equation
/**************************************边界条件*********************************************/
  h[1] = inStream(portA.h_outflow);
  portA.Xi_outflow = inStream(portB.Xi_outflow);
  portB.Xi_outflow = inStream(portA.Xi_outflow);
  portA.C_outflow = inStream(portB.C_outflow);
  portB.C_outflow = inStream(portA.C_outflow);

/************************************节点物性计算（标量链，无 ThermodynamicState record 数组）********************************************/
  for i in 1:N loop
    T[i] = Medium.temperature_phX(p[i], h[i]);
  end for;

/*************************************控制体物性计算********************************************/
  for i in 1:Nw loop
    m_flow_avg[i] = (m_flow[i] + m_flow[i+1]) / 2;
    Tf[i] = (T[i] + T[i+1]) / 2;
    rho[i] = (Medium.density(Medium.setState_phX(p[i], h[i])) + Medium.density(Medium.setState_phX(p[i+1], h[i+1]))) / 2;
    mu[i] = (Medium.dynamicViscosity(Medium.setState_phX(p[i], h[i])) + Medium.dynamicViscosity(Medium.setState_phX(p[i+1], h[i+1]))) / 2;
    cp[i] = (Medium.specificHeatCapacityCp(Medium.setState_phX(p[i], h[i])) + Medium.specificHeatCapacityCp(Medium.setState_phX(p[i+1], h[i+1]))) / 2;
    k[i] = (Medium.thermalConductivity(Medium.setState_phX(p[i], h[i])) + Medium.thermalConductivity(Medium.setState_phX(p[i+1], h[i+1]))) / 2;
    IE[i] = (Medium.specificInternalEnergy(Medium.setState_phX(p[i], h[i])) + Medium.specificInternalEnergy(Medium.setState_phX(p[i+1], h[i+1]))) / 2;
    u[i] = m_flow_avg[i] / (rho[i] * A[i]);
    Re[i] = SFR_Striling.Utilities.Functions.reynoldsNumberSmooth(m_flow_avg[i], Dhyd[i], A[i], mu[i]);

    f_W[i] = SFR_Striling.Fluid.Utilities.PressureDrop.Weishach(Re[i], roughness / Dhyd[i]);
    Dpf[i] = CF_PressureLoss * f_W[i] * (L[i] / Dhyd[i]) * (rho[i] * u[i] ^ 2 / 2);
    Dpele[i] = Constants.g_n * height[i] * rho[i];
  end for;

/**************************************换热计算*********************************************/
  if wallHeatTransfer then
    for i in 1:Nw loop
      Q[i] = CF_HeatTransfer * (5.5 + 0.025 * (Re[i] * cp[i] * mu[i] / k[i]) ^ 0.8) * k[i] / Dhyd[i] * (n_pipe * Constants.pi * Dhyd[i] * L[i]) * (T_wall[i] - Tf[i]);
    end for;
    wall.T = T_wall;
    wall.Q_flow = Q;
  else
    for i in 1:Nw loop
      T_wall[i] = Tf[i];
      Q[i] = 0;
    end for;
  end if;

/******************************/
/*           守恒方程          */
/******************************/
  for i in 1:Nw loop
    /**************************************质量守恒*********************************************/
    der(rho[i]) * V[i] = m_flow[i] * n_pipe - m_flow[i + 1] * n_pipe;
    /**************************************动量守恒*********************************************/
    if momentumDynamics == Modelica.Fluid.Types.Dynamics.SteadyState then
      0 = p[i] - p[i + 1] - (Dpf[i] - Dpele[i]);
    else
      der(rho[i] * u[i]) * L[i] = p[i] - p[i + 1] - (Dpf[i] - Dpele[i]);
    end if;
    /**************************************能量守恒*********************************************/
    der(rho[i] * IE[i]) * V[i] = m_flow[i] * h[i] * n_pipe - m_flow[i + 1] * h[i + 1] * n_pipe + Q[i];
  end for;

  annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}, grid={2,2})),
    Documentation(info="<html>
<p><b>pipe_new</b>：SFR 圆管（液态金属）的自包含实现，与 <b>pipe</b> 同构（几何/初始化/修正系数/守恒方程完全一致），
但物性层<b>不引入 <code>Medium.ThermodynamicState</code> record 数组</b>——节点温度直接由
<code>temperature_phX(p,h)</code> 标量链计算（<code>T</code> 数组声明 <code>StateSelect.never</code>），
目的：规避 TY 初始化解算器对 ph 版介质（函数反演链）下 record 数组元素的状态化/伪状态病态，
兼容 <code>SFR.Media.Sodium.Sodium</code>（ph）与常物性介质。</p>
</html>"));
end pipe_new;