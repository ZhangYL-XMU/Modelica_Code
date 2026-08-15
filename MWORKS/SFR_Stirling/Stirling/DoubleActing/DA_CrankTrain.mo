within SFR.Stirling.DoubleActing;
model DA_CrankTrain
  // 4 缸双作用斯特林机机械总成(MultiBody)
  // 4 个单活塞缸块串联在曲轴上, 曲柄相位差 90°, 飞轮 + 负载阻尼
  // 参考 ModelMacanic_V8_Test 的 V 型发动机串联方式
  // 输入 4 缸活塞力 f[4](来自热力学), 输出 4 缸活塞位移 s[4]、角速度 w、曲轴角 theta

  import Modelica.Units.SI;

  parameter SI.Inertia J = 15 "飞轮转动惯量 [kg·m2]";
  parameter SI.RotationalDampingConstant D = 15 "负载阻尼系数 [N·m·s/rad]";
  parameter SI.AngularVelocity w_start = 100 "初始角速度 [rad/s]";

  inner Modelica.Mechanics.MultiBody.World world annotation(Placement(transformation(origin={-236,-54},
extent={{-30,-30},{30,30}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(n = {1,0,0}, useAxisFlange = true) annotation(Placement(transformation(extent={{-240,5},{-180,65}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = J, phi(start = 0, fixed = true), w(start = w_start, fixed = true)) annotation(Placement(transformation(origin={-308,12},
extent={{-30,-30},{30,30}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = D) annotation(Placement(transformation(origin={-284,-112},
extent={{-30,-30},{30,30}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed_ground annotation(Placement(transformation(extent={{-240,-135},{-180,-75}})));

  DA_Cylinder cyl1(crankAngleOffset = 0) annotation(Placement(transformation(origin={-92,0},
extent={{-60,-80},{60,80}})));
  DA_Cylinder cyl2(crankAngleOffset = Modelica.Constants.pi/2) annotation(Placement(transformation(extent={{-40,-80},{80,80}})));
  DA_Cylinder cyl3(crankAngleOffset = Modelica.Constants.pi) annotation(Placement(transformation(extent={{90,-80},{210,80}})));
  DA_Cylinder cyl4(crankAngleOffset = 3*Modelica.Constants.pi/2) annotation(Placement(transformation(extent={{220,-80},{340,80}})));

  Modelica.Blocks.Interfaces.RealInput f[4] "4 缸活塞力 [N]" annotation(Placement(transformation(origin={-112,158},
extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Interfaces.RealOutput s[4] "4 缸活塞位移 [m]" annotation(Placement(transformation(extent={{100,-60},{140,-20}})));
  Modelica.Blocks.Interfaces.RealOutput theta "曲轴角 [rad]" annotation(Placement(transformation(extent={{100,-20},{140,20}})));
  Modelica.Blocks.Interfaces.RealOutput w "曲轴角速度 [rad/s]" annotation(Placement(transformation(extent={{100,20},{140,60}})));
  Modelica.Blocks.Interfaces.RealOutput power "机械功率 [W]" annotation(Placement(transformation(origin={66,192},
extent={{-20,-20},{20,20}})));

equation
  // 曲轴主支承(机架)
  connect(world.frame_b, revolute.frame_a) annotation(Line(origin={0,0},
points={{-206,-54},{-246.8,-54},{-246.8,35},{-240,35}},
color={95,95,95}));
  // 机架串联(曲轴箱)
  connect(world.frame_b, cyl1.cylinder_a) annotation(Line(origin={-26,-19},
points={{-180,-35},{-134,-35},{-134,113.8},{-114,113.8},{-114,99}},
color={95,95,95}));
  connect(cyl1.cylinder_b, cyl2.cylinder_a) annotation(Line(origin={0,0},
points={{-44,80},{-44,94.8},{-28,94.8},{-28,80}},
color={0,0,127}));
  connect(cyl2.cylinder_b, cyl3.cylinder_a) annotation(Line(points={{80,0},{90,0}}, color={0,0,127}));
  connect(cyl3.cylinder_b, cyl4.cylinder_a) annotation(Line(points={{210,0},{220,0}}, color={0,0,127}));
  // 曲轴串联
  connect(revolute.frame_b, cyl1.crank_a) annotation(Line(origin={0,0},
points={{-180,35},{-175,35},{-175,-94.8},{-44,-94.8},{-44,-80}},
color={95,95,95}));
  connect(cyl1.crank_b, cyl2.crank_a) annotation(Line(origin={0,0},
points={{-140,-80},{-140,-94.8},{68,-94.8},{68,-80}},
color={0,0,127}));
  connect(cyl2.crank_b, cyl3.crank_a) annotation(Line(points={{80,0},{90,0}}, color={0,0,127}));
  connect(cyl3.crank_b, cyl4.crank_a) annotation(Line(points={{210,0},{220,0}}, color={0,0,127}));
  // 飞轮 + 负载阻尼串联到曲轴
  connect(inertia.flange_a, revolute.axis) annotation(Line(origin={0,0},
points={{-338,12},{-343,12},{-343,70},{-210,70},{-210,65}},
color={0,0,0}));
  connect(inertia.flange_b, damper.flange_a) annotation(Line(origin={0,0},
points={{-278,12},{-273,12},{-273,-26},{-319,-26},{-319,-112},{-314,-112}},
color={0,0,0}));
  connect(damper.flange_b, fixed_ground.flange) annotation(Line(origin={0,0},
points={{-254,-112},{-210,-112},{-210,-105}},
color={0,0,0}));
  // 力输入(热力学 → 活塞)
  cyl1.f_mt = f[1];
  cyl2.f_mt = f[2];
  cyl3.f_mt = f[3];
  cyl4.f_mt = f[4];
  // 位移输出(活塞 → 热力学)
  s[1] = cyl1.s_out;
  s[2] = cyl2.s_out;
  s[3] = cyl3.s_out;
  s[4] = cyl4.s_out;
  // 输出角速度与角度
  w = revolute.w;
  theta = revolute.phi;
  power = damper.d * w * w;

  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end DA_CrankTrain;