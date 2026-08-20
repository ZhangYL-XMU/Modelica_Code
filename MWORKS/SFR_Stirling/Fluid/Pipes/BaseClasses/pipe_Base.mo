within SFR.Fluid.Pipes.BaseClasses;
model pipe_Base
  "圆形截面无管壁厚度的专适用于液态金属流质"
  import SFR.Utilities.Functions;
  import Modelica.Constants;
  import SI = Modelica.SIunits;
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium 
  annotation (choicesAllMatching = true);




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
  final parameter Real flowFraction0 = 1 "流过流阻的质量流量百分比" annotation(Dialog(tab = "高级", group = "压降相关的修正值"));
  final parameter Real dpFraction0 = 1 annotation(Dialog(tab = "高级", group = "压降相关的修正值"));
  final parameter Real CF_length = 1.0 annotation(Dialog(tab = "高级", group = "压降相关的修正值"));
  // 修正后参数
  final parameter SI.Length L_total_internal = L_total * CF_length "修正后的管道长度";
  final parameter SI.Volume[Nw] V_internal = V * CF_length "修正后的管道容积";
  final parameter SI.Area[Nw] A_heat_internal = A_heat * CF_length "修正后的换热面积";
  final parameter SI.Area A_H = Constants.pi * Dh * L_heat / Nw "每一段管道的换热面积 (单管道) " annotation(Dialog(group = "换热"));
  final parameter SI.Area[Nw] A_heat = ones(Nw) * A_H "每一段管道的换热面积 (单管道)" annotation(Dialog(group = "换热"));





  /******************************/
  /*           点变量            */
  /******************************/
   SI.Temperature[N] T(each start=T_start) "流体温度";
   SI.SpecificEnthalpy[N] h(each start=h_start)  "流体焓流";
   SI.Pressure[N] p(each start=p_start)  "流体压力";
   //SI.EnthalpyFlowRate H_flow[N] "比焓";
   Medium.ThermodynamicState[N] states;
   Medium.MassFlowRate m_flow[N](each start=m_flow_start) "单管质量流";

   /******************************/
   /*         控制体变量          */
   /******************************/
   SI.Temperature[Nw] T_wall(each start=T_wall_start) "壁面温度";
   SI.Power[Nw] Q "壁面流入热流量";
   SI.ReynoldsNumber[Nw] Re "单控制体雷诺数";
   Medium.DynamicViscosity[Nw] mu "动力粘度";
   Medium.MassFlowRate m_flow_avg[Nw](each start=m_flow_start) "质量流";
   Medium.SpecificInternalEnergy IE[Nw] "流体内能";
   SI.Density[Nw] rho "单控制体平均密度";
   SI.Velocity[Nw] u "液体流速";//√//

equation


  annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
  grid={2,2})),Icon(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2}),graphics = {Rectangle(origin={0,0},
lineColor={0,0,128},
fillColor={255,85,255},
fillPattern=FillPattern.HorizontalCylinder,
extent={{-100,38.5},{100,-38.5}},
radius=4.5), Line(origin={-2,0},
points={{-40,0},{40,0},{20,10},{40,0},{20,-10}},
color={0,0,0},
thickness=1)}));
end pipe_Base;