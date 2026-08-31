within SFR.Thermal.HeatExchange;
model test_1
  annotation(__MWORKS(version="26.1.3",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=100,ContinueTimeVector)),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.1,StartTime=0,StopTime=100,StoreEventValue=0,Tolerance=0.0001));
  parameter Real CF_HeatTransfer = 1.086 "换热修正系数（与 HE1 默认标定值一致；增大=换热更强）";
  HE1 hE1_1(CF_HeatTransfer=CF_HeatTransfer) 
    annotation(Placement(transformation(extent={{-12,-11},{12,11}})));
  TYThermoFluidSys.Blocks.Ramp ramp(offset=656775, height=1e5, startTime=10, duration=5) if false 
    annotation (Placement(transformation(origin={132,52},
extent={{10,-10},{-10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary4(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, m_flow=280.6, T(displayUnit="degC")=823.15) 
    annotation(Placement(transformation(origin={-58,-6.82199},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary3(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, m_flow=308.4, T(displayUnit="degC")=703.15) 
    annotation(Placement(transformation(origin={34,36},
extent={{10,-10},{-10,10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, T=713.15, p=1e5) 
    annotation(Placement(transformation(origin={52,-6.82199},
extent={{10,-10},{-10,10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary2(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, T=803.15, p=100000) 
    annotation(Placement(transformation(origin={-44,40},
extent={{-10,-10},{10,10}})));
  equation
  connect(hE1_1.tube_in, boundary3.ports[1]) 
  annotation(Line(origin={0,0},
points={{12.24,6.59801},{21,6.59801},{21,36},{24,36}}));
  connect(boundary2.ports[1], hE1_1.tube_out) 
  annotation(Line(origin={0,0},
points={{-34,40},{-15.44,40},{-15.44,6.59801},{-12.24,6.59801}}));
  connect(boundary4.ports[1], hE1_1.shell_in) 
  annotation(Line(origin={0,0},
points={{-48,-6.82199},{-12.24,-6.82199}}));
  connect(hE1_1.shell_out, boundary.ports[1]) 
  annotation(Line(origin={0,0},
points={{12.24,-6.82199},{42,-6.82199}}));
  end test_1;