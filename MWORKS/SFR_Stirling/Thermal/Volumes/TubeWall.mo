within SFR.Thermal.Volumes;
model TubeWall
  "多管并行圆柱管壁（径向1节点集总、轴向N段）——能量平衡 + 温度暴露热端口"
  // 设计依据（2026-09-01，方案B）：修复 PrimaryLoop 卡t=0 —— 原 TY TubeWall 为单棒薄壁（无并管数），
  //   而 SFR pipe 的 wall 热端口传递 n_pipe 管总热流（Q=CF*gamma*Nt*A*(Tw-Tf)），面积/热容失配 37/114 倍
  //   → 壁温在 0~0.036s 内爆炸到 3075/5951K，DASSL 重启失败。
  //   本组件：几何与热容按 n_tubes 并行缩放（端口热流=总量口径），径向 1 节点集总（参考
  //   TRANSFORM.SimpleWall_Cylinder 的对数平均热阻模式），物性走 MSL Medium 接口（默认
  //   TRANSFORM.Media.Solids.UO2，ORNL/TM-2000/351）。
  // 用法：port_a（流体侧）连 SFR.Fluid.Pipes.pipe 的 wall 端口；port_b（热源侧）连
  //   Modelica.PrescribedHeatFlow；N 取 pipe 的 Nw（=节数-1），n_tubes 取 pipe 的 n_pipe。
  // 端口语义：T 由内部状态显式暴露（exposeState），Q_flow 由连接的另一端方程给定——与
  //   pipe.heatTransfer 的 Q=gamma*A*Nt*(Tw-Tf) 自然耦合，避免过约束。

  import SI = Modelica.SIunits;
  import Modelica.Constants;
  import Modelica.Fluid.Types.Dynamics;
  import Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a;
  import Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b;

  //========= 材料 =========
  replaceable package Material = TRANSFORM.Media.Solids.UO2
    constrainedby TRANSFORM.Media.Interfaces.Solids.PartialSimpleAlloy
    "固体介质物性（默认 UO2；可 redeclare）" annotation(choicesAllMatching=true, Dialog(tab="材料"));

  //========= 几何（半径口径，单管） =========
  parameter Integer N(min=1) = 2 "轴向分段数（=pipe 的 Nw）" annotation(Dialog(tab="几何"));
  parameter Integer n_tubes(min=1) = 1 "并行管数（=pipe 的 n_pipe）" annotation(Dialog(tab="几何"));
  parameter SI.Length r_inner = 0.0028 "管内表面半径（m，半径口径；如棒径6mm壁厚0.2mm → 0.0028/0.0030）" annotation(Dialog(tab="几何"));
  parameter SI.Length r_outer = 0.003 "管外表面半径（m）" annotation(Dialog(tab="几何"));
  parameter SI.Length length = 1.1 "管段总长（m，=pipe 的 L_total）" annotation(Dialog(tab="几何"));

  //========= 初始化/动态 =========
  parameter Dynamics energyDynamics = Dynamics.DynamicFreeInitial
    "能量平衡形式" annotation(Dialog(tab="初始化"));
  parameter SI.Temperature T_start(displayUnit="degC") = 298.15 "每段管壁初始温度（K）" annotation(Dialog(tab="初始化"));

  //========= 端口 =========
  HeatPort_a[N] port_a "流体侧热端口（连 pipe.wall：T 暴露，Q 由 pipe.heatTransfer 决定）"
    annotation(Placement(transformation(origin={-110,0}, extent={{-10,-10},{10,10}}), iconTransformation(origin={-110,0}, extent={{-10,-10},{10,10}})));
  HeatPort_b[N] port_b "热源/外壁侧热端口（连 PrescribedHeatFlow：热流直接注入管壁）"
    annotation(Placement(transformation(origin={110,0}, extent={{10,-10},{-10,10}}), iconTransformation(origin={110,0}, extent={{10,-10},{-10,10}})));

  //========= 几何参数（final） =========
  final parameter SI.Length[N] L = fill(length/N, N) "每段长度";
  final parameter SI.Volume[N] V_wall =
    fill(n_tubes*Constants.pi*(r_outer^2 - r_inner^2)*(length/N), N) "每段壁体总容积（含 n_tubes 并行缩放）";

  //========= 变量 =========
  SI.Temperature[N] T(each start=T_start, each stateSelect=StateSelect.prefer) "每段管壁温度";
  SI.Mass[N] m "每段壁体质量";
  SI.InternalEnergy[N] U "每段壁体内能";
  SI.ThermalConductivity[N] lambda "每段热导率";

equation
  for i in 1:N loop
    // 固体物性（MSL Medium 接口：state=setState_T(T)）
    m[i] = V_wall[i]*Material.density(Material.setState_T(T[i]));
    U[i] = m[i]*Material.specificEnthalpy(Material.setState_T(T[i]));
    lambda[i] = Material.thermalConductivity(Material.setState_T(T[i]));
    // 能量平衡（端口 Q_flow 流入为正；SteadyState=代数平衡）
    if energyDynamics == Dynamics.SteadyState then
      0 = port_a[i].Q_flow + port_b[i].Q_flow;
    else
      der(U[i]) = port_a[i].Q_flow + port_b[i].Q_flow;
    end if;
    // 端口语义：温度暴露（Q_flow 由连接对方方程给定，避免过约束）
    port_a[i].T = T[i];
    port_b[i].T = T[i];
  end for;

  annotation(defaultComponentName="tubeWall",
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, grid={2,2})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}, grid={2,2}), graphics={
      Ellipse(extent={{-60,60},{60,-60}}, lineColor={0,0,0}, fillColor={95,95,95}, fillPattern=FillPattern.Solid),
      Ellipse(extent={{-40,40},{40,-40}}, lineColor={0,0,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),
      Text(extent={{-150,-90},{150,-60}}, lineColor={0,0,255}, textString="%name"),
      Text(extent={{-40,50},{40,20}}, lineColor={0,0,255}, textString="N=%N"),
      Text(extent={{-40,-20},{40,-50}}, lineColor={0,0,255}, textString="nt=%n_tubes")}));
end TubeWall;
