within SFR.Structure.Closed;
  model FirstLoop
    annotation(__MWORKS(version="26.1.3",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=3600,ContinueTimeVector)),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.01,StartTime=0,StopTime=3600,StoreEventValue=0,Tolerance=0.0001));
    TYThermoFluidSys.Sensors.SensorT TSensor1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={-37,40.8213},
extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Sensors.SensorT TSensor2(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={31,112},
extent={{-10,-10},{10,10}})));
    SFR.Fluid.Pipes.pipe pipe1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, N=5, height_ab=-10, initFromEnthalpy=true, h_start=4.725e4,n_pipe=30) 
      annotation (Placement(transformation(origin={-3,-6},
extent={{-10,-10},{10,10}},
rotation=90)));
    SFR.Fluid.Pipes.pipe pipe2(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, N=5, height_ab=-10, initFromEnthalpy=true, h_start=4.725e4,n_pipe=180) 
      annotation (Placement(transformation(origin={77,-6},
extent={{-10,-10},{10,10}},
rotation=90)));
    SFR.Fluid.Pipes.pipe_static pipe_static1(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, initFromEnthalpy=true, h_start=4.725e4) 
      annotation (Placement(transformation(origin={123,92},
extent={{-10,-10},{10,10}})));
    SFR.Fluid.Pipes.pipe_static pipe_static2(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, initFromEnthalpy=true, h_start=4.725e4) 
      annotation (Placement(transformation(origin={115,-112},
extent={{10,-10},{-10,10}})));
    SFR.Fluid.Vessels.MixingVolume volume(nPorts_a=2, nPorts_b=1, V=10, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={31,60},
extent={{-10,-10},{10,10}},
rotation=90)));
    SFR.Fluid.Vessels.MixingVolume volume1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, nPorts_a=1, nPorts_b=2, V=10) 
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
    TYThermoFluidSys.Blocks.Ramp ramp(offset=40e6, height=0, duration=100, startTime=400) 
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