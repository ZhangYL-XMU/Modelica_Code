within SFR.Thermal.HeatExchange;
model test_1
  annotation(__MWORKS(version="26.1.3",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=100,ContinueTimeVector)),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.1,StartTime=0,StopTime=100,StoreEventValue=0,Tolerance=0.0001));
  HE1 hE1_1 
    annotation (Placement(transformation(origin={0,1},
extent={{-12,-11},{12,11}})));
  TYThermoFluidSys.Blocks.Ramp ramp(offset=656775, height=1e5, startTime=10, duration=5) if false 
    annotation (Placement(transformation(origin={132,52},
extent={{10,-10},{-10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary4(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, m_flow=280.6, T(displayUnit="degC")=823.15) 
    annotation (Placement(transformation(origin={-62,-30},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary3(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, m_flow=308.4, T(displayUnit="degC")=703.15) 
    annotation (Placement(transformation(origin={40,28},
extent={{10,-10},{-10,10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, T=713.15, p=1e5) 
    annotation (Placement(transformation(origin={52,-22},
extent={{10,-10},{-10,10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary2(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, T=803.15, p=100000) 
    annotation (Placement(transformation(origin={-44,28},
extent={{-10,-10},{10,10}})));
  equation
  connect(hE1_1.tube_in, boundary3.ports[1]) 
  annotation(Line(origin={21,8},
points={{-8.76,-0.401991},{6,-0.401991},{6,20},{9,20}},
color={0,127,255}));
  connect(boundary2.ports[1], hE1_1.tube_out) 
  annotation(Line(origin={-25,11},
points={{-9,17},{9.56,17},{9.56,-3.40199},{12.76,-3.40199}},
color={0,127,255}));
  connect(boundary4.ports[1], hE1_1.shell_in) 
  annotation(Line(origin={-32,-18},
  points={{-20,-12},{16.56,-12},{16.56,12.178009},{19.76,12.178009}},
  color={0,127,255}));
  connect(hE1_1.shell_out, boundary.ports[1]) 
  annotation(Line(origin={27,-14},
  points={{-14.76,8.178009},{12,8.178009},{12,-8},{15,-8}},
  color={0,127,255}));
  end test_1;
