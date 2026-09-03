model SFR_Stirling_Steady
  annotation(__MWORKS(version="26.6.0"),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed_ground annotation(Placement(transformation(origin={179.018,-200.7},
extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow 
    annotation (Placement(transformation(origin={310.489,-2.7},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Vessels.MixingVolume volumeTube(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    nPorts_a=1, nPorts_b=1, V=1, h_start=654480 "HE1出口530℃(设计剖面初值)") 
    annotation(Placement(transformation(origin={263.489,21.3},
extent={{-10,-10},{10,10}})));
  SFR.Fluid.Vessels.ExpansionTank expansionTank1(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    A=1,
    V0=0.001,
    level_start=1,
    h_start=506655,
    p_start=100000.0) 
    annotation(Placement(transformation(origin={277.489,143.3},
extent={{-10,-10},{10,10}})));
  SFR.Fluid.Vessels.SpecifiedResistance resistance_toExpTank(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=0.1) 
    annotation(Placement(transformation(origin={303.489,119.3},
extent={{10,-10},{-10,10}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d=10.6) "发电负载（同步 SecondLoop：转速→1500rpm）" annotation(Placement(transformation(origin={197.018,-176.7},
extent={{10,-10},{-10,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=2, phi(start=0, fixed=true), w(start=0, fixed=true) "初值0（同 SecondLoop；稳态自然转向负向）") 
    annotation(Placement(transformation(origin={268.989,-176.7},
extent={{-10,-10},{10,10}})));
  inner Modelica.Mechanics.MultiBody.World world 
    annotation(Placement(transformation(origin={237.239,-86.26},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true, n(
        displayUnit="1") = {1,0,0}) annotation(Placement(transformation(origin={289.239,-126.86},
extent={{10,10},{-10,-10}})));
  Stirling.DoubleActing.DA_Engine_v2 Engine(heff=1.41) 
    annotation (Placement(transformation(origin={361.989,-103.6},
extent={{-30.75,-28.9},{30.75,28.9}})));
  Fluid.Pipes.pipe Engine_pipe(redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium,N=5,L_total=5,h_start=589680 "引擎入口~480℃剖面初值",m_flow_start=100) 
    annotation (Placement(transformation(origin={310.489,21.3},
extent={{-10,10},{10,-10}})));
  TYThermoFluidSys.Blocks.Ramp ramp2(offset=308.4, height=-92.52, duration=50, startTime=1800) 
    annotation (Placement(transformation(origin={224.989,125.3},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=- Engine.Q) "引擎吸热=40×Q_in×heff（同步 SecondLoop 标定）" 
    annotation (Placement(transformation(origin={284.989,-29.46},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=Engine_pipe.T[1]) 
    annotation (Placement(transformation(origin={336.989,-29.46},
extent={{-10,-10},{10,10}})));
  TRANSFORM.Fluid.Machines.Pump_SimpleMassFlow pump2(m_flow_nominal=308.4, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,use_input=true) 
    annotation (Placement(transformation(origin={259.489,93.3},
extent={{10,-10},{-10,10}})));
  SFR.Thermal.HeatExchange.HE1 hE1_1(shell(momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)) 
    annotation (Placement(transformation(origin={197.018,43.309},
extent={{10,10},{-10,-10}},
rotation=90)));
  TRANSFORM.Fluid.Machines.Pump_SimpleMassFlow pump1(m_flow_nominal=280.6, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation (Placement(transformation(origin={92,-90.518},
extent={{10,-10},{-10,10}})));
  TYThermoFluidSys.Blocks.Constant const2(k=823.15) 
    annotation (Placement(transformation(origin={-312,30.1187},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=innerCore.T[3] * 0.2237 + outerCore.T[3] * 0.7763) 
    annotation (Placement(transformation(origin={-312,-21},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Blocks.Constant const3(k=0) 
    annotation (Placement(transformation(origin={-266,101.5},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Blocks.Constant const1(k=0) 
    annotation (Placement(transformation(origin={-312,64},
extent={{-10,-10},{10,10}})));
  SFR.Nuclear.PointKinetics pointKinetics(Teffref_fuel(displayUnit="K"), Teffref_coolant(displayUnit="degC")=768.15 "参考=额定堆芯平均温度(440+550)/2=495℃=768.15K(尹凯论文口径); 初始冷却剂反馈=0, 功率不跌落") 
    annotation (Placement(transformation(origin={-244,35.5},
extent={{-18,-20.5},{18,20.5}})));
  SFR.Fluid.Vessels.MixingVolume volume1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, nPorts_a=1, nPorts_b=3, V=10, h_start=519165 "下腔室440℃") 
    annotation (Placement(transformation(origin={-52,-84.5},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Vessels.MixingVolume volume(nPorts_a=3, nPorts_b=1, V=10, h_start=656775 "上腔室550℃", redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation (Placement(transformation(origin={-52,111.5},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Pipes.pipe pipe_static2(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, L_total=10, Dh=0.30, initFromEnthalpy=true, h_start=519165 "冷段440℃", wallHeatTransfer=false, momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState) 
    annotation (Placement(transformation(origin={46,-90.5},
extent={{10,-10},{-10,10}})));
  SFR.Fluid.Pipes.pipe pipe_static1(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, L_total=10, Dh=0.30, initFromEnthalpy=true, h_start=656775 "热段550℃", wallHeatTransfer=false, momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState) 
    annotation (Placement(transformation(origin={65,133.5},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression3[4] (y=pointKinetics.Q_outerCore / 4) 
    annotation (Placement(transformation(origin={-106,35.5},
extent={{-10,-10},{10,10}})));
  SFR.Fluid.Vessels.ExpansionTank expansionTank(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, A=1, V0=0.001, level_start=1, h_start=656775 "热段550℃", p_start=100000.0) 
    annotation (Placement(transformation(origin={96,195.5},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Sensors.SensorT TSensor2(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation (Placement(transformation(origin={-27,153.5},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression4[4] (y=pointKinetics.Q_innerCore / 4) 
    annotation (Placement(transformation(origin={-186,35.5},
extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow_outer[4] 
    annotation (Placement(transformation(origin={-79,35.5},
extent={{-6,-6},{6,6}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow_inner[4] 
    annotation (Placement(transformation(origin={-156,35.5},
extent={{-6,-6},{6,6}})));
  SFR.Fluid.Vessels.SpecifiedResistance resistance_inner(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=22.1 "内堆芯 62.7 kg/s(2026-08-31新HE1重配流: 63.9→64.5→收紧)") 
    annotation (Placement(transformation(origin={-137.982,-26.5},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Vessels.SpecifiedResistance resistance_outer(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=4.20 "外堆芯 217.4 kg/s(2026-08-31新HE1重配流)") 
    annotation (Placement(transformation(origin={-52,-26.5},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Vessels.SpecifiedResistance resistance_shield(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=6400 "屏蔽+反射等温流道 0.5 kg/s(2026-08-31新HE1重配流: 0.44@7280→0.5@6400, m=3200/R)") 
    annotation (Placement(transformation(origin={20,-26.5},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Pipes.pipe outerCore_out(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=2, n_pipe=114, L_total=0.15, Dh=0.0415, height_ab=-0.15,
    initFromEnthalpy=true, h_start=656775, wallHeatTransfer=false,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.907 "单管217.4/114") 
    annotation (Placement(transformation(origin={-52,59.5},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Pipes.pipe outerCore(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=5, n_pipe=114, L_total=1.1, L_heat=1.1, Dh=0.0415, height_ab=-1.1,
    initFromEnthalpy=true, h_start=519165, wallHeatTransfer=true,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.907 "单管217.4/114") 
    annotation (Placement(transformation(origin={-52,35.5},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Pipes.pipe outerCore_in(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=2, n_pipe=114, L_total=0.25, Dh=0.0415, height_ab=-0.25,
    initFromEnthalpy=true, h_start=519165, wallHeatTransfer=false,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.907 "单管217.4/114") 
    annotation (Placement(transformation(origin={-52,11.5},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Pipes.pipe innerCore_out(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=2, n_pipe=37, L_total=0.15, Dh=0.0415, height_ab=-0.15,
    initFromEnthalpy=true, h_start=656775, wallHeatTransfer=false,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.695 "单管62.7/37") 
    annotation (Placement(transformation(origin={-138,59.5},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Pipes.pipe innerCore(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=5, n_pipe=37, L_total=1.1, L_heat=1.1, Dh=0.0415, height_ab=-1.1,
    initFromEnthalpy=true, h_start=519165, wallHeatTransfer=true,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.695 "单管62.7/37") 
    annotation (Placement(transformation(origin={-138,35.5},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Pipes.pipe innerCore_in(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=2, n_pipe=37, L_total=0.25, Dh=0.0415, height_ab=-0.25,
    initFromEnthalpy=true, h_start=519165, wallHeatTransfer=false,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.695 "单管62.7/37") 
    annotation (Placement(transformation(origin={-138,11.5},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Pipes.pipe shieldReflector(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=2, n_pipe=54, L_total=1.5, Dh=0.0415, height_ab=-1.5,
    initFromEnthalpy=true, h_start=519165, wallHeatTransfer=false,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=0.00926 "单管0.5/54") 
    annotation (Placement(transformation(origin={19.9819,35.5},
extent={{-10,-10},{10,10}},
rotation=90)));
  TYThermoFluidSys.Sensors.SensorT TSensor1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation (Placement(transformation(origin={-180,101.5},
extent={{-10,-10},{10,10}})));
  SFR.Fluid.Vessels.SpecifiedResistance resistance_toBoundary(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=0.1) 
    annotation (Placement(transformation(origin={114,159.5},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Blocks.Ramp ramp 
    annotation (Placement(transformation(origin={-312,97.8813},
extent={{-10,-10},{10,10}})));
  equation
  connect(expansionTank1.port, resistance_toExpTank.port_b) 
  annotation(Line(origin={565.489,207.3},
points={{-288,-72.4},{-288,-88},{-272,-88}}));
  connect(world.frame_b, revolute.frame_b) 
  annotation(Line(origin={297.239,-151.66},
points={{-50,65.4},{-23.6,65.4},{-23.6,24.8},{-18,24.8}}));
  connect(inertia.flange_b, revolute.axis) 
  annotation(Line(origin={297.239,-151.66},
points={{-18.25,-25.04},{-8,-25.04},{-8,14.8}}));
  connect(damper.flange_b, fixed_ground.flange) 
  annotation(Line(origin={307.018,-186.7},
points={{-120,10},{-128,10},{-128,-14}},
color={0,0,0}));
  connect(damper.flange_a, inertia.flange_a) 
  annotation(Line(origin={253.239,-191.66},
points={{-46.221,14.96},{5.75,14.96}},
color={0,0,0}));
  connect(world.frame_b, Engine.cylinder_a) 
  annotation(Line(origin={293.739,-86.46},
points={{-46.5,0.2},{37.5,0.2}},
color={95,95,95},
thickness=0.5));
  connect(revolute.frame_a, Engine.cylinder_a1) 
  annotation(Line(origin={319.739,-126.46},
points={{-20.5,-0.4},{11.5,-0.4},{11.5,-0.26}},
color={95,95,95},
thickness=0.5));
  connect(realExpression2.y, Engine.T_Na) 
  annotation(Line(origin={360.739,-53.46},
points={{-12.75,24},{1.25,24},{1.25,-15.46}},
color={0,0,127}));
  connect(prescribedHeatFlow.port, Engine_pipe.wall[1]) 
  annotation(Line(origin={392.989,13.44},
points={{-82.5,-6.14},{-82.5,4.06}},
color={191,0,0}));
  connect(volumeTube.port_b[1], Engine_pipe.portA) 
  annotation(Line(origin={301.989,32.3},
points={{-32.5,-11},{-1.47774,-10.9819}},
color={0,127,255}));
  connect(resistance_toExpTank.port_a, Engine_pipe.portB) 
  annotation(Line(origin={365.489,68.3},
points={{-52,51},{-40,51},{-40,25},{40.5222,25},{40.5222,-46.9819},{-44.9778,-46.9819}},
color={0,127,255}));
  connect(Engine_pipe.portB, pump2.port_a) 
  annotation(Line(origin={346.489,58.3},
points={{-25.9778,-36.9819},{59.5222,-36.9819},{59.5222,35},{-77,35}},
color={0,127,255}));
  connect(volumeTube.port_a[1], hE1_1.tube_out) 
  annotation(Line(origin={229.989,43.3},
points={{27.5,-22},{7,-22},{7,22},{-26.9728,22},{-26.9728,10.209}},
color={0,127,255}));
  connect(pump2.port_b, hE1_1.tube_in) 
  annotation(Line(origin={225.989,56.3},
points={{23.5,37},{-5,37},{-5,-37},{-22.9728,-37},{-22.9728,-23.191}},
color={0,127,255}));
  connect(realExpression.y, prescribedHeatFlow.Q_flow) 
  annotation(Line(origin={273.989,-20.7},
points={{22,-8.76},{36.5,-8.76},{36.5,8}},
color={0,0,127}));
  connect(ramp2.y, pump2.in_m_flow) 
  annotation(Line(origin={247.989,113.3},
points={{-12,12},{11.5,12},{11.5,-12.7}},
color={0,0,127}));
  connect(innerCore_out.portB, volume.port_a[1]) 
  annotation(Line(origin={-58,41.5},
points={{-79.9819,28.0222},{-79.9819,48},{6,48},{6,64}},
color={0,127,255}));
  connect(TSensor1.port_a, innerCore_out.portB) 
  annotation(Line(origin={-92.5,41.5},
points={{-87.5,50},{-87.5,31.0222},{-45.4819,31.0222},{-45.4819,28.0222}},
color={0,178,226}));
  connect(outerCore_out.portB, volume.port_a[2]) 
  annotation(Line(origin={-83,41.5},
points={{31.0181,28.0222},{31,64}},
color={0,127,255}));
  connect(shieldReflector.portB, volume.port_a[3]) 
  annotation(Line(origin={-58,41.5},
points={{78,4.0222},{78,48},{6,48},{6,64}},
color={0,127,255}));
  connect(innerCore_out.portA, innerCore.portB) 
  annotation(Line(origin={-118,41.5},
points={{-19.9819,8.02226},{-19.9819,4.0222}},
color={0,127,255}));
  connect(innerCore.portA, innerCore_in.portB) 
  annotation(Line(origin={-118,41.5},
points={{-19.9819,-15.9777},{-19.9819,-19.9778}},
color={0,127,255}));
  connect(outerCore_out.portA, outerCore.portB) 
  annotation(Line(origin={-129,41.5},
points={{77.0181,8.02226},{77.0181,4.0222}},
color={0,127,255}));
  connect(outerCore.portA, outerCore_in.portB) 
  annotation(Line(origin={-129,41.5},
points={{77.0181,-15.9777},{77.0181,-19.9778}},
color={0,127,255}));
  connect(innerCore_in.portA, resistance_inner.port_b) 
  annotation(Line(origin={-58,41.5},
points={{-79.9819,-39.97774},{-79.9819,-58}},
color={0,127,255}));
  connect(outerCore_in.portA, resistance_outer.port_b) 
  annotation(Line(origin={-58,41.5},
points={{6.01808,-39.97774},{6,-58}},
color={0,127,255}));
  connect(shieldReflector.portA, resistance_shield.port_b) 
  annotation(Line(origin={-58,41.5},
points={{78,-15.9777},{78,-58}},
color={0,127,255}));
  connect(volume1.port_b[1], resistance_shield.port_a) 
  annotation(Line(origin={-58,41.5},
points={{6,-120},{6,-100},{78,-100},{78,-78}},
color={0,127,255}));
  connect(volume1.port_b[2], resistance_inner.port_a) 
  annotation(Line(origin={-58,41.5},
points={{6,-120},{6,-100},{-79.9819,-100},{-79.9819,-78}},
color={0,127,255}));
  connect(volume1.port_b[3], resistance_outer.port_a) 
  annotation(Line(origin={-58,41.5},
points={{6,-120},{6,-78}},
color={0,127,255}));
  connect(prescribedHeatFlow_inner.port, innerCore.wall) 
  annotation(Line(origin={-118,41.5},
points={{-32,-6},{-23.8,-6}},
color={127,0,0}));
  connect(prescribedHeatFlow_outer.port, outerCore.wall) 
  annotation(Line(origin={-129,41.5},
points={{56,-6},{73.2,-6}},
color={127,0,0}));
  connect(TSensor2.port_a, volume.port_b[1]) 
  annotation(Line(origin={-58,41.5},
points={{31,102},{31,92},{6,92},{6,76}},
color={0,178,226}));
  connect(const1.y, pointKinetics.Reactivity_Other) 
  annotation(Line(origin={-73,36.01625},
points={{-228,27.98375},{-200,27.98375},{-200,4.25},{-190.755,4.25}},
color={0,0,127}));
  connect(realExpression1.y, pointKinetics.Teff_coolant) 
  annotation(Line(origin={-73,36.01625},
points={{-228,-57.01625},{-200,-57.01625},{-200,-16.045},{-190.755,-16.045}},
color={0,0,127}));
  connect(const3.y, pointKinetics.Q_in) 
  annotation(Line(origin={-73,36.01625},
points={{-182,65.48375},{-171.315,65.48375},{-171.315,22.085}},
color={0,0,127}));
  connect(pointKinetics.Teff_fuel, const2.y) 
  annotation(Line(origin={-73,36.01625},
points={{-190.755,-5.8975},{-228,-5.89755}},
color={0,0,127}));
  connect(volume.port_b[1], pipe_static1.portA) 
  annotation(Line(origin={-58,41.5},
points={{6,76},{6,91.9819},{113.022,91.9819}},
color={0,127,255}));
  connect(volume1.port_a[1], pipe_static2.portB) 
  annotation(Line(origin={-58,41.5},
points={{6,-132},{93.9778,-132.018}},
color={0,127,255}));
  connect(pipe_static2.portA, pump1.port_b) 
  annotation(Line(origin={-58,41.5},
points={{113.978,-132.018},{140,-132.018}},
color={0,178,226}));
  connect(expansionTank.port, resistance_toBoundary.port_a) 
  annotation(Line(origin={-58,41.5},
points={{154,145.6},{154,118},{162,118}},
color={0,127,255}));
  connect(resistance_toBoundary.port_b, pipe_static1.portB) 
  annotation(Line(origin={-58,41.5},
points={{182,118},{185,118},{185,91.9819},{133.0222,91.9819}},
color={0,127,255}));
  connect(hE1_1.shell_out, pump1.port_a) 
  annotation(Line(origin={-58,41.5},
points={{248.81609,-8.391},{248.81609,-132.018},{160,-132.018}},
color={0,127,255}));
  connect(hE1_1.shell_in, pipe_static1.portB) 
  annotation(Line(origin={-58,41.5},
points={{248.81609,12.009},{248.81609,91.9819},{133.0222,91.9819}},
color={0,127,255}));
  connect(prescribedHeatFlow_inner.Q_flow, realExpression4.y) 
  annotation(Line(origin={-168,35.5},
points={{6,0},{-7,0}},
color={0,0,127}));
  connect(prescribedHeatFlow_outer.Q_flow, realExpression3.y) 
  annotation(Line(origin={-90,35.5},
points={{5,0},{-5,0}},
color={0,0,127}));
  connect(ramp.y, pointKinetics.Reactivity_CR) 
  annotation(Line(origin={-282,74},
  points={{-19,23.8813},{2,23.8813},{2,0},{14.49,0},{14.49,-24.0988},{18.245,-24.0988}},
  color={0,0,127}));
  end SFR_Stirling_Steady;