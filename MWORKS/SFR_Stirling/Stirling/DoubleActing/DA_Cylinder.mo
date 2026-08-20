within SFR.Stirling.DoubleActing;
model DA_Cylinder
  // 单活塞缸块(MultiBody 曲柄滑块机构)
  // 参考文献 Stirling-dymola 三部曲: 机械模型复用 Dymola 库 V 型发动机活塞模型
  // 4 缸双作用斯特林机的每个气缸 = 1 个动力活塞
  // 4 个缸块通过曲轴串联, 曲柄相位差 90°, 由 crankAngleOffset 设定
  // Diagram 层布局: 机架 → 气缸(移动副) → 活塞 → 连杆 → 曲柄链, 垂直分层清晰排布

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

  // ---- 接口 ----
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_a "机架连接(左)" annotation(Placement(transformation(origin={-300,112},
extent={{-16,-16},{16,16}}),
iconTransformation(origin={-82,64},
extent={{-16,-16},{16,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_b "机架连接(右)" annotation(Placement(transformation(origin={110,111},
extent={{-16,-16},{16,16}}),
iconTransformation(origin={80,64},
extent={{-16,-16},{16,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_a "曲轴连接(左)" annotation(Placement(transformation(origin={-301,-388},
extent={{16,-16},{-16,16}}),
iconTransformation(origin={-80,-48},
extent={{-16,-16},{16,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_b "曲轴连接(右)" annotation(Placement(transformation(origin={110,-388},
extent={{-16,-16},{16,16}}),
iconTransformation(origin={80,-48},
extent={{-16,-16},{16,16}})));
  Modelica.Blocks.Interfaces.RealInput f_mt "活塞驱动力 [N]" annotation(Placement(transformation(origin={-80,-440},
extent={{-10,-10},{10,10}},
rotation=90),
iconTransformation(origin={-4.44089e-16,-110},
extent={{-10,-10},{10,10}},
rotation=90)));
  Modelica.Blocks.Interfaces.RealOutput s_out "活塞位移 [m]" annotation(Placement(transformation(origin={-82,294},
extent={{-24,24},{24,-24}},
rotation=90),
iconTransformation(origin={-1.39888e-14,110},
extent={{-10,-10},{10,10}},
rotation=90)));

  // ---- 机架层(气缸安装与倾角) ----
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation mounting(r = {crankLength,0,0}, animation = false) annotation(Placement(transformation(origin={-66,112},
extent={{-15,-15},{15,15}})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation cylinderInclination(
    r = {crankLength - crankPinLength/2,0,0},
    n_y = {0, Modelica.Math.cos(cylinderInclinationAngle), Modelica.Math.sin(cylinderInclinationAngle)},
    animation = false,
    rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) annotation(Placement(transformation(origin={-165,78},
extent={{-20,-20},{20,20}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation cylinderTop(r = {0, cylinderTopPosition, 0}, animation = false) annotation(Placement(transformation(origin={-126,26},
extent={{-15,-15},{15,15}})));

  // ---- 气缸(移动副)与气体力 ----
  Modelica.Mechanics.MultiBody.Joints.Prismatic cylinder(
    useAxisFlange = true,
    n = {0,1,0},
    boxWidth = 0.02,
    s(start = 0.2)) annotation(Placement(transformation(origin={-68,-42.625},
extent={{-24.375,-78},{24.375,78}},
rotation=-90)));
  ModelConnectors_Forces gasForce annotation(Placement(transformation(origin={74,-52},
extent={{-15,-15},{15,15}},
rotation=90)));

  // ---- 活塞与连杆 ----
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder piston(
    diameter = pistonDiameter,
    r = {0, pistonLength, 0},
    color = {180,180,180},
    animation = animation) annotation(Placement(transformation(origin={-66,-120},
extent={{-25,-60},{25,60}},
rotation=90)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox connectingRod(
    widthDirection = {1,0,0},
    height = 0.06,
    color = {0,0,200},
    width = 0.02,
    r_shape = {0,-0.02,0},
    r = {0, rodLength, 0},
    animation = animation) annotation(Placement(transformation(origin={-66,-246},
extent={{-20,-60},{20,60}},
rotation=90)));

  // ---- 活塞销(活塞-连杆铰接) ----
  Modelica.Mechanics.MultiBody.Joints.Revolute b2(
    n = {1,0,0},
    cylinderLength = cylinderLength,
    animation = animation,
    cylinderDiameter = 0.055) annotation(Placement(transformation(origin={-66,-186},
extent={{-20,-20},{20,20}},
rotation=-90)));

  // ---- 曲柄链(曲柄销 → 上臂 → 主轴段 → 相位, 下臂 → 相位) ----
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint b1(
    n = {1,0,0},
    cylinderLength = cylinderLength,
    animation = animation,
    cylinderDiameter = 0.055) annotation(Placement(transformation(origin={-190,-280},
extent={{-20,-20},{20,20}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation mid(r = {crankPinLength/2,0,0}, animation = false) annotation(Placement(transformation(origin={-122,-338},
extent={{-15,-15},{15,15}},
rotation=180)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox crank2(
    height = 0.05,
    widthDirection = {1,0,0},
    width = 0.02,
    r = {0, crankPinOffset, 0},
    animation = animation) annotation(Placement(transformation(origin={-150,-388},
extent={{-15,-15},{15,15}})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank1(
    diameter = 0.05,
    r_shape = {-0.01,0,0},
    length = 0.12,
    r = {crankLength - crankPinLength,0,0},
    color = {180,180,180},
    animation = animation) annotation(Placement(transformation(origin={-202,-388},
extent={{-25,-10},{25,10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle1(
    n_y = {0, Modelica.Math.cos(crankAngleOffset), Modelica.Math.sin(crankAngleOffset)},
    animation = false,
    rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) annotation(Placement(transformation(origin={-259,-388},
extent={{-20,-20},{20,20}})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank3(
    r_shape = {-0.01,0,0},
    length = 0.12,
    diameter = 0.03,
    r = {crankPinLength,0,0},
    color = {180,180,180},
    animation = animation) annotation(Placement(transformation(origin={-65,-388},
extent={{-25,-10},{25,10}})));
  Modelica.Mechanics.MultiBody.Parts.BodyBox crank4(
    height = 0.05,
    widthDirection = {1,0,0},
    width = 0.02,
    r = {0, -crankPinOffset, 0},
    animation = animation) annotation(Placement(transformation(origin={-7,-388},
extent={{-15,-15},{15,15}})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle2(
    n_y = {0, Modelica.Math.cos(-crankAngleOffset), Modelica.Math.sin(-crankAngleOffset)},
    animation = false,
    rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) annotation(Placement(transformation(origin={46,-388},
extent={{-20,-20},{20,20}})));

  // ---- 传感器 ----
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor annotation(Placement(transformation(origin={142,-88},
extent={{-20,-20},{20,20}})));

equation
  // ---- 曲柄销平面回路 ----
  connect(b1.frame_a, mid.frame_b) annotation(Line(origin={0,0},
points={{-210,-280},{-266,-280},{-266,-338},{-137,-338}},
color={95,95,95}));
  connect(connectingRod.frame_a, b1.frame_b) annotation(Line(origin={0,0},
points={{-66,-266},{-66,-280},{-170,-280}},
color={95,95,95}));
  // ---- 气缸 → 活塞 ----
  connect(cylinder.frame_b, piston.frame_b) annotation(Line(origin={0,0},
points={{-66,-67},{-66,-95}},
color={95,95,95}));
  // ---- 曲柄链(上排): 主轴段 → 相位 → 曲轴接口 ----
  connect(crank1.frame_a, crankAngle1.frame_b) annotation(Line(origin={55,-28},
points={{-282,-360},{-294,-360}},
color={95,95,95}));
  // ---- 活塞销 ----
  connect(b2.frame_a, piston.frame_a) annotation(Line(origin={0,-48},
points={{-66,-118},{-66,-97}},
color={95,95,95}));
  connect(connectingRod.frame_b, b2.frame_b) annotation(Line(origin={0,-48},
points={{-66,-178},{-66,-158}},
color={95,95,95}));
  // ---- 曲柄链(下排): 下臂 → 相位 ----
  connect(crank4.frame_b, crankAngle2.frame_a) annotation(Line(origin={-98,2},
points={{106,-390},{124,-390}},
color={95,95,95}));
  // ---- 机架链: 倾角 → 气缸顶 ----
  connect(cylinderInclination.frame_b, cylinderTop.frame_a) annotation(Line(origin={0,0},
points={{-145,78},{-139.8,78},{-139.8,56},{-145.4,56},{-145.4,26},{-141,26}},
color={95,95,95}));
  // ---- 曲柄链(上排): 主轴段 → 上臂 ----
  connect(crank1.frame_b, crank2.frame_a) annotation(Line(origin={0,0},
points={{-177,-388},{-165,-388}},
color={95,95,95}));
  // ---- 曲柄链(下排): 曲柄销轴 → 下臂 ----
  connect(crank3.frame_b, crank4.frame_a) annotation(Line(origin={-98,2},
points={{58,-390},{76,-390}},
color={95,95,95}));
  // ---- 上下曲柄链耦合: 曲柄销轴 → 上臂 ----
  connect(crank3.frame_a, crank2.frame_b) annotation(Line(origin={0,0},
points={{-90,-388},{-135,-388}},
color={95,95,95}));
  connect(crank2.frame_b, mid.frame_a) annotation(Line(origin={0,0},
points={{-135,-388},{-102.6,-388},{-102.6,-338},{-107,-338}},
color={95,95,95}));
  // ---- 气缸顶 → 移动副 ----
  connect(cylinderTop.frame_b, cylinder.frame_a) annotation(Line(origin={0,0},
points={{-111,26},{-66,26},{-66,-17}},
color={95,95,95}));
  // ---- 机架接口 ----
  connect(cylinderInclination.frame_a, cylinder_a) annotation(Line(origin={0,0},
points={{-185,78},{-300,78},{-300,112}},
color={95,95,95}));
  connect(mounting.frame_a, cylinder_a) annotation(Line(origin={0,0},
points={{-81,112},{-300,112}},
color={95,95,95}));
  connect(mounting.frame_b, cylinder_b) annotation(Line(origin={0,0},
points={{-51,112},{110,112},{110,111}},
color={95,95,95}));
  // ---- 曲轴接口 ----
  connect(crankAngle1.frame_a, crank_a) annotation(Line(origin={55,-28},
points={{-334,-360},{-356,-360}},
color={95,95,95}));
  connect(crankAngle2.frame_b, crank_b) annotation(Line(origin={-366,7},
points={{432,-395},{476,-395}},
color={95,95,95}));
  // ---- 气体力施加到移动副(support ↔ axis) ----
  connect(gasForce.flange_b, cylinder.support) annotation(Line(origin={0,0},
points={{74,-37},{74,-8},{-18,-8},{-18,-32}},
color={0,0,0}));
  connect(gasForce.flange_a, cylinder.axis) annotation(Line(origin={0,0},
points={{74,-67},{74,-88},{-18,-88},{-18,-62}},
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  // ---- 位移传感器 ----
  connect(positionSensor.flange, cylinder.axis) annotation(Line(origin={0,0},
points={{122,-88},{-18,-88},{-18,-62}},
color={0,127,0}));
  gasForce.f_mt = f_mt;
  s_out = positionSensor.s;

  annotation(
    Icon(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2}),graphics = {Rectangle(origin={-1.42109e-14,-2},
fillColor={255,255,255},
fillPattern=FillPattern.Solid,
extent={{-100,100},{100,-100}}), Line(origin={-2,64},
points={{-80,0},{80,0}},
color={0,0,0},
thickness=2), Rectangle(origin={2,25},
fillColor={255,255,255},
fillPattern=FillPattern.VerticalCylinder,
extent={{-62,51},{62,-51}}), Rectangle(origin={8.88178e-16,17},
lineColor={0,0,0},
fillColor={255,255,255},
fillPattern=FillPattern.Solid,
extent={{-26,-43},{26,43}}), Rectangle(origin={0,25},
lineColor={0,0,0},
fillColor={175,175,175},
fillPattern=FillPattern.Solid,
extent={{-20,-7},{20,7}}), Line(origin={0,0},
points={{0,18},{0,-26}},
color={0,0,0}), Line(origin={-1,-48},
points={{-75,0},{75,0}},
color={0,0,0},
thickness=2), Ellipse(origin={0,-48},
lineColor={0,0,0},
fillColor={175,175,175},
fillPattern=FillPattern.Solid,
extent={{-22,-22},{22,22}}), Line(origin={0,0},
points={{0,-70},{0,-100}},
color={0,0,0})}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent={{-300,-430},{110,270}})));
end DA_Cylinder;