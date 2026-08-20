within SFR.Stirling.DoubleActing.Gas_Dynamic;
model DA_Gas_Dynamic_Tian
  // 4 缸双作用斯特林发动机气体动力学模型(单组, 1/4 台 1 MW 热气机)
  // =====================================================================
  // 理论基础(唯一): 田文静. 斯特林发动机热力循环计算及性能模拟[D]. 兰州理工大学, 2011.
  //   按田论文 2.2.3 节节点分析法把每循环工作区划分为控制体:
  //     热侧(热腔+加热器) 1 节点 / 回热器 5 节点(论文原文: "回热器分了5个控制体") / 冷侧(冷腔+冷却器) 1 节点
  //   每个 CV 的方程与田论文公式的对应关系(式号即田论文编号):
  //     [式3-1]  开口系能量方程: dQ + (cp·Ti·mi' - cp·To·mo') = dW + cv·d(m·T)
  //              写为时间导数形式用于各 CV(热侧/冷侧含式3-15 体积功 p·dV, 回热器节点定容 dW=0)
  //     [式3-2]  理想气体状态方程 p·V = m·R·T(每个 CV 一个)
  //     [式3-4]  质量守恒: 各 CV 质量变化之和为零(每循环闭式)
  //     [式3-14后] 交界面温度由工质流向决定(迎风): 流出温度 = 流出侧 CV 温度
  //     [式3-15] 做功 dW = p·dV(热腔膨胀功 + 冷腔压缩功), 效率 eta = W/Q_h
  //     [式3-16] 活塞往复(穿梭)热损失: Q_sh = K_g·pi·D_c·S_D·(T_h-T_k)/(4·freq·delta),
  //              每循环 Q_sH = 2·Q_sh; K_g = exp(A+B·ln(T_r)) [W/(cm·K)] 形式取自该式后文
  //     [式3-17~3-20] 流动摩擦阻力: F = tau·Awg; F = 4·tau·V/d; F = 2·Cf·rho·u²·V/d;
  //              F + dP·A = 0(准稳态流动假设, 见田论文4.1.1节)
  //     [式3-21] 压降: dp = -2·Cref·mu·u·V/(d²·A), Cref = Re·Cf, Re = rho·u·d/mu
  //              反解出质量流: mp = (p_up - p_down)/R, R = 2·Cref·mu·V/(d²·A²·rho)
  //              (田论文3.2.3节: 实际循环因粘性摩擦各处压力不相等, 由压降确定分腔压力)
  //     [式3-21后] 粘性系数 mu = [A + B·(T_r-293) + C·p_m]·1e-7 kg/(m·s)
  //              (田论文为氢气 A=88.73, B=0.200, C=0.118, p_m 单位 MPa; 氦气系数按物性重拟合)
  //     [式3-22~3-24] 雷诺摩擦系数 Cref(Re): 16 / 7.343e-4·Re^1.3142 / 0.0791·Re^0.75
  //              (实现为连续化的 CrefSmooth, 过渡带±200, 数值稳定化手段)
  //     [式3-18后] 水力直径 d = 4·V/Awg(回热器丝网 d_rx = 丝径·孔隙率/(1-孔隙率))
  //     [式3-25] 压降做功损失 W_dp = (w/2pi)·∮dp·dV_c(模型中流阻耗散功率 N_p 与之等价)
  //     [式3-28] 回热器换热量 Q̇ = cp·mp·(T_h1-T_h2) = 2·h·Awg·dT(逐节点: Qreg_k=U_reg/n·(Tmat_k-Treg_k))
  //     [式3-30/3-31] NTU = h·Awg/(cp·mp), 回热效率 eps = NTU/(1+NTU)(诊断输出)
  //     [3.1.1节] 回热器平均有效温度 T_r = (T_h-T_k)/ln(T_h/T_k)
  //     [3.2.4.2节+图3.6] 回热器中温度成线性变化: 各节点网阵锚定温度按线性剖面取
  //              T_lin_k = T_k + (k-0.5)/n·(T_h-T_k)(恢复集总丢失的温度剖面, 论文原文假设)
  //     [式4-4]  换热器对流换热(牛顿冷却): Q = h·Awg·(T_w - T_g) → Qh = U_h·(T_na-Th) 等
  //     [式4-5]  壁温修正: T_gh = T_wh - Q_h/(h_h·Awg_h)(U_h 标定依据)
  //     [4.1.2节] 初始条件: 热侧初始温度 = 热壁温, 冷侧 = 冷壁温, 回热器 = 对数平均
  //     [4.1.1节] 准稳态流动假设: 质量流量由其瞬态压降代数确定(不用动量微分方程)
  // 数值稳定化手段(非论文内容, 不改变物理结论):
  //     迎风权重用一阶低通流量评估(tanh连续化式3-14后流向规则 + 断开Cref-Re代数环),
  //     密度/焓流温度/换热量按式3-2显式代入 p·V/(m·R)、m/V(消除 der(p)↔T 代数环,
  //     该符号消元是编译器本应完成的等价变换, Dassl/Ida/Rkfix4 均兼容),
  //     回热器各节点网阵温度向线性剖面锚定(3.2.4.2节线性温度剖面假设的实现)
  //
  // 参数默认值 = 侯斌. 用于海上钻井平台的小型钠冷快堆核电源概念设计方案[J]. 原子能科学技术, 2018, 52(3): 494-501
  //   表7: 缸径160mm/行程50mm, 加热器管径4.0mm×80根×长500mm, 回热器环形内165/外255×高90mm,
  //        冷却器管径1mm×1750根×高120mm, 工质He, 最高压力20MPa
  //   表6: 单台1MW(16缸=4组×4缸双作用, 本模型为其中1组4缸), 钠进/出口530/430°C, 氦气工质400°C
  //        热源温度取钠进口 530°C(钠出口430°C是斯特林取热结果, 不另计)
  //   未给出的参数(孔隙率/丝径/活塞杆径/间隙/转速)取自田论文同型机数值, 逐一注明

  import Modelica.Units.SI;

  // ================= 结构参数(表7) =================
  parameter SI.Diameter D = 0.16 "缸径(表7) [m]" annotation(Dialog(tab = "结构参数", group = "缸体"));
  parameter SI.Length S = 0.05 "活塞行程(表7) [m]" annotation(Dialog(tab = "结构参数", group = "缸体"));
  parameter SI.Diameter d_rod = 0.0 "活塞杆直径(表7未给, 假设为0即忽略杆面积; 田复现时=0.012) [m]" annotation(Dialog(tab = "结构参数", group = "缸体"));
  parameter SI.Length s_ref = -0.12 "活塞行程中点参考位移(与DA_Cylinder的Prismatic安装位对齐, s增大=活塞上移; 正弦驱动测试模型覆盖为0) [m]" annotation(Dialog(tab = "结构参数", group = "缸体"));
  protected
  final parameter SI.Area A_piston = Modelica.Constants.pi*D^2/4 "活塞面积(派生, 不显示) [m2]";
    final parameter SI.Area A_top = A_piston "活塞上方(热腔)有效面积(派生, 不显示) [m2]";
    final parameter SI.Area A_bot = A_piston - Modelica.Constants.pi*d_rod^2/4 "活塞下方(冷腔)有效面积(派生, 不显示) [m2]";
