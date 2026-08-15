within SFR.Stirling.DoubleActing;
model DA_Gas_Dynamic
  // 单组 4 缸双作用斯特林机高保真气体动力学组件(非等温、非稳态控制体积模型)
  // 严格参考 Gas_Dynamic_new 的建模方法, 并修正为压差驱动的质量流:
  //   - 理想气体状态方程(热侧/回热器/冷侧三个控制体积各自独立压力)
  //   - 压差驱动质量流(热侧↔回热器↔冷侧, 由压差与流阻决定, 保证压力平衡)
  //   - 质量守恒(三控制体积闭式, 总质量恒定)
  //   - 能量守恒(温度动态, 非等温, 质量流携带焓 cp*T)
  //   - 换热(热侧吸热 / 冷侧放热 / 回热器换热)
  //   - 回热器材料热容动态
  //   - 热传导损失
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
  parameter SI.Pressure P_m = 2.0e7 "循环参考压力 [Pa]";

  // ---- 活塞位移参考(与机械 Prismatic 安装位置对应) ----
  parameter SI.Length s_ref = -0.12 "活塞行程中点参考 [m]";

  // ---- 换热能力(换热系数×面积, 需按实际换热器标定) ----
  parameter Real U_h = 2.0e5 "热侧换热能力 [W/K]";
  parameter Real U_c = 2.0e5 "冷侧换热能力 [W/K]";
  parameter Real U_reg = 500 "回热器换热能力 [W/K]";

  // ---- 流阻(压差驱动质量流, 决定热/冷/回热器压力平衡) ----
  parameter Real R_h = 1.0e5 "热侧↔回热器流阻 [Pa·s/kg]";
  parameter Real R_c = 1.0e5 "回热器↔冷侧流阻 [Pa·s/kg]";

  // ---- 回热器材料 ----
  parameter SI.Mass m_reg_mat = 6.0 "回热器材料质量 [kg]";
  parameter Real cp_reg_mat = 500 "回热器材料比热容 [J/(kg·K)]";

  // ---- 热传导损失 ----
  parameter Real k_o = 0.0 "热传导损失系数 [W/K]";

  // ---- 标称温度与初始质量(用于确定初值) ----
  parameter SI.Temperature T_na_nom = 673.15 "标称钠热源温度 [K]";
  parameter SI.Temperature T_water_nom = 303.15 "标称冷却水温度 [K]";
  parameter SI.Temperature T_reg_nom = (T_na_nom - T_water_nom)/Modelica.Math.log(T_na_nom/T_water_nom) "标称回热器温度(对数平均) [K]";
  parameter SI.Mass mh0 = P_m*(V_h0 + A*S/2 + V_hx)/(R_gas*T_na_nom) "热侧初始工质质量 [kg]";
  parameter SI.Mass mc0 = P_m*(V_c0 + A*S/2 + V_cl)/(R_gas*T_water_nom) "冷侧初始工质质量 [kg]";
  parameter SI.Mass mreg0 = P_m*V_reg/(R_gas*T_reg_nom) "回热器初始工质质量 [kg]";

  // ---- 接口 ----
  Modelica.Blocks.Interfaces.RealInput s[4] "4 缸活塞位移 [m]" annotation(Placement(transformation(extent={{-140,-60},{-100,-20}})));
  Modelica.Blocks.Interfaces.RealInput v[4] "4 缸活塞速度 [m/s]" annotation(Placement(transformation(extent={{-140,-100},{-100,-60}})));
  Modelica.Blocks.Interfaces.RealInput T_na "钠热源温度 [K]" annotation(Placement(transformation(extent={{-140,0},{-100,40}})));
  Modelica.Blocks.Interfaces.RealInput T_water "冷却水温度 [K]" annotation(Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput f[4] "4 缸活塞力 [N]" annotation(Placement(transformation(extent={{100,-40},{140,0}})));
  Modelica.Blocks.Interfaces.RealOutput power "总指示功率 [W]" annotation(Placement(transformation(extent={{100,40},{140,80}})));
  Modelica.Blocks.Interfaces.RealOutput Q_in "总吸热量 [W]" annotation(Placement(transformation(extent={{100,0},{140,40}})));
  Modelica.Blocks.Interfaces.RealOutput Q_out "总放热量 [W]" annotation(Placement(transformation(extent={{100,-80},{140,-40}})));

  // ---- 控制体积几何与体积变化率 ----
  Real Vh[4] "热侧体积(热腔+加热器) [m3]";
  Real Vc[4] "冷侧体积(冷腔+冷却器) [m3]";
  Real Vdot_h[4] "热侧体积变化率 [m3/s]";
  Real Vdot_c[4] "冷侧体积变化率 [m3/s]";

  // ---- 热力学状态 ----
  Real Ph[4] "热侧压力 [Pa]";
  Real Pc[4] "冷侧压力 [Pa]";
  Real Preg[4] "回热器压力 [Pa]";
  Real Th[4](start = fill(T_na_nom, 4)) "热侧温度 [K]";
  Real Tc[4](start = fill(T_water_nom, 4)) "冷侧温度 [K]";
  Real Treg[4](start = fill(T_reg_nom, 4)) "回热器工质温度 [K]";
  Real Tmat[4](start = fill(T_reg_nom, 4)) "回热器材料温度 [K]";
  Real mh[4](start = fill(mh0, 4)) "热侧工质质量 [kg]";
  Real mreg[4](start = fill(mreg0, 4)) "回热器工质质量 [kg]";
  Real mc[4](start = fill(mc0, 4)) "冷侧工质质量 [kg]";

  // ---- 质量流 ----
  Real mp_h[4] "热侧→回热器质量流(正值: 流出热侧) [kg/s]";
  Real mp_c[4] "回热器→冷侧质量流(正值: 流入冷侧) [kg/s]";

  // ---- 换热量 ----
  Real Qh[4] "热侧吸热 [W]";
  Real Qc[4] "冷侧放热(负值) [W]";
  Real Qreg[4] "回热器换热 [W]";

equation
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

    // ---- 压差驱动质量流(保证压力平衡) ----
    mp_h[i] = (Ph[i] - Preg[i])/R_h;
    mp_c[i] = (Preg[i] - Pc[i])/R_c;

    // ---- 质量守恒(每循环闭式, 总质量恒定) ----
    der(mh[i]) = -mp_h[i];
    der(mreg[i]) = mp_h[i] - mp_c[i];
    der(mc[i]) = mp_c[i];

    // ---- 换热(牛顿冷却) ----
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
