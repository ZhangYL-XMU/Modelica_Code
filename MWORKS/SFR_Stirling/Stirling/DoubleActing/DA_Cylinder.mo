within SFR.Stirling.DoubleActing;
model DA_Cylinder
  // 单活塞缸块(MultiBody 曲柄滑块机构)
  // 参考文献 Stirling-dymola 三部曲: 机械模型复用 Dymola 库 V 型发动机活塞模型
  // 4 缸双作用斯特林机的每个气缸 = 1 个动力活塞
  // 4 个缸块通过曲轴串联, 曲柄相位差 90°, 由 crankAngleOffset 设定

  import Modelica.Units.SI;
  import SFR.Stirling.Mechanical_part.ModelConnectors_Forces;

  parameter Boolean animation = true "是否显示动画";

  parameter SI.Length cylinderTopPosition = 0.42 "气缸上端安装位置 [m]";
  parameter SI.Length pistonLength = 0.1 "活塞长度 [m]";
  parameter SI.Length rodLength = 0.2 "连杆长度 [m]";
  parameter SI.Length crankLength = 0.2 "曲轴主轴段长度(缸间距) [m]";
  parameter SI.Length crankPinOffset = 0.025 "曲柄半径 [m](= 活塞行程/2)";
  parameter SI.Length crankPinLength = 0.1 "曲柄销长度 [m]";
  parameter SI.Angle cylinderInclinationAngle = 0 "气缸倾角 [rad]";
  parameter SI.Angle crankAngleOffset = 0 "曲柄相位角 [rad]";
  parameter SI.Diameter pistonDiameter = 0.16 "活塞直径 [m](= 缸径)";
  parameter SI.Length cylinderLength = cylinderTopPosition - (pistonLength + rodLength - crankPinOffset) "铰链动画长度 [m]";

  // ---- 活塞 ----
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder piston(
    diameter = pistonDiameter,
    r = {0, pistonLength, 0},
    color = {180,180,180},
    animation = animation) annotation(Placement(transformation(origin={260,-56},
extent={{-30,-60},{30,60}})));

  // ---- 连杆 ----
  Modelica.Mechanics.MultiBody.Parts.BodyBox connectingRod(
    widthDirection = {1,0,0},
    height = 0.06,
    color = {0,0,200},
    width = 0.02,
    r_shape = {0,-0.02,0},
    r = {0, rodLength, 0},
    animation = animation) annotation(Placement(transformation(origin={126,92},
extent={{-30,-60},{30,60}})));

  // ---- 活塞销(活塞-连杆铰接) ----
  Modelica.Mechanics.MultiBody.Joints.Revolute b2(
    n = {1,0,0},
    cylinderLength = cylinderLength,
    animation = animation,
    cylinderDiameter = 0.055) annotation(Placement(transformation(origin={250,26},
extent={{-20,-20},{20,20}})));

  // ---- 曲柄(曲柄臂 + 曲柄销 + 主轴段) ----
  Modelica.Mechanics.MultiBody.Parts.BodyBox crank4(
    height = 0.05,
    widthDirection = {1,0,0},
    width = 0.02,
    r = {0, -crankPinOffset, 0},
    animation = animation) annotation(Placement(transformation(origin={68,-80},
extent={{-30,-30},{30,30}})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank3(
    r_shape = {-0.01,0,0},
    length = 0.12,
    diameter = 0.03,
    r = {crankPinLength,0,0},
    color = {180,180,180},
    animation = animation) annotation(Placement(transformation(extent={{-60,-46},{0,-6}})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank1(
    diameter = 0.05,
    r_shape = {-0.01,0,0},
    length = 0.12,
    r = {crankLength - crankPinLength,0,0},
    color = {180,180,180},
    animation = animation) annotation(Placement(transformation(extent={{-200,6},{-140,46}})));
  Modelica.Mechanics.MultiBody.Parts.BodyBox crank2(
    height = 0.05,
    widthDirection = {1,0,0},
    width = 0.02,
    r = {0, crankPinOffset, 0},
    animation = animation) annotation(Placement(transformation(extent={{-130,30},{-70,90}})));

  // ---- 曲柄销(平面回路约束, 处理曲柄-连杆闭环) ----
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint b1(
    n = {1,0,0},
    cylinderLength = cylinderLength,
    animation = animation,
    cylinderDiameter = 0.055) annotation(Placement(transformation(origin={40,52},
extent={{-20,-20},{20,20}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation mid(r = {crankPinLength/2,0,0}, animation = false) annotation(Placement(transformation(extent={{-50,6},{-10,46}})));

  // ---- 气缸(移动副) ----
  Modelica.Mechanics.MultiBody.Joints.Prismatic cylinder(
    useAxisFlange = true,
    n = {0,1,0},
    boxWidth = 0.02,
    s(start = 0.2)) annotation(Placement(transformation(origin={-118,-76},
extent={{-30,-80},{30,80}})));

  // ---- 机架与安装 ----
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation mounting(r = {crankLength,0,0}, animation = false) annotation(Placement(transformation(extent={{-250,-98},{-210,-58}})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation cylinderInclination(
    r = {crankLength - crankPinLength/2,0,0},
    n_y = {0, Modelica.Math.cos(cylinderInclinationAngle), Modelica.Math.sin(cylinderInclinationAngle)},
    animation = false,
    rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) annotation(Placement(transformation(extent={{-250,6},{-210,46}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation cylinderTop(r = {0, cylinderTopPosition, 0}, animation = false) annotation(Placement(transformation(extent={{-190,-46},{-150,-6}})));

  // ---- 曲柄相位 ----
  Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle1(
    n_y = {0, Modelica.Math.cos(crankAngleOffset), Modelica.Math.sin(crankAngleOffset)},
    animation = false,
    rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) annotation(Placement(transformation(extent={{-250,58},{-210,98}})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle2(
    n_y = {0, Modelica.Math.cos(-crankAngleOffset), Modelica.Math.sin(-crankAngleOffset)},
    animation = false,
    rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) annotation(Placement(transformation(origin={164,-96},
extent={{-20,-20},{20,20}})));

  // ---- 传感器与力连接器 ----
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor annotation(Placement(transformation(extent={{-120,-190},{-80,-150}})));
  ModelConnectors_Forces gasForce annotation(Placement(transformation(extent={{-250,-46},{-210,-6}})));

  // ---- 接口 ----
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_a "机架连接(左)";
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_b "机架连接(右)";
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_a "曲轴连接(左)";
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_b "曲轴连接(右)";
  Modelica.Blocks.Interfaces.RealInput f_mt "活塞驱动力 [N]";
  Modelica.Blocks.Interfaces.RealOutput s_out "活塞位移 [m]";

equation
  connect(b1.frame_a, mid.frame_b) annotation(Line(origin={0,0},
points={{20,52},{-4.8,52},{-4.8,26},{-10,26}},
color={95,95,95}));
  connect(connectingRod.frame_a, b1.frame_b) annotation(Line(origin={0,0},
points={{96,92},{65.2,92},{65.2,52},{60,52}},
color={95,95,95}));
  connect(cylinder.frame_b, piston.frame_b) annotation(Line(origin={0,0},
points={{-88,-76},{31.2,-76},{31.2,-118},{296.8,-118},{296.8,-56},{290,-56}},
color={95,95,95}));
  connect(crank1.frame_a, crankAngle1.frame_b) annotation(Line(points={{-200,26},{-200,-220},{-210,-220},{-210,78}}, color={95,95,95}));
  connect(b2.frame_a, piston.frame_a) annotation(Line(origin={0,0},
points={{230,26},{223.2,26},{223.2,-56},{230,-56}},
color={95,95,95}));
  connect(connectingRod.frame_b, b2.frame_b) annotation(Line(origin={0,0},
points={{156,92},{275.2,92},{275.2,26},{270,26}},
color={95,95,95}));
  connect(crank4.frame_b, crankAngle2.frame_a) annotation(Line(origin={0,0},
points={{98,-80},{138.8,-80},{138.8,-96},{144,-96}},
color={95,95,95}));
  connect(cylinderInclination.frame_b, cylinderTop.frame_a) annotation(Line(points={{-210,26},{-200,26},{-200,-26},{-190,-26}}, color={95,95,95}));
  connect(crank1.frame_b, crank2.frame_a) annotation(Line(points={{-140,26},{-135,26},{-135,60},{-130,60}}, color={95,95,95}));
  connect(crank3.frame_b, crank4.frame_a) annotation(Line(origin={0,0},
points={{0,-26},{5,-26},{5,-80},{38,-80}},
color={95,95,95}));
  connect(crank3.frame_a, crank2.frame_b) annotation(Line(points={{-60,-26},{-60,-220},{-70,-220},{-70,60}}, color={95,95,95}));
  connect(crank2.frame_b, mid.frame_a) annotation(Line(points={{-70,60},{-60,60},{-60,26},{-50,26}}, color={95,95,95}));
  connect(cylinderTop.frame_b, cylinder.frame_a) annotation(Line(origin={0,0},
points={{-150,-26},{-140,-26},{-140,-76},{-148,-76}},
color={95,95,95}));
  connect(cylinderInclination.frame_a, cylinder_a);
  connect(mounting.frame_a, cylinder_a);
  connect(mounting.frame_b, cylinder_b);
  connect(crankAngle1.frame_a, crank_a);
  connect(crankAngle2.frame_b, crank_b);
  connect(gasForce.flange_b, cylinder.support) annotation(Line(origin={0,0},
points={{-210,-26},{-195.2,-26},{-195.2,-48},{-130,-48},{-130,-28}},
color={0,0,0}));
  connect(gasForce.flange_a, cylinder.axis) annotation(Line(origin={0,0},
points={{-250,-26},{-254,-26},{-254,-48},{-94,-48},{-94,-28}},
color={0,0,0}));
  connect(positionSensor.flange, cylinder.axis) annotation(Line(origin={0,0},
points={{-120,-170},{-124,-170},{-124,-28},{-94,-28}},
color={0,127,0}));
  gasForce.f_mt = f_mt;
  s_out = positionSensor.s;

  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end DA_Cylinder;