within SFR.Structure;
model Firstloop_without_HX
  annotation(__MWORKS(version="26.1.3",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=84,ContinueTimeVector)),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=1,StartTime=0,StopTime=1000,StoreEventValue=0,Tolerance=0.0001));
  TYThermoFluidSys.Sensors.SensorT TSensor(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation (Placement(transformation(origin={34,40},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Sensors.SensorT TSensor1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation (Placement(transformation(origin={-118,46.8213},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Sensors.SensorT TSensor2(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation (Placement(transformation(origin={-50,118},
extent={{-10,-10},{10,10}})));
  SFR.Fluid.Pipes.pipe pipe1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, N=5, height_ab=-10, initFromEnthalpy=true, h_start=4.725e4) 
    annotation (Placement(transformation(origin={-84,0},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Pipes.pipe pipe2(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, N=5, height_ab=-10, initFromEnthalpy=true, h_start=4.725e4) 
    annotation (Placement(transformation(origin={-4,0},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Pipes.pipe_static pipe_static1(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, initFromEnthalpy=true, h_start=4.725e4) 
    annotation (Placement(transformation(origin={42,98},
extent={{-10,-10},{10,10}})));
  SFR.Fluid.Pipes.pipe_static pipe_static2(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, initFromEnthalpy=true, h_start=4.725e4) 
    annotation (Placement(transformation(origin={34,-106},
extent={{10,-10},{-10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_h boundary(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, m_flow=280.6, h=469125) 
    annotation (Placement(transformation(origin={94,-106},
extent={{10,-10},{-10,10}})));
  Modelica.Fluid.Sources.Boundary_ph boundary1(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, p=6e5, h=656775) 
    annotation (Placement(transformation(origin={94,98},
extent={{10,-10},{-10,10}})));
  SFR.Fluid.Vessels.MixingVolume volume(nPorts_a=2, nPorts_b=1, redeclare model Geometry = TRANSFORM.Fluid.ClosureRelations.Geometry.Models.LumpedVolume.GenericVolume(V=10), redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation (Placement(transformation(origin={-50,66},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Vessels.MixingVolume volume1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, nPorts_a=1, nPorts_b=2, redeclare model Geometry = TRANSFORM.Fluid.ClosureRelations.Geometry.Models.LumpedVolume.GenericVolume(V=10)) 
    annotation (Placement(transformation(origin={-50,-76},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Nuclear.PointKinetics pointKinetics(Teffref_fuel(displayUnit="K"), Teffref_coolant(displayUnit="degC")=785.15) 
    annotation (Placement(transformation(origin={-252,5.48375},
extent={{-18,-20.5},{18,20.5}})));
  Modelica.Blocks.Continuous.LimPID PID(controllerType=Modelica.Blocks.Types.SimpleController.PID, yMax=0.021, initType=Modelica.Blocks.Types.Init.SteadyState, withFeedForward=false, k=2, wd=1) 
    annotation (Placement(transformation(origin={-388,19.88505},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Blocks.Constant const1(k=0) 
    annotation (Placement(transformation(origin={-320,41.98375},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Blocks.Constant const3(k=0) 
    annotation (Placement(transformation(origin={-286,69.98375},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Blocks.Ramp ramp(offset=40e6, height=4e6, duration=100, startTime=400) 
    annotation (Placement(transformation(origin={-436,19.88505},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=TSensor2.T) 
    annotation (Placement(transformation(origin={-320,-51.01625},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Blocks.Constant const2(k=823.15) 
    annotation (Placement(transformation(origin={-320,0.1025},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Gain gain(k=0.1) 
    annotation (Placement(transformation(origin={-164,0},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Gain gain1(k=0.1) 
    annotation (Placement(transformation(origin={-164,36.305},
extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow 
    annotation (Placement(transformation(origin={-118,0},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=gain1.y) 
    annotation (Placement(transformation(origin={-60,0},
extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 
    annotation (Placement(transformation(origin={-36,0},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Sensors.SensorT TSensor3(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation (Placement(transformation(origin={60,-76},
extent={{-10,-10},{10,10}})));
equation
  connect(TSensor1.port_a, pipe1.portB) 
  annotation(Line(origin={-101,15},
points={{-17,21.8213},{-17,1},{17.0181,1},{17.0181,-4.9778}},
color={0,178,226}));
  connect(TSensor.port_a, pipe2.portB) 
  annotation(Line(origin={15,20},
points={{19,10},{19,-8},{-18.9819,-8},{-18.9819,-9.9778}},
color={0,178,226}));
  connect(boundary.ports[1], pipe_static2.portA) 
  annotation(Line(origin={64,-106},
points={{20,0},{-20.0223,-0.0180755}},
color={0,127,255}));
  connect(pipe_static1.portB, boundary1.ports[1]) 
  annotation(Line(origin={68,98},
points={{-15.9778,-0.0180755},{16,0}},
color={0,178,226}));
  connect(volume.port_b[1], pipe_static1.portA) 
  annotation(Line(origin={-9,85},
points={{-41,-13},{-41,12.9819},{41.02226,12.9819}},
color={0,127,255}));
  connect(volume.port_a[1], pipe1.portB) 
  annotation(Line(origin={-67,35},
points={{17,25},{-16.9819,25},{-16.9819,-24.9778}},
color={0,127,255}));
  connect(volume.port_a[2], pipe2.portB) 
  annotation(Line(origin={-27,35},
points={{-23,25},{23.0181,25},{23.0181,-24.9778}},
color={0,127,255}));
  connect(pipe1.portA, volume1.port_b[1]) 
  annotation(Line(origin={-67,-40},
points={{-16.9819,30.02226},{-16.9819,-6},{17,-6},{17,-30}},
color={0,127,255}));
  connect(pipe2.portA, volume1.port_b[2]) 
  annotation(Line(origin={-27,-40},
points={{23.0181,30.02226},{23.0181,-6},{-23,-6},{-23,-30}},
color={0,127,255}));
  connect(volume1.port_a[1], pipe_static2.portB) 
  annotation(Line(origin={-13,-94},
points={{-37,12},{-37,-12.0181},{36.9778,-12.0181}},
color={0,127,255}));
  connect(TSensor2.port_a, volume.port_b[1]) 
  annotation(Line(origin={-40,90},
points={{-10,18},{-10,-18}},
color={0,178,226}));
  connect(pointKinetics.Q_total, PID.u_m) 
  annotation(Line(origin={-273,0.98375},
points={{41.115,18.69625},{49,18.69625},{49,-35},{-115,-35},{-115,6.9013}},
color={0,0,127}));
  connect(const1.y, pointKinetics.Reactivity_Other) 
  annotation(Line(origin={-290,25.9837},
points={{-19,16},{-12,16},{-12,-15.7337},{18.245,-15.7337}},
color={0,0,127}));
  connect(realExpression1.y, pointKinetics.Teff_coolant) 
  annotation(Line(origin={-283,-13.01625},
points={{-26,-38},{7.49,-38},{7.49,2.97125},{11.245,2.97125}},
color={0,0,127}));
  connect(const3.y, pointKinetics.Q_in) 
  annotation(Line(origin={-264,48.98375},
points={{-11,21},{10,21},{10,-20.8987},{11.685,-20.8987}},
color={0,0,127}));
  connect(pointKinetics.Teff_fuel, const2.y) 
  annotation(Line(origin={-290,-0.01625},
points={{18.245,0.11875},{-19,0.11875}},
color={0,0,127}));
  connect(ramp.y, PID.u_s) 
  annotation(Line(origin={-413,20.99365},
points={{-12,-1.1086},{13,-1.1086}},
color={0,0,127}));
  connect(PID.y, pointKinetics.Reactivity_CR) 
  annotation(Line(origin={-347,19.98375},
points={{-30,-0.0987},{75.245,-0.09875}},
color={0,0,127}));
  connect(pointKinetics.Q_HotChannel, gain.u) 
  annotation(Line(origin={-204,0.305},
points={{-27.885,-0.305},{28,-0.305}},
color={0,0,127}));
  connect(pointKinetics.Q_AverageChannel, gain1.u) 
  annotation(Line(origin={-204,23.305},
points={{-27.885,-13.26},{8,-13.26},{8,13},{28,13}},
color={0,0,127}));
  connect(pipe1.wall[1], prescribedHeatFlow.port) 
  annotation(Line(origin={-98,0},
  points={{10.2,0},{-10,0}},
  color={127,0,0}));
  connect(gain.y, prescribedHeatFlow.Q_flow) 
  annotation(Line(origin={-140,0},
points={{-13,0},{12,0}},
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(realExpression2.y, prescribedHeatFlow1.Q_flow) 
  annotation(Line(origin={-35,0},
points={{-14,0},{-11,0}},
color={0,0,127}));
  connect(pipe2.wall[1], prescribedHeatFlow1.port) 
  annotation(Line(origin={-17,0},
  points={{9.2,0},{-9,0}},
  color={127,0,0}));
  connect(TSensor3.port_a, pipe_static2.portA) 
  annotation(Line(origin={52,-96},
  points={{8,10},{8,2},{-5.02226,2},{-5.02226,-10.0181},{-8.02226,-10.0181}},
  color={0,178,226}));
  end Firstloop_without_HX;
