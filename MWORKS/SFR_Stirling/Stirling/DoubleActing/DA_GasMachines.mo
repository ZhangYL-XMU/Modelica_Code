within SFR.Stirling.DoubleActing;
model DA_GasMachines
  // 4 个单活塞缸块串联在曲轴上, 曲柄相位差 90°, 飞轮 + 负载阻尼
  // 参考 ModelMacanic_V8_Test 的 V 型发动机串联方式

  import Modelica.Units.SI;

  parameter SI.Inertia J = 15 "飞轮转动惯量 [kg·m2]";
  parameter SI.RotationalDampingConstant D = 15 "负载阻尼系数 [N·m·s/rad]";
  parameter SI.AngularVelocity w_start = 100 "初始角速度 [rad/s]";

  inner Modelica.Mechanics.MultiBody.World world annotation(Placement(transformation(origin={-136,47},
extent={{-5,-5},{5,5}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(n = {1,0,0}, useAxisFlange = true) annotation(Placement(transformation(origin={-105,-15.08},
extent={{-5,5},{5,-5}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = J, phi(start = 0, fixed = true), w(start = w_start, fixed = true)) annotation(Placement(transformation(origin={-105,-38},
extent={{9,-9},{-9,9}},
rotation=90)));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = D) annotation(Placement(transformation(origin={-105,-58},
extent={{-6,-6},{6,6}},
rotation=-90)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed_ground annotation(Placement(transformation(origin={-105,-75},
extent={{-6,-6},{6,6}})));

  DA_Cylinder cyl1(crankAngleOffset = 0) annotation(Placement(transformation(origin={-67,-5},
extent={{-15,-21},{15,21}})));
  DA_Cylinder cyl2(crankAngleOffset = Modelica.Constants.pi/2) annotation(Placement(transformation(origin={-30,-5},
extent={{-15,-21},{15,21}})));
  DA_Cylinder cyl3(crankAngleOffset = Modelica.Constants.pi) annotation(Placement(transformation(origin={7,-5},
extent={{-15,-21},{15,21}})));
  DA_Cylinder cyl4(crankAngleOffset = 3*Modelica.Constants.pi/2) annotation(Placement(transformation(origin={44,-5},
extent={{-15,-21},{15,21}})));
  Gas_Dynamic.DA_Gas_Dynamic_Tian dA_Gas_Dynamic_Tian 
    annotation (Placement(transformation(origin={92,0},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant const(k=530+273.15) 
    annotation (Placement(transformation(origin={26,62},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant const1(k=50+273.15) 
    annotation (Placement(transformation(origin={78,84},
extent={{-10,-10},{10,10}})));

equation
  // 曲轴主支承(机架)
  connect(world.frame_b, revolute.frame_a) annotation(Line(origin={-40,-48},
points={{-91,95},{-72.8,95},{-72.8,32.92},{-70,32.92}},
color={95,95,95}));
  // 机架串联(曲轴箱)
  connect(world.frame_b, cyl1.cylinder_a) annotation(Line(origin={-66,-67},
points={{-65,114},{-17.7,114},{-17.7,75.44},{-13.3,75.44}},
color={95,95,95}));
  connect(cyl1.cylinder_b, cyl2.cylinder_a) annotation(Line(origin={-14,130},
points={{-41,-121.56},{-28.3,-121.56}},
color={0,0,127}));
  connect(cyl2.cylinder_b, cyl3.cylinder_a) annotation(Line(origin={-14,130},
points={{-4,-121.56},{8.7,-121.56}},
color={0,0,127}));
  connect(cyl3.cylinder_b, cyl4.cylinder_a) annotation(Line(origin={-14,130},
points={{33,-121.56},{45.7,-121.56}},
color={0,0,127}));
  // 曲轴串联
  connect(revolute.frame_b, cyl1.crank_a) annotation(Line(origin={-14,130},
points={{-86,-145.08},{-65,-145.08}},
color={95,95,95}),__MWORKS(BlockSystem(NamedSignal)));
  connect(cyl1.crank_b, cyl2.crank_a) annotation(Line(origin={-14,130},
points={{-41,-145.08},{-28,-145.08}},
color={0,0,127}));
  connect(cyl2.crank_b, cyl3.crank_a) annotation(Line(origin={-14,130},
points={{-4,-145.08},{9,-145.08}},
color={0,0,127}));
  connect(cyl3.crank_b, cyl4.crank_a) annotation(Line(origin={-14,130},
points={{33,-145.08},{46,-145.08}},
color={0,0,127}));
  // 飞轮 + 负载阻尼串联到曲轴
  connect(inertia.flange_a, revolute.axis) annotation(Line(origin={126,-80},
points={{-231,51},{-231,59.92}},
color={0,0,0}));
  connect(inertia.flange_b, damper.flange_a) annotation(Line(origin={126,-80},
points={{-231,33},{-231,28}},
color={0,0,0}));
  connect(damper.flange_b, fixed_ground.flange) annotation(Line(origin={206,51.92},
points={{-311,-115.92},{-311,-126.92}},
color={0,0,0}));

  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.001,StartTime=0,StopTime=10,StoreEventValue=0,Tolerance=0.0001));
  connect(cyl1.s_out, dA_Gas_Dynamic_Tian.s[1]) 
  annotation(Line(origin={6,20},
points={{-73,-1.9},{-73,20},{69.8,20},{69.8,-19.4},{73.8,-19.4}},
color={0,0,127}));
  connect(cyl2.s_out, dA_Gas_Dynamic_Tian.s[2]) 
  annotation(Line(origin={25,11},
points={{-55,7.1},{-55,29},{50.8,29},{50.8,-10.4},{54.8,-10.4}},
color={0,0,127}));
  connect(cyl3.s_out, dA_Gas_Dynamic_Tian.s[3]) 
  annotation(Line(origin={43,17},
points={{-36,1.1},{-36,23},{32.8,23},{32.8,-16.4},{36.8,-16.4}},
color={0,0,127}));
  connect(cyl4.s_out, dA_Gas_Dynamic_Tian.s[4]) 
  annotation(Line(origin={62,21},
points={{-18,-2.9},{-18,19},{13.8,19},{13.8,-20.4},{17.8,-20.4}},
color={0,0,127}));
  connect(dA_Gas_Dynamic_Tian.f[1], cyl1.f_mt) 
  annotation(Line(origin={35,-24},
points={{69,24},{87,24},{87,-24},{-102,-24},{-102,-4.1}},
color={0,0,127}));
  connect(cyl2.f_mt, dA_Gas_Dynamic_Tian.f[2]) 
  annotation(Line(origin={39,-23},
points={{-69,-5.1},{-69,-25},{83,-25},{83,23},{65,23}},
color={0,0,127}));
  connect(cyl3.f_mt, dA_Gas_Dynamic_Tian.f[3]) 
  annotation(Line(origin={58,-16},
points={{-51,-12.1},{-51,-32},{64,-32},{64,16},{46,16}},
color={0,0,127}));
  connect(cyl4.f_mt, dA_Gas_Dynamic_Tian.f[4]) 
  annotation(Line(origin={76,-16},
points={{-32,-12.1},{-32,-32},{46,-32},{46,16},{28,16}},
color={0,0,127}));
  connect(const.y, dA_Gas_Dynamic_Tian.T_na) 
  annotation(Line(origin={69,39},
points={{-32,23},{19,23},{19,-27}},
color={0,0,127}));
  connect(const1.y, dA_Gas_Dynamic_Tian.T_water) 
  annotation(Line(origin={98,48},
points={{-9,36},{2,36},{2,-32},{-2,-32},{-2,-36}},
color={0,0,127}));
end DA_GasMachines;