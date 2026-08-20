within SFR.Fluid.Pipes.BaseClasses.PressureDrop;
model Detail
  import Modelica.Constants;
  import Modelica.Units.SI;
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium;

//几何参数
parameter Integer N(min = 2) =2 "节点数";
parameter Integer Nw = N-1 "控制体数";
parameter SI.Length[Nw] L "单控制体长度";
parameter SI.Length[Nw] Dhyd "单控制体水力直径";
parameter SI.Area[Nw] A  "每一段的横截面积 (单管道)";
parameter SI.Length[Nw] height "高度差(b-a)";
parameter Real roughness "粗糙度";

//输入变量
input Medium.ThermodynamicState[N] states;
input Medium.MassFlowRate m_flow[Nw] "单管质量流";


//流质性质
Medium.DynamicViscosity[Nw] mu "动力粘度";
SI.Density[Nw] rho "单控制体平均密度";
SI.ReynoldsNumber[Nw] Re "单控制体雷诺数";
SI.Velocity[Nw] u "液体流速";


//压降
Real[Nw] f_W;
SI.Pressure[Nw] dp "总压降";
SI.Pressure[Nw] Dpf "摩擦压降";
SI.Pressure[Nw] Dpele "提升压降";

equation
for i in 1:Nw loop
  rho[i] = (Medium.density(states[i]) + Medium.density(states[i+1])) / 2;
  mu[i] = (Medium.dynamicViscosity(states[i]) + Medium.dynamicViscosity(states[i+1])) / 2;
  u[i] = m_flow[i]/(rho[i] * A[i]);
  Re[i] = SFR.Utilities.Functions.reynoldsNumberSmooth(m_flow[i], Dhyd[i], A[i], mu[i]);

//摩擦系数
  f_W[i]=Fluid.Utilities.PressureDrop.Weishach(Re[i],roughness / Dhyd[i]);
  //f_W[i]=64/Re[i];

//摩擦压降
  Dpf[i]=f_W[i] *(L[i] / Dhyd[i])*(rho[i] * u[i] ^2/2);

//提升压降
  Dpele[i]=Constants.g_n * height[i] * rho[i] ;

//控制体压降
  dp[i] = Dpf[i] - Dpele[i];

end for;



end Detail;