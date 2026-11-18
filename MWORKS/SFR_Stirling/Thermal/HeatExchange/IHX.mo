within SFR_Stirling.Thermal.HeatExchange;
model IHX
  "直管逆流管壳式中间热交换器：一次侧壳程（550→440℃）、二次侧管程（430→530℃）；分节段一维有限体积、变物性钠、积分热导率单节点壁。拓扑与 HE1 一致，但以 SFR_Stirling.Thermal.Wall.WallConduction 取代 TY TubeWall（显式径向壁导热热阻）。"
  import SI = Modelica.Units.SI;
  import Modelica.Fluid.Types.Dynamics;

  //========= 介质 =========
  replaceable package Medium = SFR_Stirling.Media.Sodium.Sodium
    "两侧工作介质（默认变物性液态钠；快速冒烟可 redeclare 为 ConstantPropertyLiquidSodium）"
    annotation(choicesAllMatching=true, Dialog(tab="介质"));

  //========= 几何 / 网格 =========
  parameter Integer N(min=2) = 20 "每侧流体节点数（控制体数 Nw=N-1，可配至 150）"
    annotation(Dialog(group="网格"));
  parameter Integer n_tubes(min=1) = 1440 "并联管数（4 台×360 根合并等效：面积×4、单管流量÷4）"
    annotation(Dialog(group="几何"));
  parameter SI.Length L_total = 2 "换热管/壳程有效长度 [m]" annotation(Dialog(group="几何"));
  parameter SI.Length Dh_tube = 0.0136 "管侧水力直径（= φ16−2×1.2 内径 13.6 mm）[m]"
    annotation(Dialog(group="几何"));
  parameter SI.Length Dh_shell = 0.0178 "壳侧当量直径（4A_free/P，由套筒 450 mm + 360×φ16 推导）[m]"
    annotation(Dialog(group="几何"));
  parameter SI.Length r_tube_in = 0.0068 "管壁内半径（管侧表面 r_in）[m]" annotation(Dialog(group="几何"));
  parameter SI.Length r_tube_out = 0.008 "管壁外半径（壳侧表面 r_out）[m]" annotation(Dialog(group="几何"));
  parameter SI.Length D_shell_in = 0.45 "外套筒内径（侯斌表 4：450 mm，记录/派生用）[m]"
    annotation(Dialog(group="几何"));

  //========= 换热标定 =========
  parameter Real CF_HeatTransfer = 1.086
    "Lyon 换热系数标定乘子（乘在两侧 γ 上；D 重标。增大=换热更强；受物理壁阻上限约束，不可用于强行凑 440/530℃）"
    annotation(Dialog(tab="换热标定"));

  //========= 初始化 =========
  parameter SI.Temperature T_shell_start = 773.15 "壳侧流体初始温度（500℃）[K]" annotation(Dialog(tab="初始化"));
  parameter SI.Temperature T_tube_start = 753.15 "管侧流体初始温度（480℃）[K]" annotation(Dialog(tab="初始化"));
  parameter SI.Temperature T_wall_start = 763.15 "壁面初始温度（490℃）[K]" annotation(Dialog(tab="初始化"));
  parameter SI.Pressure p_start = 1e5 "初始压力 [Pa]" annotation(Dialog(tab="初始化"));
  parameter SI.MassFlowRate m_flow_shell_start = 280.6/n_tubes
    "壳侧单管初始质量流量 [kg/s]（设计总流量 280.6 kg/s ÷ n_tubes）" annotation(Dialog(tab="初始化"));
  parameter SI.MassFlowRate m_flow_tube_start = 308.4/n_tubes
    "管侧单管初始质量流量 [kg/s]（设计总流量 308.4 kg/s ÷ n_tubes）" annotation(Dialog(tab="初始化"));

  //========= 动态 =========
  parameter Dynamics momentumDynamics = Dynamics.SteadyState
    "两侧动量方程形式（SteadyState=锁流量，避免无谓动态动量导致压力奇异；沿用 HE1 教训）"
    annotation(Dialog(tab="初始化"));
  parameter Dynamics energyDynamics = Dynamics.DynamicFreeInitial
    "壁面能量方程形式（FixedInitial/DynamicFreeInitial=瞬态热容；SteadyState=代数稳态壁。注意 SFR pipe 的流体能量方程恒为动态）"
    annotation(Dialog(tab="初始化"));

  //========= 初始化比焓（pipe 的 initial equation 使用 h_start 而非 T_start） =========
  final parameter SI.SpecificEnthalpy h_shell_start =
    Medium.specificEnthalpy_pTX(p_start, T_shell_start, Medium.reference_X)
    "壳侧初始比焓（由 T_shell_start 换算）";
  final parameter SI.SpecificEnthalpy h_tube_start =
    Medium.specificEnthalpy_pTX(p_start, T_tube_start, Medium.reference_X)
    "管侧初始比焓（由 T_tube_start 换算）";

  //========= 四个 MSL 流体端口（一次侧=壳程 a/b，二次侧=管程 a/b） =========
  Modelica.Fluid.Interfaces.FluidPort_a shell_in(redeclare package Medium = Medium)
    "一次侧（壳程）进口：550℃"
    annotation(Placement(transformation(origin={-102,-62.0181}, extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b shell_out(redeclare package Medium = Medium)
    "一次侧（壳程）出口：440℃（设计值；物理可达值见验证）"
    annotation(Placement(transformation(origin={102,-62.0181}, extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Interfaces.FluidPort_a tube_in(redeclare package Medium = Medium)
    "二次侧（管程）进口：430℃（+x 侧，与壳侧逆流）"
    annotation(Placement(transformation(origin={102,59.9819}, extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b tube_out(redeclare package Medium = Medium)
    "二次侧（管程）出口：530℃（−x 侧，与壳侧逆流）"
    annotation(Placement(transformation(origin={-102,59.9819}, extent={{-10,-10},{10,10}})));

  //========= 主体：壳侧 pipe（一次侧）+ 管侧 pipe（二次侧）+ 积分热导率壁 + 逆流配对 =========
  SFR_Stirling.Fluid.Pipes.pipe shell(
    N=N,
    redeclare package Medium = Medium,
    L_total=L_total,
    Dh(displayUnit="mm") = Dh_shell,
    n_pipe=n_tubes,
    initFromEnthalpy=true,
    h_start=h_shell_start,
    p_start=p_start,
    T_start=T_shell_start,
    T_wall_start=T_wall_start,
    m_flow_start=m_flow_shell_start,
    CF_HeatTransfer=CF_HeatTransfer,
    momentumDynamics=momentumDynamics)
    "一次侧壳程（一回路放射性钠，放热）"
    annotation(Placement(transformation(origin={0,-62}, extent={{-10,-10},{10,10}})));

  SFR_Stirling.Fluid.Pipes.pipe tube(
    N=N,
    redeclare package Medium = Medium,
    L_total=L_total,
    Dh(displayUnit="mm") = Dh_tube,
    n_pipe=n_tubes,
    initFromEnthalpy=true,
    h_start=h_tube_start,
    p_start=p_start,
    T_start=T_tube_start,
    T_wall_start=T_wall_start,
    m_flow_start=m_flow_tube_start,
    CF_HeatTransfer=CF_HeatTransfer,
    momentumDynamics=momentumDynamics)
    "二次侧管程（二回路中间钠，吸热；与壳侧逆流）"
    annotation(Placement(transformation(origin={0,59.9819}, extent={{-10,-10},{10,10}}, rotation=180)));

  SFR_Stirling.Thermal.Wall.WallConduction wall(
    N=N - 1,
    n_tubes=n_tubes,
    r_in=r_tube_in,
    r_out=r_tube_out,
    L_total=L_total,
    T_start=T_wall_start,
    energyDynamics=energyDynamics)
    "积分热导率单节点集总壁：port_a=管侧内表面(r_in)，port_b=壳侧外表面(r_out)"
    annotation(Placement(transformation(origin={0,-8}, extent={{-10,-10},{10,10}}, rotation=90)));

  SFR_Stirling.Thermal.HeatExchange.CounterFlowPair cf(
    n=N - 1,
    counterCurrent=true)
    "逆流索引翻转（管侧第 i 段 ↔ 壁/壳侧第 n−(i−1) 段，保证同一轴向位置配对）"
    annotation(Placement(transformation(origin={0,29.4864}, extent={{-10,-10},{10,10}}, rotation=90)));

  //========= 结果观察（方便 D 直接取数，不影响方程） =========
  SI.Temperature T_shell_out "壳侧出口流体温度 [K]";
  SI.Temperature T_tube_out "管侧出口流体温度 [K]";
  SI.HeatFlowRate Q_shell "壳侧流体放热（正=放热）[W]";
  SI.HeatFlowRate Q_tube "管侧流体吸热（正=吸热）[W]";
  SI.HeatFlowRate Q_wall_from_shell "壳侧流体经外表面传入壁的热流（正=流入壁）[W]";
  SI.HeatFlowRate Q_wall_to_tube "壁经内表面传给管侧流体的热流（正=从壁流出）[W]";
  SI.HeatFlowRate Q_balance "两侧能量不平衡 Q_shell−Q_tube（稳态应≈0，瞬态含壁热容）[W]";
  SI.Temperature T_wall_avg "壁面平均温度 [K]";

equation
  // -------- 四个 MSL 流体端口 --------
  connect(shell.portA, shell_in);
  connect(shell.portB, shell_out);
  connect(tube.portA, tube_in);
  connect(tube.portB, tube_out);

  // -------- 热端口拓扑（按 B 的契约：port_a=管侧内表面，port_b=壳侧外表面） --------
  // 管侧 pipe.wall → CounterFlowPair（逆流翻转）→ wall.port_a（管侧内表面）
  // wall.port_b（壳侧外表面）→ 壳侧 pipe.wall
  connect(tube.wall, cf.port_b);
  connect(cf.port_a, wall.port_a);
  connect(wall.port_b, shell.wall);

  // -------- 结果观察 --------
  T_shell_out = shell.T[N];
  T_tube_out = tube.T[N];
  Q_shell = -sum(shell.Q);
  Q_tube = sum(tube.Q);
  Q_wall_from_shell = sum(wall.Q_b);
  Q_wall_to_tube = -sum(wall.Q_a);
  Q_balance = Q_shell - Q_tube;
  T_wall_avg = sum(wall.T_m)/(N - 1);

  annotation(__MWORKS(version="26.1.3"),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, grid={2,2})),
    experiment(Algorithm=Dassl, InlineIntegrator=false, InlineStepSize=false, Interval=0.01,
      StartTime=0, StopTime=100, StoreEventValue=0, Tolerance=0.0001),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}, grid={2,2}), graphics={
      Rectangle(origin={0,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid,
        extent={{-100,100},{100,-100}}),
      Polygon(origin={73,-62.0181}, fillColor={170,0,0}, fillPattern=FillPattern.Solid,
        points={{-7,16},{7,0.0181},{-7,-16}}),
      Rectangle(origin={-7,-62.0181}, fillColor={170,0,0}, fillPattern=FillPattern.Solid,
        extent={{-73,6},{73,-6}}),
      Polygon(origin={-73,59.9819}, fillColor={170,0,255}, fillPattern=FillPattern.Solid,
        points={{7,16},{-7,0},{7,-16}}),
      Rectangle(origin={7,59.9819}, fillColor={170,0,255}, fillPattern=FillPattern.Solid,
        extent={{73,6},{-73,-6}}),
      Line(origin={-40,0}, points={{20,40},{-20,30},{20,20},{-20,10},{20,0},{-20,-10},{20,-20},{-20,-30},{20,-40}}),
      Line(origin={40,0}, points={{20,40},{-20,30},{20,20},{-20,10},{20,0},{-20,-10},{20,-20},{-20,-30},{20,-40}}),
      Text(extent={{-90,-72},{90,-88}}, lineColor={0,0,255}, textString="IHX"),
      Text(extent={{-90,84},{90,68}}, lineColor={0,0,255}, textString="N=%N, n_tubes=%n_tubes")}),
    Documentation(info="<html>
<h4>模型定位</h4>
<p>直管逆流管壳式中间热交换器（IHX）分节段一维模型。一次侧（一回路放射性钠）走<b>壳程</b>放热；
二次侧（二回路中间钠）走<b>管程</b>吸热；两侧逆流。拓扑结构与既有 <code>HE1</code> 完全一致，
但把 TY <code>TubeWall</code> 替换为 <code>SFR_Stirling.Thermal.Wall.WallConduction</code>：
<b>积分热导率显式径向壁阻 + 单节点集总热容</b>（B 组件，316L 默认材料）。</p>

<h4>拓扑与端口连接</h4>
<pre>
shell pipe(portA=shell_in, portB=shell_out)       // 一次侧壳程
tube  pipe(portA=tube_in,  portB=tube_out)        // 二次侧管程（与壳侧逆流）
connect(tube.wall, cf.port_b)                     // 管侧 → 逆流配对
connect(cf.port_a, wall.port_a)                   // 逆流配对 → 壁内表面(管侧 r_in)
connect(wall.port_b, shell.wall)                  // 壁外表面(壳侧 r_out) → 壳侧
</pre>
<p>端口语义严格按 B 的契约：<code>WallConduction.port_a</code>=管侧内表面（r_in），
<code>WallConduction.port_b</code>=壳侧外表面（r_out）。<code>CounterFlowPair(counterCurrent=true)</code>
把管侧第 i 段映射到壁/壳侧第 n−(i−1) 段，保证同一轴向位置配对（不在别处手工翻转数组）。</p>

<h4>关键参数</h4>
<ul>
<li>N=20（可配 150），壁段 Nw=N−1=19；n_tubes=1440（4×360 合并）；L_total=2 m；</li>
<li>Dh_tube=0.0136 m（管内径），Dh_shell=0.0178 m（4A/P 当量直径）；</li>
<li>r_tube_in/r_tube_out=0.0068/0.008 m（半径口径，φ16×1.2）；</li>
<li>Medium = SFR_Stirling.Media.Sodium.Sodium（变物性钠，ANL Golden &amp; Tokar）；</li>
<li>CF_HeatTransfer=1.086（Lyon Nu 的标定乘子，两侧共用）；</li>
<li>两侧 momentumDynamics=SteadyState（锁流量，防压力奇异）；</li>
<li>壁 energyDynamics 可配：DynamicFreeInitial（瞬态）/ SteadyState（稳态代数壁）。</li>
</ul>

<h4>两侧换热关联式</h4>
<p>由 <code>SFR_Stirling.Fluid.Pipes.BaseClasses.HeatTransfer.circle</code> 实现：
<code>Nu = 5.5 + 0.025·Pe^0.8</code>，<code>γ = Nu·k/D_h</code>，
<code>Q = CF·γ·N_tubes·π·D_h·L·(T_wall − T_fluid)</code>。管侧用 Dh_tube，壳侧用 Dh_shell（与 HE1 同口径，R4）。</p>

<h4>使用说明</h4>
<p>四个 MSL 流体端口：<code>shell_in</code>/<code>shell_out</code>（一次侧 a/b）、
<code>tube_in</code>/<code>tube_out</code>（二次侧 a/b）。使用时两侧入口接 <code>MassFlowSource_T</code>（锁流量与入口温度）、
两侧出口接 <code>Boundary_pT</code>（给定压力）。稳态可令 <code>energyDynamics=SteadyState</code> 后短时仿真收敛；
瞬态用默认 <code>DynamicFreeInitial</code>。结果观察量：<code>T_shell_out</code>、<code>T_tube_out</code>、
<code>Q_shell</code>、<code>Q_tube</code>、<code>Q_balance</code>、<code>T_wall_avg</code>。</p>

<h4>设计口径提醒（R1 决策=方案A）</h4>
<p>按 φ16×1.2 / L=2 m / n=1440 / 316L，物理壁导热上限约 2.2 MW/K，低于设计 UA≈2.77 MW/K，
故 440/530℃ 设计出口在物理上不可达。<b>本模型忠实保留物理壁阻，不以削弱壁阻或调大 CF 凑设计值</b>；
输出物理可达的出口温度，由 D 量化与设计值差距并验证。</p>
</html>"));
end IHX;
