within SFR.Structure.Closed;
model FirstLoop_fixed
  "一回路模型（堆芯三通道+轴向三段版）：内堆芯/外堆芯/屏蔽+反射 并联，轴向入口段/活性段/出口段，图面参照 FirstLoop 布置"
  // ================= 设计依据（任务 SFR-20260821-01，2026-08-21） =================
  // 三通道并联（尹凯 RELAP 104/105/106）：innerCore 圈1~4 37 组件 8948.31 kW(22.37%)
  //   outerCore 圈5~8 114 组件 31051.69 kW(77.63%)；shieldReflector 屏蔽+反射合并 54 组件 Q=0
  // 轴向三段（TRANSFORM _in/core/_out）：入口 0.25 m / 活性 1.1 m / 出口 0.15 m
  // 活性段热流轴向均匀注入 wall[1:4]（Q_zone/4），不做精细管壁传热
  // 功率分配：Q_total → gain_inner(8948.31/40000/4) / gain_outer(31051.69/40000/4) → 各4个 PrescribedHeatFlow
  // 几何：Dh=0.0415 m（组件流道面积等效）；n_pipe=组件数（37/114/54）
  // 流量配平：阻力 R=1000/m_target（屏蔽+反射 142.86 / 外堆芯 4.71 / 内堆芯 16.34 Pa·s/kg）
  //   目标流量：内 61.2 / 外 212.4 / 屏蔽+反射 7.0 kg/s（尹凯 440/550 ℃、280.6 kg/s）
  // 主管道 pipe_static：Dh=0.30 m（280.6 kg/s、863 kg/m³ → v=4.6 m/s）
  // 焓初值：h=1251*(T-298.15)：440℃→519165、550℃→656775 J/kg
  // ================================================================================

  // ================= 以下回路组件与 FirstLoop 保持一致（坐标同 FirstLoop） =================
  TYThermoFluidSys.Sensors.SensorT TSensor2(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation (Placement(transformation(origin={31,112},
    extent={{-10,-10},{10,10}})));
  SFR.Fluid.Pipes.pipe pipe_static1(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, L_total=10, Dh=0.30, initFromEnthalpy=true, h_start=656775 "热段550℃", wallHeatTransfer=false, momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState) 
    annotation (Placement(transformation(origin={123,92},
    extent={{-10,-10},{10,10}})));
  SFR.Fluid.Pipes.pipe pipe_static2(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, L_total=10, Dh=0.30, initFromEnthalpy=true, h_start=519165 "冷段440℃", wallHeatTransfer=false, momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState) 
    annotation (Placement(transformation(origin={104,-132},
extent={{10,-10},{-10,10}})));
  SFR.Fluid.Vessels.MixingVolume volume(nPorts_a=3, nPorts_b=1, V=10, h_start=656775 "上腔室550℃", redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation (Placement(transformation(origin={6,70},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Vessels.MixingVolume volume1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, nPorts_a=1, nPorts_b=3, V=10, h_start=519165 "下腔室440℃") 
    annotation (Placement(transformation(origin={6,-126},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Nuclear.PointKinetics pointKinetics(Teffref_fuel(displayUnit="K"), Teffref_coolant(displayUnit="degC")=785.15) 
    annotation (Placement(transformation(origin={-186,-6},
extent={{-18,-20.5},{18,20.5}})));
  Modelica.Blocks.Continuous.LimPID PID(controllerType=Modelica.Blocks.Types.SimpleController.PID, yMax=0.021, initType=Modelica.Blocks.Types.Init.SteadyState, withFeedForward=false, k=2, wd=1) 
    annotation (Placement(transformation(origin={-322,8.4013},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Blocks.Constant const1(k=0) 
    annotation (Placement(transformation(origin={-254,30.5},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Blocks.Constant const3(k=0) 
    annotation (Placement(transformation(origin={-220,58.5},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Blocks.Ramp ramp(offset=40e6, height=4e6, duration=100, startTime=400) 
    annotation (Placement(transformation(origin={-370,8.4013},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=TSensor2.T) 
    annotation (Placement(transformation(origin={-254,-62.5},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Blocks.Constant const2(k=823.15) 
    annotation (Placement(transformation(origin={-254,-11.3813},
extent={{-10,-10},{10,10}})));
  TRANSFORM.Fluid.Machines.Pump_SimpleMassFlow pump1(m_flow_nominal=280.6, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation (Placement(transformation(origin={150,-132.018},
extent={{10,-10},{-10,10}})));
  SFR.Fluid.Vessels.ExpansionTank expansionTank(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, A=1, V0=0.001, level_start=1, h_start=656775 "热段550℃", p_start=100000.0) 
    annotation (Placement(transformation(origin={154,154},
extent={{-10,-10},{10,10}})));
  SFR.Fluid.Vessels.SpecifiedResistance resistance_toBoundary(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=0.1) 
    annotation (Placement(transformation(origin={172,118},
extent={{-10,-10},{10,10}})));
  SFR.Thermal.HeatExchange.HE1 hE1_1(shell(momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)) 
    annotation (Placement(transformation(origin={256.01113,2.009},
    extent={{10,10},{-10,-10}},
    rotation=90)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary3(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, m_flow=308.4, T(displayUnit="degC")=703.15) 
    annotation (Placement(transformation(origin={342.01113,-59.991},
    extent={{10,-10},{-10,10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary2(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, T=803.15, p=100000) 
    annotation (Placement(transformation(origin={326,44},
extent={{10,-10},{-10,10}})));

  // ================= 堆芯三通道（竖直，替换 FirstLoop 原 pipe1/pipe2 位置） =================
  TYThermoFluidSys.Sensors.SensorT TSensor1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation (Placement(transformation(origin={-122,60},
extent={{-10,-10},{10,10}})));
  // 屏蔽层+反射层合并通道（单段，不发热）
  SFR.Fluid.Pipes.pipe shieldReflector(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=2, n_pipe=54, L_total=1.5, Dh=0.0415, height_ab=-1.5,
    initFromEnthalpy=true, h_start=519165, wallHeatTransfer=false,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=0.13) 
    annotation (Placement(transformation(origin={77.9819245,-6},
extent={{-10,-10},{10,10}},
rotation=90)));
  // 内堆芯（圈1~4）：入口段 / 活性段 / 出口段
  SFR.Fluid.Pipes.pipe innerCore_in(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=2, n_pipe=37, L_total=0.25, Dh=0.0415, height_ab=-0.25,
    initFromEnthalpy=true, h_start=519165, wallHeatTransfer=false,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.65) 
    annotation (Placement(transformation(origin={-80,-30},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Pipes.pipe innerCore(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=5, n_pipe=37, L_total=1.1, L_heat=1.1, Dh=0.0415, height_ab=-1.1,
    initFromEnthalpy=true, h_start=519165, wallHeatTransfer=true,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.65) 
    annotation (Placement(transformation(origin={-80,-6},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Pipes.pipe innerCore_out(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=2, n_pipe=37, L_total=0.15, Dh=0.0415, height_ab=-0.15,
    initFromEnthalpy=true, h_start=656775, wallHeatTransfer=false,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.65) 
    annotation (Placement(transformation(origin={-80,18},
extent={{-10,-10},{10,10}},
rotation=90)));
  // 外堆芯（圈5~8）：入口段 / 活性段 / 出口段
  SFR.Fluid.Pipes.pipe outerCore_in(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=2, n_pipe=114, L_total=0.25, Dh=0.0415, height_ab=-0.25,
    initFromEnthalpy=true, h_start=519165, wallHeatTransfer=false,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.86) 
    annotation (Placement(transformation(origin={6,-30},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Pipes.pipe outerCore(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=5, n_pipe=114, L_total=1.1, L_heat=1.1, Dh=0.0415, height_ab=-1.1,
    initFromEnthalpy=true, h_start=519165, wallHeatTransfer=true,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.86) 
    annotation (Placement(transformation(origin={6,-6},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Pipes.pipe outerCore_out(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    N=2, n_pipe=114, L_total=0.15, Dh=0.0415, height_ab=-0.15,
    initFromEnthalpy=true, h_start=656775, wallHeatTransfer=false,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start=1.86) 
    annotation (Placement(transformation(origin={6,18},
extent={{-10,-10},{10,10}},
rotation=90)));

  // ================= 流量分配阻力（三路独立，R=1000/m_target） =================
  SFR.Fluid.Vessels.SpecifiedResistance resistance_shield(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=1000/7.0) 
    annotation (Placement(transformation(origin={78,-68},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Vessels.SpecifiedResistance resistance_outer(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=1000/212.4) 
    annotation (Placement(transformation(origin={6,-68},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Vessels.SpecifiedResistance resistance_inner(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=1000/61.2) 
    annotation (Placement(transformation(origin={-79.9819,-68},
extent={{-10,-10},{10,10}},
rotation=90)));

  // ================= 功率分配（全局点堆 Q_total → 内外堆芯份额 → 每控制体 1/4） =================
  Modelica.Blocks.Math.Gain gain_inner(k=8948.31/40000/4) "内堆芯功率份额/4：8948.31/40000/4" 
    annotation (Placement(transformation(origin={-133.5,-6},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Gain gain_outer(k=31051.69/40000/4) "外堆芯功率份额/4：31051.69/40000/4" 
    annotation (Placement(transformation(origin={-53,-6},
extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow_inner[4] 
    annotation (Placement(transformation(origin={-100,-6},
extent={{-6,-6},{6,6}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow_outer[4] 
    annotation (Placement(transformation(origin={-21,-6},
extent={{-6,-6},{6,6}})));

equation
  // ---- 堆芯出口 → 上腔室 volume（port_a[1]=内堆芯, [2]=外堆芯, [3]=屏蔽+反射） ----
  connect(innerCore_out.portB, volume.port_a[1]) annotation (Line(origin={0,0},
points={{-79.9819,28.0222},{-79.9819,48},{6,48},{6,64}},
color={0,127,255}));
  connect(TSensor1.port_a, innerCore_out.portB) annotation (Line(origin={-34.5,-8.88178e-16},
points={{-87.5,50},{-87.5,31.0222},{-45.4819,31.0222},{-45.4819,28.0222}},
color={0,178,226}));
  connect(outerCore_out.portB, volume.port_a[2]) annotation (Line(origin={-25,0},
points={{31.0181,28.0222},{31,64}},
color={0,127,255}));
  connect(shieldReflector.portB, volume.port_a[3]) annotation (Line(origin={0,0},
points={{78,4.0222},{78,48},{6,48},{6,64}},
color={0,127,255}));
  // ---- 轴向三段串联 ----
  connect(innerCore_out.portA, innerCore.portB) annotation (Line(origin={-60,-8.88178e-16},
points={{-19.9819,8.02226},{-19.9819,4.0222}},
color={0,127,255}));
  connect(innerCore.portA, innerCore_in.portB) annotation (Line(origin={-60,-8.88178e-16},
points={{-19.9819,-15.97774},{-19.9819,-19.9778}},
color={0,127,255}));
  connect(outerCore_out.portA, outerCore.portB) annotation (Line(origin={-71,0},
points={{77.0180755,8.02226},{77.0180755,4.0222}},
color={0,127,255}));
  connect(outerCore.portA, outerCore_in.portB) annotation (Line(origin={-71,0},
points={{77.0180755,-15.97774},{77.0180755,-19.9778}},
color={0,127,255}));
  // ---- 分配阻力 → 三通道入口 ----
  connect(innerCore_in.portA, resistance_inner.port_b) annotation (Line(origin={0,0},
points={{-79.9819,-39.97774},{-79.9819,-58}},
color={0,127,255}));
  connect(outerCore_in.portA, resistance_outer.port_b) annotation (Line(origin={0,0},
points={{6.0180755,-39.97774},{6,-58}},
color={0,127,255}));
  connect(shieldReflector.portA, resistance_shield.port_b) annotation (Line(origin={0,0},
points={{78,-15.97774},{78,-58}},
color={0,127,255}));
  // ---- 下腔室 volume1 → 三路阻力 ----
  connect(volume1.port_b[1], resistance_shield.port_a) annotation (Line(origin={0,0},
points={{6,-120},{6,-100},{78,-100},{78,-78}},
color={0,127,255}));
  connect(volume1.port_b[2], resistance_inner.port_a) annotation (Line(origin={0,0},
points={{6,-120},{6,-100},{-79.9819,-100},{-79.9819,-78}},
color={0,127,255}));
  connect(volume1.port_b[3], resistance_outer.port_a) annotation (Line(origin={0,0},
points={{6,-120},{6,-78}},
color={0,127,255}));
  // ---- 全局点堆 Q_total → 功率增益 ----
  connect(pointKinetics.Q_total, gain_inner.u) annotation (Line(origin={0,0},
points={{-166,4},{-154,4},{-154,-6},{-143.5,-6}},
color={0,0,127}));
  connect(pointKinetics.Q_total, gain_outer.u) annotation (Line(origin={0,0},
points={{-165.885,8.19625},{-162.13,8.19625},{-162.13,20},{-69,20},{-69,-6},{-65,-6}},
color={0,0,127}));
  // ---- 分区功率 → 活性段壁面（轴向均匀，每控制体 Q_zone/4） ----
  connect(gain_inner.y, prescribedHeatFlow_inner[1].Q_flow) annotation (Line(origin={-25.5,0},
points={{-97,-6},{-80.5,-6}},
color={0,0,127}));
  connect(gain_inner.y, prescribedHeatFlow_inner[2].Q_flow) annotation (Line(origin={-25.5,0},
points={{-97,-6},{-80.5,-6}},
color={0,0,127}));
  connect(gain_inner.y, prescribedHeatFlow_inner[3].Q_flow) annotation (Line(origin={-25.5,0},
points={{-97,-6},{-80.5,-6}},
color={0,0,127}));
  connect(gain_inner.y, prescribedHeatFlow_inner[4].Q_flow) annotation (Line(origin={-25.5,0},
points={{-97,-6},{-80.5,-6}},
color={0,0,127}));
  connect(gain_outer.y, prescribedHeatFlow_outer[1].Q_flow) annotation (Line(origin={-71,0},
points={{29,-6},{44,-6}},
color={0,0,127}));
  connect(gain_outer.y, prescribedHeatFlow_outer[2].Q_flow) annotation (Line(origin={-71,0},
points={{29,-6},{44,-6}},
color={0,0,127}));
  connect(gain_outer.y, prescribedHeatFlow_outer[3].Q_flow) annotation (Line(origin={-71,0},
points={{29,-6},{44,-6}},
color={0,0,127}));
  connect(gain_outer.y, prescribedHeatFlow_outer[4].Q_flow) annotation (Line(origin={-71,0},
points={{29,-6},{44,-6}},
color={0,0,127}));
  connect(prescribedHeatFlow_inner.port, innerCore.wall) annotation (Line(origin={-60,-8.88178e-16},
points={{-34,-6},{-23.8,-6}},
color={127,0,0}));
  connect(prescribedHeatFlow_outer.port, outerCore.wall) annotation (Line(origin={-71,0},
points={{56,-6},{73.2,-6}},
color={127,0,0}));
  // ---- 上腔室出口温度测量（堆芯出口反馈） ----
  connect(TSensor2.port_a, volume.port_b[1]) annotation (Line(origin={0,0},
points={{31,102},{31,92},{6,92},{6,76}},
color={0,178,226}));
  // ---- 点堆控制与反馈（与 FirstLoop 相同） ----
  connect(pointKinetics.Q_total, PID.u_m) annotation (Line(origin={-15,-5.48375},
points={{-150.885,13.68},{-140,13.68},{-140,-38},{-307,-38},{-307,1.88505}},
color={0,0,127}));
  connect(const1.y, pointKinetics.Reactivity_Other) annotation (Line(origin={-15,-5.48375},
points={{-228,35.98375},{-200,35.98375},{-200,4.25},{-190.755,4.25}},
color={0,0,127}));
  connect(realExpression1.y, pointKinetics.Teff_coolant) annotation (Line(origin={-15,-5.48375},
points={{-228,-57.01625},{-200,-57.01625},{-200,-16.045},{-190.755,-16.045}},
color={0,0,127}));
  connect(const3.y, pointKinetics.Q_in) annotation (Line(origin={-15,-5.48375},
points={{-194,63.98375},{-171.315,63.98375},{-171.315,22.085}},
color={0,0,127}));
  connect(pointKinetics.Teff_fuel, const2.y) annotation (Line(origin={-15,-5.48375},
points={{-190.755,-5.8975},{-228,-5.8975}},
color={0,0,127}));
  connect(ramp.y, PID.u_s) annotation (Line(origin={-15,-5.48375},
points={{-344,13.88505},{-319,13.88505}},
color={0,0,127}));
  connect(PID.y, pointKinetics.Reactivity_CR) annotation (Line(origin={-15,-5.48375},
points={{-296,13.88505},{-190.755,13.885}},
color={0,0,127}));
  // ---- 一回路其余流路（与 FirstLoop 相同） ----
  connect(volume.port_b[1], pipe_static1.portA) annotation (Line(origin={0,0},
points={{6,76},{6,91.9819245},{113.02226,91.9819245}},
color={0,127,255}));
  connect(volume1.port_a[1], pipe_static2.portB) annotation (Line(origin={0,0},
points={{6,-132},{93.9778,-132.018}},
color={0,127,255}));
  connect(pipe_static2.portA, pump1.port_b) annotation (Line(origin={0,0},
points={{113.97774,-132.018},{140,-132.018}},
color={0,178,226}));
  connect(expansionTank.port, resistance_toBoundary.port_a) annotation (Line(origin={0,0},
points={{154,145.6},{154,118},{162,118}},
color={0,127,255}));
  connect(resistance_toBoundary.port_b, pipe_static1.portB) annotation (Line(origin={0,0},
points={{182,118},{185,118},{185,91.9819245},{133.0222,91.9819245}},
color={0,127,255}));
  connect(hE1_1.shell_out, pump1.port_a) annotation (Line(origin={0,0},
points={{249.809,-8.191},{249.809,-132.018},{160,-132.018}},
color={0,127,255}));
  connect(hE1_1.shell_in, pipe_static1.portB) annotation (Line(origin={0,0},
points={{249.809,12.209},{249.809,91.9819245},{133.0222,91.9819245}},
color={0,127,255}));
  connect(hE1_1.tube_in, boundary3.ports[1]) annotation (Line(origin={0,0},
points={{262.00932,-8.191},{262.00932,-59.991},{332.01113,-59.991}},
color={0,127,255}));
  connect(boundary2.ports[1], hE1_1.tube_out) annotation (Line(origin={0,0},
points={{316,44},{262.00932,44},{262.00932,12.209}},
color={0,127,255}));
  annotation (experiment(Algorithm=Dassl, StartTime=0, StopTime=3600, Interval=0.01, Tolerance=0.0001), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, grid={2,2})));
end FirstLoop_fixed;