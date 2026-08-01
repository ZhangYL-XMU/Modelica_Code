within SFR.Structure;
model FirstLoop_without_Reactor_HX
  annotation(__MWORKS(version="2025b",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=8,ContinueTimeVector)),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=1,StartTime=0,StopTime=3600,StoreEventValue=0,Tolerance=0.0001));
  SFR.Fluid.Pipes.pipe pipe1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, N=5, height_ab=-10, h_start=469125) 
    annotation (Placement(transformation(origin={-90,8},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Pipes.pipe pipe2(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, N=5, height_ab=-10, h_start=469125) 
    annotation (Placement(transformation(origin={-10,8},
extent={{-10,-10},{10,10}},
rotation=90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow(Q_flow=39.2e6) 
    annotation (Placement(transformation(origin={-124,8},
extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow1(Q_flow=8e5) 
    annotation (Placement(transformation(origin={-36,8},
extent={{-10,-10},{10,10}})));
  SFR.Fluid.Pipes.pipe_static pipe_static1(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, h_start=469125) 
    annotation (Placement(transformation(origin={36,106},
extent={{-10,-10},{10,10}})));
  SFR.Fluid.Pipes.pipe_static pipe_static2(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, h_start=469125) 
    annotation (Placement(transformation(origin={28,-98},
extent={{10,-10},{-10,10}})));
  Modelica.Fluid.Sources.Boundary_ph boundary1(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, h=656775, p(displayUnit="bar")=100000) 
    annotation (Placement(transformation(origin={88,106},
extent={{10,-10},{-10,10}})));
  SFR.Fluid.Vessels.MixingVolume volume(nPorts_a=2, nPorts_b=1, redeclare model Geometry = TRANSFORM.Fluid.ClosureRelations.Geometry.Models.LumpedVolume.GenericVolume(V=10), redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, massDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, traceDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial) 
    annotation (Placement(transformation(origin={-56,74},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Vessels.MixingVolume volume1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, nPorts_a=1, nPorts_b=2, redeclare model Geometry = TRANSFORM.Fluid.ClosureRelations.Geometry.Models.LumpedVolume.GenericVolume(V=10), energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, massDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, traceDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial) 
    annotation (Placement(transformation(origin={-56,-68},
extent={{-10,-10},{10,10}},
rotation=90)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary2(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, m_flow=280.6, T=713.15) 
    annotation (Placement(transformation(origin={94,-98},
extent={{10,-10},{-10,10}})));
  equation
  connect(pipe1.wall[2], fixedHeatFlow.port) 
  annotation(Line(origin={-104,8},
  points={{10.2,0},{-10,0}},
  color={127,0,0}));
  connect(pipe2.wall[2], fixedHeatFlow1.port) 
  annotation(Line(origin={-20,8},
  points={{6.2,0},{-6,0}},
  color={127,0,0}));
  connect(pipe_static1.portB, boundary1.ports[1]) 
  annotation(Line(origin={62,106},
  points={{-15.9778,-0.0180755},{16,0}},
  color={0,178,226}));
  connect(volume.port_b[1], pipe_static1.portA) 
  annotation(Line(origin={-15,93},
  points={{-41,-13},{-41,12.9819},{41.02226,12.9819}},
  color={0,127,255}));
  connect(volume.port_a[1], pipe1.portB) 
  annotation(Line(origin={-73,43},
points={{17,25},{17,9},{-16.9819,9},{-16.9819,-24.9778}},
color={0,127,255}));
  connect(volume.port_a[2], pipe2.portB) 
  annotation(Line(origin={-33,43},
points={{-23,25},{-23,9},{23.0181,9},{23.0181,-24.9778}},
color={0,127,255}));
  connect(pipe1.portA, volume1.port_b[1]) 
  annotation(Line(origin={-73,-32},
  points={{-16.9819,30.02226},{-16.9819,-6},{17,-6},{17,-30}},
  color={0,127,255}));
  connect(pipe2.portA, volume1.port_b[2]) 
  annotation(Line(origin={-33,-32},
  points={{23.0181,30.02226},{23.0181,-6},{-23,-6},{-23,-30}},
  color={0,127,255}));
  connect(volume1.port_a[1], pipe_static2.portB) 
  annotation(Line(origin={-19,-86},
  points={{-37,12},{-37,-12.0181},{36.9778,-12.0181}},
  color={0,127,255}));
  connect(pipe_static2.portA, boundary2.ports[1]) 
  annotation(Line(origin={61,-98},
  points={{-23.0223,-0.0180755},{23,0}},
  color={0,178,226}));
  end FirstLoop_without_Reactor_HX;
