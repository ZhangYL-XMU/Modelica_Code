within SFR.Stirling.StirlingEngine;
model test_simplified
  annotation(__MWORKS(version="26.2.0",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=0.02,ContinueTimeVector)),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.01,StartTime=0,StopTime=10,StoreEventValue=0,Tolerance=0.0001));
  Modelica.Fluid.Sources.Boundary_ph boundary1(nPorts = 1, redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, p = 9.999999999999999e5,h=506655) 
    annotation(Placement(transformation(origin={52,54},
extent={{10,-10},{-10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_h boundary(nPorts=1,redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium,h=506655,m_flow=308.4) 
    annotation (Placement(transformation(origin={-44,54},
extent={{-10,-10},{10,10}})));
equation
  end test_simplified;