public

  // ================= 换热器几何(表7; 田复现时覆盖) =================
  parameter SI.Length d_hx = 0.004 "加热管内径(表7: 4.0mm) [m]" annotation(Dialog(tab = "换热器几何", group = "加热器"));
  parameter Integer n_hx = 80 "加热管根数(表7) [-]" annotation(Dialog(tab = "换热器几何", group = "加热器"));
  parameter SI.Length L_hx = 0.5 "加热管长度(表7: 500mm) [m]" annotation(Dialog(tab = "换热器几何", group = "加热器"));
  parameter SI.Volume V_hx = n_hx*Modelica.Constants.pi/4*d_hx^2*L_hx "加热器死容积(=5.03e-4, 表7; 默认由几何计算, 田复现时覆盖) [m3]" annotation(Dialog(tab = "换热器几何", group = "加热器"));
  parameter SI.Area A_hx = n_hx*Modelica.Constants.pi/4*d_hx^2 "加热器流通面积(表7; 默认由几何计算, 田复现时覆盖) [m2]" annotation(Dialog(tab = "换热器几何", group = "加热器"));
  parameter SI.Length d_cx = 0.001 "冷却管内径(表7: 1mm) [m]" annotation(Dialog(tab = "换热器几何", group = "冷却器"));
  parameter Integer n_cx = 1750 "冷却管根数(表7) [-]" annotation(Dialog(tab = "换热器几何", group = "冷却器"));
  parameter SI.Length L_cx = 0.12 "冷却器高度(表7: 120mm) [m]" annotation(Dialog(tab = "换热器几何", group = "冷却器"));
  parameter SI.Volume V_cl = n_cx*Modelica.Constants.pi/4*d_cx^2*L_cx "冷却器死容积(=1.65e-4, 表7; 默认由几何计算, 田复现时覆盖) [m3]" annotation(Dialog(tab = "换热器几何", group = "冷却器"));
  parameter SI.Area A_cx = n_cx*Modelica.Constants.pi/4*d_cx^2 "冷却器流通面积(表7; 默认由几何计算, 田复现时覆盖) [m2]" annotation(Dialog(tab = "换热器几何", group = "冷却器"));
  parameter SI.Length D_reg_in = 0.165 "回热器内径(表7) [m]" annotation(Dialog(tab = "换热器几何", group = "回热器"));
  parameter SI.Length D_reg_out = 0.255 "回热器外径(表7) [m]" annotation(Dialog(tab = "换热器几何", group = "回热器"));
  parameter SI.Length L_reg = 0.09 "回热器高度(表7: 90mm) [m]" annotation(Dialog(tab = "换热器几何", group = "回热器"));
  parameter Real eps_por = 0.7 "回热器芯孔隙率(表7未给, 假设0.7) [-]" annotation(Dialog(tab = "换热器几何", group = "回热器"));
  parameter SI.Length d_wire = 1.0e-4 "回热器丝网丝径(表7未给, 假设0.1mm) [m]" annotation(Dialog(tab = "换热器几何", group = "回热器"));
  parameter SI.Volume V_reg = Modelica.Constants.pi/4*(D_reg_out^2 - D_reg_in^2)*L_reg*eps_por "回热器气体总容积(=1.87e-3; 默认由几何计算, 田复现时覆盖) [m3]" annotation(Dialog(tab = "换热器几何", group = "回热器"));
  parameter SI.Area A_rx = V_reg/L_reg "回热器流通面积(气体容积/高度; 默认由几何计算, 田复现时覆盖) [m2]" annotation(Dialog(tab = "换热器几何", group = "回热器"));
  parameter SI.Length d_rx = eps_por*d_wire/(1.0 - eps_por) "回热器水力直径 d=4V/Awg(式3-18后), 丝网几何化简=丝径·孔隙率/(1-孔隙率)(=2.33e-4) [m]" annotation(Dialog(tab = "换热器几何", group = "回热器"));
  parameter Integer n_reg = 20 "回热器节点数(田2.2.3节: 回热器分5控制体是折中, 越多越好; 5节点离散端点温差77K使式3-27的ε≈0.83, 20节点降至19K→ε≈0.95接近论文4.4节的0.98; 可调, 数值越快节点越少) [-]" annotation(Dialog(tab = "换热器几何", group = "回热器"));
  protected
  final parameter SI.Volume V_node = V_reg/n_reg "单节点气体容积(派生, 不显示) [m3]";
