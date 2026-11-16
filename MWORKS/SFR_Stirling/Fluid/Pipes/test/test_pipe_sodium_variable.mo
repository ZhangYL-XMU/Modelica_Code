within SFR_Stirling.Fluid.Pipes.test;
model test_pipe_sodium_variable
  "T3 最终验证：原版 pipe.mo（零改动）+ 温度相关 Sodium 介质，N=5、n_pipe=5，恒定壁面热流，60 s 瞬态"
  annotation(__MWORKS(version="26.1.3"),
    experiment(Algorithm=Dassl, InlineIntegrator=false, InlineStepSize=false,
               Interval=0.05, StartTime=0, StopTime=60, StoreEventValue=0, Tolerance=0.0001),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, grid={2,2})));

  // ---------------------------------------------------------------
  // 被测介质：可替换，默认温度相关液态钠（SFR_Striling.Media.Sodium.Sodium）
  // 同工况常物性对照时可 redeclare 为 ConstantPropertyLiquidSodium
  // ---------------------------------------------------------------
  replaceable package Medium = SFR_Stirling.Media.Sodium.Sodium
    "工作介质（默认温度相关液态钠）";

  // ---------------------------- 工况参数 ----------------------------
  parameter Integer N = 5 "节点数（>=5）";
  parameter Integer n_pipe = 5 "并联管数（>=5）";
  parameter Modelica.Units.SI.MassFlowRate m_flow_in = 10 "单管入口质量流量 [kg/s]";
  parameter Modelica.Units.SI.Temperature T_in = 823.15 "入口温度（550 degC）[K]";
  parameter Modelica.Units.SI.AbsolutePressure p_out = 1e6 "出口压力 [Pa]";
  parameter Modelica.Units.SI.HeatFlowRate Q_total = 1e6 "壁面总热流（4 段均分）[W]";
  final parameter Integer Nw = N - 1 "控制体数";
  final parameter Modelica.Units.SI.SpecificEnthalpy h_in =
    Medium.specificEnthalpy_pTX(p_out, T_in, Medium.reference_X) "入口比焓 [J/kg]";

  // ---------------------------- 边界条件 ----------------------------
  Modelica.Fluid.Sources.MassFlowSource_h inlet(
    redeclare package Medium = Medium,
    nPorts = 1,
    m_flow = m_flow_in,
    h = h_in) "入口：给定质量流量与比焓" 
    annotation(Placement(transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}})));

  Modelica.Fluid.Sources.Boundary_ph outlet(
    redeclare package Medium = Medium,
    nPorts = 1,
    p = p_out,
    h = h_in) "出口：给定压力与比焓" 
    annotation(Placement(transformation(origin = {60, 0}, extent = {{10, -10}, {-10, 10}})));

  // ------------------------- 被测组件：原版 pipe -------------------------
  SFR_Stirling.Fluid.Pipes.pipe pipe1(
    redeclare package Medium = Medium,
    N = N,
    n_pipe = n_pipe,
    L_total = 10,
    Dh = 0.05,
    height_ab = 0,
    h_start = h_in,
    p_start = p_out,
    T_start = T_in,
    T_wall_start = T_in,
    momentumDynamics = Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_start = m_flow_in) "原版 pipe.mo（不修改任何源文件）" 
    annotation(Placement(transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}})));

  // ---------------------- 恒定壁面热流（每段一个） ----------------------
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow heat[Nw](
    each Q_flow = Q_total / Nw) "恒定壁面热流，均分到各控制体" 
    annotation(Placement(transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}})));

equation
  connect(inlet.ports[1], pipe1.portA) 
    annotation(Line(origin = {-30, 0}, points = {{-20, 0}, {20, 0}}, color = {0, 127, 255}));
  connect(pipe1.portB, outlet.ports[1]) 
    annotation(Line(origin = {30, 0}, points = {{10, 0}, {-10, 0}}, color = {0, 127, 255}));
  for i in 1:Nw loop
    connect(heat[i].port, pipe1.wall[i]) 
      annotation(Line(origin = {0, 20}, points = {{0, 10}, {0, -10}}, color = {191, 0, 0}));
  end for;
end test_pipe_sodium_variable;