within SFR.Stirling.StirlingEngine;
model Stirling_Engine
  annotation(__MWORKS(version="2025b"),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true, n(
        displayUnit="1") = {1,0,0}) annotation (Placement(transformation(origin={-342,46},
extent={{-10,-10},{10,10}},
rotation=180)));
  inner Modelica.Mechanics.MultiBody.World world 
    annotation (Placement(transformation(origin={-386,114},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=2) 
    annotation (Placement(transformation(origin={-370,2},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Sum sum1(nin=4) 
    annotation (Placement(transformation(origin={58,-36},
extent={{-10,-10},{10,10}},
rotation=-90)));
  Engine_V2 engine_V2_1 
    annotation (Placement(transformation(origin={-154,94.5},
extent={{-54,-25.5},{54,25.5}})));
  Engine_V2 engine_V2_2(cylinderInclinationAngle=0,crankAngleOffset1=2.35619449019234,crankAngleOffset=1.5707963267949) 
    annotation (Placement(transformation(origin={22,94.5},
extent={{-54,-25.5},{54,25.5}})));
  Engine_V2 engine_V2_3(cylinderInclinationAngle=0,crankAngleOffset1=3.92699081698724,crankAngleOffset=3.14159265358979) 
    annotation (Placement(transformation(origin={176,94.5},
extent={{-54,-25.5},{54,25.5}})));
  Engine_V2 engine_V2_4(crankAngleOffset=4.71238898038469,crankAngleOffset1=5.49778714378214) 
    annotation (Placement(transformation(origin={330,94.5},
extent={{-54,-25.5},{54,25.5}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=440,
    duration=0,
    offset=273.15) annotation (Placement(transformation(origin={-232,200},
extent={{-16,-16},{16,16}})));
  Modelica.Blocks.Sources.Constant const1(k=273.15+50) annotation (Placement(transformation(origin={426,258},
extent={{10,-10},{-10,10}})));
  equation
  connect(world.frame_b, revolute.frame_b) 
  annotation(Line(origin={-316,66},
points={{-60,48},{-52,48},{-52,-20},{-36,-20}},
color={95,95,95},
thickness=0.5));
  connect(inertia.flange_b, revolute.axis) 
  annotation(Line(origin={-316,66},
points={{-44,-64},{-26,-64},{-26,-30}},
color={0,0,0}));
  connect(world.frame_b, engine_V2_1.cylinder_a) 
  annotation(Line(origin={-316,66},
points={{-60,48},{-17.04,48},{-17.04,40.74},{107.229,40.74}},
color={95,95,95},
thickness=0.5));
  connect(revolute.frame_a, engine_V2_1.cylinder_a1) 
  annotation(Line(origin={-316,66},
points={{-16,-20},{14.96,-20},{14.96,12.69},{107.229,12.69}},
color={95,95,95},
thickness=0.5));
  connect(engine_V2_1.frame_a, engine_V2_2.cylinder_a) 
  annotation(Line(origin={-66,107},
  points={{-34,-0.26},{33.2286,-0.26}},
  color={95,95,95},
  thickness=0.5));
  connect(engine_V2_1.frame_a1, engine_V2_2.cylinder_a1) 
  annotation(Line(origin={-66,79},
  points={{-34,-0.31},{33.2286,-0.31}},
  color={95,95,95},
  thickness=0.5));
  connect(engine_V2_2.frame_a, engine_V2_3.cylinder_a) 
  annotation(Line(origin={99,107},
  points={{-23,-0.26},{22.2286,-0.26}},
  color={95,95,95},
  thickness=0.5));
  connect(engine_V2_2.frame_a1, engine_V2_3.cylinder_a1) 
  annotation(Line(origin={99,79},
  points={{-23,-0.31},{22.2286,-0.31}},
  color={95,95,95},
  thickness=0.5));
  connect(engine_V2_3.frame_a, engine_V2_4.cylinder_a) 
  annotation(Line(origin={253,107},
  points={{-23,-0.26},{22.2286,-0.26}},
  color={95,95,95},
  thickness=0.5));
  connect(engine_V2_3.frame_a1, engine_V2_4.cylinder_a1) 
  annotation(Line(origin={253,79},
  points={{-23,-0.31},{22.2286,-0.31}},
  color={95,95,95},
  thickness=0.5));
  connect(engine_V2_1.power, sum1.u[1]) 
  annotation(Line(origin={-48,21},
points={{-135.314,44.94},{-135.314,-45},{106,-45}},
color={0,0,127}));
  connect(engine_V2_2.power, sum1.u[2]) 
  annotation(Line(origin={40,21},
points={{-47.3143,44.94},{-47.3143,-45},{18,-45}},
color={0,0,127}));
  connect(engine_V2_3.power, sum1.u[3]) 
  annotation(Line(origin={117,21},
points={{29.6857,44.94},{29.6857,-45},{-59,-45}},
color={0,0,127}));
  connect(engine_V2_4.power, sum1.u[4]) 
  annotation(Line(origin={194,21},
points={{106.686,44.94},{106.686,-45},{-136,-45}},
color={0,0,127}));
  connect(ramp.y, engine_V2_1.Hot) 
  annotation(Line(origin={-199,163},
  points={{-15.4,37},{15.366,37},{15.366,-37.9}},
  color={0,0,127}));
  connect(engine_V2_2.Hot, ramp.y) 
  annotation(Line(origin={-108,163},
  points={{100.366,-37.9},{106,-37.9},{106,37},{-106.4,37}},
  color={0,0,127}));
  connect(engine_V2_3.Hot, ramp.y) 
  annotation(Line(origin={-34,163},
  points={{180.366,-37.9},{164,-37.9},{164,37},{-180.4,37}},
  color={0,0,127}));
  connect(engine_V2_4.Hot, ramp.y) 
  annotation(Line(origin={43,163},
  points={{257.366,-37.9},{251,-37.9},{251,37},{-257.4,37}},
  color={0,0,127}));
  connect(engine_V2_1.Cold, const1.y) 
  annotation(Line(origin={146,192},
  points={{-269.424,-66.9},{-269.424,66},{269,66}},
  color={0,0,127}));
  connect(engine_V2_2.Cold, const1.y) 
  annotation(Line(origin={234,192},
  points={{-181.424,-66.9},{-168,-66.9},{-168,66},{181,66}},
  color={0,0,127}));
  connect(engine_V2_3.Cold, const1.y) 
  annotation(Line(origin={311,192},
  points={{-104.424,-66.9},{-101,-66.9},{-101,66},{104,66}},
  color={0,0,127}));
  connect(engine_V2_4.Cold, const1.y) 
  annotation(Line(origin={388,192},
  points={{-27.4244,-66.9},{-12,-66.9},{-12,66},{27,66}},
  color={0,0,127}));
  end Stirling_Engine;