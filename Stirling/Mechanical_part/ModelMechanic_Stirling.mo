within SFR.Stirling.Mechanical_part;
model ModelMechanic_Stirling


  import  Modelica.Units.SI;
  parameter Boolean animation=true;

  parameter SI.Length cylinderTopPosition=0.42;
  parameter SI.Length pistonLength=0.1;
  parameter SI.Length rodLength=0.2;
  parameter SI.Length crankLength=0.2;
  parameter SI.Length crankPinOffset=0.1;
  parameter SI.Length crankPinLength=0.1;
  parameter SI.Angle cylinderInclinationAngle=0;
  parameter SI.Angle crankAngleOffset(displayUnit="deg")=-1.5707963267949;
  parameter SI.Length cylinderLength=cylinderTopPosition - (pistonLength +rodLength - crankPinOffset);

  parameter SI.Length cylinderTopPosition1=0.42;
  parameter SI.Length pistonLength1=0.1;
  parameter SI.Length rodLength1=0.2;
  parameter SI.Length crankLength1=0.2;
  parameter SI.Length crankPinOffset1=0.1;
  parameter SI.Length crankPinLength1=0.1;
  parameter SI.Angle cylinderInclinationAngle1(displayUnit="deg")=0.785398163397448;
  parameter SI.Angle crankAngleOffset1=-1.5707963267949;
  parameter SI.Length cylinderLength1=cylinderTopPosition1 - (pistonLength1 +rodLength1 - crankPinOffset1);




  Modelica.Mechanics.MultiBody.Parts.BodyCylinder piston(
    diameter=0.1,
    r={0,pistonLength,0},
    color={180,180,180},
    animation=animation) annotation (Placement(transformation(origin={-96,28},
extent={{10,10},{-10,-10}},
rotation=270)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox connectingRod(
    widthDirection={1,0,0},
    height=0.06,
    color={0,0,200},
    width=0.02,
    r_shape={0,-0.02,0},
    r={0,rodLength,0},
    animation=animation) annotation (Placement(transformation(origin={-56,-12},
extent={{-10,-10},{10,10}},
rotation=90)));
  Modelica.Mechanics.MultiBody.Joints.Revolute b2(
    n={1,0,0},
    cylinderLength=cylinderLength,
    animation=animation,
    cylinderDiameter=0.055) annotation (Placement(transformation(origin={-76,8},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Parts.BodyBox crank4(
    height=0.05,
    widthDirection={1,0,0},
    width=0.02,
    r={0,-crankPinOffset,0},
    animation=animation) 
    annotation (Placement(transformation(origin={-66,-72},
extent={{10,-10},{-10,10}},
rotation=90)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank3(
    r_shape={-0.01,0,0},
    length=0.12,
    diameter=0.03,
    r={crankPinLength,0,0},
    color={180,180,180},
    animation=animation) annotation (Placement(transformation(origin={-95.5,-52},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank1(
    diameter=0.05,
    r_shape={-0.01,0,0},
    length=0.12,
    r={crankLength - crankPinLength,0,0},
    color={180,180,180},
    animation=animation) annotation (Placement(transformation(origin={-156,-92},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Parts.BodyBox crank2(
    height=0.05,
    widthDirection={1,0,0},
    width=0.02,
    r={0,crankPinOffset,0},
    animation=animation) annotation (Placement(transformation(origin={-126,-72},
extent={{-10,-10},{10,10}},
rotation=90)));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint b1(
    n={1,0,0},
    cylinderLength=cylinderLength,
    animation=animation,
    cylinderDiameter=0.055) annotation (Placement(transformation(origin={-76,-32},
extent={{-10,10},{10,-10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation mid(r={crankPinLength/2,0,0}, animation=
        false) annotation (Placement(transformation(origin={-106,-32},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic cylinder(useAxisFlange=true,
    s(start=0.2),
    n={0, 1, 0},
    boxWidth=0.02,animation=true) annotation (Placement(transformation(origin={-96,58},
extent={{-10,-10},{10,10}},
rotation=270)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation mounting(r={crankLength,0,0}, animation=
        false) annotation (Placement(transformation(origin={-106,98},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation cylinderInclination(
    r={crankLength - crankPinLength/2,0,0},
    n_y={0,Modelica.Math.cos(cylinderInclinationAngle),Modelica.Math.sin(cylinderInclinationAngle)},
    animation=false,
    rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
    annotation (Placement(transformation(origin={-176,38},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle1(
    n_y={0,Modelica.Math.cos(crankAngleOffset),Modelica.Math.sin(crankAngleOffset)},
    animation=false,
    rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
    annotation (Placement(transformation(origin={-196,-92},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle2(
    n_y={0,Modelica.Math.cos(-crankAngleOffset),Modelica.Math.sin(-crankAngleOffset)},
    animation=false,
    rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
    annotation (Placement(transformation(origin={-36,-92},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation cylinderTop(r={0,cylinderTopPosition,0},
      animation=false) annotation (Placement(transformation(origin={-146,58},
extent={{-10,-10},{10,10}},
rotation=90)));
  ModelConnectors_Forces gasForce 
    annotation (Placement(transformation(origin={-56,58},
extent={{-10,10},{10,-10}},
rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_a annotation (Placement(transformation(origin={-216,98},
extent={{-16,-16},{16,16}})));

  Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_b annotation (Placement(transformation(origin={-16,98},
extent={{-16,-16},{16,16}})));

  Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_a annotation (Placement(transformation(origin={-216,-102},
extent={{-16,-16},{16,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_b annotation (Placement(transformation(origin={-16,-102},
extent={{-16,-16},{16,16}})));


  Modelica.Mechanics.MultiBody.Parts.BodyCylinder piston1(
    diameter=0.1,
    r={0,pistonLength1,0},
    color={180,180,180},
    animation=animation) annotation (Placement(transformation(origin={136,28},
extent={{10,10},{-10,-10}},
rotation=270)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox connectingRod1(
    widthDirection={1,0,0},
    height=0.06,
    color={0,0,200},
    width=0.02,
    r_shape={0,-0.02,0},
    r={0,rodLength1,0},
    animation=animation) annotation (Placement(transformation(origin={176,-12},
extent={{-10,-10},{10,10}},
rotation=90)));
  Modelica.Mechanics.MultiBody.Joints.Revolute b3(
    n={1,0,0},
    cylinderLength=cylinderLength1,
    animation=animation,
    cylinderDiameter=0.055) annotation (Placement(transformation(origin={156,8},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Parts.BodyBox crank5(
    height=0.05,
    widthDirection={1,0,0},
    width=0.02,
    r={0,-crankPinOffset1,0},
    animation=animation) 
    annotation (Placement(transformation(origin={166,-72},
extent={{10,-10},{-10,10}},
rotation=90)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank6(
    r_shape={-0.01,0,0},
    length=0.12,
    diameter=0.03,
    r={crankPinLength1,0,0},
    color={180,180,180},
    animation=animation) annotation (Placement(transformation(origin={136.5,-52},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank7(
    diameter=0.05,
    r_shape={-0.01,0,0},
    length=0.12,
    r={crankLength1 - crankPinLength1,0,0},
    color={180,180,180},
    animation=animation) annotation (Placement(transformation(origin={76,-92},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Parts.BodyBox crank8(
    height=0.05,
    widthDirection={1,0,0},
    width=0.02,
    r={0,crankPinOffset1,0},
    animation=animation) annotation (Placement(transformation(origin={106,-72},
extent={{-10,-10},{10,10}},
rotation=90)));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint b4(
    n={1,0,0},
    cylinderLength=cylinderLength1,
    animation=animation,
    cylinderDiameter=0.055) annotation (Placement(transformation(origin={156,-32},
extent={{-10,10},{10,-10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation mid1(r={crankPinLength1/2,0,0}, animation=
        false) annotation (Placement(transformation(origin={126,-32},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic cylinder1(useAxisFlange=false,
    s(start=0.2),
    n={0, 1, 0},
    boxWidth=0.02) annotation (Placement(transformation(origin={136,58},
extent={{-10,-10},{10,10}},
rotation=270)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation mounting1(r={crankLength1,0,0}, animation=
        false) annotation (Placement(transformation(origin={126,98},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation cylinderInclination1(
    r={crankLength1 - crankPinLength1/2,0,0},
    n_y={0,Modelica.Math.cos(cylinderInclinationAngle1),Modelica.Math.sin(cylinderInclinationAngle1)},
    animation=false,
    rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
    annotation (Placement(transformation(origin={56,38},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle3(
    n_y={0,Modelica.Math.cos(crankAngleOffset1),Modelica.Math.sin(crankAngleOffset1)},
    animation=false,
    rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
    annotation (Placement(transformation(origin={36,-92},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle4(
    n_y={0,Modelica.Math.cos(-crankAngleOffset1),Modelica.Math.sin(-crankAngleOffset1)},
    animation=false,
    rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
    annotation (Placement(transformation(origin={196,-92},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation cylinderTop1(r={0,cylinderTopPosition1,0},
      animation=false) annotation (Placement(transformation(origin={86,58},
extent={{-10,-10},{10,10}},
rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_a1 annotation (Placement(transformation(origin={16,98},
extent={{-16,-16},{16,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_b1 annotation (Placement(transformation(origin={216,98},
extent={{-16,-16},{16,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_a1 annotation (Placement(transformation(origin={16,-102},
extent={{-16,-16},{16,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_b1 annotation (Placement(transformation(origin={216,-102},
extent={{-16,-16},{16,16}})));
  Modelica.Blocks.Sources.Sine sine(f=30,amplitude=12000) 
    annotation (Placement(transformation(origin={-16,44}, extent={{10,-10},
            {-10,10}})));
equation
  connect(b1.frame_a, mid.frame_b) 
  annotation(Line(origin={-116,-2},
points={{30,-30},{20,-30}},
color={95,95,95},
thickness=0.5));
  connect(connectingRod.frame_a, b1.frame_b) 
  annotation(Line(origin={-116,-2},
points={{60,-20},{60,-30},{50,-30}},
color={95,95,95},
thickness=0.5));
  connect(cylinder.frame_b, piston.frame_b) 
  annotation(Line(origin={-116,-2},
points={{20,50},{20,40}},
color={95,95,95},
thickness=0.5));
  connect(crank1.frame_a, crankAngle1.frame_b) 
  annotation(Line(origin={-116,-2},
points={{-50,-90},{-70,-90}},
color={95,95,95},
thickness=0.5));
  connect(b2.frame_a, piston.frame_a) 
  annotation(Line(origin={-116,-2},
points={{30,10},{20,10},{20,20}},
color={95,95,95},
thickness=0.5));
  connect(connectingRod.frame_b, b2.frame_b) 
  annotation(Line(origin={-116,-2},
points={{60,0},{60,10},{50,10}},
color={95,95,95},
thickness=0.5));
  connect(crank4.frame_b, crankAngle2.frame_a) 
  annotation(Line(origin={-116,-2},
points={{50,-80},{50,-90},{70,-90}},
color={95,95,95},
thickness=0.5));
  connect(cylinderInclination.frame_b, cylinderTop.frame_a) 
  annotation(Line(origin={-116,-2},
points={{-50,40},{-30,40},{-30,50}},
color={95,95,95},
thickness=0.5));
  connect(crank1.frame_b, crank2.frame_a) 
  annotation(Line(origin={-116,-2},
points={{-30,-90},{-10,-90},{-10,-80}},
color={95,95,95},
thickness=0.5));
  connect(crank3.frame_b, crank4.frame_a) 
  annotation(Line(origin={-116,-2},
points={{30.5,-50},{50,-50},{50,-60}},
color={95,95,95},
thickness=0.5));
  connect(crank3.frame_a, crank2.frame_b) 
  annotation(Line(origin={-116,-2},
points={{10.5,-50},{-10,-50},{-10,-60}},
color={95,95,95},
thickness=0.5));
  connect(crank2.frame_b, mid.frame_a) 
  annotation(Line(origin={-116,-2},
points={{-10,-60},{-10,-30},{0,-30}},
color={95,95,95},
thickness=0.5));
  connect(cylinderTop.frame_b, cylinder.frame_a) 
  annotation(Line(origin={-116,-2},
points={{-30,70},{-30,80},{20,80},{20,70}},
color={95,95,95},
thickness=0.5));
  connect(cylinderInclination.frame_a, cylinder_a) 
  annotation(Line(origin={-116,-2},
points={{-70,40},{-80,40},{-80,100},{-100,100}},
color={95,95,95},
thickness=0.5));
  connect(mounting.frame_a, cylinder_a) 
  annotation(Line(origin={-116,-2},
points={{0,100},{-100,100}},
color={95,95,95},
thickness=0.5));
  connect(mounting.frame_b, cylinder_b) 
  annotation(Line(origin={-116,-2},
points={{20,100},{100,100}},
color={95,95,95},
thickness=0.5));
  connect(crankAngle1.frame_a, crank_a) 
  annotation(Line(origin={-116,-2},
points={{-90,-90},{-100,-90},{-100,-100}},
color={95,95,95},
thickness=0.5));
  connect(crankAngle2.frame_b, crank_b) 
  annotation(Line(origin={-116,-2},
points={{90,-90},{100,-90},{100,-100}},
color={95,95,95},
thickness=0.5));
  connect(b4.frame_a, mid1.frame_b) 
  annotation(Line(origin={116,-2},
points={{30,-30},{20,-30}},
color={95,95,95},
thickness=0.5));
  connect(connectingRod1.frame_a, b4.frame_b) 
  annotation(Line(origin={116,-2},
points={{60,-20},{60,-30},{50,-30}},
color={95,95,95},
thickness=0.5));
  connect(cylinder1.frame_b, piston1.frame_b) 
  annotation(Line(origin={116,-2},
points={{20,50},{20,40}},
color={95,95,95},
thickness=0.5));
  connect(crank7.frame_a, crankAngle3.frame_b) 
  annotation(Line(origin={116,-2},
points={{-50,-90},{-70,-90}},
color={95,95,95},
thickness=0.5));
  connect(b3.frame_a, piston1.frame_a) 
  annotation(Line(origin={116,-2},
points={{30,10},{20,10},{20,20}},
color={95,95,95},
thickness=0.5));
  connect(connectingRod1.frame_b, b3.frame_b) 
  annotation(Line(origin={116,-2},
points={{60,0},{60,10},{50,10}},
color={95,95,95},
thickness=0.5));
  connect(crank5.frame_b, crankAngle4.frame_a) 
  annotation(Line(origin={116,-2},
points={{50,-80},{50,-90},{70,-90}},
color={95,95,95},
thickness=0.5));
  connect(cylinderInclination1.frame_b, cylinderTop1.frame_a) 
  annotation(Line(origin={116,-2},
points={{-50,40},{-30,40},{-30,50}},
color={95,95,95},
thickness=0.5));
  connect(crank7.frame_b, crank8.frame_a) 
  annotation(Line(origin={116,-2},
points={{-30,-90},{-10,-90},{-10,-80}},
color={95,95,95},
thickness=0.5));
  connect(crank6.frame_b, crank5.frame_a) 
  annotation(Line(origin={116,-2},
points={{30.5,-50},{50,-50},{50,-60}},
color={95,95,95},
thickness=0.5));
  connect(crank6.frame_a, crank8.frame_b) 
  annotation(Line(origin={116,-2},
points={{10.5,-50},{-10,-50},{-10,-60}},
color={95,95,95},
thickness=0.5));
  connect(crank8.frame_b, mid1.frame_a) 
  annotation(Line(origin={116,-2},
points={{-10,-60},{-10,-30},{0,-30}},
color={95,95,95},
thickness=0.5));
  connect(cylinderTop1.frame_b, cylinder1.frame_a) 
  annotation(Line(origin={116,-2},
points={{-30,70},{-30,80},{20,80},{20,70}},
color={95,95,95},
thickness=0.5));
  connect(cylinderInclination1.frame_a, cylinder_a1) 
  annotation(Line(origin={116,-2},
points={{-70,40},{-80,40},{-80,100},{-100,100}},
color={95,95,95},
thickness=0.5));
  connect(mounting1.frame_a, cylinder_a1) 
  annotation(Line(origin={116,-2},
points={{0,100},{-100,100}},
color={95,95,95},
thickness=0.5));
  connect(mounting1.frame_b, cylinder_b1) 
  annotation(Line(origin={116,-2},
points={{20,100},{100,100}},
color={95,95,95},
thickness=0.5));
  connect(crankAngle3.frame_a, crank_a1) 
  annotation(Line(origin={116,-2},
points={{-90,-90},{-100,-90},{-100,-100}},
color={95,95,95},
thickness=0.5));
  connect(crankAngle4.frame_b, crank_b1) 
  annotation(Line(origin={116,-2},
points={{90,-90},{100,-90},{100,-100}},
color={95,95,95},
thickness=0.5));
  connect(cylinder_b, cylinder_a1) 
  annotation(Line(origin={0,98},
  points={{-16,0},{16,0}},
  color={95,95,95},
  thickness=0.5));
  connect(crank_b, crank_a1) 
  annotation(Line(origin={0,-102},
  points={{-16,0},{16,0}},
  color={95,95,95},
  thickness=0.5));
  connect(gasForce.f_mt, sine.y) 
  annotation(Line(origin={-33,58},
      points={{-12,0},{-1,0},{-1,-14},{6,-14}},
      color={0,0,127}));
  connect(cylinder.support, gasForce.flange_b) 
  annotation(Line(origin={-73,67},
points={{-17,-5},{3,-5},{3,4},{17,4},{17,1}},
color={0,127,0}));
  connect(cylinder.axis, gasForce.flange_a) 
  annotation(Line(origin={-73,48},
points={{-17,2},{-17,-3},{17,-3},{17,7.10543e-15}},
color={0,127,0}));

  annotation(Diagram(coordinateSystem(extent={{-216,-100},{216,100}},
grid={2,2})),Icon(coordinateSystem(extent={{-282,-100},{284,100}},
grid={2,2})));
end ModelMechanic_Stirling;