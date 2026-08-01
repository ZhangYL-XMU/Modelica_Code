within SFR.Structure;
package Closed
  annotation(__MWORKS(version="26.1.3"));
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
  model FirstLoop
    annotation(__MWORKS(version="26.1.3"),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})));
    TYThermoFluidSys.Sensors.SensorT TSensor1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={-37,40.8213},
extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Sensors.SensorT TSensor2(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={31,112},
extent={{-10,-10},{10,10}})));
    SFR.Fluid.Pipes.pipe pipe1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, N=5, height_ab=-10, initFromEnthalpy=true, h_start=4.725e4) 
      annotation (Placement(transformation(origin={-3,-6},
extent={{-10,-10},{10,10}},
rotation=90)));
    SFR.Fluid.Pipes.pipe pipe2(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, N=5, height_ab=-10, initFromEnthalpy=true, h_start=4.725e4) 
      annotation (Placement(transformation(origin={77,-6},
extent={{-10,-10},{10,10}},
rotation=90)));
    SFR.Fluid.Pipes.pipe_static pipe_static1(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, initFromEnthalpy=true, h_start=4.725e4) 
      annotation (Placement(transformation(origin={123,92},
extent={{-10,-10},{10,10}})));
    SFR.Fluid.Pipes.pipe_static pipe_static2(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, initFromEnthalpy=true, h_start=4.725e4) 
      annotation (Placement(transformation(origin={115,-112},
extent={{10,-10},{-10,10}})));
    SFR.Fluid.Vessels.MixingVolume volume(nPorts_a=2, nPorts_b=1, redeclare model Geometry = TRANSFORM.Fluid.ClosureRelations.Geometry.Models.LumpedVolume.GenericVolume(V=10), redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={31,60},
extent={{-10,-10},{10,10}},
rotation=90)));
    SFR.Fluid.Vessels.MixingVolume volume1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, nPorts_a=1, nPorts_b=2, redeclare model Geometry = TRANSFORM.Fluid.ClosureRelations.Geometry.Models.LumpedVolume.GenericVolume(V=10)) 
      annotation (Placement(transformation(origin={31,-82},
extent={{-10,-10},{10,10}},
rotation=90)));
    SFR.Nuclear.PointKinetics pointKinetics(Teffref_fuel(displayUnit="K"), Teffref_coolant(displayUnit="degC")=785.15) 
      annotation (Placement(transformation(origin={-171,-0.51625},
extent={{-18,-20.5},{18,20.5}})));
    Modelica.Blocks.Continuous.LimPID PID(controllerType=Modelica.Blocks.Types.SimpleController.PID, yMax=0.021, initType=Modelica.Blocks.Types.Init.SteadyState, withFeedForward=false, k=2, wd=1) 
      annotation (Placement(transformation(origin={-307,13.88505},
extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Blocks.Constant const1(k=0) 
      annotation (Placement(transformation(origin={-239,35.98375},
extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Blocks.Constant const3(k=0) 
      annotation (Placement(transformation(origin={-205,63.98375},
extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Blocks.Ramp ramp(offset=40e6, height=4e6, duration=100, startTime=400) 
      annotation (Placement(transformation(origin={-355,13.88505},
extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Sources.RealExpression realExpression1(y=TSensor2.T) 
      annotation (Placement(transformation(origin={-239,-57.01625},
extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Blocks.Constant const2(k=823.15) 
      annotation (Placement(transformation(origin={-239,-5.8975},
extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Math.Gain gain(k=1) 
      annotation (Placement(transformation(origin={-83,-6},
extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Math.Gain gain1(k=1) 
      annotation (Placement(transformation(origin={-83,30.305},
extent={{-10,-10},{10,10}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow 
      annotation (Placement(transformation(origin={-37,-6},
extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Sources.RealExpression realExpression2(y=gain1.y) 
      annotation (Placement(transformation(origin={21,-6},
extent={{-10,-10},{10,10}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 
      annotation (Placement(transformation(origin={45,-6},
extent={{-10,-10},{10,10}})));
    TRANSFORM.Fluid.Machines.Pump_SimpleMassFlow pump1(m_flow_nominal=280.6, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={178.011,-114.009},
extent={{10,-10},{-10,10}})));
    Modelica.Fluid.Sources.Boundary_pT boundary(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, p=1e5) 
      annotation (Placement(transformation(origin={210.011,134.009},
extent={{10,-10},{-10,10}})));
    SFR.Thermal.HeatExchange.HE1 hE1_1 
      annotation (Placement(transformation(origin={256.01113,2.009},
extent={{10,10},{-10,-10}},
rotation=90)));
    Modelica.Fluid.Sources.MassFlowSource_T boundary3(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, m_flow=308.4, T(displayUnit="degC")=703.15) 
      annotation (Placement(transformation(origin={342.01113,-59.991},
extent={{10,-10},{-10,10}})));
    Modelica.Fluid.Sources.Boundary_pT boundary2(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, T=803.15, p=100000) 
      annotation (Placement(transformation(origin={332.01113,66.009},
extent={{10,-10},{-10,10}})));
    equation
    connect(TSensor1.port_a, pipe1.portB) 
    annotation(Line(origin={-20,9},
    points={{-17,21.8213},{-17,1},{17.0181,1},{17.0181,-4.9778}},
    color={0,178,226}));
    connect(volume.port_b[1], pipe_static1.portA) 
    annotation(Line(origin={72,79},
    points={{-41,-13},{-41,12.9819},{41.02226,12.9819}},
    color={0,127,255}));
    connect(volume.port_a[1], pipe1.portB) 
    annotation(Line(origin={14,29},
    points={{17,25},{-16.9819,25},{-16.9819,-24.9778}},
    color={0,127,255}));
    connect(volume.port_a[2], pipe2.portB) 
    annotation(Line(origin={54,29},
    points={{-23,25},{23.0181,25},{23.0181,-24.9778}},
    color={0,127,255}));
    connect(pipe1.portA, volume1.port_b[1]) 
    annotation(Line(origin={14,-46},
    points={{-16.9819,30.02226},{-16.9819,-6},{17,-6},{17,-30}},
    color={0,127,255}));
    connect(pipe2.portA, volume1.port_b[2]) 
    annotation(Line(origin={54,-46},
    points={{23.0181,30.02226},{23.0181,-6},{-23,-6},{-23,-30}},
    color={0,127,255}));
    connect(volume1.port_a[1], pipe_static2.portB) 
    annotation(Line(origin={68,-100},
    points={{-37,12},{-37,-12.0181},{36.9778,-12.0181}},
    color={0,127,255}));
    connect(TSensor2.port_a, volume.port_b[1]) 
    annotation(Line(origin={41,84},
    points={{-10,18},{-10,-18}},
    color={0,178,226}));
    connect(pointKinetics.Q_total, PID.u_m) 
    annotation(Line(origin={-192,-5.01625},
    points={{41.115,18.69625},{49,18.69625},{49,-35},{-115,-35},{-115,6.9013}},
    color={0,0,127}));
    connect(const1.y, pointKinetics.Reactivity_Other) 
    annotation(Line(origin={-209,19.9837},
    points={{-19,16.00005},{-12,16.00005},{-12,-15.7337},{18.245,-15.7337}},
    color={0,0,127}));
    connect(realExpression1.y, pointKinetics.Teff_coolant) 
    annotation(Line(origin={-202,-19.01625},
    points={{-26,-38},{7.49,-38},{7.49,2.97125},{11.245,2.97125}},
    color={0,0,127}));
    connect(const3.y, pointKinetics.Q_in) 
    annotation(Line(origin={-183,42.98375},
    points={{-11,21},{10,21},{10,-20.89875},{11.685,-20.89875}},
    color={0,0,127}));
    connect(pointKinetics.Teff_fuel, const2.y) 
    annotation(Line(origin={-209,-6.01625},
    points={{18.245,0.11875},{-19,0.11875}},
    color={0,0,127}));
    connect(ramp.y, PID.u_s) 
    annotation(Line(origin={-332,14.9936},
    points={{-12,-1.1086},{13,-1.1086}},
    color={0,0,127}));
    connect(PID.y, pointKinetics.Reactivity_CR) 
    annotation(Line(origin={-266,13.98375},
    points={{-30,-0.0987},{75.245,-0.09875}},
    color={0,0,127}));
    connect(pointKinetics.Q_HotChannel, gain.u) 
    annotation(Line(origin={-123,-5.695},
    points={{-27.885,-0.305},{28,-0.305}},
    color={0,0,127}));
    connect(pointKinetics.Q_AverageChannel, gain1.u) 
    annotation(Line(origin={-123,17.305},
    points={{-27.885,-13.26},{8,-13.26},{8,13},{28,13}},
    color={0,0,127}));
    connect(pipe1.wall[1], prescribedHeatFlow.port) 
    annotation(Line(origin={-17,-6},
    points={{10.2,0},{-10,0}},
    color={127,0,0}));
    connect(gain.y, prescribedHeatFlow.Q_flow) 
    annotation(Line(origin={-59,-6},
    points={{-13,0},{12,0}},
    color={0,0,127}));
    connect(realExpression2.y, prescribedHeatFlow1.Q_flow) 
    annotation(Line(origin={46,-6},
    points={{-14,0},{-11,0}},
    color={0,0,127}));
    connect(pipe2.wall[1], prescribedHeatFlow1.port) 
    annotation(Line(origin={64,-6},
    points={{9.2,0},{-9,0}},
    color={127,0,0}));
    connect(pipe_static2.portA, pump1.port_b) 
    annotation(Line(origin={158.011,-113.991},
    points={{-10.02226,-0.0180755},{10,-0.018}},
    color={0,178,226}));
    connect(boundary.ports[1], pipe_static1.portB) 
    annotation(Line(origin={180.011,114.009},
    points={{20,20},{-8,20},{-8,-24.0181},{-23.9778,-24.0181}},
    color={0,127,255}));
    connect(hE1_1.shell_out, pump1.port_a) 
    annotation(Line(origin={219.011,-60.991},
    points={{30.7982,52.8},{30.7982,-53.018},{-31,-53.018}},
    color={0,127,255}));
    connect(hE1_1.shell_in, pipe_static1.portB) 
    annotation(Line(origin={203.011,51.009},
    points={{46.7982,-38.8},{46.7982,38.9819},{-46.9778,38.9819}},
    color={0,127,255}));
    connect(hE1_1.tube_in, boundary3.ports[1]) 
    annotation(Line(origin={276.01113,-21.991},
    points={{-14.0018,13.8},{-14.0018,-38},{56,-38}},
    color={0,127,255}));
    connect(boundary2.ports[1], hE1_1.tube_out) 
    annotation(Line(origin={292.01113,39.009},
    points={{30,27},{-30.0018,27},{-30.0018,-26.8}},
    color={0,127,255}));
    end FirstLoop;
  model SFR_Stirling
    annotation(__MWORKS(version="26.1.3"),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})));
    TYThermoFluidSys.Sensors.SensorT TSensor1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={-170.506,50.8213},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Sensors.SensorT TSensor2(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={-102.506,122},
  extent={{-10,-10},{10,10}})));
    SFR.Fluid.Pipes.pipe pipe1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, N=5, height_ab=-10, initFromEnthalpy=true, h_start=4.725e4) 
      annotation (Placement(transformation(origin={-136.506,4},
  extent={{-10,-10},{10,10}},
  rotation=90)));
    SFR.Fluid.Pipes.pipe pipe2(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, N=5, height_ab=-10, initFromEnthalpy=true, h_start=4.725e4) 
      annotation (Placement(transformation(origin={-56.5056,4},
  extent={{-10,-10},{10,10}},
  rotation=90)));
    SFR.Fluid.Pipes.pipe_static pipe_static1(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, initFromEnthalpy=true, h_start=4.725e4) 
      annotation (Placement(transformation(origin={-10.5056,102},
  extent={{-10,-10},{10,10}})));
    SFR.Fluid.Pipes.pipe_static pipe_static2(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, initFromEnthalpy=true, h_start=4.725e4) 
      annotation (Placement(transformation(origin={-18.5056,-102},
  extent={{10,-10},{-10,10}})));
    SFR.Fluid.Vessels.MixingVolume volume(nPorts_a=2, nPorts_b=1, redeclare model Geometry = TRANSFORM.Fluid.ClosureRelations.Geometry.Models.LumpedVolume.GenericVolume(V=10), redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={-102.506,70},
  extent={{-10,-10},{10,10}},
  rotation=90)));
    SFR.Fluid.Vessels.MixingVolume volume1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, nPorts_a=1, nPorts_b=2, redeclare model Geometry = TRANSFORM.Fluid.ClosureRelations.Geometry.Models.LumpedVolume.GenericVolume(V=10)) 
      annotation (Placement(transformation(origin={-102.506,-72},
  extent={{-10,-10},{10,10}},
  rotation=90)));
    SFR.Nuclear.PointKinetics pointKinetics(Teffref_fuel(displayUnit="K"), Teffref_coolant(displayUnit="degC")=785.15) 
      annotation (Placement(transformation(origin={-304.506,9.48375},
  extent={{-18,-20.5},{18,20.5}})));
    Modelica.Blocks.Continuous.LimPID PID(controllerType=Modelica.Blocks.Types.SimpleController.PID, yMax=0.021, initType=Modelica.Blocks.Types.Init.SteadyState, withFeedForward=false, k=2, wd=1) 
      annotation (Placement(transformation(origin={-440.506,23.8851},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Blocks.Constant const1(k=0) 
      annotation (Placement(transformation(origin={-372.506,45.9838},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Blocks.Constant const3(k=0) 
      annotation (Placement(transformation(origin={-338.506,73.9838},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Blocks.Ramp ramp(offset=40e6, height=4e6, duration=100, startTime=400) 
      annotation (Placement(transformation(origin={-488.506,23.8851},
  extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Sources.RealExpression realExpression1(y=TSensor2.T) 
      annotation (Placement(transformation(origin={-372.506,-47.0162},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Blocks.Constant const2(k=823.15) 
      annotation (Placement(transformation(origin={-372.506,4.1025},
  extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Math.Gain gain(k=1) 
      annotation (Placement(transformation(origin={-216.506,4},
  extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Math.Gain gain1(k=1) 
      annotation (Placement(transformation(origin={-216.506,40.305},
  extent={{-10,-10},{10,10}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow 
      annotation (Placement(transformation(origin={-170.506,4},
  extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Sources.RealExpression realExpression2(y=gain1.y) 
      annotation (Placement(transformation(origin={-112.506,4},
  extent={{-10,-10},{10,10}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 
      annotation (Placement(transformation(origin={-88.5056,4},
  extent={{-10,-10},{10,10}})));
    TRANSFORM.Fluid.Machines.Pump_SimpleMassFlow pump1(m_flow_nominal=280.6, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={44.5054,-104.009},
  extent={{10,-10},{-10,10}})));
    Modelica.Fluid.Sources.Boundary_pT boundary(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, p=1e5) 
      annotation (Placement(transformation(origin={76.505435,144.009},
  extent={{10,-10},{-10,10}})));
    SFR.Thermal.HeatExchange.HE1 hE1_1 
      annotation (Placement(transformation(origin={122.506,12.009},
  extent={{10,10},{-10,-10}},
  rotation=90)));
    TRANSFORM.Fluid.Machines.Pump_SimpleMassFlow pump2(m_flow_nominal=280.6, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={196,-19.9066},
  extent={{10,-10},{-10,10}})));
    Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true, n(
          displayUnit="1") = {1,0,0}) annotation (Placement(transformation(origin={238,212},
extent={{-10,-10},{10,10}},
rotation=180)));
    inner Modelica.Mechanics.MultiBody.World world 
      annotation (Placement(transformation(origin={174,212},
extent={{-10,-10},{10,10}})));
    Modelica.Mechanics.Rotational.Components.Inertia inertia(J=2) 
      annotation (Placement(transformation(origin={258,160},
extent={{-10,-10},{10,10}})));
    Stirling.StirlingEngine.Engine_V2 stirling(heff=0.25) 
      annotation (Placement(transformation(origin={319,8.91514},
extent={{-51.084865,41},{51.084865,-41}},
rotation=-90)));
    Modelica.Fluid.Sources.Boundary_pT boundary1(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, p=1e5) 
      annotation (Placement(transformation(origin={154,84},
extent={{10,-10},{-10,10}})));
    equation
    connect(TSensor1.port_a, pipe1.portB) 
    annotation(Line(origin={-153.506,19},
    points={{-17,21.8213},{-17,1},{17.0181,1},{17.0181,-4.9778}},
    color={0,178,226}));
    connect(volume.port_b[1], pipe_static1.portA) 
    annotation(Line(origin={-61.5056,89},
    points={{-41,-13},{-41,12.9819},{41.02226,12.9819}},
    color={0,127,255}));
    connect(volume.port_a[1], pipe1.portB) 
    annotation(Line(origin={-119.506,39},
    points={{17,25},{-16.9819,25},{-16.9819,-24.9778}},
    color={0,127,255}));
    connect(volume.port_a[2], pipe2.portB) 
    annotation(Line(origin={-79.5056,39},
    points={{-23,25},{23.0181,25},{23.0181,-24.9778}},
    color={0,127,255}));
    connect(pipe1.portA, volume1.port_b[1]) 
    annotation(Line(origin={-119.506,-36},
    points={{-16.9819,30.02226},{-16.9819,-6},{17,-6},{17,-30}},
    color={0,127,255}));
    connect(pipe2.portA, volume1.port_b[2]) 
    annotation(Line(origin={-79.5056,-36},
    points={{23.0181,30.02226},{23.0181,-6},{-23,-6},{-23,-30}},
    color={0,127,255}));
    connect(volume1.port_a[1], pipe_static2.portB) 
    annotation(Line(origin={-65.5056,-90},
    points={{-37,12},{-37,-12.0181},{36.9778,-12.0181}},
    color={0,127,255}));
    connect(TSensor2.port_a, volume.port_b[1]) 
    annotation(Line(origin={-92.5056,94},
    points={{-10,18},{-10,-18}},
    color={0,178,226}));
    connect(pointKinetics.Q_total, PID.u_m) 
    annotation(Line(origin={-325.506,4.98375},
    points={{41.115,18.69625},{49,18.69625},{49,-35},{-115,-35},{-115,6.9013}},
    color={0,0,127}));
    connect(const1.y, pointKinetics.Reactivity_Other) 
    annotation(Line(origin={-342.506,29.9837},
    points={{-19,16.00005},{-12,16.00005},{-12,-15.7337},{18.245,-15.7337}},
    color={0,0,127}));
    connect(realExpression1.y, pointKinetics.Teff_coolant) 
    annotation(Line(origin={-335.506,-9.01625},
    points={{-26,-38},{7.49,-38},{7.49,2.97125},{11.245,2.97125}},
    color={0,0,127}));
    connect(const3.y, pointKinetics.Q_in) 
    annotation(Line(origin={-316.506,52.9838},
    points={{-11,21},{10,21},{10,-20.89875},{11.685,-20.89875}},
    color={0,0,127}));
    connect(pointKinetics.Teff_fuel, const2.y) 
    annotation(Line(origin={-342.506,3.98375},
    points={{18.245,0.11875},{-19,0.11875}},
    color={0,0,127}));
    connect(ramp.y, PID.u_s) 
    annotation(Line(origin={-465.506,24.9936},
    points={{-12,-1.10855},{13,-1.10855}},
    color={0,0,127}));
    connect(PID.y, pointKinetics.Reactivity_CR) 
    annotation(Line(origin={-399.506,23.9838},
    points={{-30,-0.0987},{75.245,-0.09875}},
    color={0,0,127}));
    connect(pointKinetics.Q_HotChannel, gain.u) 
    annotation(Line(origin={-256.506,4.305},
    points={{-27.885,-0.305},{28,-0.305}},
    color={0,0,127}));
    connect(pointKinetics.Q_AverageChannel, gain1.u) 
    annotation(Line(origin={-256.506,27.305},
    points={{-27.885,-13.26},{8,-13.26},{8,13},{28,13}},
    color={0,0,127}));
    connect(pipe1.wall[1], prescribedHeatFlow.port) 
    annotation(Line(origin={-150.506,4},
    points={{10.2,0},{-10,0}},
    color={127,0,0}));
    connect(gain.y, prescribedHeatFlow.Q_flow) 
    annotation(Line(origin={-192.506,4},
    points={{-13,0},{12,0}},
    color={0,0,127}));
    connect(realExpression2.y, prescribedHeatFlow1.Q_flow) 
    annotation(Line(origin={-87.5056,4},
    points={{-14,0},{-11,0}},
    color={0,0,127}));
    connect(pipe2.wall[1], prescribedHeatFlow1.port) 
    annotation(Line(origin={-69.5056,4},
    points={{9.2,0},{-9,0}},
    color={127,0,0}));
    connect(pipe_static2.portA, pump1.port_b) 
    annotation(Line(origin={24.5054,-103.991},
    points={{-33.03326,1.97292},{10,1.97292},{10,-0.018}},
    color={0,178,226}));
    connect(boundary.ports[1], pipe_static1.portB) 
    annotation(Line(origin={46.5054,124.009},
    points={{20,20},{-8,20},{-8,-22.0271},{-46.9888,-22.0271}},
    color={0,127,255}));
    connect(hE1_1.shell_out, pump1.port_a) 
    annotation(Line(origin={85.505435,-50.991},
    points={{30.7983,52.8},{30.7983,-53.018},{-31,-53.018}},
    color={0,127,255}));
    connect(hE1_1.shell_in, pipe_static1.portB) 
    annotation(Line(origin={69.505435,61.009},
    points={{46.7983,-38.8},{46.7983,40.9729},{-69.9888,40.9729}},
    color={0,127,255}));
    connect(pump2.port_b, hE1_1.tube_in) 
    annotation(Line(origin={144,-9},
  points={{42,-10.9066},{-15.4962,-10.9066},{-15.4962,10.809}},
  color={0,127,255}));
    connect(world.frame_b, revolute.frame_b) 
    annotation(Line(origin={374,232},
points={{-190,-20},{-146,-20}},
color={95,95,95},
thickness=0.5));
    connect(inertia.flange_b, revolute.axis) 
    annotation(Line(origin={374,232},
points={{-106,-72},{-103,-72},{-103,-33},{-136,-33},{-136,-30}},
color={0,0,0}));
    connect(world.frame_b, stirling.cylinder_a) 
    annotation(Line(origin={374,232},
points={{-190,-20},{-177,-20},{-177,-92},{-82.48,-92},{-82.48,-169.427}},
color={95,95,95},
thickness=0.5));
    connect(revolute.frame_a, stirling.cylinder_a1) 
    annotation(Line(origin={400,234},
points={{-152,-22},{-79.88,-22},{-79.88,-171.427}},
color={95,95,95},
thickness=0.5));
    connect(hE1_1.tube_out, stirling.hot) 
    annotation(Line(origin={203,63},
points={{-74.49581,-40.791},{-74.49581,-21.9697},{75.52,-21.9697}},
color={0,127,255}));
    connect(stirling.cold, pump2.port_a) 
    annotation(Line(origin={241,11},
points={{37.52,-30.9066},{-35,-30.9066}},
color={0,127,255}));
    connect(boundary1.ports[1], hE1_1.tube_out) 
    annotation(Line(origin={136,53},
points={{8,31},{-7.49581,31},{-7.49581,-30.791}},
color={0,127,255}));
    end SFR_Stirling;
  model SecondLoop
    annotation(__MWORKS(version="26.1.3"),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})));
    SFR.Stirling.StirlingEngine.StirlingEngine_simplified stirlingEngine 
      annotation (Placement(transformation(origin={5.74791,40},
extent={{-56.9921,41},{56.9921,-41}},
rotation=-90)));
    TRANSFORM.Fluid.Machines.Pump_SimpleMassFlow pump2(m_flow_nominal=280.6, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={-99.252095,8.0844},
extent={{10,-10},{-10,10}})));
  equation
    connect(stirlingEngine.cold, pump2.port_a) 
    annotation(Line(origin={-89.252095,7.991},
    points={{54,0.093424},{0,0.0934}},
    color={0,127,255}));
    end SecondLoop;

end Closed;