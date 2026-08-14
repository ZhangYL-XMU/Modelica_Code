within SFR.Stirling.DoubleActing;
model DA_4Cylinder_System
  // 4 缸双作用斯特林机完整系统
  // MultiBody 机械机构(曲柄滑块) + Schmidt 等温热力学
  // 机械机构输出 4 缸活塞位移 s[4] → 热力学计算压力/力 f[4] → 施加回机械活塞
  // 转速由热力学扭矩自洽求解(飞轮 + 负载阻尼)

  import Modelica.Units.SI;

  parameter SI.Inertia J = 15 "飞轮转动惯量 [kg·m2]";
  parameter SI.RotationalDampingConstant D = 15 "负载阻尼系数 [N·m·s/rad]";
  parameter SI.AngularVelocity w_start = 100 "初始角速度 [rad/s]";
  parameter SI.Temperature T_h = 673.15 "默认热腔温度 [K](useExternalTemperature=false 时有效)";
  parameter SI.Temperature T_c = 303.15 "默认冷腔温度 [K](useExternalTemperature=false 时有效)";
  parameter Boolean useExternalTemperature = false "启用外部温度输入(耦合钠冷快堆一/二回路)";

  DA_CrankTrain mech(J = J, D = D, w_start = w_start) annotation(Placement(transformation(extent={{-125,-50},{-5,50}})));
  DA_Gas_Schmidt gas annotation(Placement(transformation(origin={-26,-36},
extent={{-60,-50},{60,50}})));

  Modelica.Blocks.Interfaces.RealInput T_h_ext if useExternalTemperature "外部热腔温度 [K]" annotation(Placement(transformation(extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Interfaces.RealInput T_c_ext if useExternalTemperature "外部冷腔温度 [K]" annotation(Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput power "指示功率 [W]" annotation(Placement(transformation(extent={{100,40},{140,80}})));
  Modelica.Blocks.Interfaces.RealOutput w "曲轴角速度 [rad/s]" annotation(Placement(transformation(extent={{100,0},{140,40}})));
  Modelica.Blocks.Interfaces.RealOutput theta "曲轴角 [rad]" annotation(Placement(transformation(extent={{100,-40},{140,0}})));

equation
  // 温度: 默认取内部参数, 耦合钠回路时改由外部输入驱动
  gas.T_h = if useExternalTemperature then T_h_ext else T_h;
  gas.T_c = if useExternalTemperature then T_c_ext else T_c;
  connect(mech.s, gas.s) annotation(Line(origin={0,0},
points={{7,-20},{21,-20},{21,-66},{-98,-66}},
color={0,0,127}));
  connect(gas.f, mech.f) annotation(Line(origin={0,0},
points={{46,-46},{60,-46},{60,77},{-151,77},{-151,0},{-137,0}},
color={0,0,127}));
  power = gas.power;
  w = mech.w;
  theta = mech.theta;

  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.0001,StartTime=0,StopTime=100,StoreEventValue=0,Tolerance=0.0001),__MWORKS(ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=20,ContinueTimeVector)));
end DA_4Cylinder_System;