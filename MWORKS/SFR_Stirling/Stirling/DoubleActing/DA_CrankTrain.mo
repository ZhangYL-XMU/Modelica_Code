within SFR.Stirling.DoubleActing;
model DA_CrankTrain
  // 4 缸双作用斯特林机机械总成(MultiBody, 纯机械验证模型)
  // 4 个单活塞缸块串联在曲轴上, 曲柄相位差 90°, 飞轮 + 负载阻尼
  // 无气体力输入: 活塞力恒为零, 依靠初始角速度滑行, 用于验证三维机械建模可行性与机构动画
  // 参考 ModelMacanic_V8_Test 的 V 型发动机串联方式

  import Modelica.Units.SI;

  parameter SI.Inertia J = 15 "飞轮转动惯量 [kg·m2]";
  parameter SI.RotationalDampingConstant D = 15 "负载阻尼系数 [N·m·s/rad]";
  parameter SI.AngularVelocity w_start = 100 "初始角速度 [rad/s]";

  inner Modelica.Mechanics.MultiBody.World world annotation(Placement(transformation(origin={-380,238},
extent={{-30,-30},{30,30}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(n = {1,0,0}, useAxisFlange = true) annotation(Placement(transformation(origin={-228,76},
extent={{-30,30},{30,-30}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = J, phi(start = 0, fixed = true), w(start = w_start, fixed = true)) annotation(Placement(transformation(origin={-228,-36},
extent={{30,-30},{-30,30}},
rotation=90)));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = D) annotation(Placement(transformation(origin={-376,16},
extent={{-30,-30},{30,30}},
rotation=-90)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed_ground annotation(Placement(transformation(origin={-376,-48},
extent={{-30,-30},{30,30}})));

  DA_Cylinder cyl1(crankAngleOffset = 0) annotation(Placement(transformation(origin={-46,174},
extent={{-60,-80},{60,80}})));
  DA_Cylinder cyl2(crankAngleOffset = Modelica.Constants.pi/2) annotation(Placement(transformation(origin={96,174},
extent={{-60,-80},{60,80}})));
  DA_Cylinder cyl3(crankAngleOffset = Modelica.Constants.pi) annotation(Placement(transformation(origin={238,174},
extent={{-60,-80},{60,80}})));
  DA_Cylinder cyl4(crankAngleOffset = 3*Modelica.Constants.pi/2) annotation(Placement(transformation(origin={382,174},
extent={{-60,-80},{60,80}})));

equation
  // 曲轴主支承(机架)
  connect(world.frame_b, revolute.frame_a) annotation(Line(origin={0,0},
points={{-350,238},{-264.8,238},{-264.8,76},{-258,76}},
color={95,95,95}));
  // 机架串联(曲轴箱)
  connect(world.frame_b, cyl1.cylinder_a) annotation(Line(origin={-26,-19},
points={{-324,257},{-99.2,257},{-99.2,260.2},{-71.6,260.2}},
color={95,95,95}));
  connect(cyl1.cylinder_b, cyl2.cylinder_a) annotation(Line(origin={26,178},
points={{-19.2,63.2},{18.4,63.2}},
color={0,0,127}));
  connect(cyl2.cylinder_b, cyl3.cylinder_a) annotation(Line(origin={26,178},
points={{122.8,63.2},{160.4,63.2}},
color={0,0,127}));
  connect(cyl3.cylinder_b, cyl4.cylinder_a) annotation(Line(origin={26,178},
points={{264.8,63.2},{304.4,63.2}},
color={0,0,127}));
  // 曲轴串联
  connect(revolute.frame_b, cyl1.crank_a) annotation(Line(origin={26,178},
points={{-224,-102},{-171.6,-102},{-171.6,-71.2},{-123.6,-71.2}},
color={95,95,95}),__MWORKS(BlockSystem(NamedSignal)));
  connect(cyl1.crank_b, cyl2.crank_a) annotation(Line(origin={26,178},
points={{-19.2,-71.2},{18.4,-71.2}},
color={0,0,127}));
  connect(cyl2.crank_b, cyl3.crank_a) annotation(Line(origin={26,178},
points={{122.8,-71.2},{160.4,-71.2}},
color={0,0,127}));
  connect(cyl3.crank_b, cyl4.crank_a) annotation(Line(origin={26,178},
points={{264.8,-71.2},{304.4,-71.2}},
color={0,0,127}));
  // 飞轮 + 负载阻尼串联到曲轴
  connect(inertia.flange_a, revolute.axis) annotation(Line(origin={0,0},
points={{-228,-6},{-228,46}},
color={0,0,0}));
  connect(inertia.flange_b, damper.flange_a) annotation(Line(origin={0,0},
points={{-228,-66},{-228,-71},{-264.8,-71},{-264.8,51},{-376,51},{-376,46}},
color={0,0,0}));
  connect(damper.flange_b, fixed_ground.flange) annotation(Line(origin={8,130},
points={{-384,-144},{-384,-178}},
color={0,0,0}));
  // 活塞力恒为零(纯机械验证, 不接气体动力学)
  cyl1.f_mt = 0;
  cyl2.f_mt = 0;
  cyl3.f_mt = 0;
  cyl4.f_mt = 0;

  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end DA_CrankTrain;