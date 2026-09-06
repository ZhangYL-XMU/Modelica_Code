model Stirling
  annotation(__MWORKS(version="26.6.0"),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})));
  DoubleActing.DA_Engine_v2 Engine(heff=1.41) 
    annotation (Placement(transformation(origin={60,20},
extent={{-30.75,-28.9},{30.75,28.9}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true, n(
        displayUnit="1") = {1,0,0}) annotation(Placement(transformation(origin={-21.75,-3.26},
extent={{10,10},{-10,-10}})));
  inner Modelica.Mechanics.MultiBody.World world 
    annotation(Placement(transformation(origin={-73.75,37.34},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=2, phi(start=0, fixed=true), w(start=0, fixed=true,displayUnit="rpm") "1500rpm 初值") 
    annotation(Placement(transformation(origin={-41.75,-68.06},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed_ground annotation(Placement(transformation(origin={-91.75,-92.06},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d=10.6) "发电负载（转速校准→1500rpm）发电负载 250kW@1500rpm 等效" annotation(Placement(transformation(origin={-73.75,-68.06},
extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Sources.Ramp ramp(offset=273.15+530,startTime=1800,duration=100) if false 
    annotation (Placement(transformation(origin={148,90},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Blocks.Constant const(k=273.15+530) 
    annotation (Placement(transformation(origin={10,86},
extent={{-10,-10},{10,10}})));
  equation
  connect(world.frame_b, revolute.frame_b) 
  annotation(Line(origin={-13.75,-28.06},
points={{-50,65.4},{-23.6,65.4},{-23.6,24.8},{-18,24.8}}));
  connect(inertia.flange_b, revolute.axis) 
  annotation(Line(origin={-13.75,-28.06},
points={{-18,-40},{-8,-40},{-8,14.8}}));
  connect(damper.flange_b, fixed_ground.flange) 
  annotation(Line(origin={36.25,-78.06},
points={{-120,10},{-128,10},{-128,-14}},
color={0,0,0}));
  connect(damper.flange_a, inertia.flange_a) 
  annotation(Line(origin={10.25,-66.06},
points={{-74,-2},{-62,-2}},
color={0,0,0}));
  connect(world.frame_b, Engine.cylinder_a) 
  annotation(Line(origin={-17.25,37.14},
points={{-46.5,0.2},{77.25,0.2},{77.25,-17.14}},
color={95,95,95},
thickness=0.5));
  connect(revolute.frame_a, Engine.cylinder_a1) 
  annotation(Line(origin={8.75,-2.86},
points={{-20.5,-0.4},{51.25,-0.4},{51.25,22.86}},
color={95,95,95},
thickness=0.5));
  connect(const.y, Engine.T_Na) 
  annotation(Line(origin={41,70},
  points={{-20,16},{19,16},{19,-15.32}},
  color={0,0,127}));
  end Stirling;