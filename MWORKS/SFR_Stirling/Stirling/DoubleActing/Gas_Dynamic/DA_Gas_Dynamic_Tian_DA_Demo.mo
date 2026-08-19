within SFR.Stirling.DoubleActing.Gas_Dynamic;
model DA_Gas_Dynamic_Tian_DA_Demo
  // DA_Gas_Dynamic_Tian 与 DA_Cylinder 机械模型的耦合演示(三维动画)
  // 显式展开 4 个 DA_Cylinder 曲柄滑块机构(曲柄相位差 90°, 曲轴串联), 飞轮 + 负载阻尼;
  // 气体动力学模型直接驱动各缸 gasForce: gas.f[i] → cyl_i.f_mt,
  // 位移由气缸位置传感器反馈: cyl_i.s_out → gas.s[i], 速度由模型内部 der(s) 求得
  // 转速由热力学扭矩自洽求解; MultiBody 动画全开, 用于机械-热力学耦合验证与三维动画绘制
  // 工况: 钠 530°C(表6), 冷却水 30°C, 初始角速度 157.08 rad/s(25Hz=1500rpm)
  // 用户可将其扩展为 16 缸(V16-45°): 4 组本模型串联/并联

  import Modelica.Units.SI;

  parameter SI.Inertia J = 50 "飞轮转动惯量 [kg·m2](加大以钝化启动瞬态冲击, 转速收敛更稳)";
  parameter SI.RotationalDampingConstant D = 10.5 "负载阻尼系数 [N·m·s/rad](25Hz时阻尼功率D·w²≈259kW, 略大于气体功率257kW, 平衡于设计转速附近)";
  parameter SI.AngularVelocity w_start = -157.07963267949 "初始角速度(稳态方向为负, 直接取-2π·25Hz避免动能耗竭-反向重启的慢收敛) [rad/s]";
  parameter SI.Temperature T_na_set = 803.15 "钠热源温度(表6钠进口530°C) [K]";
  parameter SI.Temperature T_water_set = 303.15 "冷却水温度 [K]";

  inner Modelica.Mechanics.MultiBody.World world annotation(Placement(transformation(origin={-86,260},
extent={{-30,-30},{30,30}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(n = {1,0,0}, useAxisFlange = true) 
    annotation(Placement(transformation(origin={38,165},
extent={{-30,30},{30,-30}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = J, phi(start = 0, fixed = true), w(start = w_start, fixed = true)) 
    annotation(Placement(transformation(origin={-72,-129},
extent={{-30,-30},{30,30}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = D) 
    annotation(Placement(transformation(origin={28,-104},
extent={{-30,-30},{30,30}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed_ground 
    annotation(Placement(transformation(origin={28,-174},
extent={{-30,-30},{30,30}})));

  // ---- 4 缸曲柄滑块机构(曲柄相位差 90°, 三维动画) ----
  // 注: 机构初始扭矩由气体力决定, 动力学稳定于负向旋转(w<0);
  //     曲柄offsets取负序列使各缸位移时间相位为 0/+90/+180/+270°(与正弦测试模型一致), 保证热腔领先冷腔90°
  .SFR.Stirling.DoubleActing.DA_Cylinder cyl1(crankAngleOffset = 0) 
    annotation(Placement(transformation(origin={230,60},
extent={{-60,-80},{60,80}})));
  .SFR.Stirling.DoubleActing.DA_Cylinder cyl2(crankAngleOffset = -Modelica.Constants.pi/2) 
    annotation(Placement(transformation(origin={364,60},
extent={{-60,-80},{60,80}})));
  .SFR.Stirling.DoubleActing.DA_Cylinder cyl3(crankAngleOffset = -Modelica.Constants.pi) 
    annotation(Placement(transformation(origin={514,54},
extent={{-60,-80},{60,80}})));
  .SFR.Stirling.DoubleActing.DA_Cylinder cyl4(crankAngleOffset = -3*Modelica.Constants.pi/2) 
    annotation(Placement(transformation(origin={664,60},
extent={{-60,-80},{60,80}})));

  // ---- 气体动力学(默认参数=侯斌表6/表7, s_ref=-0.12与DA_Cylinder安装位对齐) ----
  DA_Gas_Dynamic_Tian gas 
    annotation(Placement(transformation(origin={864,240},
extent={{-60,-50},{60,50}})));

//   Modelica.Blocks.Interfaces.RealOutput power "气体指示功率 [W]" annotation(Placement(transformation(extent={{100,60},{140,100}})));
//   Modelica.Blocks.Interfaces.RealOutput w_out "曲轴角速度 [rad/s]" annotation(Placement(transformation(extent={{100,20},{140,60}})));
//   Modelica.Blocks.Interfaces.RealOutput theta "曲轴角 [rad]" annotation(Placement(transformation(extent={{100,-20},{140,20}})));
//   Modelica.Blocks.Interfaces.RealOutput Q_in "总吸热量 [W]" annotation(Placement(transformation(extent={{100,-60},{140,-20}})));
//   Modelica.Blocks.Interfaces.RealOutput Q_out "总放热量 [W]" annotation(Placement(transformation(extent={{100,-100},{140,-60}})));
//   Modelica.Blocks.Interfaces.RealOutput eta "热效率 [-]" annotation(Placement(transformation(extent={{100,-140},{140,-100}})));

equation
  // ---- 机架与曲轴串联(曲轴箱) ----
  connect(world.frame_b, revolute.frame_a) annotation(Line(origin={0,0},
points={{-56,260},{1.2,260},{1.2,165},{8,165}}));
  connect(world.frame_b, cyl1.cylinder_a) annotation(Line(origin={-206,-221},
points={{150,481},{372.8,481},{372.8,348.2},{384.4,348.2}},
color={95,95,95}));
  connect(cyl1.cylinder_b, cyl2.cylinder_a) annotation(Line(origin={0,0},
points={{282.8,127.2},{312.4,127.2}},
color={0,0,127}));
  connect(cyl2.cylinder_b, cyl3.cylinder_a) annotation(Line(origin={0,0},
points={{416.8,127.2},{450.8,127.2},{450.8,121.2},{462.4,121.2}},
color={0,0,127}));
  connect(cyl3.cylinder_b, cyl4.cylinder_a) annotation(Line(origin={0,0},
points={{566.8,121.2},{600.8,121.2},{600.8,127.2},{612.4,127.2}},
color={0,0,127}));
  connect(revolute.frame_b, cyl1.crank_a) annotation(Line(origin={0,0},
points={{68,165},{166.8,165},{166.8,-7.2},{178.4,-7.2}},
color={95,95,95}));
  connect(cyl1.crank_b, cyl2.crank_a) annotation(Line(origin={0,0},
points={{282.8,-7.2},{312.4,-7.2}},
color={0,0,127}));
  connect(cyl2.crank_b, cyl3.crank_a) annotation(Line(origin={0,0},
points={{416.8,-7.2},{450.8,-7.2},{450.8,-13.2},{462.4,-13.2}},
color={0,0,127}));
  connect(cyl3.crank_b, cyl4.crank_a) annotation(Line(origin={0,0},
points={{566.8,-13.2},{600.8,-13.2},{600.8,-7.2},{612.4,-7.2}},
color={0,0,127}));

  // ---- 飞轮 + 负载阻尼串联到曲轴 ----
  connect(inertia.flange_a, revolute.axis) annotation(Line(origin={-22,-174},
points={{-80,45},{-112,45},{-112,140},{60,140},{60,309}}));
  connect(inertia.flange_b, damper.flange_a) annotation(Line(origin={-22,-174},
points={{-20,45},{0,45},{0,70},{20,70}}));
  connect(damper.flange_b, fixed_ground.flange) annotation(Line(origin={-22,-174},
points={{80,70},{80,26},{50,26},{50,0}}));

  // ---- 气体动力学驱动各缸 gasForce ----
  // 注: DA_Cylinder 的 ModelConnectors_Forces(f=-f_mt)+Prismatic(axis) 力链实测使
  //     f_mt=+gas.f 时机构被激励(能量不守恒, w从159飙升至350+); 故在此反转符号,
  //     使 f_mt=-gas.f[i] 对应"气体力推动活塞做正功"的正确物理方向
  cyl1.f_mt = -gas.f[1];
  cyl2.f_mt = -gas.f[2];
  cyl3.f_mt = -gas.f[3];
  cyl4.f_mt = -gas.f[4];

  // ---- 位移反馈: cyl_i.s_out → gas.s[i]; 速度解析求导 v = der(s_out)(与DA_4Cylinder_Validation一致) ----
  connect(cyl1.s_out, gas.s[1]) annotation(Line(origin={0,0},
points={{230,148},{230,243},{790.8,243}},
color={0,0,127}));
  connect(cyl2.s_out, gas.s[2]) annotation(Line(origin={0,0},
points={{364,148},{364,243},{790.8,243}},
color={0,0,127}));
  connect(cyl3.s_out, gas.s[3]) annotation(Line(origin={0,0},
points={{514,142},{514,243},{790.8,243}},
color={0,0,127}));
  connect(cyl4.s_out, gas.s[4]) annotation(Line(origin={0,0},
points={{664,148},{664,243},{790.8,243}},
color={0,0,127}));

  // ---- 热源/冷源温度 ----
  gas.T_na = T_na_set;
  gas.T_water = T_water_set;

  // ---- 输出 ----
//   power = gas.power;
//   w_out = revolute.w;
//   theta = revolute.phi;
//   Q_in = gas.Q_in;
//   Q_out = gas.Q_out;
//   eta = gas.eta;

  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.001,StartTime=0,StopTime=100,StoreEventValue=0,Tolerance=0.0001),__MWORKS(ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=100,ContinueTimeVector)));
end DA_Gas_Dynamic_Tian_DA_Demo;