within SFR_Stirling.Thermal.Wall;
model WallConduction
  "圆柱壁径向积分热导率 + 单节点集总热容：每段一个壁温状态，port_a=管侧内表面 r_in，port_b=壳侧外表面 r_out"
  import SI = Modelica.Units.SI;
  import Modelica.Constants;
  import Modelica.Fluid.Types.Dynamics;
  import Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a;
  import Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b;

  //========= 壁材（可替换记录） =========
  replaceable record Material = SFR_Stirling.Thermal.Wall.Materials.Steel316L
    constrainedby SFR_Stirling.Thermal.Wall.Materials.PartialWallMaterial
    "壁材（默认 316L 不锈钢；可换 Tabulated 或其它材料记录）"
    annotation(choicesAllMatching=true, Dialog(tab="材料"));
  Material material "壁材记录实例（提供 rho、cp）";

  //========= 几何 / 离散 =========
  parameter Integer N(min=1) = 19 "轴向分段数（= 相连 pipe 的 Nw = pipe.N - 1）"
    annotation(Dialog(tab="几何"));
  parameter Integer n_tubes(min=1) = 1 "并联管数（G、C 均按此缩放，端口 Q 为总管束口径）"
    annotation(Dialog(tab="几何"));
  parameter SI.Length r_in = 0.0068 "管壁内半径（m，管侧表面）" annotation(Dialog(tab="几何"));
  parameter SI.Length r_out = 0.008 "管壁外半径（m，壳侧表面）" annotation(Dialog(tab="几何"));
  parameter SI.Length L_total = 2 "壁总长度（m）" annotation(Dialog(tab="几何"));

  //========= 初始化 / 动态 =========
  parameter SI.Temperature T_start = 713.15 "每段壁温初始温度（K）" annotation(Dialog(tab="初始化"));
  parameter Dynamics energyDynamics = Dynamics.DynamicFreeInitial "能量平衡形式"
    annotation(Dialog(tab="初始化"));
  parameter Boolean includeWallConduction = true
    "=true：含径向积分热导率壁阻；=false：退化纯热容耦合（两侧同温，等价旧 TubeWall）"
    annotation(Dialog(tab="模型结构"));

  //========= 端口 =========
  HeatPort_a port_a[N] "管侧（内表面 r_in）热端口"
    annotation(Placement(transformation(origin={-110,0}, extent={{-10,-10},{10,10}}),
      iconTransformation(origin={-110,0}, extent={{-10,-10},{10,10}})));
  HeatPort_b port_b[N] "壳侧（外表面 r_out）热端口"
    annotation(Placement(transformation(origin={110,0}, extent={{10,-10},{-10,10}}),
      iconTransformation(origin={110,0}, extent={{10,-10},{-10,10}})));

  //========= 派生几何参数 =========
  final parameter SI.Length[N] L = fill(L_total/N, N) "每段长度";
  final parameter SI.Volume[N] V_wall = fill(n_tubes*Constants.pi*(r_out^2 - r_in^2)*(L_total/N), N)
    "每段壁体总容积（含 n_tubes 并行缩放）";

  //========= 变量 =========
  SI.Temperature[N] T_m(each start=T_start, each stateSelect=StateSelect.prefer) "每段壁节点温度";
  SI.ThermalConductivity[N] lambda_bar "每段积分平均热导率";
  SI.ThermalConductance[N] G_wall "每段整壁热导（含 n_tubes）";
  SI.HeatCapacity[N] C_wall "每段整壁热容（含 n_tubes）";
  SI.HeatFlowRate[N] Q_a "port_a 侧流入壁的热流（W，流入为正）";
  SI.HeatFlowRate[N] Q_b "port_b 侧流入壁的热流（W，流入为正）";

