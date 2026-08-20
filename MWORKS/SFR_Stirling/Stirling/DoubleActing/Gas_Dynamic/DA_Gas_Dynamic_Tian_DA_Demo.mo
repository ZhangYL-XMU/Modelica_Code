within SFR.Stirling.DoubleActing.Gas_Dynamic;
model DA_Gas_Dynamic_Tian_DA_Demo
  // DA_Gas_Dynamic_Tian 与 DA_Cylinder 机械模型的耦合演示(三维动画)
  // 显式展开 4 个 DA_Cylinder 曲柄滑块机构(曲柄相位差 90°, 曲轴串联), 飞轮 + 负载阻尼;
  // 气体动力学模型直接驱动各缸 gasForce: gas.f[i] → cyl_i.f_mt,
  // 位移由气缸位置传感器反馈: cyl_i.s_out → gas.s[i], 速度由模型内部自动求导
  // 转速由热力学扭矩自洽求解; MultiBody 动画全开, 用于机械-热力学耦合验证与三维动画绘制
  // 输入参数尽量组件化: 热源/冷源温度为 Modelica 基础库 Constant 组件(双击可改值)
  // 工况: 钠 530°C(表6), 冷却水 30°C, 初始角速度 -157.08 rad/s(25Hz=1500rpm)
  // 用户可将其扩展为 16 缸(V16-45°): 4 组本模型串联/并联

  import Modelica.Units.SI;

  parameter SI.Inertia J = 50 "飞轮转动惯量 [kg·m2](加大以钝化启动瞬态冲击, 转速收敛更稳)";
  parameter SI.RotationalDampingConstant D = 10.5 "负载阻尼系数 [N·m·s/rad](25Hz时阻尼功率D·w²≈259kW, 略大于气体功率257kW, 平衡于设计转速附近)";
  parameter SI.AngularVelocity w_start = -157.07963267949 "初始角速度(稳态方向为负, 直接取-2π·25Hz避免动能耗竭-反向重启的慢收敛) [rad/s]";
  parameter SI.Temperature T_na_set = 803.15 "钠热源温度(表6钠进口530°C; Constant组件T_na_src的k值) [K]";
  parameter SI.Temperature T_water_set = 303.15 "冷却水温度(Constant组件T_water_src的k值) [K]";

  inner Modelica.Mechanics.MultiBody.World world annotation(Placement(transformation(origin={-158,42},
extent={{-30,-30},{30,30}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(n = {1, 0, 0}, useAxisFlange = true) 
    annotation(Placement(transformation(origin={-74,-87.2},
extent={{-30,30},{30,-30}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = J, phi(start = 0, fixed = true), w(start = w_start, fixed = true)) 
    annotation(Placement(transformation(origin={-152,-232},
extent={{-30,-30},{30,30}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = D) 
    annotation(Placement(transformation(origin={-52,-214},
extent={{-30,-30},{30,30}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed_ground 
    annotation(Placement(transformation(origin={-52,-284},
extent={{-30,-30},{30,30}})));

  // ---- 4 缸曲柄滑块机构(曲柄相位差 90°, 三维动画) ----
  // 注: 机构初始扭矩由气体力决定, 动力学稳定于负向旋转(w<0);
  //     曲柄offsets取负序列使各缸位移时间相位为 0/+90/+180/+270°(与正弦测试模型一致), 保证热腔领先冷腔90°
  .SFR.Stirling.DoubleActing.DA_Cylinder cyl1(crankAngleOffset = 0) 
    annotation(Placement(transformation(origin={92,-20},
extent={{-60,-80},{60,80}})));
  .SFR.Stirling.DoubleActing.DA_Cylinder cyl2(crankAngleOffset = -Modelica.Constants.pi / 2) 
    annotation(Placement(transformation(origin={226,-20},
extent={{-60,-80},{60,80}})));
  .SFR.Stirling.DoubleActing.DA_Cylinder cyl3(crankAngleOffset = -Modelica.Constants.pi) 
    annotation(Placement(transformation(origin={386,-20},
extent={{-60,-80},{60,80}})));
  .SFR.Stirling.DoubleActing.DA_Cylinder cyl4(crankAngleOffset = -3 * Modelica.Constants.pi / 2) 
    annotation(Placement(transformation(origin={526,-20},
extent={{-60,-80},{60,80}})));

  // ---- 气体动力学(默认参数=侯斌表6/表7, s_ref=-0.12与DA_Cylinder安装位对齐) ----
  DA_Gas_Dynamic_Tian gas 
    annotation(Placement(transformation(origin={838,192},
extent={{-60,-58},{60,58}})));

  // ---- 热源/冷源温度源(Modelica 基础库 Constant 组件, 双击可改温度) ----
  Modelica.Blocks.Sources.Constant T_na_src(k = T_na_set) "钠热源温度(表6钠进口530°C) [K]" 
    annotation(Placement(transformation(origin={644,313},
extent={{-33,-33},{33,33}})));
  Modelica.Blocks.Sources.Constant T_water_src(k = T_water_set) "冷却水温度 [K]" 
    annotation(Placement(transformation(origin={777,387},
extent={{-33,-33},{33,33}})));

equation
  // ---- 机架与曲轴串联(曲轴箱) ----
  connect(world.frame_b, revolute.frame_a) annotation(Line(origin={-184,-230},
points={{56,272},{73.2,272},{73.2,142.8},{80,142.8}}));
  connect(world.frame_b, cyl1.cylinder_a) annotation(Line(origin={-344,-301},
points={{216,343},{372.8,343},{372.8,348.2},{384.4,348.2}},
color={95,95,95}));
  connect(cyl1.cylinder_b, cyl2.cylinder_a) annotation(Line(origin={-138,-80},
points={{282.8,127.2},{312.4,127.2}},
color={0,0,127}));
  connect(cyl2.cylinder_b, cyl3.cylinder_a) annotation(Line(origin={-138,-80},
points={{416.8,127.2},{472.4,127.2}},
color={0,0,127}));
  connect(cyl3.cylinder_b, cyl4.cylinder_a) annotation(Line(origin={-138,-80},
points={{576.8,127.2},{612.4,127.2}},
color={0,0,127}));
  connect(revolute.frame_b, cyl1.crank_a) annotation(Line(origin={-184,-230},
points={{140,142.8},{224.4,142.8}},
color={95,95,95}));
  connect(cyl1.crank_b, cyl2.crank_a) annotation(Line(origin={-138,-80},
points={{282.8,-7.2},{312.4,-7.2}},
color={0,0,127}));
  connect(cyl2.crank_b, cyl3.crank_a) annotation(Line(origin={-138,-80},
points={{416.8,-7.2},{472.4,-7.2}},
color={0,0,127}));
  connect(cyl3.crank_b, cyl4.crank_a) annotation(Line(origin={-138,-80},
points={{576.8,-7.2},{612.4,-7.2}},
color={0,0,127}));

  // ---- 飞轮 + 负载阻尼串联到曲轴 ----
  connect(inertia.flange_a, revolute.axis) annotation(Line(origin={-178,-186},
points={{-4,-46},{-9,-46},{-9,107.8},{104,107.8},{104,68.8}}));
  connect(inertia.flange_b, damper.flange_a) annotation(Line(origin={-102,-284},
points={{-20,52},{0,52},{0,70},{20,70}}));
  connect(damper.flange_b, fixed_ground.flange) annotation(Line(origin={-102,-284},
points={{80,70},{80,26},{50,26},{50,0}}));

  // ---- 气体动力学驱动各缸 gasForce: gas.f[i] → cyl_i.f_mt ----
  connect(gas.f[1], cyl1.f_mt) annotation(Line(origin={458,-5},
points={{452,205},{466,205},{466,-179},{-366,-179},{-366,-103}},
color={0,0,127}));
  connect(gas.f[2], cyl2.f_mt) annotation(Line(origin={519,21},
points={{391,179},{405,179},{405,-207},{-293,-207},{-293,-129}},
color={0,0,127}));
  connect(gas.f[3], cyl3.f_mt) annotation(Line(origin={594,-3},
points={{316,203},{330,203},{330,-181},{-208,-181},{-208,-105}},
color={0,0,127}));
  connect(gas.f[4], cyl4.f_mt) annotation(Line(origin={669,9},
points={{241,191},{255,191},{255,-195},{-143,-195},{-143,-117}},
color={0,0,127}));

  // ---- 位移反馈: cyl_i.s_out → gas.s[i](速度由气体模型内部自动求导) ----
  connect(cyl1.s_out, gas.s[1]) annotation(Line(origin={-138,-80},
points={{230,148},{230,283},{902.8,283}},
color={0,0,127}));
  connect(cyl2.s_out, gas.s[2]) annotation(Line(origin={-138,-80},
points={{364,148},{364,283},{902.8,283}},
color={0,0,127}));
  connect(cyl3.s_out, gas.s[3]) annotation(Line(origin={-138,-80},
points={{524,148},{524,283},{902.8,283}},
color={0,0,127}));
  connect(cyl4.s_out, gas.s[4]) annotation(Line(origin={-138,-80},
points={{664,148},{664,283},{902.8,283}},
color={0,0,127}));

  // ---- 热源/冷源温度(Constant 组件) ----
  connect(T_na_src.y, gas.T_na) annotation(Line(origin={-138,-80},
points={{818.3,393},{952,393},{952,340}}));
  connect(T_water_src.y, gas.T_water) annotation(Line(origin={-138,-80},
points={{951.3,467},{1000,467},{1000,340}}));

  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(Algorithm = Dassl, InlineIntegrator = false, InlineStepSize = false, Interval = 0.001, StartTime = 0, StopTime = 100, StoreEventValue = 0, Tolerance = 0.0001), __MWORKS(ContinueSimConfig(SaveContinueFile = "false", SaveBeforeStop = "false", NumberBeforeStop = 1, FixedContinueInterval = "false", ContinueIntervalLength = 100, ContinueTimeVector)));
end DA_Gas_Dynamic_Tian_DA_Demo;