public
  // 热腔/冷腔余隙(田论文4.2.2节第6/7条: V_eo=0.05·V_e/S_e 即0.05cm余隙高度; 表7未给, 沿用田值)
  parameter SI.Length clearance = 0.0005 "活塞余隙高度 [m]" annotation(Dialog(tab = "换热器几何", group = "余隙"));
  protected
  final parameter SI.Volume V_h0 = clearance*A_top "热腔余隙容积(派生, 不显示) [m3]";
    final parameter SI.Volume V_c0 = clearance*A_bot "冷腔余隙容积(派生, 不显示) [m3]";
public

  // ================= 工质物性(表7: He; 田复现时改H2) =================
  parameter Real R_gas = 2077 "气体常数(He) [J/(kg·K)]" annotation(Dialog(tab = "工质与工况", group = "工质"));
  parameter Real gamma = 1.667 "比热比(He) [-]" annotation(Dialog(tab = "工质与工况", group = "工质"));
  protected
  final parameter Real cv = R_gas/(gamma - 1.0) "定容比热容(派生, 不显示) [J/(kg·K)]";
    final parameter Real cp = cv*gamma "定压比热容(派生, 不显示) [J/(kg·K)]";
public

  // ================= 工况(表6/表7) =================
  parameter SI.Pressure P_m = 1.87e7 "循环平均(充气)压力 [Pa](表7: 最高20MPa; 仿真压比~1.07, 取18.7MPa使峰值≈20MPa)" annotation(Dialog(tab = "工质与工况", group = "工况"));
  parameter SI.Temperature T_na_nom = 803.15 "标称钠热源温度(表6: 钠进口530°C) [K]" annotation(Dialog(tab = "工质与工况", group = "工况"));
  parameter SI.Temperature T_he_nom = 673.15 "标称热侧气体温度(表6: 氦气400°C, 初值用; 田复现时=壁温1073K) [K]" annotation(Dialog(tab = "工质与工况", group = "工况"));
  parameter SI.Temperature T_water_nom = 303.15 "标称冷却水温度(30°C假设) [K]" annotation(Dialog(tab = "工质与工况", group = "工况"));
  protected
  final parameter SI.Temperature T_reg_nom = (T_he_nom - T_water_nom)/Modelica.Math.log(T_he_nom/T_water_nom) "标称回热器有效温度(3.1.1节对数平均, 派生, 不显示)(=463.7K) [K]";
