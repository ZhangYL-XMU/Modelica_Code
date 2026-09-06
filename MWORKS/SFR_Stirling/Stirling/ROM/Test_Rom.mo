model Test_Rom
  annotation(__MWORKS(version="26.6.0"),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})));
  Stirling_Static.ROM.ROM_Basis rOM_Basis 
    annotation (Placement(transformation(origin={22,-92},
extent={{-32,-34.5},{32,34.5}})));
  Modelica.Blocks.Sources.Ramp ramp(offset=273.15+530,startTime=0,height=0,duration=0) 
    annotation (Placement(transformation(origin={-58,-89.44724},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Blocks.Constant const(k=273.15+530) 
    annotation (Placement(transformation(origin={-26.75,118.9},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d=10.6) "发电负载（转速校准→1500rpm）发电负载 250kW@1500rpm 等效" annotation(Placement(transformation(origin={-110.5,-35.16},
extent={{10,-10},{-10,10}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed_ground annotation(Placement(transformation(origin={-128.5,-59.16},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=2, phi(start=0, fixed=true), w(start=0, fixed=true,displayUnit="rpm") "1500rpm 初值") 
    annotation(Placement(transformation(origin={-78.5,-35.16},
extent={{-10,-10},{10,10}})));
  inner Modelica.Mechanics.MultiBody.World world 
    annotation(Placement(transformation(origin={-110.5,70.24},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true, n(
        displayUnit="1") = {1,0,0}) annotation(Placement(transformation(origin={-58.5,29.64},
extent={{10,10},{-10,-10}})));
  DoubleActing.DA_Engine_v2 Engine(heff=1.41) 
    annotation (Placement(transformation(origin={23.25,52.9},
extent={{-30.75,-28.9},{30.75,28.9}})));
equation
  connect(rOM_Basis.ROM_IN[1], ramp.y) 
  annotation(Line(origin={-28,-89},
points={{18.64,-0.447239},{-19,-0.44724}},
color={0,0,127}));
  connect(world.frame_b, revolute.frame_b) 
  annotation(Line(origin={-50.5,4.84},
points={{-50,65.4},{-23.6,65.4},{-23.6,24.8},{-18,24.8}}));
  connect(inertia.flange_b, revolute.axis) 
  annotation(Line(origin={-50.5,4.84},
points={{-18,-40},{-8,-40},{-8,14.8}}));
  connect(damper.flange_b, fixed_ground.flange) 
  annotation(Line(origin={-0.5,-45.16},
points={{-120,10},{-128,10},{-128,-14}},
color={0,0,0}));
  connect(damper.flange_a, inertia.flange_a) 
  annotation(Line(origin={-26.5,-33.16},
points={{-74,-2},{-62,-2}},
color={0,0,0}));
  connect(world.frame_b, Engine.cylinder_a) 
  annotation(Line(origin={-54,70.04},
points={{-46.5,0.2},{46.5,0.2}},
color={95,95,95},
thickness=0.5));
  connect(revolute.frame_a, Engine.cylinder_a1) 
  annotation(Line(origin={-28,30.04},
points={{-20.5,-0.4},{20.5,-0.4},{20.5,-0.26}},
color={95,95,95},
thickness=0.5));
  connect(const.y, Engine.T_Na) 
  annotation(Line(origin={4.25,102.9},
points={{-20,16},{19,16},{19,-15.32}},
color={0,0,127}));
  end Test_Rom;