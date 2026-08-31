within SFR.Structure.Closed;
  model SFR_Stirling
    annotation(__MWORKS(version="26.1.3",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=7.2,ContinueTimeVector)),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.01,StartTime=0,StopTime=3600,StoreEventValue=0,Tolerance=0.0001));
    SFR.Fluid.Vessels.ExpansionTank expansionTank(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, A=1, V0=0.001, level_start=1, h_start=656775 "热段550℃", p_start=100000.0) 
      annotation (Placement(transformation(origin={50.0181,160},
extent={{-10,-10},{10,10}})));
    TRANSFORM.Fluid.Machines.Pump_SimpleMassFlow pump1(m_flow_nominal=280.6, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={46.0181,-126.018},
extent={{10,-10},{-10,10}})));
    TYThermoFluidSys.Blocks.Constant const2(k=823.15) 
      annotation (Placement(transformation(origin={-357.982,-5.3813},
extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Sources.RealExpression realExpression1(y=innerCore.T[3] * 0.2237 + outerCore.T[3] * 0.7763) 
      annotation (Placement(transformation(origin={-357.982,-56.5},
extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Blocks.Ramp ramp(offset=40e6, height=0, duration=100, startTime=400) 
      annotation (Placement(transformation(origin={-572,14.4013},
extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Blocks.Constant const3(k=0) 
      annotation (Placement(transformation(origin={-323.982,64.5},
extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Blocks.Constant const1(k=0) 
      annotation (Placement(transformation(origin={-357.982,36.5},
extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Math.Gain gain_uM(k=1/40e6) "u_m 归一化(Q_total W→无量纲)" 
      annotation (Placement(transformation(origin={-474,-30},
extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Math.Gain gain_uS(k=1/40e6) "u_s 归一化(ramp W→无量纲)" 
      annotation (Placement(transformation(origin={-518,14.4013},
extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Nonlinear.Limiter limPID(uMin=-0.021, uMax=0.021) 
      annotation (Placement(transformation(origin={-391.982,14.4},
extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Math.Add PID_error(k1=1, k2=-1) "误差 e=u_s-u_m (归一化后)" 
      annotation (Placement(transformation(origin={-480,8.4013},
extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Continuous.PID PID(k=0.5, Ti=100, Td=0, initType=Modelica.Blocks.Types.Init.SteadyState) 
      annotation (Placement(transformation(origin={-435.991,14.4013},
extent={{-10,-10},{10,10}})));
    SFR.Nuclear.PointKinetics pointKinetics(Teffref_fuel(displayUnit="K"), Teffref_coolant(displayUnit="degC")=768.15 "参考=额定堆芯平均温度(440+550)/2=495℃=768.15K(尹凯论文口径); 初始冷却剂反馈=0, 功率不跌落") 
      annotation (Placement(transformation(origin={-289.982,0},
extent={{-18,-20.5},{18,20.5}})));
    SFR.Fluid.Vessels.MixingVolume volume1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, nPorts_a=1, nPorts_b=3, V=10, h_start=519165 "下腔室440℃") 
      annotation (Placement(transformation(origin={-97.9819,-120},
extent={{-10,-10},{10,10}},
rotation=90)));
    SFR.Fluid.Vessels.MixingVolume volume(nPorts_a=3, nPorts_b=1, V=10, h_start=656775 "上腔室550℃", redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={-97.9819,76},
extent={{-10,-10},{10,10}},
rotation=90)));
    SFR.Fluid.Pipes.pipe pipe_static2(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, L_total=10, Dh=0.30, initFromEnthalpy=true, h_start=519165 "冷段440℃", wallHeatTransfer=false, momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState) 
      annotation (Placement(transformation(origin={0.0180755,-126},
extent={{10,-10},{-10,10}})));
    SFR.Fluid.Pipes.pipe pipe_static1(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, L_total=10, Dh=0.30, initFromEnthalpy=true, h_start=656775 "热段550℃", wallHeatTransfer=false, momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState) 
      annotation (Placement(transformation(origin={19.0181,98},
extent={{-10,-10},{10,10}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow_outer[4] 
      annotation (Placement(transformation(origin={-124.982,0},
extent={{-6,-6},{6,6}})));
    SFR.Fluid.Vessels.SpecifiedResistance resistance_toBoundary(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=0.1) 
      annotation (Placement(transformation(origin={68.0180755,124},
extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Sensors.SensorT TSensor2(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={-72.9819,118},
extent={{-10,-10},{10,10}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow_inner[4] 
      annotation (Placement(transformation(origin={-201.982,0},
extent={{-6,-6},{6,6}})));
    Modelica.Blocks.Math.Gain gain_outer(k=31051.69/40000/4) "外堆芯功率份额/4：31051.69/40000/4" 
      annotation (Placement(transformation(origin={-151.982,0},
extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Math.Gain gain_inner(k=8948.31/40000/4) "内堆芯功率份额/4：8948.31/40000/4" 
      annotation (Placement(transformation(origin={-235.982,0},
extent={{-10,-10},{10,10}})));
    SFR.Fluid.Vessels.SpecifiedResistance resistance_inner(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=20.6 "内堆芯 62.7 kg/s(标定同步)") 
      annotation (Placement(transformation(origin={-183.964,-62},
extent={{-10,-10},{10,10}},
rotation=90)));
    SFR.Fluid.Vessels.SpecifiedResistance resistance_outer(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=4.30 "外堆芯 217.4 kg/s(标定同步)") 
      annotation (Placement(transformation(origin={-97.9819,-62},
extent={{-10,-10},{10,10}},
rotation=90)));
    SFR.Fluid.Vessels.SpecifiedResistance resistance_shield(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=6280 "屏蔽+反射等温流道 0.5 kg/s(标定同步)") 
      annotation (Placement(transformation(origin={-25.9819,-62},
extent={{-10,-10},{10,10}},
rotation=90)));
    SFR.Fluid.Pipes.pipe outerCore_out(
      redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
      N=2, n_pipe=114, L_total=0.15, Dh=0.0415, height_ab=-0.15,
      initFromEnthalpy=true, h_start=656775, wallHeatTransfer=false,
      momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.907 "单管217.4/114(标定同步)") 
      annotation (Placement(transformation(origin={-97.9819,24},
extent={{-10,-10},{10,10}},
rotation=90)));
    SFR.Fluid.Pipes.pipe outerCore(
      redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
      N=5, n_pipe=114, L_total=1.1, L_heat=1.1, Dh=0.0415, height_ab=-1.1,
      initFromEnthalpy=true, h_start=519165, wallHeatTransfer=true,
      momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.907 "单管217.4/114(标定同步)",redeclare model HeatTransfer = Fluid.Pipes.BaseClasses.HeatTransfer.core) 
      annotation (Placement(transformation(origin={-97.9819,0},
extent={{-10,-10},{10,10}},
rotation=90)));
    SFR.Fluid.Pipes.pipe outerCore_in(
      redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
      N=2, n_pipe=114, L_total=0.25, Dh=0.0415, height_ab=-0.25,
      initFromEnthalpy=true, h_start=519165, wallHeatTransfer=false,
      momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.907 "单管217.4/114(标定同步)") 
      annotation (Placement(transformation(origin={-97.9819,-24},
extent={{-10,-10},{10,10}},
rotation=90)));
    SFR.Fluid.Pipes.pipe innerCore_out(
      redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
      N=2, n_pipe=37, L_total=0.15, Dh=0.0415, height_ab=-0.15,
      initFromEnthalpy=true, h_start=656775, wallHeatTransfer=false,
      momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.695 "单管62.7/37(标定同步)") 
      annotation (Placement(transformation(origin={-183.982,24},
extent={{-10,-10},{10,10}},
rotation=90)));
    SFR.Fluid.Pipes.pipe innerCore(
      redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
      N=5, n_pipe=37, L_total=1.1, L_heat=1.1, Dh=0.0415, height_ab=-1.1,
      initFromEnthalpy=true, h_start=519165, wallHeatTransfer=true,
      momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.695 "单管62.7/37(标定同步)",redeclare model HeatTransfer = Fluid.Pipes.BaseClasses.HeatTransfer.core) 
      annotation (Placement(transformation(origin={-183.982,0},
extent={{-10,-10},{10,10}},
rotation=90)));
    SFR.Fluid.Pipes.pipe innerCore_in(
      redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
      N=2, n_pipe=37, L_total=0.25, Dh=0.0415, height_ab=-0.25,
      initFromEnthalpy=true, h_start=519165, wallHeatTransfer=false,
      momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.695 "单管62.7/37(标定同步)") 
      annotation (Placement(transformation(origin={-183.982,-24},
extent={{-10,-10},{10,10}},
rotation=90)));
    SFR.Fluid.Pipes.pipe shieldReflector(
      redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
      N=2, n_pipe=54, L_total=1.5, Dh=0.0415, height_ab=-1.5,
      initFromEnthalpy=true, h_start=519165, wallHeatTransfer=false,
      momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=0.00926 "单管0.5/54(标定同步)") 
      annotation (Placement(transformation(origin={-26,0},
extent={{-10,-10},{10,10}},
rotation=90)));
    TYThermoFluidSys.Sensors.SensorT TSensor1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={-225.982,66},
extent={{-10,-10},{10,10}})));
    SFR.Thermal.HeatExchange.HE1 hE1_1(shell(momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)) 
      annotation (Placement(transformation(origin={152.029,8.009},
extent={{10,10},{-10,-10}},
rotation=90)));
    TRANSFORM.Fluid.Machines.Pump_SimpleMassFlow pump2(m_flow_nominal=308.4, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={214.5,58},
extent={{10,-10},{-10,10}})));
    Modelica.Blocks.Sources.RealExpression realExpression2(y=Engine_pipe.T[1]) 
      annotation (Placement(transformation(origin={292,-64.76},
extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Sources.RealExpression realExpression(y=- Engine.Q) "引擎吸热=40×Q_in×heff（同步 SecondLoop 标定）" 
      annotation (Placement(transformation(origin={240,-64.76},
extent={{-10,-10},{10,10}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow 
      annotation (Placement(transformation(origin={265.5,-38},
extent={{-10,-10},{10,10}},
rotation=90)));
    Fluid.Pipes.pipe Engine_pipe(redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium,N=5,L_total=5,h_start=589680 "引擎入口~480℃剖面初值",m_flow_start=100) 
      annotation (Placement(transformation(origin={265.5,-14},
extent={{-10,10},{10,-10}})));
    Stirling.DoubleActing.DA_Engine_v2 Engine(heff=1.41) 
      annotation (Placement(transformation(origin={317,-138.9},
extent={{-30.75,-28.9},{30.75,28.9}})));
    Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true, n(
          displayUnit="1") = {1,0,0}) annotation(Placement(transformation(origin={244.25,-162.16},
extent={{10,10},{-10,-10}})));
    inner Modelica.Mechanics.MultiBody.World world 
      annotation(Placement(transformation(origin={192.25,-121.56},
extent={{-10,-10},{10,10}})));
    Modelica.Mechanics.Rotational.Components.Inertia inertia(J=2, phi(start=0, fixed=true), w(start=0, fixed=true) "初值0（同 SecondLoop；稳态自然转向负向）") 
      annotation(Placement(transformation(origin={224,-212},
extent={{-10,-10},{10,10}})));
    Modelica.Mechanics.Rotational.Components.Fixed fixed_ground annotation(Placement(transformation(origin={134.029,-236},
extent={{-10,-10},{10,10}})));
    Modelica.Mechanics.Rotational.Components.Damper damper(d=10.6) "发电负载（同步 SecondLoop：转速→1500rpm）" annotation(Placement(transformation(origin={152.029,-212},
extent={{10,-10},{-10,10}})));
    SFR.Fluid.Vessels.SpecifiedResistance resistance_toExpTank(
      redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=0.1) 
      annotation(Placement(transformation(origin={258.5,84},
extent={{10,-10},{-10,10}})));
    SFR.Fluid.Vessels.ExpansionTank expansionTank1(
      redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
      A=1,
      V0=0.001,
      level_start=1,
      h_start=506655,
      p_start=100000.0) 
      annotation(Placement(transformation(origin={232.5,108},
extent={{-10,-10},{10,10}})));
    SFR.Fluid.Vessels.MixingVolume volumeTube(
      redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
      nPorts_a=1, nPorts_b=1, V=1, h_start=654480 "HE1出口530℃(设计剖面初值)") 
      annotation(Placement(transformation(origin={218.5,-14},
extent={{-10,-10},{10,10}})));
    equation
    connect(innerCore_out.portB, volume.port_a[1]) 
    annotation(Line(origin={-103.982,6},
points={{-79.9819,28.0222},{-79.9819,48},{6,48},{6,64}},
color={0,127,255}));
    connect(TSensor1.port_a, innerCore_out.portB) 
    annotation(Line(origin={-138.482,6},
points={{-87.5,50},{-87.5,31.0222},{-45.4819,31.0222},{-45.4819,28.0222}},
color={0,178,226}));
    connect(outerCore_out.portB, volume.port_a[2]) 
    annotation(Line(origin={-128.982,6},
points={{31.0181,28.0222},{31,64}},
color={0,127,255}));
    connect(shieldReflector.portB, volume.port_a[3]) 
    annotation(Line(origin={-103.982,6},
points={{78,4.0222},{78,48},{6,48},{6,64}},
color={0,127,255}));
    connect(innerCore_out.portA, innerCore.portB) 
    annotation(Line(origin={-163.982,6},
points={{-19.9819,8.02226},{-19.9819,4.0222}},
color={0,127,255}));
    connect(innerCore.portA, innerCore_in.portB) 
    annotation(Line(origin={-163.982,6},
points={{-19.9819,-15.97774},{-19.9819,-19.9778}},
color={0,127,255}));
    connect(outerCore_out.portA, outerCore.portB) 
    annotation(Line(origin={-174.982,6},
points={{77.0180755,8.02226},{77.0180755,4.0222}},
color={0,127,255}));
    connect(outerCore.portA, outerCore_in.portB) 
    annotation(Line(origin={-174.982,6},
points={{77.0180755,-15.97774},{77.0180755,-19.9778}},
color={0,127,255}));
    connect(innerCore_in.portA, resistance_inner.port_b) 
    annotation(Line(origin={-103.982,6},
points={{-79.9819,-39.97774},{-79.9819,-58}},
color={0,127,255}));
    connect(outerCore_in.portA, resistance_outer.port_b) 
    annotation(Line(origin={-103.982,6},
points={{6.0180755,-39.97774},{6,-58}},
color={0,127,255}));
    connect(shieldReflector.portA, resistance_shield.port_b) 
    annotation(Line(origin={-103.982,6},
points={{78,-15.97774},{78,-58}},
color={0,127,255}));
    connect(volume1.port_b[1], resistance_shield.port_a) 
    annotation(Line(origin={-103.982,6},
points={{6,-120},{6,-100},{78,-100},{78,-78}},
color={0,127,255}));
    connect(volume1.port_b[2], resistance_inner.port_a) 
    annotation(Line(origin={-103.982,6},
points={{6,-120},{6,-100},{-79.9819,-100},{-79.9819,-78}},
color={0,127,255}));
    connect(volume1.port_b[3], resistance_outer.port_a) 
    annotation(Line(origin={-103.982,6},
points={{6,-120},{6,-78}},
color={0,127,255}));
    connect(pointKinetics.Q_total, gain_inner.u) 
    annotation(Line(origin={-103.982,6},
points={{-165.885,8.19625},{-154,8.19625},{-154,-6},{-144,-6}},
color={0,0,127}));
    connect(pointKinetics.Q_total, gain_outer.u) 
    annotation(Line(origin={-103.982,6},
points={{-165.885,8.19625},{-92,8.19625},{-92,5.02226},{-64,5.02226},{-64,-6},{-60,-6}},
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
    connect(gain_inner.y, prescribedHeatFlow_inner[1].Q_flow) 
    annotation(Line(origin={-129.482,6},
points={{-95.5,-6},{-78.5,-6}},
color={0,0,127}));
    connect(gain_inner.y, prescribedHeatFlow_inner[2].Q_flow) 
    annotation(Line(origin={-129.482,6},
points={{-95.5,-6},{-78.5,-6}},
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
    connect(gain_inner.y, prescribedHeatFlow_inner[3].Q_flow) 
    annotation(Line(origin={-129.482,6},
points={{-95.5,-6},{-78.5,-6}},
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
    connect(gain_inner.y, prescribedHeatFlow_inner[4].Q_flow) 
    annotation(Line(origin={-129.482,6},
points={{-95.5,-6},{-78.5,-6}},
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
    connect(gain_outer.y, prescribedHeatFlow_outer[1].Q_flow) 
    annotation(Line(origin={-174.982,6},
points={{34,-6},{44,-6}},
color={0,0,127}));
    connect(gain_outer.y, prescribedHeatFlow_outer[2].Q_flow) 
    annotation(Line(origin={-174.982,6},
points={{34,-6},{44,-6}},
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
    connect(gain_outer.y, prescribedHeatFlow_outer[3].Q_flow) 
    annotation(Line(origin={-174.982,6},
points={{34,-6},{44,-6}},
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
    connect(gain_outer.y, prescribedHeatFlow_outer[4].Q_flow) 
    annotation(Line(origin={-174.982,6},
points={{34,-6},{44,-6}},
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
    connect(prescribedHeatFlow_inner.port, innerCore.wall) 
    annotation(Line(origin={-163.982,6},
points={{-32,-6},{-23.8,-6}},
color={127,0,0}));
    connect(prescribedHeatFlow_outer.port, outerCore.wall) 
    annotation(Line(origin={-174.982,6},
points={{56,-6},{73.2,-6}},
color={127,0,0}));
    connect(TSensor2.port_a, volume.port_b[1]) 
    annotation(Line(origin={-103.982,6},
points={{31,102},{31,92},{6,92},{6,76}},
color={0,178,226}));
    connect(pointKinetics.Q_total, gain_uM.u) 
    annotation(Line(origin={-118.982,0.51625},
points={{-150.885,13.68},{-147.13,13.68},{-147.13,-46.51625},{-371.018,-46.51625},{-371.018,-30.51625},{-367.018,-30.51625}},
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
    connect(gain_uM.y, PID_error.u2) 
    annotation(Line(origin={-423.982,-6},
points={{-39.018,-24},{12,-24},{12,-8},{-72.018,-8},{-72.018,8.4013},{-68.018,8.4013}},
color={0,0,127}));
    connect(const1.y, pointKinetics.Reactivity_Other) 
    annotation(Line(origin={-118.982,0.51625},
points={{-228,35.98375},{-200,35.98375},{-200,4.25},{-190.755,4.25}},
color={0,0,127}));
    connect(realExpression1.y, pointKinetics.Teff_coolant) 
    annotation(Line(origin={-118.982,0.51625},
points={{-228,-57.01625},{-200,-57.01625},{-200,-16.045},{-190.755,-16.045}},
color={0,0,127}));
    connect(const3.y, pointKinetics.Q_in) 
    annotation(Line(origin={-118.982,0.51625},
points={{-194,63.98375},{-171.315,63.98375},{-171.315,22.085}},
color={0,0,127}));
    connect(pointKinetics.Teff_fuel, const2.y) 
    annotation(Line(origin={-118.982,0.51625},
points={{-190.755,-5.8975},{-228,-5.89755}},
color={0,0,127}));
    connect(ramp.y, gain_uS.u) 
    annotation(Line(origin={-463.982,16},
points={{-97.018,-1.5987},{-66.018,-1.5987}},
color={0,0,127}));
    connect(gain_uS.y, PID_error.u1) 
    annotation(Line(origin={-433.982,16},
points={{-73.018,-1.5987},{-58.018,-1.5987}},
color={0,0,127}));
    connect(PID_error.y, PID.u) 
    annotation(Line(origin={-425.982,6},
points={{-43.018,2.4013},{-26.009,2.4013},{-26.009,8.4013},{-22.009,8.4013}},
color={0,0,127}));
    connect(PID.y, limPID.u) 
    annotation(Line(origin={-405.982,14},
points={{-19.009,0.4013},{2,0.4}},
color={0,0,127}));
    connect(limPID.y, pointKinetics.Reactivity_CR) 
    annotation(Line(origin={-118.982,0.51625},
points={{-262,13.88375},{-190.755,13.885}},
color={0,0,127}));
    connect(volume.port_b[1], pipe_static1.portA) 
    annotation(Line(origin={-103.982,6},
points={{6,76},{6,91.9819245},{113.02226,91.9819245}},
color={0,127,255}));
    connect(volume1.port_a[1], pipe_static2.portB) 
    annotation(Line(origin={-103.982,6},
points={{6,-132},{93.9778,-132.018}},
color={0,127,255}));
    connect(pipe_static2.portA, pump1.port_b) 
    annotation(Line(origin={-103.982,6},
points={{113.97774,-132.018},{140,-132.018}},
color={0,178,226}));
    connect(expansionTank.port, resistance_toBoundary.port_a) 
    annotation(Line(origin={-103.982,6},
points={{154,145.6},{154,118},{162,118}},
color={0,127,255}));
    connect(resistance_toBoundary.port_b, pipe_static1.portB) 
    annotation(Line(origin={-103.982,6},
points={{182,118},{185,118},{185,91.9819245},{133.0222,91.9819245}},
color={0,127,255}));
    connect(hE1_1.shell_out, pump1.port_a) 
    annotation(Line(origin={-103.982,6},
points={{249.809,-8.191},{249.809,-132.018},{160,-132.018}},
color={0,127,255}));
    connect(hE1_1.shell_in, pipe_static1.portB) 
    annotation(Line(origin={-103.982,6},
points={{249.809,12.209},{249.809,91.9819245},{133.0222,91.9819245}},
color={0,127,255}));
    connect(expansionTank1.port, resistance_toExpTank.port_b) 
    annotation(Line(origin={520.5,172},
points={{-288,-72.4},{-288,-88},{-272,-88}}));
    connect(world.frame_b, revolute.frame_b) 
    annotation(Line(origin={252.25,-186.96},
points={{-50,65.4},{-23.6,65.4},{-23.6,24.8},{-18,24.8}}));
    connect(inertia.flange_b, revolute.axis) 
    annotation(Line(origin={252.25,-186.96},
points={{-18.25,-25.04},{-8,-25.04},{-8,14.8}}));
    connect(damper.flange_b, fixed_ground.flange) 
    annotation(Line(origin={262.029,-222},
points={{-120,10},{-128,10},{-128,-14}},
color={0,0,0}));
    connect(damper.flange_a, inertia.flange_a) 
    annotation(Line(origin={208.25,-226.96},
points={{-46.221,14.96},{5.75,14.96}},
color={0,0,0}));
    connect(world.frame_b, Engine.cylinder_a) 
    annotation(Line(origin={248.75,-121.76},
points={{-46.5,0.2},{37.5,0.2}},
color={95,95,95},
thickness=0.5));
    connect(revolute.frame_a, Engine.cylinder_a1) 
    annotation(Line(origin={274.75,-161.76},
points={{-20.5,-0.4},{11.5,-0.4},{11.5,-0.26}},
color={95,95,95},
thickness=0.5));
    connect(realExpression2.y, Engine.T_Na) 
    annotation(Line(origin={315.75,-88.76},
points={{-12.75,24},{1.25,24},{1.25,-15.46}},
color={0,0,127}));
    connect(prescribedHeatFlow.port, Engine_pipe.wall[1]) 
    annotation(Line(origin={348,-21.86},
points={{-82.5,-6.14},{-82.5,4.06}},
color={191,0,0}));
    connect(volumeTube.port_b[1], Engine_pipe.portA) 
    annotation(Line(origin={257,-3},
points={{-32.5,-11},{-1.47774,-10.9819}},
color={0,127,255}));
    connect(resistance_toExpTank.port_a, Engine_pipe.portB) 
    annotation(Line(origin={320.5,33},
points={{-52,51},{-40,51},{-40,25},{40.5222,25},{40.5222,-46.9819},{-44.9778,-46.9819}},
color={0,127,255}));
    connect(Engine_pipe.portB, pump2.port_a) 
    annotation(Line(origin={301.5,23},
points={{-25.9778,-36.9819},{59.5222,-36.9819},{59.5222,35},{-77,35}},
color={0,127,255}));
    connect(volumeTube.port_a[1], hE1_1.tube_out) 
    annotation(Line(origin={185,8},
    points={{27.5,-22},{7,-22},{7,22},{-26.9728,22},{-26.9728,10.209}},
    color={0,127,255}));
    connect(pump2.port_b, hE1_1.tube_in) 
    annotation(Line(origin={181,21},
    points={{23.5,37},{-5,37},{-5,-37},{-22.9728,-37},{-22.9728,-23.191}},
    color={0,127,255}));
    connect(realExpression.y, prescribedHeatFlow.Q_flow) 
    annotation(Line(origin={229,-56},
points={{22,-8.76},{36.5,-8.76},{36.5,8}},
color={0,0,127}));
    end SFR_Stirling;