public

  // ================= 换热能力(式4-4/4-5/3-28 标定) =================
  parameter Real U_h = 7.7e3 "热侧换热能力= h_h·Awg_h(式4-4) [W/K]; 标定(式4-5): Q_h_cyc=1MW/(T_na-T_he)=1e6/130≈7.7e3, 等价h_h≈15.3kW/(m2·K)(20MPa He管内强制对流假设)" annotation(Dialog(tab = "换热能力", group = "换热器"));
  parameter Real U_c = 3.0e4 "冷侧换热能力= h_c·Awg_c [W/K]; 标定: Q_c_cyc≈0.7MW, 冷侧气体≈325K(高于水温~22K)" annotation(Dialog(tab = "换热能力", group = "换热器"));
  parameter Real U_reg = 1.0e5 "回热器总换热能力= 2·h·Awg(式3-28集总到链式, 逐节点U_reg/n_reg) [W/K]; 标定: 丝网湿面积Awg≈32m2×h≈1560W/(m2·K), 目标eps≈0.94~0.98(田论文4.4节eps≈0.98)" annotation(Dialog(tab = "换热能力", group = "回热器"));
  parameter SI.Mass m_reg_mat = 6.0 "回热器网阵总质量 [kg](环形体积2.67e-3m3×网阵占30%×钢密度7800≈6.25, 表7未给材料, 假设不锈钢)" annotation(Dialog(tab = "换热能力", group = "回热器"));
  parameter Real cp_reg_mat = 500 "回热器网阵比热容 [J/(kg·K)](不锈钢假设)" annotation(Dialog(tab = "换热能力", group = "回热器"));
  parameter SI.Time tau_r = 1.0 "回热器各节点网阵向线性剖面温度松弛时间常数(3.2.4.2节线性温度剖面假设的实现) [s]" annotation(Dialog(tab = "换热能力", group = "回热器"));

  // ================= 流阻(式3-17~3-24) =================
  parameter Boolean enableFlowLoss = true "启用流阻压降(式3-17~3-24); false时R取极小值用于理想绝热极限对照" annotation(Dialog(tab = "流阻与损失", group = "流阻(式3-17~3-24)"));
  parameter Real R_min = 1.0e-4 "无流阻对照时的残余流阻 [Pa·s/kg](数值下限, 压差可忽略)" annotation(Dialog(tab = "流阻与损失", group = "流阻(式3-17~3-24)"));
  parameter Real A_mu = 196.0 "式3-21后粘性拟合系数A(He: 300K/500K两点拟合, 单位1e-7 Pa·s; 田原文氢气A=88.73)" annotation(Dialog(tab = "流阻与损失", group = "流阻(式3-17~3-24)"));
  parameter Real B_mu = 0.435 "式3-21后粘性拟合系数B(He拟合; 田原文氢气B=0.200)" annotation(Dialog(tab = "流阻与损失", group = "流阻(式3-17~3-24)"));
  parameter Real C_mu = 0.0 "式3-21后粘性压力项系数(He压力依赖忽略; 田原文氢气C=0.118, p_m单位MPa)" annotation(Dialog(tab = "流阻与损失", group = "流阻(式3-17~3-24)"));
  parameter SI.Time tau_delay = 1.0e-4 "界面流量一阶低通滤波时间常数(断开Cref-Re自指代数环, 数值手段; 为循环周期~0.25%, 远小于物理变化尺度) [s]" annotation(Dialog(tab = "流阻与损失", group = "流阻(式3-17~3-24)"));

  // ================= 穿梭损失(式3-16) =================
  parameter Boolean enableShuttleLoss = true "启用活塞往复(穿梭)热损失(式3-16)" annotation(Dialog(tab = "流阻与损失", group = "穿梭损失(式3-16)"));
  parameter SI.Length delta_gap = 4.5e-4 "活塞-气缸间隙(表7未给, 沿用田论文4.2.2节第16条0.45mm) [m]" annotation(Dialog(tab = "流阻与损失", group = "穿梭损失(式3-16)"));
  parameter Real A_kg = -10.471 "式3-16后导热率系数A(He: 300K/873K两点拟合, W/(cm·K)单位制; 田原文氢气A=-11.004)" annotation(Dialog(tab = "流阻与损失", group = "穿梭损失(式3-16)"));
  parameter Real B_kg = 0.70 "式3-16后导热率系数B(He拟合; 田原文氢气B=0.8130)" annotation(Dialog(tab = "流阻与损失", group = "穿梭损失(式3-16)"));

  // ================= 迎风平滑(数值手段) =================
  parameter SI.MassFlowRate m_upw = 0.02 "迎风切换过渡质量流(式3-14后流向规则的tanh连续化) [kg/s]" annotation(Dialog(tab = "数值参数", group = "数值稳定化"));
  parameter SI.Time tau_v = 1.0e-4 "内部速度一阶高通求导滤波时间常数(等效 v=s/(tau_v·s+1); 25Hz下相位滞后~0.9°, 幅值衰减<0.01%; MWORKS编译器禁止der(input), 用辅助状态实现) [s]" annotation(Dialog(tab = "数值参数", group = "数值稳定化"));

protected
  // ================= 初值质量(式3-2在标称温度下反算, 派生, 不显示) =================
  final parameter SI.Mass mh0 = P_m*(V_h0 + A_top*S/2.0 + V_hx)/(R_gas*T_he_nom) "热侧初始质量(行程中点) [kg]";
  final parameter SI.Mass mc0 = P_m*(V_c0 + A_bot*S/2.0 + V_cl)/(R_gas*T_water_nom) "冷侧初始质量 [kg]";
  final parameter SI.Mass mreg0 = P_m*V_reg/(R_gas*T_reg_nom) "回热器初始总质量(逐节点均分) [kg]";
