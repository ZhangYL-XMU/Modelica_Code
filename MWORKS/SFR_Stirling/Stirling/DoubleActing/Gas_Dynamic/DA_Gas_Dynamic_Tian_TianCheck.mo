within SFR.Stirling.DoubleActing.Gas_Dynamic;
model DA_Gas_Dynamic_Tian_TianCheck
  // DA_Gas_Dynamic_Tian 的田文静论文复现验证模型
  // 用田论文 4.2 节/表1 的 20kW 四缸双作用斯特林发动机参数(氢气/1073K/303K/15.5MPa/30.35Hz)
  // 驱动同一套气体动力学方程, 与田论文表2 结果对照:
  //   表2: 1073K 时理想绝热效率 66.6%(1078K行66.7%插值), 计及损失效率 40.8%
  // 输入全部使用 Modelica 基础库组件:
  //   位移: Sine(相位0/90/180/270°) × FirstOrder阶跃包络(1-exp(-t/0.15)平滑启动) + s_ref偏置
  //   速度: 模型内部变量对位移求导(v=der(s)), 无需外部提供
  //   温度: Constant 常量源(田4.2.1节 T1=1073K 加热壁温, T2=303K 冷壁温)
  // 双实例对照:
  //   gasNominal — 田名义参数(流阻+穿梭损失): 预期效率低于66.6%
  //   gasLimit   — 极限对照(U→∞, 无流阻, 无穿梭): 逼近理想绝热上限
  // 田参数(4.2节): 缸径5.5cm/行程4cm/杆径1.2cm, 加热管φ0.3cm×60cm×18根,
  //   回热器2个(φ4.5cm×6.2cm, 孔隙率0.67, 丝径0.05mm, 并联等效), 冷却管φ0.1cm×8cm×199根×2个,
  //   余隙0.05cm, 连通容积V_hr=V_rk=2cm3/V_kc=4cm3(归并至相邻换热器), 工质氢气R=4124/γ=1.405
  //   粘性μ=[88.73+0.200(T_r-293)+0.118·p_m]·1e-7(式3-21后, 氢气原文系数), p_m单位MPa
  //   穿梭损失K_g=exp(-11.004+0.8130·ln(T_r)) W/(cm·K)(式3-16后, 氢气原文系数), 间隙0.45mm

  import Modelica.Units.SI;

  parameter Real f_hz = 30.35 "频率(田4.2.1节第10条) [Hz]";
  parameter SI.Length s_ref = 0.0 "测试用位移参考 [m]";
  parameter SI.Length amp = 0.02 "行程半幅=Se/2(田4.2.1节第6/7条行程4cm) [m]";
  parameter SI.Time tau_start = 0.15 "启动平滑时间常数 [s]";

  // ================= 输入源组件(Modelica 基础库) =================
  // ---- 启动包络: Constant(1) → FirstOrder 阶跃响应 = 1-exp(-t/tau_start) ----
  Modelica.Blocks.Sources.Constant envStep(k = 1) "单位阶跃输入(生成平滑启动包络)" annotation(Placement(transformation(extent={{-123,-10},{-103,10}})));
  Modelica.Blocks.Continuous.FirstOrder envelope(T = tau_start, k = 1, y_start = 0) "启动包络 1-exp(-t/0.15)(0→1平滑过渡)" annotation(Placement(transformation(extent={{-93,-10},{-73,10}})));

  // ---- 4 缸位移: 相位 0/90/180/270°, 热腔体积领先冷腔 90°(田4.2.1节第9条) ----
  Modelica.Blocks.Sources.Sine sine1(amplitude = amp, f = f_hz, phase = 0) "缸1位移正弦(相位0°)" annotation(Placement(transformation(extent={{-75,80},{-55,100}})));
  Modelica.Blocks.Sources.Sine sine2(amplitude = amp, f = f_hz, phase = Modelica.Constants.pi/2) "缸2位移正弦(相位90°)" annotation(Placement(transformation(extent={{-75,20},{-55,40}})));
  Modelica.Blocks.Sources.Sine sine3(amplitude = amp, f = f_hz, phase = Modelica.Constants.pi) "缸3位移正弦(相位180°)" annotation(Placement(transformation(extent={{-75,-40},{-55,-20}})));
  Modelica.Blocks.Sources.Sine sine4(amplitude = amp, f = f_hz, phase = 3*Modelica.Constants.pi/2) "缸4位移正弦(相位270°)" annotation(Placement(transformation(extent={{-75,-100},{-55,-80}})));

  // ---- 包络×正弦 + 位移参考偏置 ----
  Modelica.Blocks.Math.Product prod1 annotation(Placement(transformation(extent={{-45,80},{-25,100}})));
  Modelica.Blocks.Math.Product prod2 annotation(Placement(transformation(extent={{-45,20},{-25,40}})));
  Modelica.Blocks.Math.Product prod3 annotation(Placement(transformation(extent={{-45,-40},{-25,-20}})));
  Modelica.Blocks.Math.Product prod4 annotation(Placement(transformation(extent={{-45,-100},{-25,-80}})));
  Modelica.Blocks.Sources.Constant sOffset(k = s_ref) "位移行程中点偏置" annotation(Placement(transformation(extent={{-27,68},{-7,88}})));
  Modelica.Blocks.Math.Add add1 annotation(Placement(transformation(extent={{3,68},{23,88}})));
  Modelica.Blocks.Math.Add add2 annotation(Placement(transformation(extent={{3,16},{23,36}})));
  Modelica.Blocks.Math.Add add3 annotation(Placement(transformation(extent={{3,-36},{23,-16}})));
  Modelica.Blocks.Math.Add add4 annotation(Placement(transformation(extent={{3,-88},{23,-68}})));

  // ---- 速度: 模型内部变量对位移求导(v=der(s)), 无需外部提供 ----

  // ---- 热源/冷源温度(田4.2.1节: 加热壁温1073K, 冷壁温303K) ----
  Modelica.Blocks.Sources.Constant T_na_src(k = 1073.0) "加热器壁面温度(热源) [K]" annotation(Placement(transformation(extent={{3,-46},{23,-26}})));
  Modelica.Blocks.Sources.Constant T_water_src(k = 303.0) "冷却器壁面温度(冷源) [K]" annotation(Placement(transformation(extent={{3,-98},{23,-78}})));

  // ================= 被验证的气体动力学实例 =================
  // ---- 田名义参数实例(氢气, 1073K, 15.5MPa) ----
  DA_Gas_Dynamic_Tian gasNominal(
    D = 0.055,
    S = 0.04,
    d_rod = 0.012,
    s_ref = s_ref,
    d_hx = 0.003,
    n_hx = 18,
    L_hx = 0.6,
    V_hx = 7.834e-5,          // 加热器7.634e-5 + 连通V_hr 2e-6
    A_hx = 1.272e-4,
    d_cx = 0.001,
    n_cx = 398,               // 199根×2个冷却器
    L_cx = 0.08,
    V_cl = 2.901e-5,          // 冷却器2.501e-5 + 连通V_kc 4e-6
    A_cx = 3.126e-4,
    V_reg = 1.3434e-4,        // 田式V_r=π·h·(d/2)²·ε·n_r=132.34cm3 + 连通V_rk 2e-6
    A_rx = 2.167e-3,          // 2个回热器并联等效: V_reg/0.062(并联布置假设, 流阻为串联的1/4)
    d_rx = 1.015e-4,          // 丝径5e-5×孔隙率0.67/(1-0.67)
    clearance = 0.0005,
    R_gas = 4124,
    gamma = 1.405,
    P_m = 15.5e6,
    T_na_nom = 1073.0,
    T_he_nom = 1073.0,        // 田4.1.2节: T_he=T_e=T_wh(热侧初温=热壁温)
    T_water_nom = 303.0,
    U_h = 1.0e4,              // 近似等温加热器(田2.2.2.1节理想绝热假设: 加热器无限换热), 与表2"理想绝热+损失修正"框架对齐
    U_c = 1.0e4,              // 近似等温冷却器(同上)
    U_reg = 1.0e5,            // 田4.4节: 其回热器效率≈0.98 → NTU=49 → U_reg=2·NTU·cp·mp≈1e5
    m_reg_mat = 0.508,        // 网阵质量=V_geo·(1-ε)·ρ_ss=1.975e-4×0.33×7800
    cp_reg_mat = 500,
    tau_r = 1.0,
    m_upw = 0.01,             // 迎风过渡流量(田机峰值流量~0.06kg/s的~17%)
    tau_delay = 1.0e-4,       // 滤波时间常数(田机周期0.033s的~0.3%)
    A_mu = 88.73,
    B_mu = 0.200,
    C_mu = 0.118,             // 式3-21后氢气原文系数, p_m单位MPa
    delta_gap = 0.45e-3,      // 田4.2.2节第16条活塞-气缸间隙0.45mm
    A_kg = -11.004,
    B_kg = 0.8130)            // 式3-16后氢气原文系数
    annotation(Placement(transformation(origin={172,-81},
extent={{-50,-50},{50,50}})));

  // ---- 理想绝热极限对照实例(U→∞, 流阻→0, 穿梭→0) ----
  DA_Gas_Dynamic_Tian gasLimit(
    D = 0.055,
    S = 0.04,
    d_rod = 0.012,
    s_ref = s_ref,
    d_hx = 0.003,
    n_hx = 18,
    L_hx = 0.6,
    V_hx = 7.834e-5,
    A_hx = 1.272e-4,
    d_cx = 0.001,
    n_cx = 398,
    L_cx = 0.08,
    V_cl = 2.901e-5,
    A_cx = 3.126e-4,
    V_reg = 1.3434e-4,
    A_rx = 2.167e-3,
    d_rx = 1.015e-4,
    clearance = 0.0005,
    R_gas = 4124,
    gamma = 1.405,
    P_m = 15.5e6,
    T_na_nom = 1073.0,
    T_he_nom = 1073.0,
    T_water_nom = 303.0,
    U_h = 1.0e5,
    U_c = 1.0e5,
    U_reg = 1.0e5,
    m_reg_mat = 0.508,
    cp_reg_mat = 500,
    tau_r = 1.0,
    enableFlowLoss = false,
    enableShuttleLoss = false,
    m_upw = 0.01,
    tau_delay = 1.0e-4,
    A_mu = 88.73,
    B_mu = 0.200,
    C_mu = 0.118,
    delta_gap = 0.45e-3,
    A_kg = -11.004,
    B_kg = 0.8130) 
    annotation(Placement(transformation(origin={154,75},
extent={{-50,-50},{50,50}})));

