within SFR.Fluid.Pipes.BaseClasses.PressureDrop;
model test_detail
  import SFR.Utilities.Functions;
  import Modelica.Constants;
  replaceable package Medium = TYMedia.Incompressible.LBE;

//几何参数
parameter Integer N(min = 2) =5 "节点数";
parameter Integer Nw = N-1 "控制体数";
parameter Modelica.Units.SI.Length[Nw] L = ones(Nw) * 0.25 "单控制体长度";
parameter Modelica.Units.SI.Length[Nw] Dhyd = ones(Nw) * 0.01 "单控制体水力直径";
parameter Modelica.Units.SI.Area[Nw] A = ones(Nw) * (Constants.pi * Dhyd[1] ^ 2 / 4) "每一段的横截面积 (单管道)";
parameter Modelica.Units.SI.Length[Nw] height = ones(Nw) * (-0.00) "高度差(b-a)";
parameter Real roughness "粗糙度";


//流质性质
Medium.AbsolutePressure[N] p"节点压力";
Medium.SpecificEnthalpy[N] h "节点比焓";
Medium.MassFlowRate m_flow[Nw] "质量流";
Medium.ThermodynamicState[N] states;



  replaceable model Friction = Fluid.Pipes.BaseClasses.PressureDrop.Detail;
Friction friction(redeclare package Medium = Medium, states=states, N=N, Nw=Nw, L=L, Dhyd=Dhyd, A=A, height=height, roughness=roughness, m_flow=m_flow);

equation
p[5] = 1e5;

for i in 1:N loop
  h[i] = 4.725e4;
  states[i]=Medium.setState_phX(p[i],h[i]);
end for;
for i in 1:Nw loop
  m_flow [i] = 10;
  p[i] = p[i+1] + friction.dp[i];
end for;




end test_detail;