equation
  for i in 1:N loop
    // 积分平均热导率（随两侧表面温度变化；稳态精确还原圆柱径向导热）
    lambda_bar[i] = Material.lambdaBar(port_a[i].T, port_b[i].T);
    // 整壁热导：G = 2*pi*L_i*lambdaBar*n_tubes/ln(r_out/r_in)
    G_wall[i] = 2*Constants.pi*L[i]*lambda_bar[i]*n_tubes/Modelica.Math.log(r_out/r_in);
    // 整壁热容：C = rho*cp*pi*(r_out^2-r_in^2)*L_i*n_tubes
    C_wall[i] = n_tubes*Constants.pi*(r_out^2 - r_in^2)*L[i]*material.rho*material.cp;

    if includeWallConduction then
      // 两个半热阻（各 1/(2G)）夹中央热容节点；稳态 Q_a=G*(T_a-T_b) 精确
      port_a[i].Q_flow = 2*G_wall[i]*(port_a[i].T - T_m[i]);
      port_b[i].Q_flow = 2*G_wall[i]*(port_b[i].T - T_m[i]);
    else
      // 退化：纯热容耦合（两侧同温、无壁阻；Q 由连接方给定，等价旧 TubeWall）
      port_a[i].T = T_m[i];
      port_b[i].T = T_m[i];
    end if;

    // 能量守恒（端口热流流入为正）
    if energyDynamics == Dynamics.SteadyState then
      0 = port_a[i].Q_flow + port_b[i].Q_flow;
    else
      C_wall[i]*der(T_m[i]) = port_a[i].Q_flow + port_b[i].Q_flow;
    end if;

    // 便于测试/后处理观测
    Q_a[i] = port_a[i].Q_flow;
    Q_b[i] = port_b[i].Q_flow;
  end for;

initial equation
  for i in 1:N loop
    if energyDynamics == Dynamics.FixedInitial then
      T_m[i] = T_start;
    end if;
  end for;

  annotation(defaultComponentName="wall",
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}, grid={2,2}), graphics={
      Rectangle(extent={{-30,100},{30,-100}}, lineColor={0,0,0}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),
      Rectangle(extent={{-20,100},{20,-100}}, lineColor={0,0,0}, fillColor={255,255,255}, fillPattern=FillPattern.HorizontalCylinder),
      Text(extent={{-150,-90},{150,-60}}, lineColor={0,0,255}, textString="%name"),
      Text(extent={{-90,60},{90,30}}, lineColor={0,0,255}, textString="WallConduction"),
      Text(extent={{-90,-30},{90,-60}}, lineColor={0,0,255}, textString="N=%N, nt=%n_tubes")}),
    Documentation(info="<html>
<h4>功能</h4>
<p>圆柱壁径向<b>积分热导率</b> + <b>单节点集总热容</b>的独立壁面组件。每段一个壁温状态 <code>T_m[i]</code>，
两侧壁面温度由端口 <code>port_a[i].T</code>（管侧内表面 r_in）与 <code>port_b[i].T</code>（壳侧外表面 r_out）给出。</p>

<h4>关键方程（每段 i）</h4>
<pre>
lambda_bar_i = (Kint(T_a_i) - Kint(T_b_i)) / (T_a_i - T_b_i)      // 积分平均热导率
G_i          = 2*pi*L_i*lambda_bar_i*n_tubes / ln(r_out/r_in)       // 整壁热导
Q_a_i        = 2*G_i*(T_a_i - T_m_i)
Q_b_i        = 2*G_i*(T_b_i - T_m_i)
C_i*dT_m_i/dt = Q_a_i + Q_b_i                                      // C_i = rho*cp*pi*(r_out^2-r_in^2)*L_i*n_tubes
</pre>
<p>稳态时 Q_a + Q_b = 0 ⇒ T_m=(T_a+T_b)/2，Q_a = G_i*(T_a−T_b) =
2*pi*L_i*lambda_bar_i*n_tubes/ln(r_out/r_in)*(T_a−T_b)，精确还原圆柱径向导热式（规格书式(7)/(8)/(11)）。</p>

<h4>端口语义</h4>
<ul>
<li><code>port_a</code>：管侧内表面（r_in），热流流入壁为正；</li>
<li><code>port_b</code>：壳侧外表面（r_out），热流流入壁为正；</li>
<li>端口温度由本组件代数关系约束，<code>Q_flow</code> 由本组件给出，与 <code>SFR_Stirling.Fluid.Pipes.pipe</code> 的
<code>wall</code> 热端口（Q 由 pipe.heatTransfer 给出）自然闭合，不会过约束。</li>
</ul>

<h4>退化选项</h4>
<p><code>includeWallConduction=false</code> 时强制 <code>port_a.T=port_b.T=T_m</code>，即纯热容耦合，
复现旧 <code>Thermal.Volumes.TubeWall</code> 的“无导热热阻”行为（仅供对照，默认不启用）。</p>

<h4>使用示例（IHX 中）</h4>
<pre>
SFR_Stirling.Thermal.Wall.WallConduction wall(N=N-1, n_tubes=n_tubes,
  r_in=r_tube_in, r_out=r_tube_out, L_total=L_total, T_start=T_wall_start);
connect(cf.port_a, wall.port_a);   // 管侧（经 CounterFlowPair 逆流翻转）
connect(wall.port_b, shell.wall);  // 壳侧
</pre>
</html>"));
end WallConduction;
