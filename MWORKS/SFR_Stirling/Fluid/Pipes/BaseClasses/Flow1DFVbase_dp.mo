within SFR.Fluid.Pipes.BaseClasses;
model Flow1DFVbase_dp
                     "圆形截面无管壁厚度的专适用于液态金属流质"
  import SFR.Utilities.Functions;
  import Modelica.Constants;
  replaceable package Medium = Modelica.Media.Water.WaterIF97_ph;




                      /******************************/
                      /*           常参数            */
                      /******************************/
//几何参数
parameter Integer N(min = 2)=2 "节点数";
final parameter Integer Nw = N-1 "控制体数量";
final parameter Real[Nw] n_channels(each min = 1.0) = fill(n_pipe, Nw) "平行管数量" annotation(Dialog(group = "几何参数"));
parameter Real n_pipe = 1 "平行管数量" annotation(Dialog(group = "几何参数"));
parameter Modelica.Units.SI.Length L_total = 10 "管道总长" annotation(Dialog(group = "几何参数"));
parameter Modelica.Units.SI.Length Dh = 0.05 "单管道水力直径" annotation(Dialog(group = "几何参数"));
parameter Modelica.Units.SI.Length height_ab = 0 "高度差(a-b)" annotation(Dialog(group = "几何参数"));
parameter Real roughness=0.0015    "管壁粗糙度";
final parameter Modelica.Units.SI.PerUnit e = roughness/Dh "相对粗糙度";

final parameter Modelica.Units.SI.Area A_cross = Constants.pi * Dh ^ 2 / 4 "单管道横截面积" 
    annotation(Dialog(group = "几何参数"));
final parameter Modelica.Units.SI.Length[Nw] L = ones(Nw) * L_total / Nw "每一段的长度" 
    annotation(Dialog(group = "几何参数"));
final parameter Modelica.Units.SI.Length[Nw] Dhyd = ones(Nw) * Dh "每一段的水力直径（单管道）" 
    annotation(Dialog(group = "几何参数"));
final parameter Modelica.Units.SI.Length[Nw] height = ones(Nw) * height_ab / Nw "每一段的高度差" 
    annotation(Dialog(group = "几何参数"));
final parameter Modelica.Units.SI.Area[Nw] A = ones(Nw) * A_cross "每一段的横截面积 (单管道)" 
    annotation(Dialog(group = "几何参数"));
final parameter Modelica.Units.SI.Volume[Nw] V = n_channels .* A .* L "每一段管道的总容积" 
    annotation(Dialog(group = "几何参数"));
final parameter Modelica.Units.SI.Volume V_tot = sum(V) "管道总容积";
final parameter Modelica.Units.SI.Area A_mean = sum(A) / Nw "平均横截面积";

//流动参数
  // parameter Medium.MassFlowRate m_flow_nom "标称质量流量 (总)" annotation(Evaluate = true,Dialog(tab = "初始化"));
  // Medium.MassFlowRate m_flow(start = m_flow_nom/Nt) "Mass flow rate (单管质量流)";
//  Real dwdt(start = 0) "动量因子";
 Medium.MassFlowRate m_flow "质量流";

                      /******************************/
                      /*           点变量            */
                      /******************************/

  Medium.AbsolutePressure[N] p(each start=1e5)
                                         "节点压力";
  Medium.SpecificEnthalpy h(start=1e5) "节点比焓";
//  Medium.MassFlowRate[N] m_flows=fill(port_a.m_flow,N) "单管节点质量流";


  Medium.Density[N] rho "节点密度";
  Medium.DynamicViscosity[N] mu "动力粘度";
  Medium.ThermodynamicState[N] states;





                      /******************************/
                      /*         控制体变量          */
                      /******************************/
  Real f_W[Nw]
              "摩擦系数";
  Modelica.Units.SI.PerUnit[Nw] Re   "雷诺数";
  Modelica.Units.SI.Pressure dp[Nw]
                                   "单控制体压降";
  Modelica.Units.SI.Pressure Dpf[Nw]
                                    "段摩擦压降";
//  Modelica.Units.SI.Pressure Dpad[Nw]"段加速压降";
  Modelica.Units.SI.Pressure Dpele[Nw]
                                      "段提升压降";
  Medium.Density rho_avg[Nw]
                            "段密度";
  Modelica.Units.SI.Velocity[Nw] u "控制体流速";
//  Modelica.Units.SI.Velocity u_avg[Nw] "段流速";



  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Medium, m_flow=m_flow, p=p[1])
    "Fluid connector a (positive design flow direction is from port_a to port_b)" 
    annotation (Placement(transformation(origin={-99.7774,-0.180755},
  extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Medium, m_flow=-m_flow, p=p[N])
    "Fluid connector b (positive design flow direction is from port_a to port_b)" 
    annotation (Placement(transformation(origin={100,0},
  extent={{10,-10},{-10,10}}),
  iconTransformation(origin={100.222,-0.180755},
  extent={{10,-10},{-10,10}})));




equation


/************************************节点物性计算********************************************/
for i in 1:N loop
//  h[i] = port_a.h_outflow;
  states[i]=Medium.setState_phX(p[i],h);
  rho[i]=Medium.density(states[i]); //g/cm3
  mu[i] = Medium.dynamicViscosity(states[i]);
end for;

/*************************************控制体物性计算********************************************/
for i in 1:Nw loop
  rho_avg[i] = (rho[i] + rho[i + 1]) / 2;
  u[i]=port_a.m_flow/(rho_avg[i] * 1e3 * A[i]);
  Re[i] = noEvent(abs(m_flow * Dh / (A_cross * mu[i])));
end for;
/**************************************压降计算*********************************************/
for i in 1:Nw loop
//摩擦系数
  f_W[i]=Fluid.Utilities.PressureDrop.Weishach(Re[i],e);

//摩擦压降
  Dpf[i]=f_W[i] *(L[i] / Dhyd[i])*(rho_avg[i] * 1e3 * u[i] ^2/2);

//提升压降
  Dpele[i]=Constants.g_n * height[i] * rho_avg[i] * 1e3;

//控制体压降
  dp[i] = Dpf[i] + Dpele[i];

//节点压力
  p[i+1] = p[i] + dp[i];
end for;






/**************************************瞬态稳态*********************************************/

/**************************************质量守恒*********************************************/


/**************************************动量守恒*********************************************/



/**************************************边界条件*********************************************/
h = port_a.h_outflow;
  port_a.h_outflow = inStream(port_b.h_outflow);
  port_b.h_outflow = inStream(port_a.h_outflow);

  annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
  grid={2,2})),Icon(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2}),graphics={  Rectangle(origin={0,0},
lineColor={0,0,128},
fillColor={255,85,255},
fillPattern=FillPattern.HorizontalCylinder,
extent={{-100,38.5},{100,-38.5}},
radius=4.5)}));
end Flow1DFVbase_dp;
