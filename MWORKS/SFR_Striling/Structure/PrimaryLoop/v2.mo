model v2
  annotation(__MWORKS(version = "26.6.0", ContinueSimConfig(SaveContinueFile = "false", SaveBeforeStop = "false", NumberBeforeStop = 1, FixedContinueInterval = "false", ContinueIntervalLength = 100, ContinueTimeVector)), Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})), experiment(Algorithm = Dassl, InlineIntegrator = false, InlineStepSize = false, Interval = 0.01, StartTime = 0, StopTime = 3600, StoreEventValue = 0, Tolerance = 0.0001));
  Fluid.Pipes.pipe pipe_static1(N = 5, redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, L_total = 10, Dh = 0.30, initFromEnthalpy = true, h_start = 656775 "热段550℃", wallHeatTransfer = false, momentumDynamics = Modelica.Fluid.Types.Dynamics.SteadyState) 
    annotation(Placement(transformation(origin = {121.994, 111.009},
    extent = {{-10, -10}, {10, 10}})));
  Fluid.Pipes.pipe pipe_static2(N = 5, redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, L_total = 10, Dh = 0.30, initFromEnthalpy = true, h_start = 519165 "冷段440℃", wallHeatTransfer = false, momentumDynamics = Modelica.Fluid.Types.Dynamics.SteadyState) 
    annotation(Placement(transformation(origin = {102.994, -112.991},
    extent = {{10, -10}, {-10, 10}})));
  Fluid.Vessels.MixingVolume volume(nPorts_a = 3, nPorts_b = 1, V = 10, h_start = 656775 "上腔室550℃", redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation(Placement(transformation(origin = {4.99444, 89.009},
    extent = {{-10, -10}, {10, 10}},
    rotation = 90)));
  Fluid.Vessels.MixingVolume volume1(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, nPorts_a = 1, nPorts_b = 3, V = 10, h_start = 519165 "下腔室440℃") 
    annotation(Placement(transformation(origin = {4.99444, -106.991},
    extent = {{-10, -10}, {10, 10}},
    rotation = 90)));
  Nuclear.PointKinetics pointKinetics(Teffref_fuel = 885.5 "燃料参考=额定全10节点平均壁温K(2026-09-08 重标: 实测额定平均值885.50K; 原863.2为09-06旧模型状态残留)", Teffref_coolant(displayUnit = "K") = 768.28511 "冷却剂参考(2026-09-12 标定: 768.29 -> 768.28511, 由 rho=0 一阶平衡解求得, 使稳态功率精确落于 40.000000 MW; 原768.15为尹凯论文口径)") 
    annotation(Placement(transformation(origin = {-160, 72},
    extent = {{-18, -20.5}, {18, 20.5}})));
  Modelica.Blocks.Sources.Constant constCR(k = 0) "无PID：控制棒反应性恒为0（自稳验证）" 
    annotation(Placement(transformation(origin = {-238, 116},
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const1(k = 0) 
    annotation(Placement(transformation(origin = {-238, 84.309},
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const3(k = 0) 
    annotation(Placement(transformation(origin = {-200, 144},
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = (sum(innerCore.T) / 11) * 0.2237 + (sum(outerCore.T) / 11) * 0.7763 "coolant eff. T: 全11节点算术平均(=体积平均), 份额加权 (2026-09-08 优化)") 
    annotation(Placement(transformation(origin = {-200, 47.4799},
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y = (sum(innerCore.T_wall) / 10) * 0.2237 + (sum(outerCore.T_wall) / 10) * 0.7763 "fuel eff. T: 全10节点算术平均(=体积平均), 份额加权 (2026-09-08 优化; 原 T_wall[6] 偏上0.5节≈+5.5K)") 
    annotation(Placement(transformation(origin = {-230, 57.627},
    extent = {{-10, -10}, {10, 10}})));
  TRANSFORM.Fluid.Machines.Pump_SimpleMassFlow pump1(m_flow_nominal = 280.6, redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation(Placement(transformation(origin = {148.994435, -113.009},
    extent = {{10, -10}, {-10, 10}})));
  Fluid.Vessels.ExpansionTank expansionTank(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, A = 1, V0 = 0.001, level_start = 1, h_start = 656775 "热段550℃", p_start = 100000.0) 
    annotation(Placement(transformation(origin = {152.994435, 173.009},
    extent = {{-10, -10}, {10, 10}})));
  Fluid.Vessels.SpecifiedResistance resistance_toBoundary(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, R = 0.1) 
    annotation(Placement(transformation(origin = {170.994435, 137.009},
    extent = {{-10, -10}, {10, 10}})));
  Thermal.HeatExchange.HE1 hE1_1(shell(momentumDynamics = Modelica.Fluid.Types.Dynamics.SteadyState), N = 10) 
    annotation(Placement(transformation(origin={224,20},
extent={{10,10},{-10,-10}},
rotation=90)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary3(nPorts = 1, redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, m_flow = 308.4, T(displayUnit = "degC") = 703.15) 
    annotation(Placement(transformation(origin = {341.005565, -40.982},
    extent = {{10, -10}, {-10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary2(nPorts = 1, redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, T = 803.15, p = 100000) 
    annotation(Placement(transformation(origin = {324.994435, 63.009},
    extent = {{10, -10}, {-10, 10}})));
  Fluid.Pipes.pipe shieldReflector(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, N = 2, n_pipe = 54, L_total = 1.5, Dh = 0.0415, height_ab = -1.5, initFromEnthalpy = true, h_start = 519165, wallHeatTransfer = false, momentumDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 0.00926 "单管0.5/54") 
    annotation(Placement(transformation(origin = {76.9764, 13.009},
    extent = {{-10, -10}, {10, 10}},
    rotation = 90)));
  Fluid.Pipes.pipe innerCore_in(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, N = 2, n_pipe = 37, L_total = 0.25, Dh = 0.0415, height_ab = -0.25, initFromEnthalpy = true, h_start = 519165, wallHeatTransfer = false, momentumDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 1.695 "单管62.7/37") 
    annotation(Placement(transformation(origin = {-81.0056, -10.991},
    extent = {{-10, -10}, {10, 10}},
    rotation = 90)));
  Fluid.Pipes.pipe innerCore(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, N = 11, n_pipe = 37, L_total = 1.1, L_heat = 1.1, Dh = 0.0415, height_ab = -1.1, initFromEnthalpy = true, h_start = 607863 "无PID自稳试验: 中芯初值=额定767.18K; h=cp*(T-298.15)", wallHeatTransfer = true, momentumDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 1.695 "单管62.7/37", CF_HeatTransfer = 1.0 "堆芯传热修正系数(2026-09-12 标定: 保持1.0; 功率标定由 Teffref_coolant 承担, 壁温 885.51K 不变)", redeclare model HeatTransfer = Fluid.Pipes.BaseClasses.HeatTransfer.core) 
    annotation(Placement(transformation(origin = {-81.0056, 13.009},
    extent = {{-10, -10}, {10, 10}},
    rotation = 90)));
  Fluid.Pipes.pipe innerCore_out(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, N = 2, n_pipe = 37, L_total = 0.15, Dh = 0.0415, height_ab = -0.15, initFromEnthalpy = true, h_start = 656775, wallHeatTransfer = false, momentumDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 1.695 "单管62.7/37") 
    annotation(Placement(transformation(origin = {-81.0056, 37.009},
    extent = {{-10, -10}, {10, 10}},
    rotation = 90)));
  Fluid.Pipes.pipe outerCore_in(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, N = 2, n_pipe = 114, L_total = 0.25, Dh = 0.0415, height_ab = -0.25, initFromEnthalpy = true, h_start = 519165, wallHeatTransfer = false, momentumDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 1.907 "单管217.4/114") 
    annotation(Placement(transformation(origin = {4.99444, -10.991},
    extent = {{-10, -10}, {10, 10}},
    rotation = 90)));
  Fluid.Pipes.pipe outerCore(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, N = 11, n_pipe = 114, L_total = 1.1, L_heat = 1.1, Dh = 0.0415, height_ab = -1.1, initFromEnthalpy = true, h_start = 607863 "无PID自稳试验: 中芯初值=额定767.18K; h=cp*(T-298.15)", wallHeatTransfer = true, momentumDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 1.907 "单管217.4/114", CF_HeatTransfer = 1.0 "堆芯传热修正系数(2026-09-12 标定: 保持1.0; 功率标定由 Teffref_coolant 承担, 壁温 885.51K 不变)", redeclare model HeatTransfer = Fluid.Pipes.BaseClasses.HeatTransfer.core) 
    annotation(Placement(transformation(origin = {4.99444, 13.009},
    extent = {{-10, -10}, {10, 10}},
    rotation = 90)));
  Fluid.Pipes.pipe outerCore_out(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, N = 2, n_pipe = 114, L_total = 0.15, Dh = 0.0415, height_ab = -0.15, initFromEnthalpy = true, h_start = 656775, wallHeatTransfer = false, momentumDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 1.907 "单管217.4/114") 
    annotation(Placement(transformation(origin = {4.99444, 37.009},
    extent = {{-10, -10}, {10, 10}},
    rotation = 90)));
  Fluid.Vessels.SpecifiedResistance resistance_shield(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, R = 6400 "屏蔽+反射等温流道 0.5 kg/s(2026-08-31新HE1重配流: 0.44@7280→0.5@6400, m=3200/R)") 
    annotation(Placement(transformation(origin = {76.9944, -48.991},
    extent = {{-10, -10}, {10, 10}},
    rotation = 90)));
  Fluid.Vessels.SpecifiedResistance resistance_outer(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, R = 4.20 "外堆芯 217.4 kg/s(2026-08-31新HE1重配流)") 
    annotation(Placement(transformation(origin = {4.99444, -48.991},
    extent = {{-10, -10}, {10, 10}},
    rotation = 90)));
  Fluid.Vessels.SpecifiedResistance resistance_inner(redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium, R = 22.1 "内堆芯 62.7 kg/s(2026-08-31新HE1重配流: 63.9→64.5→收紧)") 
    annotation(Placement(transformation(origin = {-80.9875, -48.991},
    extent = {{-10, -10}, {10, 10}},
    rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow_inner[10] 
    annotation(Placement(transformation(origin = {-106, 13.009},
    extent = {{-6, -6}, {6, 6}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow_outer[10] 
    annotation(Placement(transformation(origin={-10,13.009},
extent={{-6,-6},{6,6}})));
  Modelica.Blocks.Math.Gain gain2(k = 1 / 10) 
    annotation(Placement(transformation(origin = {-136, 13.009},
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain gain3(k=1 / 10) 
    annotation (Placement(transformation(origin={-43.5028,13.009},
extent={{-10,-10},{10,10}})));
equation
  connect(innerCore_out.portB, volume.port_a[1]) 
    annotation(Line(origin = {-1.00556, 19.009},
    points = {{-79.9819, 28.0222}, {-79.9819, 48}, {6, 48}, {6, 64}},
    color = {0, 127, 255}));
  connect(outerCore_out.portB, volume.port_a[2]) 
    annotation(Line(origin = {-26.0056, 19.009},
    points = {{31.0181, 28.0222}, {31, 64}},
    color = {0, 127, 255}));
  connect(shieldReflector.portB, volume.port_a[3]) 
    annotation(Line(origin = {-1.00556, 19.009},
    points = {{78, 4.0222}, {78, 48}, {6, 48}, {6, 64}},
    color = {0, 127, 255}));
  connect(innerCore_out.portA, innerCore.portB) 
    annotation(Line(origin = {-61.0056, 19.009},
    points = {{-19.9819, 8.02226}, {-19.9819, 4.0222}},
    color = {0, 127, 255}));
  connect(innerCore.portA, innerCore_in.portB) 
    annotation(Line(origin = {-61.0056, 19.009},
    points = {{-19.9819, -15.97774}, {-19.9819, -19.9778}},
    color = {0, 127, 255}));
  connect(outerCore_out.portA, outerCore.portB) 
    annotation(Line(origin = {-72.0056, 19.009},
    points = {{77.0180755, 8.02226}, {77.0180755, 4.0222}},
    color = {0, 127, 255}));
  connect(outerCore.portA, outerCore_in.portB) 
    annotation(Line(origin = {-72.0056, 19.009},
    points = {{77.0180755, -15.97774}, {77.0180755, -19.9778}},
    color = {0, 127, 255}));
  connect(innerCore_in.portA, resistance_inner.port_b) 
    annotation(Line(origin = {-1.00556, 19.009},
    points = {{-79.9819, -39.97774}, {-79.9819, -58}},
    color = {0, 127, 255}));
  connect(outerCore_in.portA, resistance_outer.port_b) 
    annotation(Line(origin = {-1.00556, 19.009},
    points = {{6.0180755, -39.97774}, {6, -58}},
    color = {0, 127, 255}));
  connect(shieldReflector.portA, resistance_shield.port_b) 
    annotation(Line(origin = {-1.00556, 19.009},
    points = {{78, -15.97774}, {78, -58}},
    color = {0, 127, 255}));
  connect(volume1.port_b[1], resistance_shield.port_a) 
    annotation(Line(origin = {-1.00556, 19.009},
    points = {{6, -120}, {6, -100}, {78, -100}, {78, -78}},
    color = {0, 127, 255}));
  connect(volume1.port_b[2], resistance_inner.port_a) 
    annotation(Line(origin = {-1.00556, 19.009},
    points = {{6, -120}, {6, -100}, {-79.9819, -100}, {-79.9819, -78}},
    color = {0, 127, 255}));
  connect(volume1.port_b[3], resistance_outer.port_a) 
    annotation(Line(origin = {-1.00556, 19.009},
    points = {{6, -120}, {6, -78}},
    color = {0, 127, 255}));
  connect(const1.y, pointKinetics.Reactivity_Other) 
    annotation(Line(origin = {9.0004, 63.525},
    points = {{-236.0004, 20.784}, {-209.0004, 20.784}, {-209.0004, 13.24125}, {-188.7554, 13.24125}},
    color = {0, 0, 127}));
  connect(realExpression1.y, pointKinetics.Teff_coolant) 
    annotation(Line(origin = {9.0004, 63.525},
    points = {{-198.0004, -16.0451}, {-192.5104, -16.0451}, {-192.5104, -7.05375}, {-188.7554, -7.05375}},
    color = {0, 0, 127}));
  connect(const3.y, pointKinetics.Q_in) 
    annotation(Line(origin = {9.0004, 63.525},
    points = {{-198.0004, 80.475}, {-169.3154, 80.475}, {-169.3154, 31.0763}},
    color = {0, 0, 127}));
  connect(realExpression4.y, pointKinetics.Teff_fuel) 
    annotation(Line(origin = {9.0004, 63.525},
    points = {{-228.0004, -5.898}, {-192.5104, -5.898}, {-192.5104, 3.09375}, {-188.7554, 3.09375}},
    color = {0, 0, 127}));
  connect(volume.port_b[1], pipe_static1.portA) 
    annotation(Line(origin = {-1.00556, 19.009},
    points = {{6, 76}, {6, 91.9819245}, {113.02226, 91.9819245}},
    color = {0, 127, 255}));
  connect(volume1.port_a[1], pipe_static2.portB) 
    annotation(Line(origin = {-1.00556, 19.009},
    points = {{6, -132}, {93.9778, -132.018}},
    color = {0, 127, 255}));
  connect(pipe_static2.portA, pump1.port_b) 
    annotation(Line(origin = {-1.00556, 19.009},
    points = {{113.97774, -132.018}, {140, -132.018}},
    color = {0, 178, 226}));
  connect(expansionTank.port, resistance_toBoundary.port_a) 
    annotation(Line(origin = {-1.00556, 19.009},
    points = {{154, 145.6}, {154, 118}, {162, 118}},
    color = {0, 127, 255}));
  connect(resistance_toBoundary.port_b, pipe_static1.portB) 
    annotation(Line(origin = {-1.00556, 19.009},
    points = {{182, 118}, {185, 118}, {185, 91.9819245}, {133.0222, 91.9819245}},
    color = {0, 127, 255}));
  connect(hE1_1.shell_out, pump1.port_a) 
    annotation(Line(origin={-1.00556,19.009},
points={{218.80375,-9.209},{218.80375,-132.018},{159.999995,-132.018}},
color={0,127,255}));
  connect(hE1_1.shell_in, pipe_static1.portB) 
    annotation(Line(origin={-1.00556,19.009},
points={{218.80375,11.191},{218.80375,91.9819245},{133.02176,91.9819245}},
color={0,127,255}));
  connect(hE1_1.tube_in, boundary3.ports[1]) 
    annotation(Line(origin={-1.00556,19.009},
points={{231.004,-9.209},{231.004,-59.991},{332.011125,-59.991}},
color={0,127,255}));
  connect(boundary2.ports[1], hE1_1.tube_out) 
    annotation(Line(origin={-1.00556,19.009},
points={{315.999995,44},{231.004,44},{231.004,11.191}},
color={0,127,255}));
  connect(outerCore.wall, prescribedHeatFlow_outer.port) 
    annotation(Line(origin={-17,13},
points={{18.19444,0.009},{13,0.009}},
color={127,0,0}));
  connect(prescribedHeatFlow_inner.port, innerCore.wall) 
    annotation(Line(origin = {-106, 13},
    points = {{6, 0.009}, {21.1944, 0.009}},
    color = {191, 0, 0}));
  connect(prescribedHeatFlow_inner[1].Q_flow, gain2.y) 
  annotation(Line(origin={-276,48},
points={{8.006,0},{-5,7.10543e-15}},
color={0,0,127}));
  connect(gain2.y, prescribedHeatFlow_inner[2].Q_flow) 
  annotation(Line(origin={-276,48},
points={{-5,7.10543e-15},{8.006,0}},
color={0,0,127}));
  connect(gain2.y, prescribedHeatFlow_inner[3].Q_flow) 
  annotation(Line(origin={-276,48},
points={{-5,7.10543e-15},{8.006,0}},
color={0,0,127}));
  connect(gain2.y, prescribedHeatFlow_inner[4].Q_flow) 
  annotation(Line(origin={-276,48},
points={{-5,7.10543e-15},{8.006,0}},
color={0,0,127}));
  connect(gain2.y, prescribedHeatFlow_inner[5].Q_flow) 
  annotation(Line(origin={-276,48},
points={{-5,7.10543e-15},{8.006,0}},
color={0,0,127}));
  connect(gain2.y, prescribedHeatFlow_inner[6].Q_flow) 
  annotation(Line(origin={-276,48},
points={{-5,7.10543e-15},{8.006,0}},
color={0,0,127}));
  connect(gain2.y, prescribedHeatFlow_inner[7].Q_flow) 
  annotation(Line(origin={-276,48},
points={{-5,7.10543e-15},{8.006,0}},
color={0,0,127}));
  connect(gain2.y, prescribedHeatFlow_inner[8].Q_flow) 
  annotation(Line(origin={-276,48},
points={{-5,7.10543e-15},{8.006,0}},
color={0,0,127}));
  connect(gain2.y, prescribedHeatFlow_inner[9].Q_flow) 
  annotation(Line(origin={-276,48},
points={{-5,7.10543e-15},{8.006,0}},
color={0,0,127}));
  connect(gain2.y, prescribedHeatFlow_inner[10].Q_flow) 
  annotation(Line(origin={-276,48},
points={{151,-34.991},{164,-34.991}},
color={0,0,127}));
  connect(constCR.y, pointKinetics.Reactivity_CR) 
    annotation(Line(origin = {9.0004, 63.525},
    points = {{-236.0004, 52.475}, {-201.0004, 52.475}, {-201.0004, 22.8763}, {-188.7554, 22.8763}},
    color = {0, 0, 127}));
  connect(gain3.y, prescribedHeatFlow_outer[1].Q_flow) 
  annotation(Line(origin={-192,63},
points={{159.4972,-49.991},{176,-49.991}},
color={0,0,127}));
  connect(gain3.y, prescribedHeatFlow_outer[2].Q_flow) 
  annotation(Line(origin={-181,48},
points={{148.4972,-34.991},{165,-34.991}},
color={0,0,127}));
  connect(gain3.y, prescribedHeatFlow_outer[3].Q_flow) 
  annotation(Line(origin={-181,48},
points={{148.4972,-34.991},{165,-34.991}},
color={0,0,127}));
  connect(gain3.y, prescribedHeatFlow_outer[4].Q_flow) 
  annotation(Line(origin={-181,48},
points={{148.4972,-34.991},{165,-34.991}},
color={0,0,127}));
  connect(gain3.y, prescribedHeatFlow_outer[5].Q_flow) 
  annotation(Line(origin={-181,48},
points={{148.4972,-34.991},{165,-34.991}},
color={0,0,127}));
  connect(gain3.y, prescribedHeatFlow_outer[6].Q_flow) 
  annotation(Line(origin={-181,48},
points={{148.4972,-34.991},{165,-34.991}},
color={0,0,127}));
  connect(gain3.y, prescribedHeatFlow_outer[7].Q_flow) 
  annotation(Line(origin={-181,48},
points={{148.4972,-34.991},{165,-34.991}},
color={0,0,127}));
  connect(gain3.y, prescribedHeatFlow_outer[8].Q_flow) 
  annotation(Line(origin={-181,48},
points={{148.4972,-34.991},{165,-34.991}},
color={0,0,127}));
  connect(gain3.y, prescribedHeatFlow_outer[9].Q_flow) 
  annotation(Line(origin={-181,48},
points={{148.4972,-34.991},{165,-34.991}},
color={0,0,127}));
  connect(gain3.y, prescribedHeatFlow_outer[10].Q_flow) 
  annotation(Line(origin={-181,48},
points={{148.4972,-34.991},{165,-34.991}},
color={0,0,127}));
  connect(pointKinetics.Q_innerCore, gain2.u) 
    annotation(Line(origin = {-140, 42},
    points = {{0.115, 24.5163}, {11.87, 24.51625}, {11.87, 1.009}, {-12, 1.009}, {-12, -28.991}, {-8, -28.991}},
    color = {0, 0, 127}));
  connect(pointKinetics.Q_outerCore, gain3.u) 
  annotation(Line(origin={-98,45},
points={{-41.885,31.56125},{36,31.56125},{36,-31.991},{42.4972,-31.991}},
color={0,0,127}));
end v2;