equation
  // ---- 启动包络: 1-exp(-t/0.15) ----
  connect(envStep.y, envelope.u) annotation(Line(points={{-103,0},{-93,0}}));

  // ---- 位移: (正弦×包络) + 偏置 ----
  connect(sine1.y, prod1.u1) annotation(Line(points={{-55,90},{-45,90}}));
  connect(envelope.y, prod1.u2) annotation(Line(points={{-73,0},{-59,0},{-59,90},{-45,90}}));
  connect(sine2.y, prod2.u1) annotation(Line(points={{-55,30},{-45,30}}));
  connect(envelope.y, prod2.u2) annotation(Line(points={{-73,0},{-59,0},{-59,30},{-45,30}}));
  connect(sine3.y, prod3.u1) annotation(Line(points={{-55,-30},{-45,-30}}));
  connect(envelope.y, prod3.u2) annotation(Line(points={{-73,0},{-59,0},{-59,-30},{-45,-30}}));
  connect(sine4.y, prod4.u1) annotation(Line(points={{-55,-90},{-45,-90}}));
  connect(envelope.y, prod4.u2) annotation(Line(points={{-73,0},{-59,0},{-59,-90},{-45,-90}}));
  connect(prod1.y, add1.u1) annotation(Line(points={{-25,90},{-11,90},{-11,78},{3,78}}));
  connect(sOffset.y, add1.u2) annotation(Line(points={{-7,78},{3,78}}));
  connect(prod2.y, add2.u1) annotation(Line(points={{-25,30},{-11,30},{-11,26},{3,26}}));
  connect(sOffset.y, add2.u2) annotation(Line(points={{-7,78},{-2,78},{-2,26},{3,26}}));
  connect(prod3.y, add3.u1) annotation(Line(points={{-25,-30},{-11,-30},{-11,-26},{3,-26}}));
  connect(sOffset.y, add3.u2) annotation(Line(points={{-7,78},{-2,78},{-2,-26},{3,-26}}));
  connect(prod4.y, add4.u1) annotation(Line(points={{-25,-90},{-11,-90},{-11,-78},{3,-78}}));
  connect(sOffset.y, add4.u2) annotation(Line(points={{-7,78},{-2,78},{-2,-78},{3,-78}}));

  // ---- 位移 → 气体动力学(两实例共用同一运动输入) ----
  connect(add1.y, gasNominal.s[1]) annotation(Line(origin={0,0},
points={{24,78},{81,78},{81,-78},{111,-78}}));
  connect(add2.y, gasNominal.s[2]) annotation(Line(origin={0,0},
points={{24,26},{81,26},{81,-78},{111,-78}}));
  connect(add3.y, gasNominal.s[3]) annotation(Line(origin={0,0},
points={{24,-26},{27,-26},{27,-78},{111,-78}}));
  connect(add4.y, gasNominal.s[4]) annotation(Line(origin={0,0},
points={{24,-78},{111,-78}}));
  connect(add1.y, gasLimit.s[1]) annotation(Line(origin={0,0},
points={{24,78},{93,78}}));
  connect(add2.y, gasLimit.s[2]) annotation(Line(origin={0,0},
points={{24,26},{27,26},{27,78},{93,78}}));
  connect(add3.y, gasLimit.s[3]) annotation(Line(origin={0,0},
points={{24,-26},{81,-26},{81,78},{93,78}}));
  connect(add4.y, gasLimit.s[4]) annotation(Line(origin={0,0},
points={{24,-78},{81,-78},{81,78},{93,78}}));

  // ---- 热源/冷源温度(两实例共用) ----
  connect(T_na_src.y, gasNominal.T_na) annotation(Line(origin={0,0},
points={{24,-36},{27,-36},{27,-9},{152,-9},{152,-21}}));
  connect(T_water_src.y, gasNominal.T_water) annotation(Line(origin={0,0},
points={{24,-88},{27,-88},{27,-9},{192,-9},{192,-21}}));
  connect(T_na_src.y, gasLimit.T_na) annotation(Line(origin={0,0},
points={{24,-36},{27,-36},{27,147},{134,147},{134,135}}));
  connect(T_water_src.y, gasLimit.T_water) annotation(Line(origin={0,0},
points={{24,-88},{27,-88},{27,147},{174,147},{174,135}}));

  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(Algorithm = Dassl, InlineIntegrator = false, InlineStepSize = false,
      Interval = 0.002, StartTime = 0, StopTime = 1, StoreEventValue = 0,
      Tolerance = 0.001));
end DA_Gas_Dynamic_Tian_TianCheck;