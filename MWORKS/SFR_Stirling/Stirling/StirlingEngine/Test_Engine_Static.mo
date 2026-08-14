within SFR.Stirling.StirlingEngine;
model Test_Engine_Static
  annotation(__MWORKS(version="2025b",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=10,ContinueTimeVector)),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.01,StartTime=0,StopTime=10,StoreEventValue=0,Tolerance=0.0001));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true, n(
        displayUnit="1") = {1,0,0}) annotation (Placement(transformation(origin={-92,-26},
extent={{-10,-10},{10,10}},
rotation=180)));
  inner Modelica.Mechanics.MultiBody.World world
    annotation (Placement(transformation(origin={-136,42},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=2)
    annotation (Placement(transformation(origin={-120,-70},
extent={{-10,-10},{10,10}})));
  Engine_V2_Static stirling(heff=0.25)
    annotation (Placement(transformation(origin={54,26},
extent={{-52,-26},{52,26}})));
  Modelica.Fluid.Sources.Boundary_ph boundary1(nPorts = 1, redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, p = 9.999999999999999e5,h=506655)
    annotation(Placement(transformation(origin={108,90},
extent={{10,-10},{-10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_h boundary(nPorts=1,redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium,h=506655,m_flow=308.4)
    annotation (Placement(transformation(origin={-6,90},
extent={{-10,-10},{10,10}})));
  equation
  connect(world.frame_b, revolute.frame_b)
  annotation(Line(origin={-66,-6},
points={{-60,48},{-52,48},{-52,-20},{-36,-20}},
color={95,95,95},
thickness=0.5));
  connect(inertia.flange_b, revolute.axis)
  annotation(Line(origin={-66,-6},
points={{-44,-64},{-26,-64},{-26,-30}},
color={0,0,0}));
  connect(world.frame_b, stirling.cylinder_a)
  annotation(Line(origin={-66,-6},
points={{-60,48},{-17.04,48},{-17.04,35.233074},{67.2571,35.233074}},
color={95,95,95},
thickness=0.5));
  connect(revolute.frame_a, stirling.cylinder_a1)
  annotation(Line(origin={-40,-4},
  points={{-42,-22},{-30,-22},{-30,22.5029},{41.2571,22.5029}},
  color={95,95,95},
  thickness=0.5));
  connect(boundary1.ports[1], stirling.cold)
  annotation(Line(origin={91,71},
  points={{7,19},{-7.26313,19},{-7.26313,-19.52}},
  color={0,127,255}));
  connect(boundary.ports[1], stirling.hot)
  annotation(Line(origin={13,71},
  points={{-9,19},{9.8,19},{9.8,-19.52}},
  color={0,127,255}));
  end Test_Engine_Static;
