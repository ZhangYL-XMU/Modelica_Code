within SFR.Stirling.DoubleActing.Gas_Dynamic;
model DA_Gas_Dynamic
  // 单组 4 缸双作用斯特林机高保真气体动力学组件(非等温、非稳态控制体积模型)
  // 理论来源: stirling-dymola 三部曲的 3 控制体积方法(热侧/回热器/冷侧、理想气体
  //   状态方程、牛顿冷却、集总回热器热容、迎风焓流), 并对三处作严格化修正,
  //   修正依据(教科书/文献级):
  //   - 回热器独立状态方程(替代三部曲 P_l=(P1+P2)/2 人为平均): 控制体积法基本要求,
  //     依据 Urieli&Berechowitz《Stirling Cycle Engine Analysis》理想绝热模型、
  //     沃克《热气机》中译本(田文静论文文献[30])
  //   - 完整能量方程 d(m·cv·T)=Q+Σṁ·cp·T*−P·V̇(替代三部曲热量演化式缺功项/cv·T焓流):
  //     依据工程热力学第一定律开口系能量方程(田文静论文式3-1 同式)
  //   - 压差驱动质量流: 流阻按田文静式3-17~3-24(Δp=−2·Cref·μ·u·V/(d²·A) 反解流量,
  //     出处沃克《热气机》), 由侯斌表7几何确定 —— 替代原无文献出处的常数线性流阻
  //   - 热源温度取钠进口 530℃(表6; 钠出口430℃是斯特林取热结果, 不另计),
  //     U_h/U_c/U_reg 按"氦气稳态≈400℃、冷侧气体≈310℃、回热ε≈0.95~0.97"标定
  //
  // 结构: 4 缸双作用, 循环 i = 缸 i 热腔(活塞上方) + 缸 i+1 冷腔(活塞下方), 闭环
  //       每循环拆 3 控制体积: 热侧(热腔+加热器) / 回热器 / 冷侧(冷腔+冷却器)
  // 注: 位移 s 与速度 v 同时由机械机构提供(位移由位置传感器, 速度由速度传感器)

  import Modelica.Units.SI;

  // ---- 结构参数(文献表7) ----
  parameter SI.Diameter D = 0.16 "缸径 [m]";
  parameter SI.Length S = 0.05 "活塞行程 [m]";
  parameter SI.Area A = Modelica.Constants.pi*D^2/4 "活塞面积 [m2]";

  // ---- 换热器死容积(文献表7) ----
  parameter SI.Volume V_hx = 5.03e-4 "加热器死容积 [m3]";
  parameter SI.Volume V_reg = 2.67e-3 "回热器死容积 [m3]";
  parameter SI.Volume V_cl = 1.65e-4 "冷却器死容积 [m3]";
  parameter SI.Volume V_h0 = 0.0 "热腔余隙容积 [m3]";
  parameter SI.Volume V_c0 = 0.0 "冷腔余隙容积 [m3]";

  // ---- 工质氦气物性 ----
  parameter Real R_gas = 2077 "氦气气体常数 [J/(kg·K)]";
  parameter Real cv = 3116 "氦气定容比热容 [J/(kg·K)]";
  parameter Real cp = cv + R_gas "氦气定压比热容 [J/(kg·K)]";

  // ---- 参考压力(工质最高 20 MPa) ----
  parameter SI.Pressure P_m = 1.35e7 "循环参考压力 [Pa]";

  // ---- 活塞位移参考(与机械 Prismatic 安装位置对应) ----
  parameter SI.Length s_ref = -0.12 "活塞行程中点参考 [m]";

  // ---- 换热能力(换热系数×面积, 按侯斌表6/表7 标定, 见报告修订记录) ----
  parameter Real U_h = 3.7e3 "热侧换热能力(标定: Q_h≈480kW/组÷(803.15−673.15)K → 氦气稳态≈673K) [W/K]";
  parameter Real U_c = 3.0e4 "冷侧换热能力(标定: 冷侧气体≈310K, 比冷却水高约7K) [W/K]";
  parameter Real U_reg = 5.0e4 "回热器换热能力(标定: 表7环形回热器丝网面积≈32m2/组×h≈3000×有效系数, 目标ε≈0.95~0.97, 田文静4.4节ε≈0.98) [W/K]";

  // ---- 流阻(田文静式3-17~3-24, 出处沃克《热气机》: 压降式反解流量, 替代原无出处线性流阻) ----
  parameter SI.Length d_hx = 0.004 "加热管水力直径(表7 管内径) [m]";
  parameter SI.Area A_hx = 80*Modelica.Constants.pi*(0.004/2)^2 "加热器流通面积(表7: 80根管, 单组口径同V_hx) [m2]";
  parameter SI.Length d_rx = 0.0001*0.7/(1.0 - 0.7) "回热器水力直径(丝径0.1mm假设×孔隙率/(1-孔隙率)) [m]";
  parameter SI.Area A_rx = Modelica.Constants.pi/4*(0.255^2 - 0.165^2)*0.7 "回热器流通面积(表7环形×孔隙率0.7) [m2]";
  parameter SI.Length d_cx = 0.002 "冷却器氦气侧水力直径(表7未给, 假设) [m]";
  parameter SI.Area A_cx = V_cl/0.12 "冷却器氦气侧流通面积(假设=V_cl/管长0.12m) [m2]";
  parameter Real A_mu = 196.0 "式3-21后 氦气粘性拟合系数A(单位1e-7 Pa·s, 300K/500K两点拟合)";
  parameter Real B_mu = 0.435 "式3-21后 氦气粘性拟合系数B";

  // ---- 回热器材料 ----
  parameter SI.Mass m_reg_mat = 6.0 "回热器材料质量 [kg]";
  parameter Real cp_reg_mat = 500 "回热器材料比热容 [J/(kg·K)]";

  // ---- 热传导损失 ----
  parameter Real k_o = 0.0 "热传导损失系数 [W/K]";

  // ---- 标称温度与初始质量(用于确定初值) ----
  parameter SI.Temperature T_na_nom = 803.15 "标称钠热源温度(表6: 钠进口530℃; 430℃出口是斯特林取热结果, 不另计) [K]";
  parameter SI.Temperature T_he_nom = 673.15 "标称氦气工质温度(表6: 400℃) [K]";
  parameter SI.Temperature T_water_nom = 303.15 "标称冷却水温度 [K]";
  parameter SI.Temperature T_reg_nom = (T_he_nom - T_water_nom)/Modelica.Math.log(T_he_nom/T_water_nom) "标称回热器温度(对数平均) [K]";
  parameter SI.Mass mh0 = P_m*(V_h0 + A*S/2 + V_hx)/(R_gas*T_he_nom) "热侧初始工质质量 [kg]";
  parameter SI.Mass mc0 = P_m*(V_c0 + A*S/2 + V_cl)/(R_gas*T_water_nom) "冷侧初始工质质量 [kg]";
  parameter SI.Mass mreg0 = P_m*V_reg/(R_gas*T_reg_nom) "回热器初始工质质量 [kg]";

  // ---- 接口 ----
  Modelica.Blocks.Interfaces.RealInput s[4] "4 缸活塞位移 [m]" annotation(Placement(transformation(origin={-120,60},
extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Interfaces.RealInput v[4] "4 缸活塞速度 [m/s]" annotation(Placement(transformation(origin={-120,-60},
extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Interfaces.RealInput T_na "钠热源温度 [K]" annotation(Placement(transformation(origin={-40,120},
extent={{-20,-20},{20,20}},
rotation=-90)));
  Modelica.Blocks.Interfaces.RealInput T_water "冷却水温度 [K]" annotation(Placement(transformation(origin={40,120},
extent={{-20,-20},{20,20}},
rotation=270)));
  Modelica.Blocks.Interfaces.RealOutput f[4] "4 缸活塞力 [N]" annotation(Placement(transformation(extent={{100,-40},{140,0}})));
  Modelica.Blocks.Interfaces.RealOutput power "总指示功率 [W]" annotation(Placement(transformation(extent={{100,40},{140,80}})));
  Modelica.Blocks.Interfaces.RealOutput Q_in "总吸热量 [W]" annotation(Placement(transformation(origin={-40,-122},
extent={{-20,-20},{20,20}},
rotation=270)));
  Modelica.Blocks.Interfaces.RealOutput Q_out "总放热量 [W]" annotation(Placement(transformation(origin={40,-122},
extent={{-20,-20},{20,20}},
rotation=270)));

  // ---- 控制体积几何与体积变化率 ----
  Real Vh[4] "热侧体积(热腔+加热器) [m3]";
  Real Vc[4] "冷侧体积(冷腔+冷却器) [m3]";
  Real Vdot_h[4] "热侧体积变化率 [m3/s]";
  Real Vdot_c[4] "冷侧体积变化率 [m3/s]";

  // ---- 热力学状态 ----
  Real Ph[4] "热侧压力 [Pa]";
  Real Pc[4] "冷侧压力 [Pa]";
  Real Preg[4] "回热器压力 [Pa]";
  Real Th[4](start = fill(T_he_nom, 4)) "热侧温度 [K]";
  Real Tc[4](start = fill(T_water_nom, 4)) "冷侧温度 [K]";
  Real Treg[4](start = fill(T_reg_nom, 4)) "回热器工质温度 [K]";
  Real Tmat[4](start = fill(T_reg_nom, 4)) "回热器材料温度 [K]";
  Real mh[4](start = fill(mh0, 4)) "热侧工质质量 [kg]";
  Real mreg[4](start = fill(mreg0, 4)) "回热器工质质量 [kg]";
  Real mc[4](start = fill(mc0, 4)) "冷侧工质质量 [kg]";

  // ---- 质量流 ----
  Real mp_h[4] "热侧→回热器质量流(正值: 流出热侧) [kg/s]";
  Real mp_c[4] "回热器→冷侧质量流(正值: 流入冷侧) [kg/s]";
  Real mp_h_d[4] "延迟流量(1e-5s, 用于评估流阻, 断开Cref-Re自指代数回路) [kg/s]";
  Real mp_c_d[4] "延迟流量 [kg/s]";

  // ---- 式3-21 流阻评估量(田文静式3-21后: μ/u/ρ/Re; 式3-22~3-24: Cref) ----
  Real T_r_eff "回热器有效温度(田文静3.1.1节 对数平均, 用于式3-21后的粘性公式) [K]";
  Real mu_gas "工质粘性系数(式3-21后) [Pa·s]";
  Real rho_h[4] "加热器侧工质密度 ρ=p/(RT) [kg/m3]";
  Real rho_c[4] "冷却器侧工质密度 [kg/m3]";
  Real u_hx[4] "加热器流速 u=m/(ρA) [m/s]";
  Real u_cx[4] "冷却器流速 [m/s]";
  Real Re_hx[4] "加热器雷诺数(式3-21后) [-]";
  Real Re_cx[4] "冷却器雷诺数 [-]";
  Real Cref_hx[4] "加热器雷诺摩擦系数(式3-22~3-24, CrefSmooth连续化) [-]";
  Real Cref_cx[4] "冷却器雷诺摩擦系数 [-]";
  Real R_hx[4] "热侧↔回热器流阻(式3-21反解: R=2·Cref·μ·V/(d²·A²·ρ)) [Pa·s/kg]";
  Real R_cx[4] "回热器↔冷侧流阻 [Pa·s/kg]";
  Real dp_hx[4] "热侧流阻压降(式3-21) [Pa]";
  Real dp_cx[4] "冷侧流阻压降 [Pa]";

  function CrefSmooth "田文静式3-22~3-24的连续化实现(过渡带±200, 其余区间与论文公式完全一致)"
    input Real Re "雷诺数 [-]";
    output Real Cref "雷诺摩擦系数 [-]";
  protected
    Real fB "过渡段公式值(式3-23)";
    Real fC "湍流段公式值(式3-24)";
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

  // ---- 换热量 ----
  Real Qh[4] "热侧吸热 [W]";
  Real Qc[4] "冷侧放热(负值) [W]";
  Real Qreg[4] "回热器换热 [W]";

equation
  // ---- 式3-21后: μ=[A+B(T_r−293)]×1e−7, T_r 取回热器有效温度(3.1.1节对数平均) ----
  T_r_eff = (T_na - T_water)/Modelica.Math.log(T_na/T_water);
  mu_gas = (A_mu + B_mu*(T_r_eff - 293.0))*1.0e-7;

  for i in 1:4 loop
    // ---- 几何: 循环 i 热腔=缸 i 活塞上方, 冷腔=缸(i+1)活塞下方 ----
    Vh[i] = V_h0 + A*(s_ref + S/2 - s[i]) + V_hx;
    Vc[i] = V_c0 + A*(s[if i == 4 then 1 else i + 1] - s_ref + S/2) + V_cl;

    // ---- 体积变化率(由活塞速度给定) ----
    Vdot_h[i] = -A*v[i];
    Vdot_c[i] = A*v[if i == 4 then 1 else i + 1];

    // ---- 理想气体状态方程(三个控制体积独立压力) ----
    Ph[i]*Vh[i] = mh[i]*R_gas*Th[i];
    Preg[i]*V_reg = mreg[i]*R_gas*Treg[i];
    Pc[i]*Vc[i] = mc[i]*R_gas*Tc[i];

    // ---- 压差驱动质量流: 流阻按田文静式3-17~3-24(出处沃克《热气机》)由表7几何反解,
    //      Cref 用延迟1e-5s流量评估(断开自指代数回路, 数值稳健);
    //      3控制体积拓扑下 mp_h 用加热器几何、mp_c 用冷却器几何(回热器压降并入两侧界面) ----
    mp_h_d[i] = delay(mp_h[i], 1.0e-5);
    mp_c_d[i] = delay(mp_c[i], 1.0e-5);
    rho_h[i] = Ph[i]/(R_gas*Th[i]);
    rho_c[i] = Pc[i]/(R_gas*Tc[i]);
    u_hx[i] = mp_h_d[i]/(rho_h[i]*A_hx);
    u_cx[i] = mp_c_d[i]/(rho_c[i]*A_cx);
    // 式3-21后: Re=ρ·u·d/μ(与流向无关, 取|u|)
    Re_hx[i] = rho_h[i]*abs(u_hx[i])*d_hx/mu_gas;
    Re_cx[i] = rho_c[i]*abs(u_cx[i])*d_cx/mu_gas;
    // 式3-22~3-24: Cref(Re), CrefSmooth 连续化(过渡带±200)
    Cref_hx[i] = CrefSmooth(Re_hx[i]);
    Cref_cx[i] = CrefSmooth(Re_cx[i]);
    // 式3-21反解: R=2·Cref·μ·V/(d²·A²·ρ); ṁ=(p_up−p_down)/R
    R_hx[i] = 2.0*Cref_hx[i]*mu_gas*V_hx/(d_hx^2*A_hx^2*rho_h[i]);
    R_cx[i] = 2.0*Cref_cx[i]*mu_gas*V_cl/(d_cx^2*A_cx^2*rho_c[i]);
    mp_h[i] = (Ph[i] - Preg[i])/R_hx[i];
    mp_c[i] = (Preg[i] - Pc[i])/R_cx[i];
    // 诊断: 式3-21压降
    dp_hx[i] = -R_hx[i]*mp_h[i];
    dp_cx[i] = -R_cx[i]*mp_c[i];

    // ---- 质量守恒(每循环闭式, 总质量恒定) ----
    der(mh[i]) = -mp_h[i];
    der(mreg[i]) = mp_h[i] - mp_c[i];
    der(mc[i]) = mp_c[i];

    // ---- 换热(牛顿冷却; U 标定见参数区: 钠进口530℃→氦气稳态≈400℃) ----
    Qh[i] = U_h*(T_na - Th[i]);
    Qc[i] = U_c*(T_water - Tc[i]);
    Qreg[i] = U_reg*(Tmat[i] - Treg[i]);

    // ---- 能量守恒(温度动态, 质量流携带焓 cp*T, 迎风焓流) ----
    der(mh[i]*cv*Th[i]) = Qh[i]
      - mp_h[i]*cp*(if mp_h[i] > 0 then Th[i] else Treg[i])
      - Ph[i]*Vdot_h[i];
    der(mreg[i]*cv*Treg[i]) = Qreg[i]
      + mp_h[i]*cp*(if mp_h[i] > 0 then Th[i] else Treg[i])
      - mp_c[i]*cp*(if mp_c[i] > 0 then Treg[i] else Tc[i]);
    der(mc[i]*cv*Tc[i]) = Qc[i]
      + mp_c[i]*cp*(if mp_c[i] > 0 then Treg[i] else Tc[i])
      - Pc[i]*Vdot_c[i];

    // ---- 回热器材料热容动态 ----
    der(Tmat[i]) = -Qreg[i]/(m_reg_mat*cp_reg_mat);

    // ---- 活塞力: 上方=循环 i 热侧压力, 下方=循环(i-1)冷侧压力 ----
    f[i] = (Ph[i] - Pc[if i == 1 then 4 else i - 1])*A;
  end for;

  // ---- 总功率与总热量(能量守恒检验) ----
  power = -sum(f .* v);
  Q_in = sum(Qh);
  Q_out = -sum(Qc) + k_o*(T_na - T_water);

  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end DA_Gas_Dynamic;