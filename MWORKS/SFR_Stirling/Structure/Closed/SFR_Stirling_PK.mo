within SFR.Structure.Closed;
model SFR_Stirling_PK
  // 2026-09-01 总装验证模型。一回路 = PrimaryLoop 标定版（份额 22.37/77.63、TubeWall、realExpression1/4 反馈、
  //   Teffref_fuel=864.05/Teffref_coolant=768.15、R=22.1/4.2/6400、HE1 N=10、Constant 40MW 参考）；
  // 二回路/引擎 = SFR_Stirling 定案版（pump2 308.4、Engine_pipe、DA_Engine_v2 Engine(heff=1.41)、
  //   revolute/inertia(J=2,fixed)/damper(d=10.6)、吸热 realExpression_QEngine=-Engine.Q）。
  annotation(__MWORKS(version="26.6.0"),
    experiment(Algorithm=Dassl, StartTime=0, StopTime=3600, Interval=0.01, Tolerance=0.0001),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, grid={2,2})));
  Fluid.Pipes.pipe pipe_static1(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, L_total=10, Dh=0.30, initFromEnthalpy=true, h_start=656775 "热段550℃", wallHeatTransfer=false, momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState) 
    annotation (Placement(transformation(origin={121.994,111.009},
    extent={{-10,-10},{10,10}})));
  Fluid.Pipes.pipe pipe_static2(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, L_total=10, Dh=0.30, initFromEnthalpy=true, h_start=519165 "冷段440℃", wallHeatTransfer=false, momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState) 
    annotation (Placement(transformation(origin={102.994,-112.991},
    extent={{10,-10},{-10,10}})));
  Fluid.Vessels.MixingVolume volume(nPorts_a=3, nPorts_b=1, V=10, h_start=656775 "上腔室550℃", redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation (Placement(transformation(origin={4.99444,89.009},
    extent={{-10,-10},{10,10}},
    rotation=90)));
  Fluid.Vessels.MixingVolume volume1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, nPorts_a=1, nPorts_b=3, V=10, h_start=519165 "下腔室440℃") 
    annotation (Placement(transformation(origin={4.99444,-106.991},
    extent={{-10,-10},{10,10}},
    rotation=90)));
  Nuclear.PointKinetics pointKinetics(Teffref_fuel(displayUnit="K")=864.05 "fuel ref = 864.05 K (rated mean weighted wall T; mirror coolant ref 768.15)", Teffref_coolant(displayUnit="degC")=768.15 "参考=额定堆芯平均温度(440+550)/2=495℃=768.15K(尹凯论文口径); 初始冷却剂反馈=0, 功率不跌落") 
    annotation (Placement(transformation(origin={-146,106.43},
    extent={{-18,-20.5},{18,20.5}})));
  Modelica.Blocks.Continuous.PID PID(k=0.5, Ti=100, Td=0, initType=Modelica.Blocks.Types.Init.NoInit) 
    annotation (Placement(transformation(origin={-290,120.831},
    extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Add PID_error(k1=1, k2=-1) "误差 e=u_s-u_m (归一化后)" 
    annotation (Placement(transformation(origin={-332,120.831},
    extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Nonlinear.Limiter limPID(uMin=-0.021, uMax=0.021) 
    annotation (Placement(transformation(origin={-248,120.83},
    extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Gain gain_uS(k=1/40e6) "u_s 归一化(ramp W→无量纲)" 
    annotation (Placement(transformation(origin={-384,120.831},
    extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Gain gain_uM(k=1/40e6) "u_m 归一化(Q_total W→无量纲)" 
    annotation (Placement(transformation(origin={-364,90.9009},
    extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant const1(k=0) 
    annotation (Placement(transformation(origin={-214,142.93},
    extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant const3(k=0) 
    annotation (Placement(transformation(origin={-180,170.93},
    extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant ramp(k=40e6) "参考功率 40MW（恒定；原 TY Ramp 语义等价——MSL Ramp 在 Sysplorer 下 time<startTime 时输出 0，曾导致参考信号归零、CR 满插压堆，2026-09-01 修复）" 
    annotation (Placement(transformation(origin={-420,120.83},
    extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=innerCore.T[6] * 0.2237 + outerCore.T[6] * 0.7763 "coolant eff. T at axial mid (mirror Teffref=768.15K)") 
    annotation (Placement(transformation(origin={-184,90.9009},
    extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=tubeWall.T[6] * 0.2237 + tubeWall1.T[6] * 0.7763 "fuel eff. T from TubeWall states (mirror coolant input; wall temp as fuel lump)") 
    annotation (Placement(transformation(origin={-214,101.048},
    extent={{-10,-10},{10,10}})));
  TRANSFORM.Fluid.Machines.Pump_SimpleMassFlow pump1(m_flow_nominal=280.6, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation (Placement(transformation(origin={148.994435,-113.009},
    extent={{10,-10},{-10,10}})));
  Fluid.Vessels.ExpansionTank expansionTank(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, A=1, V0=0.001, level_start=1, h_start=656775 "热段550℃", p_start=100000.0) 
    annotation (Placement(transformation(origin={152.994435,173.009},
    extent={{-10,-10},{10,10}})));
  Fluid.Vessels.SpecifiedResistance resistance_toBoundary(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=0.1) 
    annotation (Placement(transformation(origin={170.994435,137.009},
    extent={{-10,-10},{10,10}})));
  Thermal.HeatExchange.HE1 hE1_1(shell(momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState),N=10) 
    annotation (Placement(transformation(origin={255.005565,21.018},
    extent={{10,10},{-10,-10}},
    rotation=90)));
  Fluid.Pipes.pipe shieldReflector(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=2, n_pipe=54, L_total=1.5, Dh=0.0415, height_ab=-1.5,
    initFromEnthalpy=true, h_start=519165, wallHeatTransfer=false,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=0.00926 "单管0.5/54") 
    annotation (Placement(transformation(origin={76.9764,13.009},
    extent={{-10,-10},{10,10}},
    rotation=90)));
  Fluid.Pipes.pipe innerCore_in(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=2, n_pipe=37, L_total=0.25, Dh=0.0415, height_ab=-0.25,
    initFromEnthalpy=true, h_start=519165, wallHeatTransfer=false,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.695 "单管62.7/37") 
    annotation (Placement(transformation(origin={-81.0056,-10.991},
    extent={{-10,-10},{10,10}},
    rotation=90)));
  Fluid.Pipes.pipe innerCore(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=11, n_pipe=37, L_total=1.1, L_heat=1.1, Dh=0.0415, height_ab=-1.1,
    initFromEnthalpy=true, h_start=519165, wallHeatTransfer=true,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.695 "单管62.7/37") 
    annotation (Placement(transformation(origin={-81.0056,13.009},
    extent={{-10,-10},{10,10}},
    rotation=90)));
  Fluid.Pipes.pipe innerCore_out(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=2, n_pipe=37, L_total=0.15, Dh=0.0415, height_ab=-0.15,
    initFromEnthalpy=true, h_start=656775, wallHeatTransfer=false,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.695 "单管62.7/37") 
    annotation (Placement(transformation(origin={-81.0056,37.009},
    extent={{-10,-10},{10,10}},
    rotation=90)));
  Fluid.Pipes.pipe outerCore_in(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=2, n_pipe=114, L_total=0.25, Dh=0.0415, height_ab=-0.25,
    initFromEnthalpy=true, h_start=519165, wallHeatTransfer=false,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.907 "单管217.4/114") 
    annotation (Placement(transformation(origin={4.99444,-10.991},
    extent={{-10,-10},{10,10}},
    rotation=90)));
  Fluid.Pipes.pipe outerCore(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=11, n_pipe=114, L_total=1.1, L_heat=1.1, Dh=0.0415, height_ab=-1.1,
    initFromEnthalpy=true, h_start=519165, wallHeatTransfer=true,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.907 "单管217.4/114") 
    annotation (Placement(transformation(origin={4.99444,13.009},
    extent={{-10,-10},{10,10}},
    rotation=90)));
  Fluid.Pipes.pipe outerCore_out(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=2, n_pipe=114, L_total=0.15, Dh=0.0415, height_ab=-0.15,
    initFromEnthalpy=true, h_start=656775, wallHeatTransfer=false,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.907 "单管217.4/114") 
    annotation (Placement(transformation(origin={4.99444,37.009},
    extent={{-10,-10},{10,10}},
    rotation=90)));
  Fluid.Vessels.SpecifiedResistance resistance_shield(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=6400 "屏蔽+反射等温流道 0.5 kg/s(2026-08-31新HE1重配流)") 
    annotation (Placement(transformation(origin={76.9944,-48.991},
    extent={{-10,-10},{10,10}},
    rotation=90)));
  Fluid.Vessels.SpecifiedResistance resistance_outer(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=4.20 "外堆芯 217.4 kg/s(2026-08-31新HE1重配流)") 
    annotation (Placement(transformation(origin={4.99444,-48.991},
    extent={{-10,-10},{10,10}},
    rotation=90)));
  Fluid.Vessels.SpecifiedResistance resistance_inner(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=22.1 "内堆芯 62.7 kg/s(2026-08-31新HE1重配流)") 
    annotation (Placement(transformation(origin={-80.9875,-48.991},
    extent={{-10,-10},{10,10}},
    rotation=90)));
  Thermal.Volumes.TubeWall tubeWall(N=10, n_tubes=37, r_inner=0.0028, r_outer=0.003, length=1.1, T_start=823.15 "wall init 550C") 
    annotation (Placement(transformation(origin={-113.0056,13.009},
    extent={{10,-10},{-10,10}})));
  Thermal.Volumes.TubeWall tubeWall1(N=10, n_tubes=114, r_inner=0.0028, r_outer=0.003, length=1.1, T_start=823.15 "wall init 550C") 
    annotation (Placement(transformation(origin={-16,13.009},
    extent={{10,-10},{-10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow_inner[10] 
    annotation (Placement(transformation(origin={-134,13.009},
    extent={{-6,-6},{6,6}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow_outer[10] 
    annotation (Placement(transformation(origin={-42,13.009},
    extent={{-6,-6},{6,6}})));
  Modelica.Blocks.Sources.RealExpression realExpression2[10] (y=pointKinetics.Q_total * 0.2237 / 10 "inner 22.37% (2026-09-01 cal)") 
    annotation (Placement(transformation(origin={-166,13.009},
    extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression3[10] (y=pointKinetics.Q_total * 0.7763 / 10 "outer 77.63% (2026-09-01 cal)") 
    annotation (Placement(transformation(origin={-46,44},
    extent={{-10,-10},{10,10}})));
  // ================= 二回路 + 引擎（SFR_Stirling 定案版，坐标整体右移 550） =================
  TRANSFORM.Fluid.Machines.Pump_SimpleMassFlow pump2(m_flow_nominal=308.4, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation (Placement(transformation(origin={344.25,58.9},
extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression_TNa(y=Engine_pipe.T[1]) "引擎钠侧输入温度" 
    annotation (Placement(transformation(origin={421.75,-63.86},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression_QEngine(y=- Engine.Q) "引擎吸热=40×Q_in×heff（同步 SecondLoop 标定）" 
    annotation (Placement(transformation(origin={369.75,-63.86},
extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow engineHeatFlow 
    annotation (Placement(transformation(origin={395.25,-37.1},
extent={{-10,-10},{10,10}},
rotation=90)));
  Fluid.Pipes.pipe Engine_pipe(redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium,N=5,L_total=5,h_start=589680 "引擎入口~480℃剖面初值",m_flow_start=100) 
    annotation (Placement(transformation(origin={395.25,-13.1},
extent={{-10,10},{10,-10}})));
  Stirling.DoubleActing.DA_Engine_v2 Engine(heff=1.41) 
    annotation (Placement(transformation(origin={446.75,-138},
extent={{-30.75,-28.9},{30.75,28.9}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true, n(displayUnit="1") = {1,0,0}) 
    annotation(Placement(transformation(origin={374,-161.26},
extent={{10,10},{-10,-10}})));
  inner Modelica.Mechanics.MultiBody.World world 
    annotation(Placement(transformation(origin={322,-120.66},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=2, phi(start=0, fixed=true), w(start=0, fixed=true) "初值0（同 SecondLoop；稳态自然转向负向）") 
    annotation(Placement(transformation(origin={353.75,-211.1},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed_ground 
    annotation(Placement(transformation(origin={263.779,-235.1},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d=10.6) "发电负载（同步 SecondLoop：转速→1500rpm）" 
    annotation(Placement(transformation(origin={281.779,-211.1},
extent={{10,-10},{-10,10}})));
  Fluid.Vessels.SpecifiedResistance resistance_toExpTank(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=0.1) 
    annotation(Placement(transformation(origin={388.25,84.9},
extent={{10,-10},{-10,10}})));
  Fluid.Vessels.ExpansionTank expansionTank1(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    A=1, V0=0.001, level_start=1, h_start=506655, p_start=100000.0) 
    annotation(Placement(transformation(origin={362.25,108.9},
extent={{-10,-10},{10,10}})));
  Fluid.Vessels.MixingVolume volumeTube(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    nPorts_a=1, nPorts_b=1, V=1, h_start=654480 "HE1出口530℃(设计剖面初值)") 
    annotation(Placement(transformation(origin={348.25,-13.1},
extent={{-10,-10},{10,10}})));
  equation
  // ---- 堆芯三通道 → 上腔室 ----
  connect(innerCore_out.portB, volume.port_a[1]) 
    annotation(Line(origin={-1.00556,19.009},
    points={{-79.9819,28.0222},{-79.9819,48},{6,48},{6,64}},
    color={0,127,255}));
  connect(outerCore_out.portB, volume.port_a[2]) 
    annotation(Line(origin={-26.0056,19.009},
    points={{31.0181,28.0222},{31,64}},
    color={0,127,255}));
  connect(shieldReflector.portB, volume.port_a[3]) 
    annotation(Line(origin={-1.00556,19.009},
    points={{78,4.0222},{78,48},{6,48},{6,64}},
    color={0,127,255}));
  connect(innerCore_out.portA, innerCore.portB) 
    annotation(Line(origin={-61.0056,19.009},
    points={{-19.9819,8.02226},{-19.9819,4.0222}},
    color={0,127,255}));
  connect(innerCore.portA, innerCore_in.portB) 
    annotation(Line(origin={-61.0056,19.009},
    points={{-19.9819,-15.97774},{-19.9819,-19.9778}},
    color={0,127,255}));
  connect(outerCore_out.portA, outerCore.portB) 
    annotation(Line(origin={-72.0056,19.009},
    points={{77.0180755,8.02226},{77.0180755,4.0222}},
    color={0,127,255}));
  connect(outerCore.portA, outerCore_in.portB) 
    annotation(Line(origin={-72.0056,19.009},
    points={{77.0180755,-15.97774},{77.0180755,-19.9778}},
    color={0,127,255}));
  connect(innerCore_in.portA, resistance_inner.port_b) 
    annotation(Line(origin={-1.00556,19.009},
    points={{-79.9819,-39.97774},{-79.9819,-58}},
    color={0,127,255}));
  connect(outerCore_in.portA, resistance_outer.port_b) 
    annotation(Line(origin={-1.00556,19.009},
    points={{6.0180755,-39.97774},{6,-58}},
    color={0,127,255}));
  connect(shieldReflector.portA, resistance_shield.port_b) 
    annotation(Line(origin={-1.00556,19.009},
    points={{78,-15.97774},{78,-58}},
    color={0,127,255}));
  connect(volume1.port_b[1], resistance_shield.port_a) 
    annotation(Line(origin={-1.00556,19.009},
    points={{6,-120},{6,-100},{78,-100},{78,-78}},
    color={0,127,255}));
  connect(volume1.port_b[2], resistance_inner.port_a) 
    annotation(Line(origin={-1.00556,19.009},
    points={{6,-120},{6,-100},{-79.9819,-100},{-79.9819,-78}},
    color={0,127,255}));
  connect(volume1.port_b[3], resistance_outer.port_a) 
    annotation(Line(origin={-1.00556,19.009},
    points={{6,-120},{6,-78}},
    color={0,127,255}));
  // ---- 点堆功率/反馈 ----
  connect(pointKinetics.Q_total, gain_uM.u) 
    annotation(Line(origin={25.0004,106.946},
    points={{-150.8854,13.68},{-147.13,13.68},{-147.13,-32.045},{-405,-32.045},{-405,-16.045},{-401,-16.045}},
    color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain_uM.y, PID_error.u2) 
    annotation(Line(origin={-280,100.43},
    points={{-73,-9.52875},{-68,-9.52875},{-68,14.4013},{-64,14.4013}},
    color={0,0,127}));
  connect(const1.y, pointKinetics.Reactivity_Other) 
    annotation(Line(origin={25.0004,106.946},
    points={{-228.0004,35.98375},{-200,35.98375},{-200,4.25},{-190.7554,4.25}},
    color={0,0,127}));
  connect(realExpression1.y, pointKinetics.Teff_coolant) 
    annotation(Line(origin={25.0004,106.946},
    points={{-198.0004,-16.045},{-190.7554,-16.045}},
    color={0,0,127}));
  connect(const3.y, pointKinetics.Q_in) 
    annotation(Line(origin={25.0004,106.946},
    points={{-194.0004,63.98375},{-171.3154,63.98375},{-171.3154,22.085}},
    color={0,0,127}));
  connect(realExpression4.y, pointKinetics.Teff_fuel) 
    annotation(Line(origin={25.0004,106.946},
    points={{-190.7554,-5.8975},{-228.0004,-5.89755}},
    color={0,0,127}));
  connect(ramp.y, gain_uS.u) 
    annotation(Line(origin={-320,122.43},
    points={{-89,-1.6},{-76,-1.5987}},
    color={0,0,127}));
  connect(gain_uS.y, PID_error.u1) 
    annotation(Line(origin={-290,122.43},
    points={{-83,-1.5987},{-58,-1.5987},{-58,4.4013},{-54,4.4013}},
    color={0,0,127}));
  connect(PID_error.y, PID.u) 
    annotation(Line(origin={-282,112.43},
    points={{-39,8.4013},{-20,8.4013}},
    color={0,0,127}));
  connect(PID.y, limPID.u) 
    annotation(Line(origin={-262,120.43},
    points={{-17,0.4013},{2,0.4}},
    color={0,0,127}));
  connect(limPID.y, pointKinetics.Reactivity_CR) 
    annotation(Line(origin={25.0004,106.946},
    points={{-262,13.88375},{-190.7554,13.885}},
    color={0,0,127}));
  // ---- 一回路主环路 ----
  connect(volume.port_b[1], pipe_static1.portA) 
    annotation(Line(origin={-1.00556,19.009},
    points={{6,76},{6,91.9819245},{113.02226,91.9819245}},
    color={0,127,255}));
  connect(volume1.port_a[1], pipe_static2.portB) 
    annotation(Line(origin={-1.00556,19.009},
    points={{6,-132},{93.9778,-132.018}},
    color={0,127,255}));
  connect(pipe_static2.portA, pump1.port_b) 
    annotation(Line(origin={-1.00556,19.009},
    points={{113.97774,-132.018},{140,-132.018}},
    color={0,178,226}));
  connect(expansionTank.port, resistance_toBoundary.port_a) 
    annotation(Line(origin={-1.00556,19.009},
    points={{154,145.6},{154,118},{162,118}},
    color={0,127,255}));
  connect(resistance_toBoundary.port_b, pipe_static1.portB) 
    annotation(Line(origin={-1.00556,19.009},
    points={{182,118},{185,118},{185,91.9819245},{133.0222,91.9819245}},
    color={0,127,255}));
  connect(hE1_1.shell_out, pump1.port_a) 
    annotation(Line(origin={-1.00556,19.009},
    points={{249.809,-8.191},{249.809,-132.018},{160,-132.018}},
    color={0,127,255}));
  connect(hE1_1.shell_in, pipe_static1.portB) 
    annotation(Line(origin={-1.00556,19.009},
    points={{249.809,12.209},{249.809,91.9819245},{133.0222,91.9819245}},
    color={0,127,255}));
  // ---- 管壁传热（热源→管壁→冷却剂） ----
  connect(tubeWall.port_a, innerCore.wall) 
    annotation(Line(origin={-94,13},
    points={{-9.0056,0.009},{9.1944,0.009}},
    color={191,0,0}));
  connect(tubeWall.port_b, prescribedHeatFlow_inner.port) 
    annotation(Line(origin={-129,13},
    points={{5.9944,0.009},{1,0.009}},
    color={191,0,0}));
  connect(outerCore.wall, tubeWall1.port_a) 
    annotation(Line(origin={-2,13},
    points={{3.19444,0.009},{-4,0.009}},
    color={127,0,0}));
  connect(prescribedHeatFlow_outer.port, tubeWall1.port_b) 
    annotation(Line(origin={-31,13},
    points={{-5,0.009},{5,0.009}},
    color={191,0,0}));
  connect(realExpression2.y, prescribedHeatFlow_inner.Q_flow) 
    annotation(Line(origin={-147,13},
    points={{-8,0.009},{7,0.009}},
    color={0,0,127}));
  connect(prescribedHeatFlow_outer.Q_flow, realExpression3.y) 
    annotation(Line(origin={-52,13},
    points={{4,0.009},{0.8,0.009},{0.8,8.009},{20,8.009},{20,31},{17,31}},
    color={0,0,127}));
  // ---- 二回路（HE1 二次侧 → 引擎 → 泵 → HE1） ----
  connect(expansionTank1.port, resistance_toExpTank.port_b) 
    annotation(Line(origin={650.25,172.9},
points={{-288,-72.4},{-288,-88},{-272,-88}}));
  connect(world.frame_b, revolute.frame_b) 
    annotation(Line(origin={382,-186.06},
points={{-50,65.4},{-23.6,65.4},{-23.6,24.8},{-18,24.8}}));
  connect(inertia.flange_b, revolute.axis) 
    annotation(Line(origin={382,-186.06},
points={{-18.25,-25.04},{-8,-25.04},{-8,14.8}}));
  connect(damper.flange_b, fixed_ground.flange) 
    annotation(Line(origin={391.779,-221.1},
points={{-120,10},{-128,10},{-128,-14}},
color={0,0,0}));
  connect(damper.flange_a, inertia.flange_a) 
    annotation(Line(origin={338,-226.06},
points={{-46.221,14.96},{5.75,14.96}},
color={0,0,0}));
  connect(world.frame_b, Engine.cylinder_a) 
    annotation(Line(origin={378.5,-120.86},
points={{-46.5,0.2},{37.5,0.2}},
color={95,95,95},
thickness=0.5));
  connect(revolute.frame_a, Engine.cylinder_a1) 
    annotation(Line(origin={404.5,-160.86},
points={{-20.5,-0.4},{11.5,-0.4},{11.5,-0.26}},
color={95,95,95},
thickness=0.5));
  connect(realExpression_TNa.y, Engine.T_Na) 
    annotation(Line(origin={445.5,-87.86},
points={{-12.75,24},{1.25,24},{1.25,-15.46}},
color={0,0,127}));
  connect(engineHeatFlow.port, Engine_pipe.wall[1]) 
    annotation(Line(origin={477.75,-20.96},
points={{-82.5,-6.14},{-82.5,4.06}},
color={191,0,0}));
  connect(volumeTube.port_b[1], Engine_pipe.portA) 
    annotation(Line(origin={386.75,-2.1},
points={{-32.5,-11},{-1.47774,-10.9819}},
color={0,127,255}));
  connect(resistance_toExpTank.port_a, Engine_pipe.portB) 
    annotation(Line(origin={450.25,33.9},
points={{-52,51},{-40,51},{-40,25},{40.5222,25},{40.5222,-46.9819},{-44.9778,-46.9819}},
color={0,127,255}));
  connect(Engine_pipe.portB, pump2.port_a) 
    annotation(Line(origin={431.25,23.9},
points={{-25.9778,-36.9819},{59.5222,-36.9819},{59.5222,35},{-77,35}},
color={0,127,255}));
  connect(volumeTube.port_a[1], hE1_1.tube_out) 
    annotation(Line(origin={314.75,8.9},
points={{27.5,-22},{7,-22},{7,22.318},{-53.7462,22.318}},
color={0,127,255}));
  connect(pump2.port_b, hE1_1.tube_in) 
    annotation(Line(origin={310.75,21.9},
points={{23.5,37},{-5,37},{-5,-37},{-22.9728,-37},{-22.9728,-11.082},{-49.7462,-11.082}},
color={0,127,255}));
  connect(realExpression_QEngine.y, engineHeatFlow.Q_flow) 
    annotation(Line(origin={358.75,-55.1},
points={{22,-8.76},{36.5,-8.76},{36.5,8}},
color={0,0,127}));
end SFR_Stirling_PK;