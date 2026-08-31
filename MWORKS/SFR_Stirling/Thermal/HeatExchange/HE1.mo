within SFR.Thermal.HeatExchange;
model HE1
  "中间热交换器 IHX：一次侧（壳程，SFR 钠）放热 550→440 ℃ @280.6 kg/s；二次侧（管程，SFR 钠）吸热 430→530 ℃ @308.4 kg/s几何/换热参数已提升到顶层（图形层双击本组件可编辑）：n_tubes/L_total/管径壁厚/CF_HeatTransfer/N 等壳/管侧动量均为 SteadyState：壳侧接锁流量泵、管侧接锁流量源+定压边界，动态动量无必要且易压力奇异。2026-08-31 几何修正：n_tubes=1440（4 台×360 根合并）、壳侧当量直径按外套筒内径 450 mm 推导（0.0178 m）、CF_HeatTransfer=1.086 标定，见 建模文档/换热器HE1标定_20260831.md"
  annotation(__MWORKS(version="26.1.3",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=100,ContinueTimeVector)),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.01,StartTime=0,StopTime=100,StoreEventValue=0,Tolerance=0.0001),Icon(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2}),graphics = {Rectangle(origin={0,0},
fillColor={255,255,255},
fillPattern=FillPattern.Solid,
extent={{-100,100},{100,-100}}), Polygon(origin={73,-62.0181},
fillColor={170,0,0},
fillPattern=FillPattern.Solid,
points={{-7,16},{7,0.0181},{-7,-16}}), Rectangle(origin={-7,-62.0181},
fillColor={170,0,0},
fillPattern=FillPattern.Solid,
extent={{-73,6},{73,-6}}), Polygon(origin={-73,59.9819},
fillColor={170,0,255},
fillPattern=FillPattern.Solid,
points={{7,16},{-7,0},{7,-16}}), Rectangle(origin={7,59.9819},
fillColor={170,0,255},
fillPattern=FillPattern.Solid,
extent={{73,6},{-73,-6}}), Line(origin={-40,0},
points={{20,40},{-20,30},{20,20},{-20,10},{20,0},{-20,-10},{20,-20},{-20,-30},{20,-40}}), Line(origin={40,0},
points={{20,40},{-20,30},{20,20},{-20,10},{20,0},{-20,-10},{20,-20},{-20,-30},{20,-40}})}));
  // ===== 顶层参数（图形层可编辑；默认值 = 已验证的标定状态） =====
  parameter Integer n_tubes = 1440 "换热管根数（4 台 IHX 合并等效：4×360=1440）" annotation(Dialog(group="几何"));
  parameter Modelica.Units.SI.Length L_total = 2 "换热管/壳程长度 [m]" annotation(Dialog(group="几何"));
  parameter Modelica.Units.SI.Length Dh_tube = 0.0136 "管侧水力直径（管内径=φ16−2×1.2=13.6 mm）[m]" annotation(Dialog(group="几何"));
  parameter Modelica.Units.SI.Length Dh_shell = 0.0178 "壳侧当量直径 [m]（由外套筒内径450mm+360xφ16推导：A_free=0.0867 m2,P=19.51 m,Dh=4A/P）" annotation(Dialog(group="几何"));
  parameter Modelica.Units.SI.Length D_shell_in = 0.45 "外套筒内径（侯斌表4：450 mm）[m]" annotation(Dialog(group="几何"));
  parameter Modelica.Units.SI.Length r_wall_in = 0.0136 "管壁内径 [m]（TY TubeWall r_inner 为内径口径：φ16×1.2 → 13.6 mm）" annotation(Dialog(group="几何"));
  parameter Modelica.Units.SI.Length r_wall_out = 0.016 "管壁外径 [m]（TY TubeWall r_outer 为外径口径：16 mm）" annotation(Dialog(group="几何"));
  parameter Integer N = 5 "每侧节点数" annotation(Dialog(group="网格"));
  parameter Real CF_HeatTransfer = 1.086 "换热能力修正系数（标定 2026-08-31：n_tubes=1440 四台合并；设计 UA≈2.77 MW/K ↔ 模型 Lyon 2.55 MW/K；增大=换热更强）" annotation(Dialog(tab="换热标定"));
  parameter Modelica.Units.SI.Temperature T_wall_ref = 713.15 "管壁参考温度 [K]（440℃）" annotation(Dialog(tab="初始化"));
  parameter Modelica.Units.SI.Temperature T_wall_init = 738.15 "管壁初始温度 [K]（465℃）" annotation(Dialog(tab="初始化"));
  TYThermoFluidSys.Thermal.TubeWall tubeWall(N=N - 1,
    r_inner(displayUnit="mm")=r_wall_in,
    r_outer(displayUnit="mm")=r_wall_out,
    length=L_total,
    T_reference=fill(T_wall_ref, N - 1),
    exposeState_a=true,
    exposeState_b=true,
    T_start=fill(T_wall_init, N - 1)) 
    annotation (Placement(transformation(origin={7.10543e-15,-8},
    extent={{-10,-10},{10,10}},
    rotation=90)));
  SFR.Fluid.Pipes.pipe shell(N=N, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, L_total=L_total, Dh(displayUnit="mm")=Dh_shell, n_pipe=n_tubes,T_wall_start=T_wall_ref,m_flow_start=1, CF_HeatTransfer=CF_HeatTransfer, momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState) 
    annotation (Placement(transformation(origin={7.10543e-15,-62},
    extent={{-10,-10},{10,10}})));
  SFR.Fluid.Pipes.pipe tube(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, N=N, L_total=L_total, n_pipe=n_tubes, Dh(displayUnit="mm")=Dh_tube,T_wall_start=T_wall_ref,m_flow_start=1, CF_HeatTransfer=CF_HeatTransfer, momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState) 
    annotation (Placement(transformation(origin={7.10543e-15,59.9819},
    extent={{-10,-10},{10,10}},
    rotation=180)));
  Modelica.Fluid.Interfaces.FluidPort_a tube_in(redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation (Placement(transformation(origin={102,59.9819},
    extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b tube_out(redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation (Placement(transformation(origin={-102,59.9819},
    extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Interfaces.FluidPort_a shell_in(redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation (Placement(transformation(origin={-102,-62.0181},
    extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b shell_out(redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation (Placement(transformation(origin={102,-62.0181},
    extent={{-10,-10},{10,10}})));
  SFR.Thermal.HeatExchange.CounterFlowPair counterFlow(n=N - 1, counterCurrent=true) 
    annotation (Placement(transformation(origin={7.10543e-15,29.4864},
    extent={{-10,-10},{10,10}},
    rotation=90)));
  equation
  connect(tube.portB, tube_out) 
  annotation(Line(origin={-56,60},
  points={{45.9778,-2.45e-5},{-46,-0.0181}},
  color={0,127,255}));
  connect(tube.portA, tube_in) 
  annotation(Line(origin={54,60},
  points={{-44.0223,-2.45e-5},{48,-0.0181}},
  color={0,127,255}));
  connect(shell.portB, shell_out) 
  annotation(Line(origin={56,-62},
  points={{-45.9778,-0.0180755},{46,-0.0181}},
  color={0,127,255}));
  connect(shell.portA, shell_in) 
  annotation(Line(origin={-56,-62},
  points={{46.02226,-0.0180755},{-46,-0.0181}},
  color={0,127,255}));
  connect(counterFlow.port_b, tube.wall) 
  annotation(Line(origin={0,51},
  points={{7.10543e-15,-11.5136},{7.10543e-15,5.1819}},
  color={191,0,0}));
  connect(counterFlow.port_a, tubeWall.port_b) 
  annotation(Line(origin={0,17},
  points={{7.10543e-15,2.4864},{7.10543e-15,-15}},
  color={191,0,0}));
  connect(tubeWall.port_a, shell.wall) 
  annotation(Line(origin={0,-38},
  points={{7.10543e-15,20},{7.10543e-15,-20.2}},
  color={191,0,0}));
  end HE1;