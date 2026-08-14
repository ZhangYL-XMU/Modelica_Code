within SFR.Stirling.DoubleActing;
model DA_Gas_Schmidt
  // 4 缸双作用斯特林热力学核心(Schmidt 等温模型)
  // 复现文献：侯斌等. 用于海上钻井平台的小型钠冷快堆核电源概念设计方案.
  // 原子能科学技术, 2018, 52(3): 494-501
  // 单台 1 MW = 4 组四缸双作用循环, 本模型为其中 1 组(4 缸)
  //
  // 输入: 4 缸活塞位移 s[4](由 MultiBody 机械机构位置传感器实测) + 冷/热端温度 T_h/T_c(来自钠回路边界)
  // 输出: 4 缸活塞力 f[4], 通过 ModelConnectors_Forces 施加到机械活塞
  // 循环 j 由缸 j 的热腔(活塞上方)与缸 j+1 的冷腔(活塞下方)串联构成(闭环)

  // ---- 结构参数(文献表7) ----
  parameter Real D = 0.16 "缸径 [m]";
  parameter Real S = 0.05 "活塞行程 [m]";
  parameter Real A = Modelica.Constants.pi*D^2/4 "活塞面积 [m2]";

  // ---- 工质氦气物性 ----
  parameter Real R_gas = 2077 "氦气气体常数 [J/(kg·K)]";

  // ---- 标称温度(用于确定工质充装质量, 闭式循环质量恒定) ----
  parameter Real T_h_nom = 673.15 "标称热腔温度 [K](氦气 400℃)";
  parameter Real T_c_nom = 303.15 "标称冷腔温度 [K](冷却水 30℃)";

  // ---- 压力 ----
  parameter Real P_m = 2.0e7 "循环参考压力 [Pa](工质最高 20 MPa)";

  // ---- 换热器死容积(文献表7) ----
  parameter Real V_hx = 5.03e-4 "加热器死容积 [m3](80管×内径4mm×长500mm)";
  parameter Real V_reg = 2.67e-3 "回热器死容积 [m3](环形165/255mm×高90mm)";
  parameter Real V_cl = 1.65e-4 "冷却器死容积 [m3](1750管×内径1mm×高120mm)";
  parameter Real V_h0 = 0.0 "热腔余隙容积 [m3]";
  parameter Real V_c0 = 0.0 "冷腔余隙容积 [m3]";

  // ---- 活塞位移参考(与机械 Prismatic 安装位置对应) ----
  // 机械活塞位移实测区间为 [-0.145, -0.095] m, 行程 0.05 m, 中点为 -0.12 m
  // s_ref 取行程中点, 保证 Vh/Vc 恒正且波动幅值 = A·S
  parameter Real s_ref = -0.12 "活塞行程中点参考 [m]";

  // ---- 接口 ----
  Modelica.Blocks.Interfaces.RealInput s[4] "4 缸活塞位移 [m]" annotation(Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealInput T_c "冷腔温度 [K](来自冷却边界)" annotation(Placement(transformation(extent={{-140,-40},{-100,0}})));
  Modelica.Blocks.Interfaces.RealInput T_h "热腔温度 [K](来自钠回路换热边界)" annotation(Placement(transformation(extent={{-140,0},{-100,40}})));
  Modelica.Blocks.Interfaces.RealOutput f[4] "4 个活塞力 [N]" annotation(Placement(transformation(extent={{100,-40},{140,0}})));
  Modelica.Blocks.Interfaces.RealOutput power "指示功率 [W]" annotation(Placement(transformation(extent={{100,40},{140,80}})));

  // ---- 内部变量 ----
  Real Vh[4] "各缸热腔容积 [m3]";
  Real Vc[4] "各缸冷腔容积 [m3]";
  Real Veq[4] "各循环等效容积 [m3/K]";
  Real P[4] "各循环压力 [Pa]";
  Real T_reg "回热器对数平均温度(实时) [K]";
  Real T_reg_nom "回热器标称对数平均温度 [K]";
  Real m "每循环工质质量(常数) [kg]";
  Real Veq_avg "循环等效容积平均值 [m3/K]";

equation
  // 回热器死容积取对数平均温度(实时)
  T_reg = (T_h - T_c)/Modelica.Math.log(T_h/T_c);
  // 标称对数平均温度(用于工质充装质量)
  T_reg_nom = (T_h_nom - T_c_nom)/Modelica.Math.log(T_h_nom/T_c_nom);

  // 循环等效容积平均值(标称温度, 按参考压力确定工质充装质量; 闭式循环质量恒定)
  Veq_avg = (V_h0 + A*S/2)/T_h_nom + (V_c0 + A*S/2)/T_c_nom + V_hx/T_h_nom + V_reg/T_reg_nom + V_cl/T_c_nom;
  m = P_m*Veq_avg/R_gas;

  // 各缸热腔(活塞上方)与冷腔(活塞下方)容积
  // 活塞位于上止点(s 最大)时热腔最小、冷腔最大; 下止点(s 最小)时相反
  for j in 1:4 loop
    Vh[j] = V_h0 + A*(s_ref + S/2 - s[j]);
    Vc[j] = V_c0 + A*(s[j] - s_ref + S/2);
  end for;

  // 双作用循环等效容积: 循环 j 的压缩腔 = 缸 j+1 的冷腔
  Veq[1] = Vh[1]/T_h + Vc[2]/T_c + V_hx/T_h + V_reg/T_reg + V_cl/T_c;
  Veq[2] = Vh[2]/T_h + Vc[3]/T_c + V_hx/T_h + V_reg/T_reg + V_cl/T_c;
  Veq[3] = Vh[3]/T_h + Vc[4]/T_c + V_hx/T_h + V_reg/T_reg + V_cl/T_c;
  Veq[4] = Vh[4]/T_h + Vc[1]/T_c + V_hx/T_h + V_reg/T_reg + V_cl/T_c;

  // 各循环压力(理想气体, 封闭循环质量恒定)
  for j in 1:4 loop
    P[j] = m*R_gas/Veq[j];
  end for;

  // 活塞力: F_j = (P_j - P_{j-1})·A (上方热腔压力 P_j, 下方冷腔压力 P_{j-1})
  f[1] = (P[1] - P[4])*A;
  f[2] = (P[2] - P[1])*A;
  f[3] = (P[3] - P[2])*A;
  f[4] = (P[4] - P[3])*A;

  // 指示功率 = Σ(气体对活塞的净力)·(活塞速度)
  // ModelConnectors_Forces 施加到活塞的力 = -f_mt, 故气体对活塞做功 = -Σ f·ds
  power = -(f[1]*der(s[1]) + f[2]*der(s[2]) + f[3]*der(s[3]) + f[4]*der(s[4]));

  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end DA_Gas_Schmidt;
