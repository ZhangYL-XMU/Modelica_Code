model SFR_flowDown
  annotation(__MWORKS(version="26.6.0",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=7.2,ContinueTimeVector)),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.1,StartTime=0,StopTime=3600,StoreEventValue=0,Tolerance=0.0001));
  Fluid.Vessels.SpecifiedResistance resistance_shield(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=6400 "屏蔽+反射等温流道 0.5 kg/s(2026-08-31新HE1重配流: 0.44@7280→0.5@6400, m=3200/R)") 
    annotation (Placement(transformation(origin={-62.2556,-32.5},
extent={{-10,-10},{10,10}},
rotation=90)));
  Fluid.Pipes.pipe outerCore_out(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=2, n_pipe=114, L_total=0.15, Dh=0.0415, height_ab=-0.15,
    initFromEnthalpy=true, h_start=656775, wallHeatTransfer=false,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.907 "单管217.4/114") 
    annotation (Placement(transformation(origin={-134.256,53.5},
extent={{-10,-10},{10,10}},
rotation=90)));
  Fluid.Pipes.pipe outerCore(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=11, n_pipe=114, L_total=1.1, L_heat=1.1, Dh=0.0415, height_ab=-1.1,
    initFromEnthalpy=true, h_start=607863 "无PID自稳试验: 中芯初值=额定767.18K; h=cp*(T-298.15)", wallHeatTransfer=true,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.907 "单管217.4/114") 
    annotation (Placement(transformation(origin={-134.256,29.5},
extent={{-10,-10},{10,10}},
rotation=90)));
  Fluid.Pipes.pipe outerCore_in(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=2, n_pipe=114, L_total=0.25, Dh=0.0415, height_ab=-0.25,
    initFromEnthalpy=true, h_start=519165, wallHeatTransfer=false,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.907 "单管217.4/114") 
    annotation (Placement(transformation(origin={-134.256,5.5},
extent={{-10,-10},{10,10}},
rotation=90)));
  Modelica.Blocks.Sources.RealExpression realExpression3[10] (y=pointKinetics.Q_total * 0.7763 / 10 "outer 77.63% (2026-09-01 cal)") 
    annotation (Placement(transformation(origin={-185.25,60.491},
extent={{-10,-10},{10,10}})));
  Fluid.Pipes.pipe innerCore(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=11, n_pipe=37, L_total=1.1, L_heat=1.1, Dh=0.0415, height_ab=-1.1,
    initFromEnthalpy=true, h_start=607863 "无PID自稳试验: 中芯初值=额定767.18K; h=cp*(T-298.15)", wallHeatTransfer=true,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.695 "单管62.7/37") 
    annotation (Placement(transformation(origin={-220.256,29.5},
extent={{-10,-10},{10,10}},
rotation=90)));
  Fluid.Pipes.pipe innerCore_in(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=2, n_pipe=37, L_total=0.25, Dh=0.0415, height_ab=-0.25,
    initFromEnthalpy=true, h_start=519165, wallHeatTransfer=false,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.695 "单管62.7/37") 
    annotation (Placement(transformation(origin={-220.256,5.5},
extent={{-10,-10},{10,10}},
rotation=90)));
  Fluid.Pipes.pipe shieldReflector(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=2, n_pipe=54, L_total=1.5, Dh=0.0415, height_ab=-1.5,
    initFromEnthalpy=true, h_start=519165, wallHeatTransfer=false,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=0.00926 "单管0.5/54") 
    annotation (Placement(transformation(origin={-62.2736,29.5},
extent={{-10,-10},{10,10}},
rotation=90)));
  Thermal.HeatExchange.HE1 hE1_1(shell(momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState),N=10) 
    annotation (Placement(transformation(origin={115.756,37.509},
extent={{10,10},{-10,-10}},
rotation=90)));
  Fluid.Vessels.SpecifiedResistance resistance_toBoundary(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=0.1) 
    annotation (Placement(transformation(origin={31.7444,153.5},
extent={{-10,-10},{10,10}})));
  Fluid.Vessels.ExpansionTank expansionTank(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, A=1, V0=0.001, level_start=1, h_start=656775 "热段550℃", p_start=100000.0) 
    annotation (Placement(transformation(origin={13.7444,189.5},
extent={{-10,-10},{10,10}})));
  Fluid.Pipes.pipe pipe_static1(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, L_total=10, Dh=0.30, initFromEnthalpy=true, h_start=656775 "热段550℃", wallHeatTransfer=false, momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState) 
    annotation (Placement(transformation(origin={-17.256,127.5},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=innerCore.T_wall[6] * 0.2237 + outerCore.T_wall[6] * 0.7763 "fuel eff. T: 份额加权管道壁温(09-06 无PID标定口径; 原 tubeWall 组件已不存在)") 
    annotation (Placement(transformation(origin={-369.25,74.118},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=innerCore.T[6] * 0.2237 + outerCore.T[6] * 0.7763 "coolant eff. T at axial mid (mirror Teffref=768.15K)") 
    annotation (Placement(transformation(origin={-339.25,63.9709},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant const3(k=0) 
    annotation (Placement(transformation(origin={-339.25,160.491},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant const1(k=0) 
    annotation (Placement(transformation(origin={-377.25,100.8},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d=10.6) "发电负载（同步 SecondLoop：转速→1500rpm）" annotation(Placement(transformation(origin={156.5,-181.3},
extent={{10,-10},{-10,10}})));
  Nuclear.PointKinetics pointKinetics(Teffref_fuel=863.2 "燃料参考=额定份额加权管道壁温K(2026-09-06 标定)", Teffref_coolant(displayUnit="degC")=768.29 "冷却剂参考(2026-09-06 标定; 原768.15为旧口径)参考=额定堆芯平均温度(440+550)/2=495℃=768.15K(尹凯论文口径); 初始冷却剂反馈=0, 功率不跌落") 
    annotation (Placement(transformation(origin={-301.25,79.5},
extent={{-18,-20.5},{18,20.5}})));
  Fluid.Vessels.MixingVolume volume1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, nPorts_a=1, nPorts_b=3, V=10, h_start=519165 "下腔室440℃") 
    annotation (Placement(transformation(origin={-134.256,-90.5},
extent={{-10,-10},{10,10}},
rotation=90)));
  Fluid.Vessels.MixingVolume volume(nPorts_a=3, nPorts_b=1, V=10, h_start=656775 "上腔室550℃", redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation (Placement(transformation(origin={-134.256,105.5},
extent={{-10,-10},{10,10}},
rotation=90)));
  Fluid.Pipes.pipe pipe_static2(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, L_total=10, Dh=0.30, initFromEnthalpy=true, h_start=519165 "冷段440℃", wallHeatTransfer=false, momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState) 
    annotation (Placement(transformation(origin={-36.256,-96.5},
extent={{10,-10},{-10,10}})));
  TRANSFORM.Fluid.Machines.Pump_SimpleMassFlow pump1(m_flow_nominal=280.6, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,use_input=true) 
    annotation (Placement(transformation(origin={9.74444,-96.518},
extent={{10,-10},{-10,10}})));
  Fluid.Vessels.SpecifiedResistance resistance_outer(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=4.20 "外堆芯 217.4 kg/s(2026-08-31新HE1重配流)") 
    annotation (Placement(transformation(origin={-134.256,-32.5},
extent={{-10,-10},{10,10}},
rotation=90)));
  Fluid.Pipes.pipe Engine_pipe(redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium,N=5,L_total=5,h_start=589680 "引擎入口~480℃剖面初值",m_flow_start=100) 
    annotation (Placement(transformation(origin={229.75,16},
extent={{-10,10},{10,-10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow 
    annotation (Placement(transformation(origin={229.75,-8},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Vessels.MixingVolume volumeTube(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    nPorts_a=1, nPorts_b=1, V=1, h_start=654480 "HE1出口530℃(设计剖面初值)") 
    annotation(Placement(transformation(origin={182.75,16},
extent={{-10,-10},{10,10}})));
  SFR.Fluid.Vessels.ExpansionTank expansionTank1(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    A=1,
    V0=0.001,
    level_start=1,
    h_start=506655,
    p_start=100000.0) 
    annotation(Placement(transformation(origin={196.75,138},
extent={{-10,-10},{10,10}})));
  SFR.Fluid.Vessels.SpecifiedResistance resistance_toExpTank(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=0.1) 
    annotation(Placement(transformation(origin={222.75,114},
extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Sources.Constant constCR(k=0) "无PID：控制棒反应性恒为0（自稳验证）" 
    annotation (Placement(transformation(origin={-377.25,132.491},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=2, phi(start=0, fixed=true), w(start=0, fixed=true) "初值0（同 SecondLoop；稳态自然转向负向）") 
    annotation(Placement(transformation(origin={191.261,-181.3},
extent={{-10,-10},{10,10}})));
  inner Modelica.Mechanics.MultiBody.World world 
    annotation(Placement(transformation(origin={156.5,-91.56},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true, n(
        displayUnit="1") = {1,0,0}) annotation(Placement(transformation(origin={208.5,-132.16},
extent={{10,10},{-10,-10}})));
  Stirling.DoubleActing.DA_Engine_v2 Engine(heff=1.41) 
    annotation (Placement(transformation(origin={281.25,-108.9},
extent={{-30.75,-28.9},{30.75,28.9}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed_ground annotation(Placement(transformation(origin={138.5,-205.3},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=- Engine.Q) "引擎吸热=40×Q_in×heff（同步 SecondLoop 标定）" 
    annotation (Placement(transformation(origin={204.25,-34.76},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression5(y=Engine_pipe.T[1]) 
    annotation (Placement(transformation(origin={256.25,-34.76},
extent={{-10,-10},{10,10}})));
  TRANSFORM.Fluid.Machines.Pump_SimpleMassFlow pump2(m_flow_nominal=308.4, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,use_input=true) 
    annotation (Placement(transformation(origin={178.75,88},
extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Sources.Ramp ramp1(offset=308.4,startTime=1200,duration=60,height=-92.52) 
    annotation (Placement(transformation(origin={150,114},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Ramp ramp(offset=280.6,startTime=1200,duration=60,height=-84.18) 
    annotation (Placement(transformation(origin={-17.256,-53.509},
extent={{-10,-10},{10,10}})));
  Fluid.Pipes.pipe innerCore_out(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=2, n_pipe=37, L_total=0.15, Dh=0.0415, height_ab=-0.15,
    initFromEnthalpy=true, h_start=656775, wallHeatTransfer=false,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.695 "单管62.7/37") 
    annotation (Placement(transformation(origin={-220.256,53.5},
extent={{-10,-10},{10,10}},
rotation=90)));
  Modelica.Blocks.Sources.RealExpression realExpression2[10] (y=pointKinetics.Q_total * 0.2237 / 10 "inner 22.37% (2026-09-01 cal)") 
    annotation (Placement(transformation(origin={-277.25,29.5},
extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow_outer[10] 
    annotation (Placement(transformation(origin={-181.25,29.5},
extent={{-6,-6},{6,6}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow_inner[10] 
    annotation (Placement(transformation(origin={-245.25,29.5},
extent={{-6,-6},{6,6}})));
  Fluid.Vessels.SpecifiedResistance resistance_inner(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=22.1 "内堆芯 62.7 kg/s(2026-08-31新HE1重配流: 63.9→64.5→收紧)") 
    annotation (Placement(transformation(origin={-220.237,-32.5},
extent={{-10,-10},{10,10}},
rotation=90)));
  equation
  connect(innerCore_out.portB, volume.port_a[1]) 
  annotation(Line(origin={-140.256,35.5},
points={{-79.9819,28.0222},{-79.9819,48},{6,48},{6,64}},
color={0,127,255}));
  connect(outerCore_out.portB, volume.port_a[2]) 
  annotation(Line(origin={-165.256,35.5},
points={{31.0181,28.0222},{31,64}},
color={0,127,255}));
  connect(shieldReflector.portB, volume.port_a[3]) 
  annotation(Line(origin={-140.256,35.5},
points={{78.0005,4.0222},{78.0005,48},{6,48},{6,64}},
color={0,127,255}));
  connect(innerCore_out.portA, innerCore.portB) 
  annotation(Line(origin={-200.256,35.5},
points={{-19.9819,8.02226},{-19.9819,4.0222}},
color={0,127,255}));
  connect(innerCore.portA, innerCore_in.portB) 
  annotation(Line(origin={-200.256,35.5},
points={{-19.9819,-15.9777},{-19.9819,-19.9778}},
color={0,127,255}));
  connect(outerCore_out.portA, outerCore.portB) 
  annotation(Line(origin={-211.256,35.5},
points={{77.0181,8.02226},{77.0181,4.0222}},
color={0,127,255}));
  connect(outerCore.portA, outerCore_in.portB) 
  annotation(Line(origin={-211.256,35.5},
points={{77.0181,-15.9777},{77.0181,-19.9778}},
color={0,127,255}));
  connect(innerCore_in.portA, resistance_inner.port_b) 
  annotation(Line(origin={-140.256,35.5},
points={{-79.9819,-39.9777},{-79.981,-58}},
color={0,127,255}));
  connect(outerCore_in.portA, resistance_outer.port_b) 
  annotation(Line(origin={-140.256,35.5},
points={{6.01808,-39.9777},{6,-58}},
color={0,127,255}));
  connect(shieldReflector.portA, resistance_shield.port_b) 
  annotation(Line(origin={-140.256,35.5},
points={{78.0005,-15.9777},{78.0004,-58}},
color={0,127,255}));
  connect(volume1.port_b[1], resistance_shield.port_a) 
  annotation(Line(origin={-140.256,35.5},
points={{6,-120},{6,-100},{78.0004,-100},{78.0004,-78}},
color={0,127,255}));
  connect(volume1.port_b[2], resistance_inner.port_a) 
  annotation(Line(origin={-140.256,35.5},
points={{6,-120},{6,-100},{-79.981,-100},{-79.981,-78}},
color={0,127,255}));
  connect(volume1.port_b[3], resistance_outer.port_a) 
  annotation(Line(origin={-140.256,35.5},
points={{6,-120},{6,-78}},
color={0,127,255}));
  connect(const1.y, pointKinetics.Reactivity_Other) 
  annotation(Line(origin={-130.25,80.016},
points={{-236,20.784},{-209.0004,20.784},{-209.0004,4.25025},{-190.755,4.25025}},
color={0,0,127}));
  connect(realExpression1.y, pointKinetics.Teff_coolant) 
  annotation(Line(origin={-130.25,80.016},
points={{-198,-16.0451},{-190.755,-16.0448}},
color={0,0,127}));
  connect(const3.y, pointKinetics.Q_in) 
  annotation(Line(origin={-130.25,80.016},
points={{-198,80.475},{-171.315,80.475},{-171.315,22.0852}},
color={0,0,127}));
  connect(realExpression4.y, pointKinetics.Teff_fuel) 
  annotation(Line(origin={-130.25,80.016},
points={{-228,-5.898},{-190.755,-5.89725}},
color={0,0,127}));
  connect(volume.port_b[1], pipe_static1.portA) 
  annotation(Line(origin={-140.256,35.5},
points={{6,76},{6,91.9819},{113.022,91.9819}},
color={0,127,255}));
  connect(volume1.port_a[1], pipe_static2.portB) 
  annotation(Line(origin={-140.256,35.5},
points={{6,-132},{93.9778,-132.018}},
color={0,127,255}));
  connect(pipe_static2.portA, pump1.port_b) 
  annotation(Line(origin={-140.256,35.5},
points={{113.978,-132.018},{140.00044,-132.018}},
color={0,178,226}));
  connect(expansionTank.port, resistance_toBoundary.port_a) 
  annotation(Line(origin={-140.256,35.5},
points={{154.00044,145.6},{154.00044,118},{162,118}},
color={0,127,255}));
  connect(resistance_toBoundary.port_b, pipe_static1.portB) 
  annotation(Line(origin={-140.256,35.5},
points={{182,118},{185,118},{185,91.9819},{133.022,91.9819}},
color={0,127,255}));
  connect(hE1_1.shell_out, pump1.port_a) 
  annotation(Line(origin={-140.256,35.5},
points={{249.81019,-8.191},{249.81019,-132.018},{160.00044,-132.018}},
color={0,127,255}));
  connect(hE1_1.shell_in, pipe_static1.portB) 
  annotation(Line(origin={-140.256,35.5},
points={{249.81019,12.209},{249.81019,91.9819},{133.022,91.9819}},
color={0,127,255}));
  connect(realExpression2.y, prescribedHeatFlow_inner.Q_flow) 
  annotation(Line(origin={-258.25,29.491},
points={{-8,0.009},{7,0.009}},
color={0,0,127}));
  connect(prescribedHeatFlow_outer.Q_flow, realExpression3.y) 
  annotation(Line(origin={-191.25,29.491},
points={{4,0.009},{0.8,0.009},{0.8,8.009},{20,8.009},{20,31},{17,31}},
color={0,0,127}));
  connect(outerCore.wall, prescribedHeatFlow_outer.port) 
  annotation(Line(origin={-156.25,29.491},
points={{18.194,0.009},{-19,0.009}},
color={127,0,0}));
  connect(prescribedHeatFlow_inner.port, innerCore.wall) 
  annotation(Line(origin={-245.25,29.491},
points={{6,0.009},{21.194,0.009}},
color={191,0,0}));
  connect(constCR.y, pointKinetics.Reactivity_CR) 
  annotation(Line(origin={-130.25,80.016},
points={{-236,52.475},{-201.0004,52.475},{-201.0004,13.8852},{-190.755,13.8852}},
color={0,0,127}));
  connect(ramp.y, pump1.in_m_flow) 
  annotation(Line(origin={6.75,-71.509},
points={{-13.006,18},{2.99444,18},{2.99444,-17.709}},
color={0,0,127}));
  connect(expansionTank1.port, resistance_toExpTank.port_b) 
  annotation(Line(origin={484.75,202},
points={{-288,-72.4},{-288,-88},{-272,-88}}));
  connect(world.frame_b, revolute.frame_b) 
  annotation(Line(origin={216.5,-156.96},
points={{-50,65.4},{-23.6,65.4},{-23.6,24.8},{-18,24.8}}));
  connect(inertia.flange_b, revolute.axis) 
  annotation(Line(origin={216.5,-156.96},
points={{-15.239,-24.34},{-8,-24.34},{-8,14.8}}));
  connect(damper.flange_b, fixed_ground.flange) 
  annotation(Line(origin={266.5,-191.3},
points={{-120,10},{-128,10},{-128,-14}},
color={0,0,0}));
  connect(damper.flange_a, inertia.flange_a) 
  annotation(Line(origin={175.511,-196.26},
points={{-9.011,14.96},{5.75,14.96}},
color={0,0,0}));
  connect(world.frame_b, Engine.cylinder_a) 
  annotation(Line(origin={213,-91.76},
points={{-46.5,0.2},{37.5,0.2}},
color={95,95,95},
thickness=0.5));
  connect(revolute.frame_a, Engine.cylinder_a1) 
  annotation(Line(origin={239,-131.76},
points={{-20.5,-0.4},{11.5,-0.4},{11.5,-0.26}},
color={95,95,95},
thickness=0.5));
  connect(realExpression5.y, Engine.T_Na) 
  annotation(Line(origin={280,-58.76},
points={{-12.75,24},{1.25,24},{1.25,-15.46}},
color={0,0,127}));
  connect(prescribedHeatFlow.port, Engine_pipe.wall[1]) 
  annotation(Line(origin={312.25,8.14},
points={{-82.5,-6.14},{-82.5,4.06}},
color={191,0,0}));
  connect(volumeTube.port_b[1], Engine_pipe.portA) 
  annotation(Line(origin={221.25,27},
points={{-32.5,-11},{-1.47774,-10.9819}},
color={0,127,255}));
  connect(resistance_toExpTank.port_a, Engine_pipe.portB) 
  annotation(Line(origin={284.75,63},
points={{-52,51},{-40,51},{-40,25},{40.5222,25},{40.5222,-46.9819},{-44.9778,-46.9819}},
color={0,127,255}));
  connect(Engine_pipe.portB, pump2.port_a) 
  annotation(Line(origin={265.75,53},
points={{-25.9778,-36.9819},{59.5222,-36.9819},{59.5222,35},{-77,35}},
color={0,127,255}));
  connect(volumeTube.port_a[1], hE1_1.tube_out) 
  annotation(Line(origin={149.25,38},
points={{27.5,-22},{7,-22},{7,22},{-27.4958,22},{-27.4958,9.709}},
color={0,127,255}));
  connect(pump2.port_b, hE1_1.tube_in) 
  annotation(Line(origin={145.25,51},
points={{23.5,37},{-5,37},{-5,-37},{-23.4958,-37},{-23.4958,-23.691}},
color={0,127,255}));
  connect(realExpression.y, prescribedHeatFlow.Q_flow) 
  annotation(Line(origin={193.25,-26},
points={{22,-8.76},{36.5,-8.76},{36.5,8}},
color={0,0,127}));
  connect(ramp1.y, pump2.in_m_flow) 
  annotation(Line(origin={170,105},
  points={{-9,9},{8.75,9},{8.75,-9.7}},
  color={0,0,127}));
  end SFR_flowDown;