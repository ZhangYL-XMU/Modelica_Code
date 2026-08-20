within SFR.Structure.Closed;
model FirstLoop_without_Reactor
  annotation(__MWORKS(version="26.2.1"),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})));
  TRANSFORM.Fluid.Volumes.MixingVolume volume1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, nPorts_a=1, nPorts_b=2, redeclare model Geometry = TRANSFORM.Fluid.ClosureRelations.Geometry.Models.LumpedVolume.GenericVolume(V=10), energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, massDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, traceDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial) 
    annotation (Placement(transformation(origin={-70,-80},
extent={{-10,-10},{10,10}},
rotation=90)));
  TRANSFORM.Fluid.Volumes.MixingVolume volume(nPorts_a=2, nPorts_b=1, redeclare model Geometry = TRANSFORM.Fluid.ClosureRelations.Geometry.Models.LumpedVolume.GenericVolume(V=10), redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, massDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, traceDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial) 
    annotation (Placement(transformation(origin={-70,62},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Pipes.pipe_static pipe_static2(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, h_start=469125) 
    annotation (Placement(transformation(origin={14,-110},
extent={{10,-10},{-10,10}})));
  SFR.Fluid.Pipes.pipe_static pipe_static1(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, h_start=469125) 
    annotation (Placement(transformation(origin={22,94},
extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow1(Q_flow=0) 
    annotation (Placement(transformation(origin={-50,-4},
extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow(Q_flow=0) 
    annotation (Placement(transformation(origin={-138,-4},
extent={{-10,-10},{10,10}})));
  SFR.Fluid.Pipes.pipe pipe2(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, N=5, height_ab=-10, h_start=469125) 
    annotation (Placement(transformation(origin={-24,-4},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Pipes.pipe pipe1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, N=5, height_ab=-10, h_start=469125) 
    annotation (Placement(transformation(origin={-104,-4},
extent={{-10,-10},{10,10}},
rotation=90)));
  TYThermoFluidSys.Sensors.SensorT TSensor1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation (Placement(transformation(origin={-138,26},
extent={{-10,-10},{10,10}})));
  TRANSFORM.Fluid.Machines.Pump_SimpleMassFlow pump1(m_flow_nominal=280.6, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation (Placement(transformation(origin={54,-110.018},
extent={{10,-10},{-10,10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, p=1e5) 
    annotation (Placement(transformation(origin={86,138},
extent={{10,-10},{-10,10}})));
  SFR.Thermal.HeatExchange.HE1 hE1_1 
    annotation (Placement(transformation(origin={132,6},
extent={{10,10},{-10,-10}},
rotation=90)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary3(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, m_flow=308.4, T(displayUnit="degC")=703.15) 
    annotation (Placement(transformation(origin={218,-56},
extent={{10,-10},{-10,10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary2(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, T=803.15, p=100000) 
    annotation (Placement(transformation(origin={208,70},
extent={{10,-10},{-10,10}})));
  equation
  connect(TSensor1.port_a, pipe1.portB) 
  annotation(Line(origin={-121,11},
points={{-17,5},{-17,1},{17.0181,1},{17.0181,-4.9778}},
color={0,178,226}));
  connect(pipe1.wall[2], fixedHeatFlow.port) 
  annotation(Line(origin={-118,-4},
points={{10.2,0},{-10,0}},
color={127,0,0}));
  connect(pipe2.wall[2], fixedHeatFlow1.port) 
  annotation(Line(origin={-34,-4},
points={{6.2,0},{-6,0}},
color={127,0,0}));
  connect(volume.port_b[1], pipe_static1.portA) 
  annotation(Line(origin={-29,81},
points={{-41,-13},{-41,12.9819},{41.02226,12.9819}},
color={0,127,255}));
  connect(volume.port_a[1], pipe1.portB) 
  annotation(Line(origin={-87,31},
points={{17,25},{-16.9819,25},{-16.9819,-24.9778}},
color={0,127,255}));
  connect(volume.port_a[2], pipe2.portB) 
  annotation(Line(origin={-47,31},
points={{-23,25},{23.0180755,25},{23.0180755,-24.9778}},
color={0,127,255}));
  connect(pipe1.portA, volume1.port_b[1]) 
  annotation(Line(origin={-87,-44},
points={{-16.9819,30.02226},{-16.9819,-6},{17,-6},{17,-30}},
color={0,127,255}));
  connect(pipe2.portA, volume1.port_b[2]) 
  annotation(Line(origin={-47,-44},
points={{23.0180755,30.02226},{23.0180755,-6},{-23,-6},{-23,-30}},
color={0,127,255}));
  connect(volume1.port_a[1], pipe_static2.portB) 
  annotation(Line(origin={-33,-98},
points={{-37,12},{-37,-12.0181},{36.9778,-12.0181}},
color={0,127,255}));
  connect(pipe_static2.portA, pump1.port_b) 
  annotation(Line(origin={34,-110},
  points={{-10.02226,-0.0180755},{10,-0.0180755}},
  color={0,178,226}));
  connect(boundary.ports[1], pipe_static1.portB) 
  annotation(Line(origin={56,118},
points={{20,20},{-8,20},{-8,-24.0181},{-23.9778,-24.0181}},
color={0,127,255}));
  connect(hE1_1.shell_out, pump1.port_a) 
  annotation(Line(origin={95,-57},
  points={{30.7982,52.8},{30.7982,-53.018},{-31,-53.018}},
  color={0,127,255}));
  connect(hE1_1.shell_in, pipe_static1.portB) 
  annotation(Line(origin={79,55},
  points={{46.7982,-38.8},{46.7982,38.9819},{-46.9778,38.9819}},
  color={0,127,255}));
  connect(hE1_1.tube_in, boundary3.ports[1]) 
  annotation(Line(origin={152,-18},
points={{-14.0018,13.8},{-14.0018,-38},{56,-38}},
color={0,127,255}));
  connect(boundary2.ports[1], hE1_1.tube_out) 
  annotation(Line(origin={168,43},
points={{30,27},{-30.0018,27},{-30.0018,-26.8}},
color={0,127,255}));
  end FirstLoop_without_Reactor;
