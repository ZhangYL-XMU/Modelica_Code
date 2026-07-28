within SFR.Stirling.StirlingEngine;
model test_simplified
  annotation(__MWORKS(version="26.2.0",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=0.02,ContinueTimeVector)),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.01,StartTime=0,StopTime=10,StoreEventValue=0,Tolerance=0.0001));
  StirlingEngine_simplified stirlingEngine_simplified 
    annotation (Placement(transformation(origin={1,-6},
extent={{-27,-22},{27,22}})));
  Modelica.Fluid.Sources.Boundary_ph boundary1(nPorts = 1, redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, p = 9.999999999999999e5,h=506655) 
    annotation(Placement(transformation(origin={58,-5.56},
extent={{10,-10},{-10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_h boundary(nPorts=1,redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium,h=506655,m_flow=308.4) 
    annotation (Placement(transformation(origin={-56,-6},
extent={{-10,-10},{10,10}})));
equation
  connect(stirlingEngine_simplified.port_b, boundary1.ports[1]) 
  annotation(Line(origin={40,29},
points={{-11.64,-34.56},{8,-34.56}},
color={0,127,255}));
  connect(boundary.ports[1], stirlingEngine_simplified.port_a) 
  annotation(Line(origin={-27,28},
points={{-19,-34},{0.64,-34},{0.64,-33.56}},
color={0,127,255}));

end test_simplified;