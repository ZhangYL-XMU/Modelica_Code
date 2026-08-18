within SFR.Stirling.DoubleActing;
model DA_4Cylinder_Validation
  // 单组 4 缸双作用斯特林机验证模型(三维动画)
  // 显式展开 4 个 DA_Cylinder 曲柄滑块机构, 曲轴串联(曲柄相位差 90°), 飞轮 + 负载阻尼
  // DA_Gas_Dynamic 气体动力学直接驱动每个气缸的 gasForce: f[i] → cyl_i.f_mt
  // 位移由气缸位置传感器返回: cyl_i.s_out → s[i], 速度解析求导 v = der(s)
  // 转速由热力学扭矩自洽求解; 三维动画全开, 用于机械-热力学耦合验证与动图绘制
  // 热端温度 T_na(钠) / 冷端温度 T_water(水) 可由外部输入驱动, 用于耦合钠冷快堆一/二回路

  import Modelica.Units.SI;

  parameter SI.Inertia J = 15 "飞轮转动惯量 [kg·m2]";
  parameter SI.RotationalDampingConstant D = 15 "负载阻尼系数 [N·m·s/rad]";
  parameter SI.AngularVelocity w_start = 100 "初始角速度 [rad/s]";
  parameter SI.Temperature T_na_default = 803.15 "默认钠热源温度(表6: 钠进口530℃; 430℃出口是斯特林取热结果, 不另计) [K](useExternalTemperature=false 时有效)";
  parameter SI.Temperature T_water_default = 303.15 "默认冷却水温度 [K](useExternalTemperature=false 时有效)";
  parameter Boolean useExternalTemperature = false "启用外部温度输入(耦合钠冷快堆一/二回路)";

  inner Modelica.Mechanics.MultiBody.World world annotation(Placement(transformation(origin={-402,67.2},
extent={{-30,-30},{30,30}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(n = {1,0,0}, useAxisFlange = true) annotation(Placement(transformation(origin={-248,-67.2},
extent={{-30,30},{30,-30}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = J, phi(start = 0, fixed = true), w(start = w_start, fixed = true)) annotation(Placement(transformation(origin={-412,-158},
extent={{-30,-30},{30,30}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = D) annotation(Placement(transformation(origin={-318,-158},
extent={{-30,-30},{30,30}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed_ground annotation(Placement(transformation(origin={-248,-218},
extent={{-30,-30},{30,30}})));

  // ---- 4 缸曲柄滑块机构(曲柄相位差 90°, 三维动画) ----
  DA_Cylinder cyl1(crankAngleOffset = 0) annotation(Placement(transformation(origin={-120,-3.55271e-15},
extent={{-60,-80},{60,80}})));
  DA_Cylinder cyl2(crankAngleOffset = Modelica.Constants.pi/2) annotation(Placement(transformation(extent={{-40,-80},{80,80}})));
  DA_Cylinder cyl3(crankAngleOffset = Modelica.Constants.pi) annotation(Placement(transformation(extent={{90,-80},{210,80}})));
  DA_Cylinder cyl4(crankAngleOffset = 3*Modelica.Constants.pi/2) annotation(Placement(transformation(extent={{220,-80},{340,80}})));

  // ---- 高保真气体动力学(直接驱动各缸 gasForce) ----
  .SFR.Stirling.DoubleActing.Gas_Dynamic.DA_Gas_Dynamic gas annotation(Placement(transformation(origin={150,-354},
extent={{-60,-50},{60,50}})));

  Modelica.Blocks.Interfaces.RealInput T_na_ext if useExternalTemperature "外部钠热源温度 [K]" annotation(Placement(transformation(extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Interfaces.RealInput T_water_ext if useExternalTemperature "外部冷却水温度 [K]" annotation(Placement(transformation(origin={-135,-15},
extent={{-5,-5},{5,5}})));
  Modelica.Blocks.Interfaces.RealOutput power "气体指示功率 [W]" annotation(Placement(transformation(extent={{100,60},{140,100}})));
  Modelica.Blocks.Interfaces.RealOutput w "曲轴角速度 [rad/s]" annotation(Placement(transformation(extent={{100,20},{140,60}})));
  Modelica.Blocks.Interfaces.RealOutput theta "曲轴角 [rad]" annotation(Placement(transformation(extent={{100,-20},{140,20}})));
  Modelica.Blocks.Interfaces.RealOutput Q_in "总吸热量 [W]" annotation(Placement(transformation(extent={{100,-60},{140,-20}})));
  Modelica.Blocks.Interfaces.RealOutput Q_out "总放热量 [W]" annotation(Placement(transformation(extent={{100,-100},{140,-60}})));

equation
  // ---- 机架与曲轴串联(曲轴箱) ----
  connect(world.frame_b, revolute.frame_a) annotation(Line(origin={0,0},
points={{-372,67.2},{-284.8,67.2},{-284.8,-67.2},{-278,-67.2}},
color={95,95,95}));
  connect(world.frame_b, cyl1.cylinder_a) annotation(Line(origin={-26,-19},
points={{-346,86.2},{-145.6,86.2}},
color={95,95,95}));
  connect(cyl1.cylinder_b, cyl2.cylinder_a) annotation(Line(origin={0,0},
points={{-67.2,67.2},{-31.6,67.2}},
color={0,0,127}));
  connect(cyl2.cylinder_b, cyl3.cylinder_a) annotation(Line(points={{80,0},{90,0}}, color={0,0,127}));
  connect(cyl3.cylinder_b, cyl4.cylinder_a) annotation(Line(points={{210,0},{220,0}}, color={0,0,127}));
  connect(revolute.frame_b, cyl1.crank_a) annotation(Line(origin={0,0},
points={{-218,-67.2},{-171.6,-67.2}},
color={95,95,95}));
  connect(cyl1.crank_b, cyl2.crank_a) annotation(Line(origin={0,0},
points={{-67.2,-67.2},{-31.6,-67.2}},
color={0,0,127}));
  connect(cyl2.crank_b, cyl3.crank_a) annotation(Line(points={{80,0},{90,0}}, color={0,0,127}));
  connect(cyl3.crank_b, cyl4.crank_a) annotation(Line(points={{210,0},{220,0}}, color={0,0,127}));

  // ---- 飞轮 + 负载阻尼串联到曲轴 ----
  connect(inertia.flange_a, revolute.axis) annotation(Line(origin={0,0},
points={{-442,-158},{-447,-158},{-447,-102.2},{-248,-102.2},{-248,-97.2}},
color={0,0,0}));
  connect(inertia.flange_b, damper.flange_a) annotation(Line(origin={0,0},
points={{-382,-158},{-348,-158}},
color={0,0,0}));
  connect(damper.flange_b, fixed_ground.flange) annotation(Line(origin={-100,-176},
points={{-188,18},{-148,18},{-148,-42}},
color={0,0,0}));

  // ---- 气体动力学直接驱动各缸 gasForce: f[i] → cyl_i.f_mt ----
  connect(gas.f[1], cyl1.f_mt) annotation(Line(origin={0,0},
points={{222,-364},{236,-364},{236,-110},{-120,-110},{-120,-88}},
color={0,0,127}));
  connect(gas.f[2], cyl2.f_mt) annotation(Line(origin={0,0},
points={{222,-364},{236,-364},{236,-277},{20,-277},{20,-88}},
color={0,0,127}));
  connect(gas.f[3], cyl3.f_mt) annotation(Line(origin={0,0},
points={{222,-364},{236,-364},{236,-98},{150,-98},{150,-88}},
color={0,0,127}));
  connect(gas.f[4], cyl4.f_mt) annotation(Line(origin={0,0},
points={{222,-364},{280,-364},{280,-88}},
color={0,0,127}));
  // 位移反馈: cyl_i.s_out → gas.s[i]
  connect(cyl1.s_out, gas.s[1]) annotation(Line(origin={0,0},
points={{-120,88},{-120,98},{-43.6,98},{-43.6,-324},{78,-324}},
color={0,0,127}));
  connect(cyl2.s_out, gas.s[2]) annotation(Line(origin={0,0},
points={{20,88},{20,98},{84.4,98},{84.4,-277},{64,-277},{64,-324},{78,-324}},
color={0,0,127}));
  connect(cyl3.s_out, gas.s[3]) annotation(Line(origin={0,0},
points={{150,88},{150,98},{214.4,98},{214.4,-277},{64,-277},{64,-324},{78,-324}},
color={0,0,127}));
  connect(cyl4.s_out, gas.s[4]) annotation(Line(origin={0,0},
points={{280,88},{280,98},{216.8,98},{216.8,-277},{64,-277},{64,-324},{78,-324}},
color={0,0,127}));
  // 速度解析求导
  gas.v[1] = der(cyl1.s_out);
  gas.v[2] = der(cyl2.s_out);
  gas.v[3] = der(cyl3.s_out);
  gas.v[4] = der(cyl4.s_out);

  // ---- 温度: 默认内部参数, 耦合钠回路时改由外部输入驱动 ----
  gas.T_na = if useExternalTemperature then T_na_ext else T_na_default;
  gas.T_water = if useExternalTemperature then T_water_ext else T_water_default;

  // ---- 输出 ----
  power = gas.power;
  w = revolute.w;
  theta = revolute.phi;
  Q_in = gas.Q_in;
  Q_out = gas.Q_out;

  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.0001,StartTime=0,StopTime=100,StoreEventValue=0,Tolerance=0.0001),__MWORKS(ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=20,ContinueTimeVector)));
end DA_4Cylinder_Validation;