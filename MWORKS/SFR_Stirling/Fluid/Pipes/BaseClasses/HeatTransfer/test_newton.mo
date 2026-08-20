within SFR.Fluid.Pipes.BaseClasses.HeatTransfer;
model test_newton
  import SFR.Utilities.Functions;
  import Modelica.Constants;
  replaceable package Medium = TYMedia.Incompressible.LBE;

  //几何参数
  parameter Integer N(min = 2) = 5 "节点数";
  parameter Integer Nw = N - 1 "控制体数";
  parameter Integer Nt(min = 1) = 1 "Number of tubes in parallel";
  parameter Modelica.Units.SI.Length[Nw] L = ones(Nw) * 0.25 "单控制体长度";
  parameter Modelica.Units.SI.Length[Nw] Dhyd = ones(Nw) * 0.1 "单控制体水力直径";
  parameter Modelica.Units.SI.Area[Nw] A = ones(Nw) * (Constants.pi * Dhyd[1] ^ 2 / 4) "每一段的横截面积 (单管道)";
  parameter Modelica.Units.SI.Length[Nw] height = ones(Nw) * 0 "高度差(b-a)";
  final parameter Modelica.Units.SI.Volume[Nw] V = fill(Nt, Nw) .* A .* L;



  //流质性质
  Medium.AbsolutePressure[N] p(each start = 1e5) "节点压力";
  Medium.SpecificEnthalpy[N] h(each start = 4.725e4) "节点比焓";
  Medium.MassFlowRate m_flow[Nw] "质量流";
  Modelica.Units.SI.Density[Nw] rho "单控制体平均密度";
  Medium.ThermodynamicState[N] states;
  Medium.SpecificInternalEnergy IE[Nw];

  //流动


  replaceable model HeatTransfer = Fluid.Pipes.BaseClasses.HeatTransfer.circle;
  HeatTransfer heatTransfer(
  redeclare package Medium = Medium,
    states = states,
    Nf = N,
    Nw = Nw,
    Nt = Nt,
    L = L,
    Dhyd = Dhyd,
    A = A,
    m_flow = m_flow
    );

  Modelica.Fluid.Interfaces.HeatPorts_a[Nw] wall annotation(Placement(transformation(extent = {{-40, 20}, {40,
    40}}, rotation = 0)));
  TYThermoFluidSys.Boundaries.BoundaryHeatFlow boundaryHeatFlow1(n=4,Q_flow=10000) 
    annotation (Placement(transformation(origin={-48,80},
extent={{-10,-10},{10,10}})));
  annotation(experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.1,StartTime=0,StopTime=100,StoreEventValue=0,Tolerance=0.0001),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})));

equation
connect(wall,heatTransfer.wall);
  h[1] = 4.725e4;

  for i in 1:N loop
    p[i] = 1e5;
    states[i] = Medium.setState_phX(p[i], h[i]);
  end for;

  for i in 1:Nw loop
    m_flow[i] = 10;
    rho[i] = (Medium.density(states[i]) + Medium.density(states[i + 1])) / 2;
    IE[i] = (Medium.specificInternalEnergy(states[i]) + Medium.specificInternalEnergy(states[i + 1])) / 2;
    der(rho[i] * IE[i]) * V[i] =
      m_flow[1] * (h[i] - h[i + 1]) + heatTransfer.Q[i];
  end for;
  connect(boundaryHeatFlow1.port, wall) 
  annotation(Line(origin={-19,55},
  points={{-19,25},{17,25},{17,-25},{19,-25}},
  color={191,0,0}));




end test_newton;
