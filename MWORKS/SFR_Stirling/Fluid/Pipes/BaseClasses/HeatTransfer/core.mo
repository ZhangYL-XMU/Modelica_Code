within SFR.Fluid.Pipes.BaseClasses.HeatTransfer;
model core
  "堆芯棒束子通道传热模型"
  import Modelica.Constants;
  replaceable package Medium = Modelica.Media.Water.StandardWater;


parameter Integer Nf(min = 2) = 2 "Number of nodes on the fluid side";
parameter Integer Nw = Nf - 1 "Number of volumes on the wall side";
parameter Integer Nt(min = 1) "Number of tubes in parallel";

  //几何参数
input Modelica.Units.SI.Length[Nw] L "每一段的长度";
input Modelica.Units.SI.Length[Nw] Dhyd "水力直径（单管道）";
input Modelica.Units.SI.Area[Nw] A;

  //输入变量
input Medium.ThermodynamicState[Nf] states "热力状态(ph)";
input Medium.MassFlowRate m_flow[Nw] "质量流";
input Real CF = 1.0 "换热能力修正系数";

  // 棒束几何（Westinghouse 关系式参数，手动输入）
  parameter Modelica.Units.SI.Length Pitch = 0.0074 "棒间中心距 P [m]（侯斌 对边距59mm/61棒 推算约7.4mm；可改）" 
    annotation(Dialog(tab="棒束几何"));
  parameter Modelica.Units.SI.Length D_rod = 0.006 "棒径 D [m]（CEFR 型 6mm；可改）" 
    annotation(Dialog(tab="棒束几何"));

  //热力学参数
  Medium.Temperature Tf[Nw]"液体温度";


  //物性参数 
  Modelica.Units.SI.ReynoldsNumber[Nw] Re;
  Medium.DynamicViscosity[Nw] mu;
  Medium.ThermalConductivity[Nw] k "Thermal conductivity";
  Medium.SpecificHeatCapacity[Nw] cp "Heat capacity at constant pressure";
  Modelica.Units.SI.PrandtlNumber[Nw] Pr;
  Modelica.Units.SI.PecletNumber[Nw] Pe;
  Modelica.Units.SI.NusseltNumber[Nw] Nu;

  Modelica.Units.SI.CoefficientOfHeatTransfer gamma[Nw];

  //功率
   Modelica.Units.SI.Power[Nw] Q ;
   Medium.Temperature[Nw] Tw  "壁面温度";

   Modelica.Fluid.Interfaces.HeatPorts_a[Nw] wall annotation (Placement(transformation(extent = {{-40, 20}, {40,
      40}}, rotation = 0)));


equation
  Q = wall.Q_flow;
  Tw = wall.T;

  for i in 1:Nw loop
    mu[i] = (Medium.dynamicViscosity(states[i]) + Medium.dynamicViscosity(states[i + 1])) / 2;
    Re[i] = noEvent(abs(m_flow[i] * Dhyd[i] / (A[i] * mu[i])));
    Tf[i] = (Medium.temperature(states[i]) + Medium.temperature(states[i+1])) / 2;
    k[i] = (Medium.thermalConductivity(states[i]) + Medium.thermalConductivity(states[i + 1])) / 2;
    cp[i] = (Medium.specificHeatCapacityCp(states[i]) + Medium.specificHeatCapacityCp(states[i+1])) / 2;
    Pr[i] = cp[i] * mu[i] / k[i];
    Pe[i] = Re[i] * Pr[i];
    // ---- Westinghouse 棒束子通道关系式（5-95）：P/D = Pitch/D_rod ----
    Nu[i] = 4.0 + 0.33 * (Pitch / D_rod) ^ 3.8 * (Pe[i] / 100) ^ 0.8 + 0.16 * (Pitch / D_rod) ^ 5.0;
    gamma[i] = Nu[i] * k[i] / Dhyd[i];

    Q[i] = CF * gamma[i] * Nt * Constants.pi * Dhyd[i] * L[i] * (Tw[i] - Tf[i]);
  end for;


end core;