public

  // ================= 接口(与Stirling_Static风格一致: 位移/温度输入+力输出;
  //                         与DA_Cylinder直连: cyl_i.f_mt ← f[i], cyl_i.s_out → s[i]) =================
  Modelica.Blocks.Interfaces.RealInput s[4] "4缸活塞位移(缸i, s增大=活塞上移) [m]" 
    annotation (Placement(transformation(origin={-122,6}, extent={{-20,-20},{20,20}}), iconTransformation(origin={-100,10})));
  Modelica.Blocks.Interfaces.RealInput T_na "钠热源温度(表6: 钠进口530°C) [K]" 
    annotation (Placement(transformation(origin={-40,120}, extent={{-20,-20},{20,20}}, rotation=-90), iconTransformation(origin={0,100})));
  Modelica.Blocks.Interfaces.RealInput T_water "冷却水温度 [K]" 
    annotation (Placement(transformation(origin={40,120}, extent={{-20,-20},{20,20}}, rotation=-90), iconTransformation(origin={0,-100})));
  Modelica.Blocks.Interfaces.RealOutput f[4] "4缸活塞净气体力(正=向上, 与位移s正方向一致) [N]" 
    annotation (Placement(transformation(origin={120,0},
extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Interfaces.RealOutput power "总指示功率 [W]" 
    annotation (Placement(transformation(origin={120,80},
extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Interfaces.RealOutput Q_in "总吸热量(含穿梭损失, 式4-3的Q_h定义) [W]" 
    annotation (Placement(transformation(origin={-40,-120},
extent={{-20,20},{20,-20}},
rotation=-90)));
  Modelica.Blocks.Interfaces.RealOutput Q_out "总放热量(含穿梭损失) [W]" 
    annotation (Placement(transformation(origin={40,-120},
extent={{-20,20},{20,-20}},
rotation=-90)));
  Modelica.Blocks.Interfaces.RealOutput eta "热效率 power/Q_in(式3-15) [-]" 
    annotation (Placement(transformation(origin={120,-80},
extent={{-20,-20},{20,20}})));

  // ================= 几何与运动(式3-14正弦容积的一般化: 位移由机械机构给定, 速度为内部变量) =================
  Real v[4] "4缸活塞速度(内部变量; MWORKS编译器禁止der(input), 故用辅助状态一阶高通求导, 等效v=s/(tau_v·s+1), 25Hz下滞后~0.9°) [m/s]";
  Real x_s[4](start = fill(0.0, 4)) "位移一阶低通辅助状态(内部求导用) [m]";
  Real Vh[4] "热侧CV体积(热腔+加热器) [m3]";
  Real Vc[4] "冷侧CV体积(冷腔+冷却器) [m3]";
  Real Vdot_h[4] "热侧体积变化率 [m3/s]";
  Real Vdot_c[4] "冷侧体积变化率 [m3/s]";

  // ================= 热力学状态(式3-2每个CV) =================
  Real Ph[4](start = fill(P_m, 4)) "热侧压力 [Pa]";
  Real Pc[4](start = fill(P_m, 4)) "冷侧压力 [Pa]";
  Real Preg[4, n_reg](start = fill(P_m, 4, n_reg)) "回热器各节点压力(节点中心压力) [Pa]";
  Real Th[4] "热侧气体温度 [K]";
  Real Tc[4] "冷侧气体温度 [K]";
  Real Treg[4, n_reg] "回热器各节点气体温度 [K]";
  Real Tmat[4, n_reg](start = fill(T_reg_nom, 4, n_reg)) "回热器各节点网阵温度 [K]";
  Real mh[4](start = fill(mh0, 4)) "热侧气体质量 [kg]";
  Real mreg[4, n_reg](start = fill(mreg0/n_reg, 4, n_reg)) "回热器各节点气体质量 [kg]";
  Real mc[4](start = fill(mc0, 4)) "冷侧气体质量 [kg]";

  // ================= 界面质量流(式3-21反解, 压差驱动; 界面0=热侧↔回热器节点1, 界面k=节点k↔节点k+1, 界面n_reg=节点n_reg↔冷侧) =================
  Real mp_h[4] "热侧界面质量流(正: 流出热侧) [kg/s]";
  Real mp_c[4] "冷侧界面质量流(正: 流入冷侧) [kg/s]";
  Real mp_int[4, n_reg + 1] "全部界面流量 mp_int[i,k], k=0..n_reg [kg/s]";
  Real mp_fh[4](start = fill(0.0, 4)) "热侧界面流量一阶低通滤波值(评估Cref/迎风用, 数值断环手段) [kg/s]";
  Real mp_fr[4](start = fill(0.0, 4)) "回热器平均流量一阶低通滤波值(回热器各界面共用, 质量守恒下界面流量近似均匀) [kg/s]";
  Real mp_fc[4](start = fill(0.0, 4)) "冷侧界面流量一阶低通滤波值 [kg/s]";
  Real mp_rx[4] "回热器内平均流量 [kg/s]";

  // ================= 式3-21流阻评估量 =================
  Real T_r_eff "回热器有效温度(3.1.1节对数平均) [K]";
  Real mu_gas "工质粘性系数(式3-21后) [Pa·s]";
  Real rho_h[4] "热侧密度 rho=m/V(式3-2等价形式) [kg/m3]";
  Real rho_reg[4, n_reg] "回热器各节点密度 [kg/m3]";
  Real rho_c[4] "冷侧密度 [kg/m3]";
  Real u_hx[4] "加热器流速 u=m/(rho·A)(式3-21后) [m/s]";
  Real u_rx[4] "回热器流速 [m/s]";
  Real u_cx[4] "冷却器流速 [m/s]";
  Real Re_hx[4] "加热器雷诺数 Re=rho·u·d/mu [-]";
  Real Re_rx[4] "回热器雷诺数 [-]";
  Real Re_cx[4] "冷却器雷诺数 [-]";
  Real Cref_hx[4] "加热器雷诺摩擦系数(式3-22~3-24) [-]";
  Real Cref_rx[4] "回热器雷诺摩擦系数 [-]";
  Real Cref_cx[4] "冷却器雷诺摩擦系数 [-]";
  Real R_hx[4] "加热器流阻(式3-21反解: R=2·Cref·mu·V/(d²·A²·rho)) [Pa·s/kg]";
  Real R_rx[4] "回热器总流阻 [Pa·s/kg]";
  Real R_cx[4] "冷却器流阻 [Pa·s/kg]";
  Real R_int[4, n_reg + 1] "界面流阻(k=0和n_reg含加热器/冷却器+端部半节点; 中间含两相邻节点各半) [Pa·s/kg]";
  Real dp_hx[4] "加热器压降(式3-21) [Pa]";
  Real dp_rx[4] "回热器总压降 [Pa]";
  Real dp_cx[4] "冷却器压降 [Pa]";

  // ================= 换热量(式4-4/3-28/3-16) =================
  Real Qh[4] "热侧气体吸热(式4-4牛顿冷却) [W]";
  Real Qc[4] "冷侧气体放热(负值) [W]";
  Real Qreg[4, n_reg] "回热器各节点气体-网阵换热(式3-28逐节点) [W]";
  Real Q_sh[4] "穿梭损失(式3-16功率形式) [W]";
  Real K_g "工质导热率 exp(A+B·ln(T_r))(式3-16后) [W/(m·K)]";
  Real T_lin[n_reg] "回热器线性温度剖面各节点锚定温度(3.2.4.2节+图3.6) [K]";

  // ================= 诊断量 =================
  Real th_h[4] "热侧界面迎风权重(式3-14后流向规则的tanh连续化) [-]";
  Real th_c[4] "冷侧界面迎风权重 [-]";
  Real T_h_out[4] "热侧流出焓温度(式3-14后) [K]";
  Real T_c_in[4] "冷侧流入焓温度(式3-14后) [K]";
  Real th_r[4, n_reg - 1] "回热器中间界面迎风权重 [-]";
  Real T_r_out[4, n_reg] "回热器各节点流出焓温度 [K]";
  Real T_r_in[4, n_reg] "回热器各节点流入焓温度 [K]";
  Real NTU[4] "传输单位数(式3-30) [-]";
  Real eps_eff[4] "回热器效率(式3-31) [-]";
  Real N_p[4] "流阻耗散功率(式3-25压降损失的瞬时等价量) [W]";
  Real M_tot[4] "每循环总质量(守恒检验) [kg]";

  function CrefSmooth "式3-22~3-24的连续化实现(过渡带±200, 数值稳定化; 段内与论文公式完全一致)"
    input Real Re "雷诺数 [-]";
    output Real Cref "雷诺摩擦系数 [-]";
  protected
    Real fB "式3-23值";
    Real fC "式3-24值";
    Real t1 "Re 1600→2400 归一化位置";
    Real t2 "Re 3600→4400 归一化位置";
    Real w1 "smoothstep(t1)";
    Real w2 "smoothstep(t2)";
  algorithm
    fB := 7.343e-4*Re^1.3142;
    fC := 0.0791*Re^0.75;
    t1 := if noEvent(Re <= 1600.0) then 0.0 else if noEvent(Re >= 2400.0) then 1.0 else (Re - 1600.0)/800.0;
    t2 := if noEvent(Re <= 3600.0) then 0.0 else if noEvent(Re >= 4400.0) then 1.0 else (Re - 3600.0)/800.0;
    w1 := t1^2*(3.0 - 2.0*t1);
    w2 := t2^2*(3.0 - 2.0*t2);
    Cref := 16.0*(1.0 - w1) + fB*w1*(1.0 - w2) + fC*w1*w2;
  end CrefSmooth;

equation
  // ---- 工质物性随工况(式3-21后 mu; 式3-16后 K_g) ----
  T_r_eff = (T_na - T_water)/Modelica.Math.log(T_na/T_water);
  mu_gas = (A_mu + B_mu*(T_r_eff - 293.0) + C_mu*P_m/1.0e6)*1.0e-7;
  K_g = 100.0*Modelica.Math.exp(A_kg + B_kg*Modelica.Math.log(T_r_eff));

  // ---- 回热器线性温度剖面锚定(3.2.4.2节: 回热器中温度成线性变化; 图3.6) ----
  //      节点1紧邻热侧(高温端), 节点n_reg紧邻冷侧(低温端); 剖面从热端线性降到冷端
  for k in 1:n_reg loop
    T_lin[k] = T_he_nom - (k - 0.5)/n_reg*(T_he_nom - T_water_nom);
  end for;

  for i in 1:4 loop
    // ---- 几何: 循环i热腔=缸i上方, 冷腔=缸(i+1)下方(田论文2.1节: 热腔在上/冷腔在下) ----
    //      位移参考: s=行程中点s_ref, 上止点s_ref+S/2, 下止点s_ref-S/2
    //      速度: 内部一阶高通求导(辅助状态x_s: der(x_s)=(s-x_s)/tau_v, v=(s-x_s)/tau_v,
    //            等效 v=s/(tau_v·s+1)的微分近似; MWORKS编译器禁止直接der(input))
    der(x_s[i]) = (s[i] - x_s[i])/tau_v;
    v[i] = (s[i] - x_s[i])/tau_v;
    Vh[i] = V_h0 + A_top*(s_ref + S/2.0 - s[i]) + V_hx;
    Vc[i] = V_c0 + A_bot*(s[mod(i, 4) + 1] - (s_ref - S/2.0)) + V_cl;
    Vdot_h[i] = -A_top*v[i];
    Vdot_c[i] = A_bot*v[mod(i, 4) + 1];

    // ---- 状态方程(式3-2): 热侧/冷侧 ----
    Ph[i]*Vh[i] = mh[i]*R_gas*Th[i];
    Pc[i]*Vc[i] = mc[i]*R_gas*Tc[i];

    // ---- 流阻(式3-17~3-24): 加热器+回热器链+冷却器压降串联 ----
    //      一阶低通滤波流量评估Cref(断开Cref-Re自指代数环, 数值断环手段)
    //      密度写为 rho=m/V(式3-2的等价形式, 显式消元避免 p/T 代数环, 数值手段)
    der(mp_fh[i]) = (mp_h[i] - mp_fh[i])/tau_delay;
    der(mp_fr[i]) = (mp_rx[i] - mp_fr[i])/tau_delay;
    der(mp_fc[i]) = (mp_c[i] - mp_fc[i])/tau_delay;
    mp_rx[i] = (mp_h[i] + mp_c[i])/2.0;
    rho_h[i] = mh[i]/Vh[i];
    rho_c[i] = mc[i]/Vc[i];
    for k in 1:n_reg loop
      rho_reg[i, k] = mreg[i, k]/V_node;
    end for;
    u_hx[i] = mp_fh[i]/(rho_h[i]*A_hx);
    u_rx[i] = mp_fr[i]/(rho_reg[i, 1]*A_rx);
    u_cx[i] = mp_fc[i]/(rho_c[i]*A_cx);
    Re_hx[i] = rho_h[i]*abs(u_hx[i])*d_hx/mu_gas;
    Re_rx[i] = rho_reg[i, 1]*abs(u_rx[i])*d_rx/mu_gas;
    Re_cx[i] = rho_c[i]*abs(u_cx[i])*d_cx/mu_gas;
    Cref_hx[i] = CrefSmooth(Re_hx[i]);
    Cref_rx[i] = CrefSmooth(Re_rx[i]);
    Cref_cx[i] = CrefSmooth(Re_cx[i]);
    // 式3-21反解: dp = -2·Cref·mu·u·V/(d²·A) = -R·mp, R = 2·Cref·mu·V/(d²·A²·rho)
    R_hx[i] = 2.0*Cref_hx[i]*mu_gas*V_hx/(d_hx^2*A_hx^2*rho_h[i]);
    R_rx[i] = 2.0*Cref_rx[i]*mu_gas*V_reg/(d_rx^2*A_rx^2*rho_reg[i, 1]);
    R_cx[i] = 2.0*Cref_cx[i]*mu_gas*V_cl/(d_cx^2*A_cx^2*rho_c[i]);
    // 界面流阻: 界面0含加热器+回热器第1节点压降之半; 界面n_reg含回热器末节点之半+冷却器;
    //            中间界面含相邻两节点各半压降(节点k流阻=R_rx/n_reg, 按节点密度修正 rho1/rho_k)
    if enableFlowLoss then
      R_int[i, 1] = R_hx[i] + R_rx[i]/(2.0*n_reg);
      for k in 1:n_reg - 1 loop
        R_int[i, k + 1] = (R_rx[i]/(2.0*n_reg))*(rho_reg[i, 1]/rho_reg[i, k] + rho_reg[i, 1]/rho_reg[i, k + 1]);
      end for;
      R_int[i, n_reg + 1] = (R_rx[i]/(2.0*n_reg))*(rho_reg[i, 1]/rho_reg[i, n_reg]) + R_cx[i];
    else
      for k in 0:n_reg loop
        R_int[i, k + 1] = R_min;
      end for;
    end if;
    // 压差驱动界面质量流(3.2.3节: 实际循环分腔压力由压降确定)
    mp_int[i, 1] = (Ph[i] - Preg[i, 1])/R_int[i, 1];
    for k in 1:n_reg - 1 loop
      mp_int[i, k + 1] = (Preg[i, k] - Preg[i, k + 1])/R_int[i, k + 1];
    end for;
    mp_int[i, n_reg + 1] = (Preg[i, n_reg] - Pc[i])/R_int[i, n_reg + 1];
    mp_h[i] = mp_int[i, 1];
    mp_c[i] = mp_int[i, n_reg + 1];
    // 诊断: 式3-21压降
    dp_hx[i] = -R_hx[i]*mp_h[i];
    dp_cx[i] = -R_cx[i]*mp_c[i];
    dp_rx[i] = -(Preg[i, 1] - Preg[i, n_reg]) - (R_int[i, 1] - R_hx[i])*mp_h[i] - (R_int[i, n_reg + 1] - R_cx[i])*mp_c[i];

    // ---- 质量守恒(式3-4): 每循环闭式 ----
    der(mh[i]) = -mp_h[i];
    der(mreg[i, 1]) = mp_int[i, 1] - mp_int[i, 2];
    for k in 2:n_reg - 1 loop
      der(mreg[i, k]) = mp_int[i, k] - mp_int[i, k + 1];
    end for;
    der(mreg[i, n_reg]) = mp_int[i, n_reg] - mp_int[i, n_reg + 1];
    der(mc[i]) = mp_c[i];

    // ---- 换热(式4-4牛顿冷却: 壁温=钠温/水温; 式3-28逐节点: Qreg_k=(U_reg/n)·(Tmat_k-Treg_k)) ----
    //       温度按式3-2显式代入(消环, 数值手段)
    Qh[i] = U_h*(T_na - Ph[i]*Vh[i]/(mh[i]*R_gas));
    Qc[i] = U_c*(T_water - Pc[i]*Vc[i]/(mc[i]*R_gas));
    for k in 1:n_reg loop
      Treg[i, k] = Preg[i, k]*V_node/(mreg[i, k]*R_gas);
      Qreg[i, k] = (U_reg/n_reg)*(Tmat[i, k] - Treg[i, k]);
    end for;

    // ---- 能量方程(式3-1时间导数形式; 推导: cv·d(m·T)/dt = Q̇ + Σcp·T*·mp - p·V̇,
    //        结合式3-2得压力状态形式 der(p)=[(γ-1)·(Q̇±cp·T*·mp) - γ·p·V̇]/V) ----
    // 迎风焓流温度(式3-14后流向规则: 流出温度=流出侧CV温度; tanh连续化+低通流量评估,
    //   温度按式3-2显式代入消除 der(p)↔T 代数环; 数值手段, 物理方程不变):
    //   界面k的迎风权重 th_k = 0.5·(1+tanh(mp_f_k/m_upw)); 焓流温度 = th_k·T_左 + (1-th_k)·T_右
    th_h[i] = 0.5*(1.0 + Modelica.Math.tanh(mp_fh[i]/m_upw));
    th_c[i] = 0.5*(1.0 + Modelica.Math.tanh(mp_fc[i]/m_upw));
    T_h_out[i] = th_h[i]*(Ph[i]*Vh[i]/(mh[i]*R_gas)) + (1.0 - th_h[i])*Treg[i, 1];
    T_c_in[i] = th_c[i]*Treg[i, n_reg] + (1.0 - th_c[i])*(Pc[i]*Vc[i]/(mc[i]*R_gas));
    for k in 1:n_reg - 1 loop
      th_r[i, k] = 0.5*(1.0 + Modelica.Math.tanh(mp_fr[i]/m_upw));
      T_r_out[i, k] = th_r[i, k]*Treg[i, k] + (1.0 - th_r[i, k])*Treg[i, k + 1];
      T_r_in[i, k + 1] = th_r[i, k]*Treg[i, k] + (1.0 - th_r[i, k])*Treg[i, k + 1];
    end for;
    T_r_in[i, 1] = T_h_out[i];
    T_r_out[i, n_reg] = T_c_in[i];
    // 热侧(含式3-15膨胀功 p·dV):
    der(Ph[i]) = ((gamma - 1.0)*(Qh[i] - mp_h[i]*cp*T_h_out[i]) - gamma*Ph[i]*Vdot_h[i])/Vh[i];
    // 回热器各节点(定容 dW=0, 式3-11条件):
    for k in 1:n_reg loop
      der(Preg[i, k]) = (gamma - 1.0)*(Qreg[i, k] + mp_int[i, k]*cp*T_r_in[i, k] - mp_int[i, k + 1]*cp*T_r_out[i, k])/V_node;
    end for;
    // 冷侧(含式3-15压缩功 p·dV):
    der(Pc[i]) = ((gamma - 1.0)*(Qc[i] + mp_c[i]*cp*T_c_in[i]) - gamma*Pc[i]*Vdot_c[i])/Vc[i];

    // ---- 回热器各节点网阵热容(式3-28的热平衡) + 线性剖面锚定(3.2.4.2节+图3.6) ----
    for k in 1:n_reg loop
      der(Tmat[i, k]) = -Qreg[i, k]/((m_reg_mat/n_reg)*cp_reg_mat) + (T_lin[k] - Tmat[i, k])/tau_r;
    end for;

    // ---- 穿梭损失(式3-16: Q_sh=K_g·pi·D·S·(T_h-T_k)/(4·freq·delta), 每循环Q_sH=2·Q_sh,
    //        功率形式 Q̇=K_g·pi·D·S·(T_h-T_k)/(2·delta), 式中T_h/T_k为缸壁热/冷端温度限=钠温/水温) ----
    Q_sh[i] = if enableShuttleLoss then K_g*Modelica.Constants.pi*D*S*(T_na - T_water)/(2.0*delta_gap) else 0.0;

    // ---- 活塞力(双作用): 上方=循环i热腔, 下方=循环(i-1)冷腔(正=向上, 与位移s正方向一致) ----
    f[i] = - (Pc[if i == 1 then 4 else i - 1]*A_bot - Ph[i]*A_top);

    // ---- 诊断 ----
    NTU[i] = U_reg/(2.0*cp*max(abs(mp_rx[i]), m_upw));
    eps_eff[i] = NTU[i]/(1.0 + NTU[i]);
    N_p[i] = R_hx[i]*mp_h[i]^2 + R_rx[i]*mp_rx[i]^2 + R_cx[i]*mp_c[i]^2;
    M_tot[i] = mh[i] + sum(mreg[i, :]) + mc[i];
  end for;

  // ---- 总功率与总热量(式3-15: W=W_c+W_e的功率形式; 式4-3: 吸热量含穿梭损失Q_sH) ----
  power = sum(-f .* v);
  Q_in = sum(Qh + Q_sh);
  Q_out = sum(Q_sh - Qc);
  eta = power/max(Q_in, 1.0);

initial equation
  // 网阵初值取线性温度剖面(3.2.4.2节+图3.6), 与锚定目标自洽, 消除启动爬坡瞬态(稳态初值)
  for i in 1:4 loop
    for k in 1:n_reg loop
      Tmat[i, k] = T_lin[k];
    end for;
  end for;
  // 求导辅助状态初值与位移一致, 使初始速度 v(0)=(s-x_s)/tau_v=0, 避免启动瞬态尖峰
  for i in 1:4 loop
    x_s[i] = s[i];
  end for;

  annotation(
    Icon(coordinateSystem(extent={{-100,-100},{100,100}},
preserveAspectRatio=true,
grid={2,2})),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end DA_Gas_Dynamic_Tian;