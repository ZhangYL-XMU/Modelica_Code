within SFR.Stirling.MechanicalGas;
model Stirling
  import Modelica.Units.SI;
  parameter Boolean animation = true;

  parameter SI.Length cylinderTopPosition = 0.42;
  parameter SI.Length pistonLength = 0.1;
  parameter SI.Length rodLength = 0.2;
  parameter SI.Length crankLength = 0.2;
  parameter SI.Length crankPinOffset = 0.1;
  parameter SI.Length crankPinLength = 0.1;
  parameter SI.Angle cylinderInclinationAngle = 0;
  parameter SI.Angle crankAngleOffset = -1.5707963267949;
  parameter SI.Length cylinderLength = cylinderTopPosition - (pistonLength +
    rodLength - crankPinOffset);

  parameter SI.Length cylinderTopPosition1 = 0.42;
  parameter SI.Length pistonLength1 = 0.1;
  parameter SI.Length rodLength1 = 0.2;
  parameter SI.Length crankLength1 = 0.2;
  parameter SI.Length crankPinOffset1 = 0.1;
  parameter SI.Length crankPinLength1 = 0.1;
  parameter SI.Angle cylinderInclinationAngle1 = 0.785398163397448;
  parameter SI.Angle crankAngleOffset1 = -1.5707963267949;
  parameter SI.Length cylinderLength1 = cylinderTopPosition1 - (pistonLength1 +
    rodLength1 - crankPinOffset1);

  Modelica.Mechanics.MultiBody.Parts.BodyCylinder piston(
    diameter = 0.1,
    r = {0, pistonLength, 0},
    innerDiameter = 0.05,
    color = {180, 180, 180},
    animation = animation) annotation(Placement(transformation(origin = {-126, 6},
    extent = {{10, 10}, {-10, -10}},
    rotation = 270)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox connectingRod(
    widthDirection = {1, 0, 0},
    height = 0.06,
    color = {0, 0, 200},
    width = 0.02,
    r_shape = {0, -0.02, 0},
    r = {0, rodLength, 0},
    animation = animation) annotation(Placement(transformation(origin = {-84, -36},
    extent = {{-10, -10}, {10, 10}},
    rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Revolute b2(
    n(displayUnit = "1") = {1, 0, 0},
    cylinderLength = cylinderLength,
    animation = animation,
    cylinderDiameter = 0.055) annotation(Placement(transformation(origin = {-104, -16},
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Parts.BodyBox crank4(
    height = 0.05,
    widthDirection = {1, 0, 0},
    width = 0.02,
    r = {0, -crankPinOffset, 0},
    animation = animation) 
    annotation(Placement(transformation(origin = {-94, -96},
    extent = {{10, -10}, {-10, 10}},
    rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank3(
    r_shape = {-0.01, 0, 0},
    length = 0.12,
    diameter = 0.03,
    r = {crankPinLength, 0, 0},
    color = {180, 180, 180},
    animation = animation) annotation(Placement(transformation(origin = {-123.5, -76},
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank1(
    diameter = 0.05,
    r_shape = {-0.01, 0, 0},
    length = 0.12,
    r = {crankLength - crankPinLength, 0, 0},
    color = {180, 180, 180},
    animation = animation) annotation(Placement(transformation(origin = {-184, -116},
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Parts.BodyBox crank2(
    height = 0.05,
    widthDirection = {1, 0, 0},
    width = 0.02,
    r = {0, crankPinOffset, 0},
    animation = animation) annotation(Placement(transformation(origin = {-154, -96},
    extent = {{-10, -10}, {10, 10}},
    rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint b1(
    n(displayUnit = "1") = {1, 0, 0},
    cylinderLength = cylinderLength,
    animation = animation,
    cylinderDiameter = 0.055) 
    annotation(Placement(transformation(origin = {-104, -56},
    extent = {{-10, 10}, {10, -10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation mid(r = {crankPinLength / 2, 0,
    0}, animation = false) 
    annotation(Placement(transformation(origin = {-134, -56},
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic cylinder(
    useAxisFlange = true,
    n(displayUnit = "1") = {0, 1, 0},
    boxWidth = 0.02,
    s(start = 0.2)) annotation(Placement(transformation(origin = {-124, 34},
    extent = {{-10, -10}, {10, 10}},
    rotation = 270)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation mounting(r = {crankLength, 0,
    0}, animation = false) 
    annotation(Placement(transformation(origin = {-134, 74},
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation cylinderInclination(
    r = {crankLength - crankPinLength / 2, 0, 0},
    n_y = {0, Modelica.Math.cos(cylinderInclinationAngle), Modelica.Math.sin(
    cylinderInclinationAngle)},
    animation = false,
    rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
    annotation(Placement(transformation(origin = {-204, 14},
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle1(
    n_y = {0, Modelica.Math.cos(crankAngleOffset), Modelica.Math.sin(
    crankAngleOffset)},
    animation = false,
    rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
    annotation(Placement(transformation(origin = {-224, -116},
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle2(
    n_y = {0, Modelica.Math.cos(-crankAngleOffset), Modelica.Math.sin(-
    crankAngleOffset)},
    animation = false,
    rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
    annotation(Placement(transformation(origin = {-64, -116},
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation cylinderTop(r = {0,
    cylinderTopPosition, 0}, animation = false) 
    annotation(Placement(transformation(origin = {-174, 34},
    extent = {{-10, -10}, {10, 10}},
    rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder piston1(
    diameter = 0.1,
    r = {0, pistonLength1, 0},
    innerDiameter = 0.05,
    color = {180, 180, 180},
    animation = animation) annotation(Placement(transformation(origin = {164, 4},
    extent = {{10, 10}, {-10, -10}},
    rotation = 270)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox connectingRod1(
    widthDirection = {1, 0, 0},
    height = 0.06,
    color = {0, 0, 200},
    width = 0.02,
    r_shape = {0, -0.02, 0},
    r = {0, rodLength1, 0},
    animation = animation) annotation(Placement(transformation(origin = {204, -36},
    extent = {{-10, -10}, {10, 10}},
    rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Revolute b3(
    n = {1, 0, 0},
    cylinderLength = cylinderLength1,
    animation = animation,
    cylinderDiameter = 0.055) annotation(Placement(transformation(origin = {184, -16},
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Parts.BodyBox crank5(
    height = 0.05,
    widthDirection = {1, 0, 0},
    width = 0.02,
    r = {0, -crankPinOffset1, 0},
    animation = animation) 
    annotation(Placement(transformation(origin = {194, -96},
    extent = {{10, -10}, {-10, 10}},
    rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank6(
    r_shape = {-0.01, 0, 0},
    length = 0.12,
    diameter = 0.03,
    r = {crankPinLength1, 0, 0},
    color = {180, 180, 180},
    animation = animation) annotation(Placement(transformation(origin = {164.5, -76},
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank7(
    diameter = 0.05,
    r_shape = {-0.01, 0, 0},
    length = 0.12,
    r = {crankLength1 - crankPinLength1, 0, 0},
    color = {180, 180, 180},
    animation = animation) annotation(Placement(transformation(origin = {104, -116},
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Parts.BodyBox crank8(
    height = 0.05,
    widthDirection = {1, 0, 0},
    width = 0.02,
    r = {0, crankPinOffset1, 0},
    animation = animation) annotation(Placement(transformation(origin = {134, -96},
    extent = {{-10, -10}, {10, 10}},
    rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint b4(
    n = {1, 0, 0},
    cylinderLength = cylinderLength1,
    animation = animation,
    cylinderDiameter = 0.055) 
    annotation(Placement(transformation(origin = {184, -56},
    extent = {{-10, 10}, {10, -10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation mid1(r = {crankPinLength1 / 2,
    0, 0}, animation = false) 
    annotation(Placement(transformation(origin = {154, -56},
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic cylinder1(
    useAxisFlange = true,
    n(displayUnit = "1") = {0, 1, 0},
    boxWidth = 0.02,
    s(start = 0.2)) annotation(Placement(transformation(origin = {164, 34},
    extent = {{-10, -10}, {10, 10}},
    rotation = 270)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation mounting1(r = {crankLength1,
    0, 0}, animation = false) 
    annotation(Placement(transformation(origin = {154, 74},
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation cylinderInclination1(
    r = {crankLength1 - crankPinLength1 / 2, 0, 0},
    n_y = {0, Modelica.Math.cos(cylinderInclinationAngle1), Modelica.Math.sin(
    cylinderInclinationAngle1)},
    animation = false,
    rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
    annotation(Placement(transformation(origin = {84, 14},
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle3(
    n_y = {0, Modelica.Math.cos(crankAngleOffset1), Modelica.Math.sin(
    crankAngleOffset1)},
    animation = false,
    rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
    annotation(Placement(transformation(origin = {64, -116},
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle4(
    n_y = {0, Modelica.Math.cos(-crankAngleOffset1), Modelica.Math.sin(-
    crankAngleOffset1)},
    animation = false,
    rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
    annotation(Placement(transformation(origin = {224, -116},
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation cylinderTop1(r = {0,
    cylinderTopPosition1, 0}, animation = false) 
    annotation(Placement(transformation(origin = {114, 34},
    extent = {{-10, -10}, {10, 10}},
    rotation = 90)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_a 
    annotation(Placement(transformation(origin = {-244, 74},
    extent = {{-16, -16}, {16, 16}})));
protected
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_b 
    annotation(Placement(transformation(origin = {-44, 74},
    extent = {{-16, -16}, {16, 16}})));
public
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_a 
    annotation(Placement(transformation(origin = {-244, -126},
    extent = {{-16, -16}, {16, 16}})));
protected
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_b 
    annotation(Placement(transformation(origin = {-44, -126},
    extent = {{-16, -16}, {16, 16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_a1 
    annotation(Placement(transformation(origin = {44, 74},
    extent = {{-16, -16}, {16, 16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_a1 
    annotation(Placement(transformation(origin = {44, -126},
    extent = {{-16, -16}, {16, 16}})));
public
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_b1 
    annotation(Placement(transformation(origin = {244, -126},
    extent = {{-16, -16}, {16, 16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_b1 
    annotation(Placement(transformation(origin = {246, 76},
    extent = {{-16, -16}, {16, 16}})));
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor 
    annotation(Placement(transformation(origin = {26, 10},
    extent = {{-10, -10}, {10, 10}},
    rotation = 180)));
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor1 
    annotation(Placement(transformation(origin = {-70, 8},
    extent = {{-10, -10}, {10, 10}})));
  Mechanical_part.ModelConnectors_Forces sample_Gas annotation(Placement(transformation(origin = {-90, 42},
    extent = {{-10, -10}, {10, 10}},
    rotation = 90)));
  Gas_Dynamic.Gas_Dynamic gas_Dynamic(
    d1 = 0.14,
    l_d = 0.1,
    d2 = 0.14,
    dc = 0.16,
    P1(fixed = true),
    n1(fixed = true),
    n2(fixed = true),
    nt(fixed = true),
    Vm1 = 0.0015,
    Vm2 = 0.002,
    Uc = 1085,
    Uf = 1000, Z = 7, Po = 8.999999999999999e5) annotation(Placement(transformation(origin = {-22, 4},
    extent = {{-10, -10}, {10, 10}},
    rotation = 90)));
  Mechanical_part.ModelConnectors_Forces sample_Gas1 annotation(Placement(transformation(origin = {202, 40},
    extent = {{-10, -10}, {10, 10}},
    rotation = 90)));
  Modelica.Blocks.Interfaces.RealOutput power 
    annotation(Placement(transformation(origin = {-64, -169},
    extent = {{-17, -17}, {17, 17}},
    rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput Hot 
    annotation(Placement(transformation(origin = {-72, 120},
    extent = {{-20, -20}, {20, 20}},
    rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput Cold 
    annotation(Placement(transformation(origin = {60, 120},
    extent = {{-20, -20}, {20, 20}},
    rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput efficient 
    annotation(Placement(transformation(origin = {64, -169},
    extent = {{-17, -17}, {17, 17}},
    rotation = -90)));
equation
  power = gas_Dynamic.power;
  efficient = gas_Dynamic.power / gas_Dynamic.Qpc;
  connect(b1.frame_a, mid.frame_b) annotation(Line(
    points = {{-114, -56}, {-124, -56}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(connectingRod.frame_a, b1.frame_b) annotation(Line(
    points = {{-84, -46}, {-84, -56}, {-94, -56}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(cylinder.frame_b, piston.frame_b) annotation(Line(
    points = {{-124, 24}, {-124, 16}, {-126, 16}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(crank1.frame_a, crankAngle1.frame_b) 
    annotation(Line(
    points = {{-194, -116}, {-214, -116}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(b2.frame_a, piston.frame_a) annotation(Line(
    points = {{-114, -16}, {-126, -16}, {-126, -4}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(connectingRod.frame_b, b2.frame_b) annotation(Line(
    points = {{-84, -26}, {-84, -16}, {-94, -16}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(crank4.frame_b, crankAngle2.frame_a) annotation(Line(
    points = {{-94, -106}, {-94, -116}, {-74, -116}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(cylinderInclination.frame_b, cylinderTop.frame_a) 
    annotation(Line(
    points = {{-194, 14}, {-174, 14}, {-174, 24}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(crank1.frame_b, crank2.frame_a) annotation(Line(
    points = {{-174, -116}, {-154, -116}, {-154, -106}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(crank3.frame_b, crank4.frame_a) annotation(Line(
    points = {{-113.5, -76}, {-94, -76}, {-94, -86}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(crank3.frame_a, crank2.frame_b) annotation(Line(
    points = {{-133.5, -76}, {-154, -76}, {-154, -86}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(crank2.frame_b, mid.frame_a) annotation(Line(
    points = {{-154, -86}, {-154, -56}, {-144, -56}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(cylinderTop.frame_b, cylinder.frame_a) annotation(Line(
    points = {{-174, 44}, {-174, 54}, {-124, 54}, {-124, 44}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(cylinderInclination.frame_a, cylinder_a) annotation(Line(
    points = {{-214, 14}, {-224, 14}, {-224, 74}, {-244, 74}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(mounting.frame_a, cylinder_a) annotation(Line(
    points = {{-144, 74}, {-244, 74}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(mounting.frame_b, cylinder_b) annotation(Line(
    points = {{-124, 74}, {-44, 74}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(crankAngle1.frame_a, crank_a) annotation(Line(
    points = {{-234, -116}, {-244, -116}, {-244, -126}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(crankAngle2.frame_b, crank_b) annotation(Line(
    points = {{-54, -116}, {-44, -116}, {-44, -126}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(b4.frame_a, mid1.frame_b) annotation(Line(
    points = {{174, -56}, {164, -56}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(connectingRod1.frame_a, b4.frame_b) annotation(Line(
    points = {{204, -46}, {204, -56}, {194, -56}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(cylinder1.frame_b, piston1.frame_b) annotation(Line(
    points = {{164, 24}, {164, 14}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(crank7.frame_a, crankAngle3.frame_b) 
    annotation(Line(
    points = {{94, -116}, {74, -116}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(b3.frame_a, piston1.frame_a) annotation(Line(
    points = {{174, -16}, {164, -16}, {164, -6}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(connectingRod1.frame_b, b3.frame_b) annotation(Line(
    points = {{204, -26}, {204, -16}, {194, -16}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(crank5.frame_b, crankAngle4.frame_a) annotation(Line(
    points = {{194, -106}, {194, -116}, {214, -116}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(cylinderInclination1.frame_b, cylinderTop1.frame_a) annotation(Line(
    points = {{94, 14}, {114, 14}, {114, 24}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(crank7.frame_b, crank8.frame_a) annotation(Line(
    points = {{114, -116}, {134, -116}, {134, -106}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(crank6.frame_b, crank5.frame_a) annotation(Line(
    points = {{174.5, -76}, {194, -76}, {194, -86}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(crank6.frame_a, crank8.frame_b) annotation(Line(
    points = {{154.5, -76}, {134, -76}, {134, -86}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(crank8.frame_b, mid1.frame_a) annotation(Line(
    points = {{134, -86}, {134, -56}, {144, -56}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(cylinderTop1.frame_b, cylinder1.frame_a) annotation(Line(
    points = {{114, 44}, {114, 54}, {164, 54}, {164, 44}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(cylinderInclination1.frame_a, cylinder_a1) annotation(Line(
    points = {{74, 14}, {64, 14}, {64, 74}, {44, 74}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(mounting1.frame_a, cylinder_a1) annotation(Line(
    points = {{144, 74}, {44, 74}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(crankAngle3.frame_a, crank_a1) annotation(Line(
    points = {{54, -116}, {44, -116}, {44, -126}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(crankAngle4.frame_b, crank_b1) annotation(Line(
    points = {{234, -116}, {244, -116}, {244, -126}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(crank_b, crank_a1) annotation(Line(
    points = {{-44, -126}, {44, -126}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(cylinder_a1, cylinder_b) annotation(Line(
    points = {{44, 74}, {-44, 74}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(cylinder_b1, mounting1.frame_b) annotation(Line(
    points = {{246, 76}, {246, 74}, {164, 74}},
    color = {95, 95, 95},
    thickness = 0.5));
  connect(sample_Gas.flange_b, cylinder.support) 
    annotation(Line(points = {{-90, 52}, {-118, 52}, {-118, 38}}, color = {0, 127, 0}));
  connect(cylinder.axis, positionSensor1.flange) annotation(Line(points = {{-118,
    26}, {-96, 26}, {-96, 8}, {-80, 8}}, color = {0, 127, 0}));
  connect(positionSensor.flange, cylinder1.axis) annotation(Line(points = {{36, 10},
    {36, 8}, {68, 8}, {68, 40}, {96, 40}, {96, 60}, {136, 60}, {136, 56}, {180, 56}, {180,
    26}, {170, 26}}, color = {0, 127, 0}));
  connect(positionSensor1.s, gas_Dynamic.u) 
    annotation(Line(origin = {0, 0},
    points = {{-59, 8}, {-59, 10}, {-36.2, 10}},
    color = {0, 0, 127}));
  connect(gas_Dynamic.u1, positionSensor.s) annotation(Line(origin = {0, 0},
    points = {{-8, 10}, {15, 10}},
    color = {0, 0, 127}));
  connect(gas_Dynamic.fo, sample_Gas.f_mt) annotation(Line(origin = {0, 0},
    points = {{-27, 16.8}, {-27, 42}, {-101, 42}},
    color = {0, 0, 127}));
  connect(gas_Dynamic.u3, Cold) annotation(Line(origin = {0, 0},
    points = {{-8, -2}, {60, -2}, {60, 128}},
    color = {0, 0, 127}), __MWORKS(BlockSystem(NamedSignal)));
  connect(sample_Gas.flange_a, cylinder.axis) 
    annotation(Line(points = {{-90, 32}, {-90, 26}, {-118, 26}}, color = {0, 127, 0}));
  connect(gas_Dynamic.fo1, sample_Gas1.f_mt) annotation(Line(origin = {0, 0},
    points = {{-17, 16.8}, {-17, 22}, {4, 22}, {4, -8}, {140, -8}, {140, 16}, {191, 16}, {191, 40}},
    color = {0, 0, 127}));
  connect(sample_Gas1.flange_a, cylinder1.axis) annotation(Line(points = {{
    202, 30}, {204, 30}, {204, 26}, {170, 26}}, color = {0, 127, 0}));
  connect(sample_Gas1.flange_b, cylinder1.support) annotation(Line(points =
    {{202, 50}, {184, 50}, {184, 38}, {170, 38}}, color = {0, 127, 0}));
  annotation(Icon(coordinateSystem(extent = {{-260, -152}, {266, 100}},
    grid = {2, 2})), Diagram(coordinateSystem(extent = {{-520, -300}, {520, 220}},
    grid = {2, 2})));
  connect(Hot, gas_Dynamic.u2) 
    annotation(Line(origin = {-95, 70},
    points = {{35, 62}, {35, -78}, {55, -78}, {55, -72}, {59, -72}},
    color = {0, 0, 127}));
end Stirling;