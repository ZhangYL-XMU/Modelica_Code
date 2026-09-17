model Base "精细化标定"
  annotation(__MWORKS(version="26.6.0",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=3600,ContinueTimeVector)),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.01,StartTime=0,StopTime=3600,StoreEventValue=0,Tolerance=0.0001));
  Modelica.Blocks.Math.Gain gain3(k=1 / 10) 
    annotation (Placement(transformation(origin={-186.756,-7.75542},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Gain gain2(k = 1 / 10) 
    annotation(Placement(transformation(origin={-279.253,-7.75542},
extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow_outer[10] 
    annotation(Placement(transformation(origin={-153.253,-7.75542},
extent={{-6,-6},{6,6}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow_inner[10] 
    annotation(Placement(transformation(origin={-249.253,-7.75542},
extent={{-6,-6},{6,6}})));
  Fluid.Vessels.SpecifiedResistance resistance_inner(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, R = 22.1 "内堆芯 62.7 kg/s(2026-08-31新HE1重配流: 63.9→64.5→收紧)") 
    annotation(Placement(transformation(origin={-224.24,-69.7554},
extent={{-10,-10},{10,10}},
rotation=90)));
  Fluid.Vessels.SpecifiedResistance resistance_outer(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, R = 4.20 "外堆芯 217.4 kg/s(2026-08-31新HE1重配流)") 
    annotation(Placement(transformation(origin={-138.258,-69.7554},
extent={{-10,-10},{10,10}},
rotation=90)));
  Fluid.Vessels.SpecifiedResistance resistance_shield(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, R = 6400 "屏蔽+反射等温流道 0.5 kg/s(2026-08-31新HE1重配流: 0.44@7280→0.5@6400, m=3200/R)") 
    annotation(Placement(transformation(origin={-66.2584,-69.7554},
extent={{-10,-10},{10,10}},
rotation=90)));
  Fluid.Pipes.pipe outerCore_out(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, N = 2, n_pipe = 114, L_total = 0.15, Dh = 0.0415, height_ab = -0.15, initFromEnthalpy = true, h_start = 656775, wallHeatTransfer = false, momentumDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 1.907 "单管217.4/114") 
    annotation(Placement(transformation(origin={-138.258,16.2446},
extent={{-10,-10},{10,10}},
rotation=90)));
  Fluid.Pipes.pipe outerCore(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, N=11, n_pipe=114, L_total=1.1, L_heat=1.1, Dh=0.0415, height_ab=-1.1, initFromEnthalpy=true, h_start=607863 "无PID自稳试验: 中芯初值=额定767.18K; h=cp*(T-298.15)", wallHeatTransfer=true, momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.907 "单管217.4/114", CF_HeatTransfer=1.0 "堆芯传热修正系数(2026-09-12 标定: 保持1.0; 功率标定由 Teffref_coolant 承担, 壁温 885.51K 不变)", redeclare model HeatTransfer = Fluid.Pipes.BaseClasses.HeatTransfer.core) 
    annotation(Placement(transformation(origin={-138.258,-7.75542},
extent={{-10,-10},{10,10}},
rotation=90)));
  Fluid.Pipes.pipe outerCore_in(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, N=2, n_pipe=114, L_total=0.25, Dh=0.0415, height_ab=-0.25, initFromEnthalpy=true, h_start=519165, wallHeatTransfer=false, momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.907 "单管217.4/114") 
    annotation(Placement(transformation(origin={-138.258,-31.7554},
extent={{-10,-10},{10,10}},
rotation=90)));
  Fluid.Pipes.pipe innerCore_out(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, N=2, n_pipe=37, L_total=0.15, Dh=0.0415, height_ab=-0.15, initFromEnthalpy=true, h_start=656775, wallHeatTransfer=false, momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.695 "单管62.7/37") 
    annotation(Placement(transformation(origin={-224.258,16.2446},
extent={{-10,-10},{10,10}},
rotation=90)));
  Fluid.Pipes.pipe innerCore(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, N=11, n_pipe=37, L_total=1.1, L_heat=1.1, Dh=0.0415, height_ab=-1.1, initFromEnthalpy=true, h_start=607863 "无PID自稳试验: 中芯初值=额定767.18K; h=cp*(T-298.15)", wallHeatTransfer=true, momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.695 "单管62.7/37", CF_HeatTransfer=1.0 "堆芯传热修正系数(2026-09-12 标定: 保持1.0; 功率标定由 Teffref_coolant 承担, 壁温 885.51K 不变)", redeclare model HeatTransfer = Fluid.Pipes.BaseClasses.HeatTransfer.core) 
    annotation(Placement(transformation(origin={-224.258,-7.75542},
extent={{-10,-10},{10,10}},
rotation=90)));
  Fluid.Pipes.pipe innerCore_in(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, N=2, n_pipe=37, L_total=0.25, Dh=0.0415, height_ab=-0.25, initFromEnthalpy=true, h_start=519165, wallHeatTransfer=false, momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.695 "单管62.7/37") 
    annotation(Placement(transformation(origin={-224.258,-31.7554},
extent={{-10,-10},{10,10}},
rotation=90)));
  Fluid.Pipes.pipe shieldReflector(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, N=2, n_pipe=54, L_total=1.5, Dh=0.0415, height_ab=-1.5, initFromEnthalpy=true, h_start=519165, wallHeatTransfer=false, momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=0.00926 "单管0.5/54") 
    annotation(Placement(transformation(origin={-66.2764,-7.75542},
extent={{-10,-10},{10,10}},
rotation=90)));
  Thermal.HeatExchange.HE1 hE1_1(shell(momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState), N=10) 
    annotation(Placement(transformation(origin={80.7472175,-0.764417},
extent={{10,10},{-10,-10}},
rotation=90)));
  Fluid.Vessels.SpecifiedResistance resistance_toBoundary(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, R=0.1) 
    annotation(Placement(transformation(origin={27.7417,116.245},
extent={{-10,-10},{10,10}})));
  Fluid.Vessels.ExpansionTank expansionTank(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, A=1, V0=0.001, level_start=1, h_start=656775 "热段550℃", p_start=100000.0) 
    annotation(Placement(transformation(origin={9.74165,152.245},
extent={{-10,-10},{10,10}})));
  TRANSFORM.Fluid.Machines.Pump_SimpleMassFlow pump1(m_flow_nominal=280.6, redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation(Placement(transformation(origin={5.74165,-133.773},
extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=(sum(innerCore.T_wall) / 10) * 0.2237 + (sum(outerCore.T_wall) / 10) * 0.7763 "fuel eff. T: 全10节点算术平均(=体积平均), 份额加权 (2026-09-08 优化; 原 T_wall[6] 偏上0.5节≈+5.5K)") 
    annotation(Placement(transformation(origin={-373.253,36.8626},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=(sum(innerCore.T) / 11) * 0.2237 + (sum(outerCore.T) / 11) * 0.7763 "coolant eff. T: 全11节点算术平均(=体积平均), 份额加权 (2026-09-08 优化)") 
    annotation(Placement(transformation(origin={-343.253,26.7155},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant const3(k=0) 
    annotation(Placement(transformation(origin={-343.253,123.236},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant const1(k=0) 
    annotation(Placement(transformation(origin={-381.253,63.5446},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant constCR(k=0) "无PID：控制棒反应性恒为0（自稳验证）" 
    annotation(Placement(transformation(origin={-381.253,95.2356},
extent={{-10,-10},{10,10}})));
  Nuclear.PointKinetics pointKinetics(Teffref_fuel=885.5 "燃料参考=额定全10节点平均壁温K(2026-09-08 重标: 实测额定平均值885.50K; 原863.2为09-06旧模型状态残留)", Teffref_coolant(displayUnit="K")=768.28511 "冷却剂参考(2026-09-12 标定: 768.29 -> 768.28511, 由 rho=0 一阶平衡解求得, 使稳态功率精确落于 40.000000 MW; 原768.15为尹凯论文口径)") 
    annotation(Placement(transformation(origin={-303.253,51.2356},
extent={{-18,-20.5},{18,20.5}})));
  Fluid.Vessels.MixingVolume volume1(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, nPorts_a=1, nPorts_b=3, V=10, h_start=519165 "下腔室440℃") 
    annotation(Placement(transformation(origin={-138.258,-127.755},
extent={{-10,-10},{10,10}},
rotation=90)));
  Fluid.Vessels.MixingVolume volume(nPorts_a=3, nPorts_b=1, V=10, h_start=656775 "上腔室550℃", redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation(Placement(transformation(origin={-138.258,68.2446},
extent={{-10,-10},{10,10}},
rotation=90)));
  Fluid.Pipes.pipe pipe_static2(N=5, redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, L_total=10, Dh=0.30, initFromEnthalpy=true, h_start=519165 "冷段440℃", wallHeatTransfer=false, momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState) 
    annotation(Placement(transformation(origin={-40.2588,-133.755},
extent={{10,-10},{-10,10}})));
  Fluid.Pipes.pipe pipe_static1(N=5, redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, L_total=10, Dh=0.30, initFromEnthalpy=true, h_start=656775 "热段550℃", wallHeatTransfer=false, momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState) 
    annotation(Placement(transformation(origin={-21.2588,90.2446},
extent={{-10,-10},{10,10}})));
  Fluid.Vessels.MixingVolume volumeTube(redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, nPorts_a=1, nPorts_b=1, V=1, h_start=654480 "HE1出口530℃(设计剖面初值)") 
    annotation(Placement(transformation(origin={192,-24},
extent={{-10,-10},{10,10}})));
  Fluid.Vessels.ExpansionTank expansionTank1(redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, A=1, V0=0.001, level_start=1, h_start=506655, p_start=100000.0) 
    annotation(Placement(transformation(origin={292.759,102},
extent={{-10,-10},{10,10}})));
  Fluid.Vessels.SpecifiedResistance resistance_toExpTank(redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, R=0.1) 
    annotation(Placement(transformation(origin={292.759,68},
extent={{10,-10},{-10,10}},
rotation=-90)));
  TRANSFORM.Fluid.Machines.Pump_SimpleMassFlow pump2(m_flow_nominal=308.4, redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, use_input=false) 
    annotation (Placement(transformation(origin={188,48},
extent={{10,-10},{-10,10}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d=10.443) annotation(Placement(transformation(origin={123.5,-217.109},
extent={{10,-10},{-10,10}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed_ground annotation(Placement(transformation(origin={105.5,-241.109},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=2, phi(start=0, fixed=true), w(start=100, fixed=true)) 
    annotation(Placement(transformation(origin={163.5,-217.109},
extent={{-10,-10},{10,10}})));
  inner Modelica.Mechanics.MultiBody.World world 
    annotation(Placement(transformation(origin={144.5,-111.709},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true, n(displayUnit="1")={1, 0, 0}) annotation(Placement(transformation(origin={183.5,-152.309},
extent={{10,10},{-10,-10}})));
  SFR_Striling.Stirling.DoubleActing.DA_Engine_v3 Engine(U_h=2.0e4, U_c=4.5e5, U_reg=2.0e6, heff_Na=1.5140, heff_water=1.0) 
    annotation (Placement(transformation(origin={265.25,-129.049},
extent={{-30.75,-28.9},{30.75,28.9}})));
  Fluid.Pipes.pipe Engine_pipe(redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, N=5, L_total=0.5, m_flow_start=100, n_pipe=3200, Dh=0.004, CF_HeatTransfer=6, initFromEnthalpy=false, T_start=803.15, T_wall_start=803.15) 
    annotation (Placement(transformation(origin={258,-24.018},
extent={{-10,10},{10,-10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow[4] 
    annotation (Placement(transformation(origin={258,-50.927},
extent={{-10,-10},{10,10}},
rotation=90)));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=(Engine_pipe.T[1] + Engine_pipe.T[2] + Engine_pipe.T[3] + Engine_pipe.T[4]) / 4) 
    annotation (Placement(transformation(origin={206,-78.629},
extent={{-10,-10},{10,10}})));
  Fluid.Pipes.pipe water(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, N=5, L_total=0.12, m_flow_start=100, n_pipe=70000, Dh=0.001, CF_HeatTransfer=1, initFromEnthalpy=false, T_start=311.15, T_wall_start=311.15) 
    annotation (Placement(transformation(origin={374,-184.909},
extent={{-10,10},{10,-10}},
rotation=-90)));
  Modelica.Fluid.Sources.Boundary_ph boundary2(nPorts=1, redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, p=9.999999999999999e5, h=506655) 
    annotation(Placement(transformation(origin={374,-229.049},
extent={{10,-10},{-10,10}},
rotation=-90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1[4] 
    annotation (Placement(transformation(origin={344,-184.909},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=(water.T[1] + water.T[2] + water.T[3] + water.T[4]) / 4) 
    annotation (Placement(transformation(origin={220,-184.909},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary4(nPorts=1, redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, m_flow=200, T=273.15 + 20) 
    annotation (Placement(transformation(origin={374.018,-140.769},
extent={{-10,-10},{10,10}},
rotation=-90)));
  Modelica.Blocks.Math.Gain gain(k=1 / 4) 
    annotation (Placement(transformation(origin={308,-184.909},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Gain gain1(k=-1 / 4) 
    annotation (Placement(transformation(origin={308,-78.629},
extent={{-10,-10},{10,10}},
rotation=90)));
  equation
  connect(innerCore_out.portB, volume.port_a[1]) 
  annotation(Line(origin={-144.258,-1.75542},
  points={{-79.982,28.0222},{-79.982,48},{6,48},{6,64}},
  color={0,127,255}));
  connect(outerCore_out.portB, volume.port_a[2]) 
  annotation(Line(origin={-169.258,-1.75542},
  points={{31.0181155,28.0222},{31,64}},
  color={0,127,255}));
  connect(shieldReflector.portB, volume.port_a[3]) 
  annotation(Line(origin={-144.258,-1.75542},
  points={{78.0000355,4.0222},{78.0000355,48},{6,48},{6,64}},
  color={0,127,255}));
  connect(innerCore_out.portA, innerCore.portB) 
  annotation(Line(origin={-204.258,-1.75542},
  points={{-19.9819,8.02226},{-19.9819,4.0222}},
  color={0,127,255}));
  connect(innerCore.portA, innerCore_in.portB) 
  annotation(Line(origin={-204.258,-1.75542},
  points={{-19.9819,-15.97774},{-19.9819,-19.9778}},
  color={0,127,255}));
  connect(outerCore_out.portA, outerCore.portB) 
  annotation(Line(origin={-215.258,-1.75542},
  points={{77.0181,8.02226},{77.0181,4.0222}},
  color={0,127,255}));
  connect(outerCore.portA, outerCore_in.portB) 
  annotation(Line(origin={-215.258,-1.75542},
  points={{77.0181,-15.97774},{77.0181,-19.9778}},
  color={0,127,255}));
  connect(innerCore_in.portA, resistance_inner.port_b) 
  annotation(Line(origin={-144.258,-1.75542},
  points={{-79.982,-39.97774},{-79.98194,-58}},
  color={0,127,255}));
  connect(outerCore_in.portA, resistance_outer.port_b) 
  annotation(Line(origin={-144.258,-1.75542},
  points={{6.0180755,-39.97774},{6,-58}},
  color={0,127,255}));
  connect(shieldReflector.portA, resistance_shield.port_b) 
  annotation(Line(origin={-144.258,-1.75542},
  points={{78.0000355,-15.97774},{77.99996,-58}},
  color={0,127,255}));
  connect(volume1.port_b[1], resistance_shield.port_a) 
  annotation(Line(origin={-144.258,-1.75542},
  points={{6,-120},{6,-100},{77.99996,-100},{77.99996,-78}},
  color={0,127,255}));
  connect(volume1.port_b[2], resistance_inner.port_a) 
  annotation(Line(origin={-144.258,-1.75542},
  points={{6,-120},{6,-100},{-79.98194,-100},{-79.98194,-78}},
  color={0,127,255}));
  connect(volume1.port_b[3], resistance_outer.port_a) 
  annotation(Line(origin={-144.258,-1.75542},
  points={{6,-120},{6,-78}},
  color={0,127,255}));
  connect(const1.y, pointKinetics.Reactivity_Other) 
  annotation(Line(origin={-134.252,42.7606},
  points={{-236.0004,20.784},{-209.0004,20.784},{-209.0004,13.24125},{-188.7554,13.24125}},
  color={0,0,127}));
  connect(realExpression1.y, pointKinetics.Teff_coolant) 
  annotation(Line(origin={-134.252,42.7606},
  points={{-198.0004,-16.0451},{-192.5104,-16.0451},{-192.5104,-7.05375},{-188.7554,-7.05375}},
  color={0,0,127}));
  connect(const3.y, pointKinetics.Q_in) 
  annotation(Line(origin={-134.252,42.7606},
  points={{-198.0004,80.475},{-169.3154,80.475},{-169.3154,31.0762}},
  color={0,0,127}));
  connect(realExpression4.y, pointKinetics.Teff_fuel) 
  annotation(Line(origin={-134.252,42.7606},
  points={{-228.0004,-5.898},{-192.5104,-5.898},{-192.5104,3.09375},{-188.7554,3.09375}},
  color={0,0,127}));
  connect(volume.port_b[1], pipe_static1.portA) 
  annotation(Line(origin={-144.258,-1.75542},
  points={{6,76},{6,91.9819245},{113.02182,91.9819245}},
  color={0,127,255}));
  connect(volume1.port_a[1], pipe_static2.portB) 
  annotation(Line(origin={-144.258,-1.75542},
  points={{6,-132},{93.97736,-132.018}},
  color={0,127,255}));
  connect(pipe_static2.portA, pump1.port_b) 
  annotation(Line(origin={-144.258,-1.75542},
  points={{113.9773,-132.018},{139.999995,-132.018}},
  color={0,178,226}));
  connect(expansionTank.port, resistance_toBoundary.port_a) 
  annotation(Line(origin={-144.258,-1.75542},
  points={{153.999995,145.6},{153.999995,118},{161.999995,118}},
  color={0,127,255}));
  connect(resistance_toBoundary.port_b, pipe_static1.portB) 
  annotation(Line(origin={-144.258,-1.75542},
  points={{181.999995,118},{185,118},{185,91.9819245},{133.02176,91.9819245}},
  color={0,127,255}));
  connect(hE1_1.shell_out, pump1.port_a) 
  annotation(Line(origin={-144.258,-1.75542},
  points={{218.80375,-9.209},{218.80375,-132.018},{159.999995,-132.018}},
  color={0,127,255}));
  connect(hE1_1.shell_in, pipe_static1.portB) 
  annotation(Line(origin={-144.258,-1.75542},
  points={{218.80375,11.191},{218.80375,91.9819245},{133.02176,91.9819245}},
  color={0,127,255}));
  connect(outerCore.wall, prescribedHeatFlow_outer.port) 
  annotation(Line(origin={-160.253,-7.76442},
  points={{18.19444,0.009},{13,0.009}},
  color={127,0,0}));
  connect(prescribedHeatFlow_inner.port, innerCore.wall) 
  annotation(Line(origin={-249.253,-7.76442},
  points={{6,0.009},{21.1944,0.009}},
  color={191,0,0}));
  connect(prescribedHeatFlow_inner[1].Q_flow, gain2.y) 
  annotation(Line(origin={-419.253,27.2356},
  points={{164,-34.991},{151,-34.991}},
  color={0,0,127}));
  connect(gain2.y, prescribedHeatFlow_inner[2].Q_flow) 
  annotation(Line(origin={-419.253,27.2356},
  points={{151,-34.991},{164,-34.991}},
  color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain2.y, prescribedHeatFlow_inner[3].Q_flow) 
  annotation(Line(origin={-419.253,27.2356},
  points={{151,-34.991},{164,-34.991}},
  color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain2.y, prescribedHeatFlow_inner[4].Q_flow) 
  annotation(Line(origin={-419.253,27.2356},
  points={{151,-34.991},{164,-34.991}},
  color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain2.y, prescribedHeatFlow_inner[5].Q_flow) 
  annotation(Line(origin={-419.253,27.2356},
  points={{151,-34.991},{164,-34.991}},
  color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain2.y, prescribedHeatFlow_inner[6].Q_flow) 
  annotation(Line(origin={-419.253,27.2356},
  points={{151,-34.991},{164,-34.991}},
  color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain2.y, prescribedHeatFlow_inner[7].Q_flow) 
  annotation(Line(origin={-419.253,27.2356},
  points={{151,-34.991},{164,-34.991}},
  color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain2.y, prescribedHeatFlow_inner[8].Q_flow) 
  annotation(Line(origin={-419.253,27.2356},
  points={{151,-34.991},{164,-34.991}},
  color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain2.y, prescribedHeatFlow_inner[9].Q_flow) 
  annotation(Line(origin={-419.253,27.2356},
  points={{151,-34.991},{164,-34.991}},
  color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain2.y, prescribedHeatFlow_inner[10].Q_flow) 
  annotation(Line(origin={-419.253,27.2356},
  points={{151,-34.991},{164,-34.991}},
  color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(constCR.y, pointKinetics.Reactivity_CR) 
  annotation(Line(origin={-134.252,42.7606},
  points={{-236.0004,52.475},{-201.0004,52.475},{-201.0004,22.8763},{-188.7554,22.8763}},
  color={0,0,127}));
  connect(gain3.y, prescribedHeatFlow_outer[1].Q_flow) 
  annotation(Line(origin={-335.253,42.2356},
  points={{159.4972,-49.991},{176,-49.991}},
  color={0,0,127}));
  connect(gain3.y, prescribedHeatFlow_outer[2].Q_flow) 
  annotation(Line(origin={-324.253,27.2356},
  points={{148.4972,-34.991},{165,-34.991}},
  color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain3.y, prescribedHeatFlow_outer[3].Q_flow) 
  annotation(Line(origin={-324.253,27.2356},
  points={{148.4972,-34.991},{165,-34.991}},
  color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain3.y, prescribedHeatFlow_outer[4].Q_flow) 
  annotation(Line(origin={-324.253,27.2356},
  points={{148.4972,-34.991},{165,-34.991}},
  color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain3.y, prescribedHeatFlow_outer[5].Q_flow) 
  annotation(Line(origin={-324.253,27.2356},
  points={{148.4972,-34.991},{165,-34.991}},
  color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain3.y, prescribedHeatFlow_outer[6].Q_flow) 
  annotation(Line(origin={-324.253,27.2356},
  points={{148.4972,-34.991},{165,-34.991}},
  color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain3.y, prescribedHeatFlow_outer[7].Q_flow) 
  annotation(Line(origin={-324.253,27.2356},
  points={{148.4972,-34.991},{165,-34.991}},
  color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain3.y, prescribedHeatFlow_outer[8].Q_flow) 
  annotation(Line(origin={-324.253,27.2356},
  points={{148.4972,-34.991},{165,-34.991}},
  color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain3.y, prescribedHeatFlow_outer[9].Q_flow) 
  annotation(Line(origin={-324.253,27.2356},
  points={{148.4972,-34.991},{165,-34.991}},
  color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain3.y, prescribedHeatFlow_outer[10].Q_flow) 
  annotation(Line(origin={-324.253,27.2356},
  points={{148.4972,-34.991},{165,-34.991}},
  color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(pointKinetics.Q_innerCore, gain2.u) 
  annotation(Line(origin={-283.253,21.2356},
  points={{0.115,24.51625},{11.87,24.51625},{11.87,1.009},{-12,1.009},{-12,-28.991},{-8,-28.991}},
  color={0,0,127}));
  connect(pointKinetics.Q_outerCore, gain3.u) 
  annotation(Line(origin={-241.253,24.2356},
  points={{-41.885,31.56125},{36,31.56125},{36,-31.991},{42.4972,-31.991}},
  color={0,0,127}));
  connect(world.frame_b, revolute.frame_b) 
  annotation(Line(origin={191.5,-177.109},
points={{-37,65.4},{-23.6,65.4},{-23.6,24.8},{-18,24.8}}));
  connect(inertia.flange_b, revolute.axis) 
  annotation(Line(origin={191.5,-177.109},
points={{-18,-40},{-8,-40},{-8,14.8}}));
  connect(damper.flange_b, fixed_ground.flange) 
  annotation(Line(origin={233.5,-227.109},
points={{-120,10},{-128,10},{-128,-14}},
color={0,0,0}));
  connect(damper.flange_a, inertia.flange_a) 
  annotation(Line(origin={147.5,-217.109},
points={{-14,0},{6,0}},
color={0,0,0}));
  connect(world.frame_b, Engine.cylinder_a) 
  annotation(Line(origin={188,-111.909},
points={{-33.5,0.2},{46.5,0.2}},
color={95,95,95},
thickness=0.5));
  connect(revolute.frame_a, Engine.cylinder_a1) 
  annotation(Line(origin={214,-151.909},
points={{-20.5,-0.4},{20.5,-0.4},{20.5,-0.26}},
color={95,95,95},
thickness=0.5));
  connect(realExpression2.y, Engine.T_Na) 
  annotation(Line(origin={255,-78.909},
points={{-38,0.28},{-8.2,0.28},{-8.2,-15.46}},
color={0,0,127}));
  connect(water.portB, boundary2.ports[1]) 
  annotation(Line(origin={446.268,-322.927},
points={{-72.2499,127.996},{-72.268,103.878}},
color={0,127,255}));
  connect(prescribedHeatFlow1.port, water.wall) 
  annotation(Line(origin={357,-185.049},
points={{-3,0.14},{13.2,0.14}},
color={191,0,0}));
  connect(prescribedHeatFlow.port, Engine_pipe.wall) 
  annotation(Line(origin={258,-32.927},
points={{0,-8},{0,5.109}},
color={191,0,0}));
  connect(realExpression3.y, Engine.T_water) 
  annotation(Line(origin={294,-86.909},
points={{-63,-98},{-47.2,-98},{-47.2,-76.82}},
color={0,0,127}));
  connect(water.portA, boundary4.ports[1]) 
  annotation(Line(origin={374,-163.049},
points={{0.0180755,-11.8823},{0.018,12.28}},
color={0,127,255}));
  connect(Engine.Q_out, gain.u) 
  annotation(Line(origin={299,-166.909},
points={{-14.9925,3.18},{-14.9925,-18},{-3,-18}},
color={0,0,127}));
  connect(gain.y, prescribedHeatFlow1[1].Q_flow) 
  annotation(Line(origin={328,-160.909},
points={{-9,-24},{6,-24}},
color={0,0,127}));
  connect(gain.y, prescribedHeatFlow1[2].Q_flow) 
  annotation(Line(origin={327,-184.909},
points={{-8,0},{7,0}},
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain.y, prescribedHeatFlow1[3].Q_flow) 
  annotation(Line(origin={327,-184.909},
points={{-8,0},{7,0}},
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain.y, prescribedHeatFlow1[4].Q_flow) 
  annotation(Line(origin={327,-184.909},
points={{-8,0},{7,0}},
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(Engine.Q_in, gain1.u) 
  annotation(Line(origin={284,-96.909},
points={{0.0075,-0.35},{24,-0.35},{24,6.28}},
color={0,0,127}));
  connect(gain1.y, prescribedHeatFlow[1].Q_flow) 
  annotation(Line(origin={283,-63.909},
points={{25,-3.72},{25,-0.72},{-25,-0.72},{-25,2.982}},
color={0,0,127}));
  connect(gain1.y, prescribedHeatFlow[2].Q_flow) 
  annotation(Line(origin={283,-63.909},
points={{25,-3.72},{25,-1},{-25,-1},{-25,2.982}},
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain1.y, prescribedHeatFlow[3].Q_flow) 
  annotation(Line(origin={283,-63.909},
points={{25,-3.72},{25,-0.72},{-25,-0.72},{-25,2.982}},
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain1.y, prescribedHeatFlow[4].Q_flow) 
  annotation(Line(origin={283,-63.909},
points={{25,-3.72},{25,-0.72},{-25,-0.72},{-25,2.982}},
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(expansionTank1.port, resistance_toExpTank.port_b) 
  annotation(Line(origin={494,162},
points={{-201.241,-68.4},{-201.241,-84}}));
  connect(volumeTube.port_a[1], hE1_1.tube_out) 
  annotation(Line(origin={158.5,-2},
points={{27.5,-22},{7,-22},{7,22},{-71.7546,22},{-71.7546,11.4356}},
color={0,127,255}));
  connect(pump2.port_b, hE1_1.tube_in) 
  annotation(Line(origin={154.5,11},
points={{23.5,37},{-5,37},{-5,-37},{-67.7546,-37},{-67.7546,-21.964417}},
color={0,127,255}));
  connect(volumeTube.port_b[1], Engine_pipe.portA) 
  annotation(Line(origin={222.759,-22},
points={{-24.759,-2},{25.2633,-1.99992}},
color={0,127,255}));
  connect(pump2.port_a, Engine_pipe.portB) 
  annotation(Line(origin={252.759,12},
points={{-54.759,36},{54,36},{54,-35.9999},{15.2632,-35.9999}},
color={0,127,255}));
  connect(resistance_toExpTank.port_a, pump2.port_a) 
  annotation(Line(origin={245.759,61},
points={{47,-3},{47,-13},{-47.759,-13}},
color={0,127,255}));
  end Base;