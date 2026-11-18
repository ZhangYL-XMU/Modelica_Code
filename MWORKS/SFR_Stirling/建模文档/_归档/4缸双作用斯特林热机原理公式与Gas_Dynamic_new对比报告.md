# 单组 4 缸双作用斯特林热机详细原理报告

**—— 气体动力学与机械耦合建模, 及与 Gas_Dynamic_new 的对比**

| 项目 | 内容 |
|------|------|
| 建模平台 | MWORKS.Sysplorer (Modelica) |
| 参考模型 | `SFR.Stirling.DoubleActing.DA_Gas_Dynamic` / `DA_Cylinder` / `DA_4Cylinder_Validation` |
| 对比基准 | `SFR.Stirling.Gas_Dynamic.Gas_Dynamic_new` (β 型单机) |
| 设计工况 | 氦气 20 MPa, 热源 400°C (钠), 冷源 30°C (水), 文献表 7 结构参数 |
| 日期 | 2026-08-15 |

---

## 1. 系统概述

单组 4 缸双作用斯特林热机由两大子系统组成：

| 子系统 | 模型 | 职责 |
|--------|------|------|
| 气体动力学 | `DA_Gas_Dynamic` | 12 个控制体积的热力学状态、质量流、换热、指示功率, 输出 4 缸活塞力 $f[4]$ |
| 机械机构 | `DA_Cylinder` × 4 (封装于 `DA_4Cylinder_Validation`) | MultiBody 曲柄滑块机构, 曲柄相位差 90°, 返回活塞位移 $s[4]$, 接收气体力 |

两子系统闭环耦合: 气体动力学由位移/速度计算压力 → 压力差产生活塞力 → 活塞力驱动曲柄滑块机构 → 机构运动改变体积 → 体积与压力耦合决定热力学状态。转速 $w$ 由热力学扭矩与负载阻尼平衡自洽求解, **不预设转速**。

---

## 2. 4 缸双作用斯特林循环原理

### 2.1 循环拓扑

双作用 (double-acting) 构型的核心思想: **每个活塞的上、下两面分别属于两个不同的热力学循环**。对 4 缸机:

$$\text{循环 } i = \underbrace{\text{缸 } i \text{ 热腔(活塞上方)}}_{\text{高温侧}} \;+\; \underbrace{\text{缸 } i+1 \text{ 冷腔(活塞下方)}}_{\text{低温侧}} \quad (\text{模 4 闭环})$$

相邻缸曲柄相位差 90°, 因此循环 $i$ 的热腔与冷腔体积变化相位差 90° —— 这正是斯特林循环要求的"膨胀容积与压缩容积相位错开"条件。

### 2.2 活塞力

缸 $j$ 活塞上表面受循环 $j$ 热腔压力 $P_{h,j}$, 下表面受循环 $j-1$ 冷腔压力 $P_{c,j-1}$, 故:

$$F_j = \left( P_{h,j} - P_{c,j-1} \right) A, \qquad A = \frac{\pi D^2}{4}$$

### 2.3 指示功率

$$\dot{W} = - \sum_{j=1}^{4} F_j \, v_j$$

符号约定: 气体对活塞做正功 (压力推动活塞运动) 时 $F_j$ 与 $v_j$ 同向, 气体输出功率为正。

---

## 3. 气体动力学模型 (DA_Gas_Dynamic)

### 3.1 控制体积划分

每个循环拆分为 **3 个控制体积** (共 4 循环 × 3 = 12 个):

| 控制体积 | 组成 | 体积 |
|----------|------|------|
| 热侧 h | 热腔 (活塞上方) + 加热器死容积 | $V_{h,i} = V_{h0} + A\left(s_{\text{ref}} + \frac{S}{2} - s_i\right) + V_{hx}$ |
| 回热器 reg | 回热器死容积 (恒定) | $V_{reg}$ |
| 冷侧 c | 冷腔 (活塞下方) + 冷却器死容积 | $V_{c,i} = V_{c0} + A\left(s_{i+1} - s_{\text{ref}} + \frac{S}{2}\right) + V_{cl}$ |

体积变化率由活塞速度给定:

$$\dot{V}_{h,i} = -A\, v_i, \qquad \dot{V}_{c,i} = +A\, v_{i+1}$$

其中 $s_{\text{ref}} = -0.12\ \text{m}$ 为活塞行程中点参考位移 (与机械 Prismatic 安装位置对应)。

### 3.2 状态方程 (理想气体, 三腔独立压力)

$$\begin{aligned}
P_{h,i} V_{h,i} &= m_{h,i} R_g T_{h,i} \\
P_{reg,i} V_{reg} &= m_{reg,i} R_g T_{reg,i} \\
P_{c,i} V_{c,i} &= m_{c,i} R_g T_{c,i}
\end{aligned}$$

氦气物性: $R_g = 2077\ \text{J/(kg·K)}$, $c_v = 3116\ \text{J/(kg·K)}$, $c_p = c_v + R_g = 5193\ \text{J/(kg·K)}$。

### 3.3 质量流: 压差驱动 (关键)

$$\dot{m}_{h,i} = \frac{P_{h,i} - P_{reg,i}}{R_h}, \qquad \dot{m}_{c,i} = \frac{P_{reg,i} - P_{c,i}}{R_c}$$

其中 $R_h = R_c = 1.0\times10^5\ \text{Pa·s/kg}$ 为等效流阻。压差驱动保证热侧、回热器、冷侧压力始终趋于平衡 (稳态压差仅 0.3%), 使系统维持 20 MPa 量级的循环压力。

### 3.4 质量守恒 (每循环闭式)

$$\frac{d m_{h,i}}{dt} = -\dot{m}_{h,i}, \qquad \frac{d m_{reg,i}}{dt} = \dot{m}_{h,i} - \dot{m}_{c,i}, \qquad \frac{d m_{c,i}}{dt} = \dot{m}_{c,i}$$

三式相加得 $\dfrac{d}{dt}(m_{h,i} + m_{reg,i} + m_{c,i}) = 0$, 每循环工质总质量严格守恒。

### 3.5 能量守恒 (非等温, 焓流迎风)

$$\frac{d}{dt}\left( m_{h,i} c_v T_{h,i} \right) = Q_{h,i} - \dot{m}_{h,i} c_p T^{\ast}_{h,i} - P_{h,i} \dot{V}_{h,i}$$

$$\frac{d}{dt}\left( m_{reg,i} c_v T_{reg,i} \right) = Q_{reg,i} + \dot{m}_{h,i} c_p T^{\ast}_{h,i} - \dot{m}_{c,i} c_p T^{\ast}_{c,i}$$

$$\frac{d}{dt}\left( m_{c,i} c_v T_{c,i} \right) = Q_{c,i} + \dot{m}_{c,i} c_p T^{\ast}_{c,i} - P_{c,i} \dot{V}_{c,i}$$

其中迎风焓流温度 (质量流携带焓, 取上游温度):

$$T^{\ast}_{h,i} = \begin{cases} T_{h,i}, & \dot{m}_{h,i} > 0 \\ T_{reg,i}, & \dot{m}_{h,i} \le 0 \end{cases}, \qquad T^{\ast}_{c,i} = \begin{cases} T_{reg,i}, & \dot{m}_{c,i} > 0 \\ T_{c,i}, & \dot{m}_{c,i} \le 0 \end{cases}$$

### 3.6 换热模型 (牛顿冷却)

$$\begin{aligned}
Q_{h,i} &= U_h \left( T_{na} - T_{h,i} \right), & U_h &= 2.0\times10^5\ \text{W/K} \\
Q_{c,i} &= U_c \left( T_{water} - T_{c,i} \right), & U_c &= 2.0\times10^5\ \text{W/K} \\
Q_{reg,i} &= U_{reg} \left( T_{mat,i} - T_{reg,i} \right), & U_{reg} &= 500\ \text{W/K}
\end{aligned}$$

### 3.7 回热器材料热容动态

$$\frac{d T_{mat,i}}{dt} = -\frac{Q_{reg,i}}{m_{reg,mat}\, c_{p,reg,mat}}, \qquad m_{reg,mat} = 6.0\ \text{kg}, \quad c_{p,reg,mat} = 500\ \text{J/(kg·K)}$$

### 3.8 总热量与热损失

$$Q_{in} = \sum_{i=1}^{4} Q_{h,i}, \qquad Q_{out} = -\sum_{i=1}^{4} Q_{c,i} + k_o (T_{na} - T_{water}), \qquad k_o = 0$$

### 3.9 初值

$$\begin{aligned}
T_{reg,nom} &= \frac{T_{na,nom} - T_{water,nom}}{\ln\left( T_{na,nom} / T_{water,nom} \right)} = 478\ \text{K} \\
m_{h0} &= \frac{P_m \left( V_{h0} + A\,S/2 + V_{hx} \right)}{R_g T_{na,nom}}, \quad m_{c0} = \frac{P_m \left( V_{c0} + A\,S/2 + V_{cl} \right)}{R_g T_{water,nom}} \\
m_{reg0} &= \frac{P_m V_{reg}}{R_g T_{reg,nom}}, \qquad P_m = 2.0\times10^7\ \text{Pa}
\end{aligned}$$

---

## 4. 机械模型 (DA_Cylinder × 4)

### 4.1 机构拓扑

每缸为 MultiBody 曲柄滑块机构: 机架 → 气缸 (Prismatic 移动副) → 活塞 → 活塞销 (Revolute) → 连杆 → 曲柄销 (RevolutePlanarLoopConstraint) → 曲柄链。4 缸曲轴串联, 曲柄相位由 `crankAngleOffset` = $0,\ \pi/2,\ \pi,\ 3\pi/2$ 设定。飞轮 (转动惯量 $J$) 与负载阻尼 ($D$) 串联在曲轴上。

### 4.2 气体力施加

`ModelConnectors_Forces` (即 gasForce) 满足 $f = -f_{mt}$, 连接方式:

- `flange_a` → Prismatic 的 `axis` (移动副驱动轴)
- `flange_b` → Prismatic 的 `support` (固定支撑)

由此气体力 $f_{mt}$ 转化为作用于活塞的力, 机械与热力学通过 `gasForce.f_mt = f_mt` 方程直接耦合。

### 4.3 机械动力学

$$\begin{cases}
J \dfrac{d\omega}{dt} = \tau_{gas} - D\,\omega \\
\tau_{gas} = \sum_j F_j \cdot \dfrac{v_j}{\omega} \quad \text{(曲柄滑块运动学换算)}
\end{cases}$$

转速自洽收敛于气体扭矩与阻尼扭矩的平衡点 $\omega_{eq} = \sqrt{\tau_{gas}/D}$。模型中对子组件输出用解析求导 `gas.v[j] = der(cyl_j.s_out)` 获得活塞速度 (Modelica 不允许对输入变量求导)。

---

## 5. 与 Gas_Dynamic_new 的对比

| 对比项 | Gas_Dynamic_new (β 型单机) | DA_Gas_Dynamic (本模型, 4 缸双作用) |
|--------|---------------------------|-------------------------------------|
| **构型** | β 型: 膨胀活塞 (d1) 与压缩活塞 (d2) 同轴布置 | 双作用 α 型: 4 缸, 每活塞上热下冷跨缸组循环 |
| **循环拓扑** | 单循环, 2 活塞 | 4 循环闭环, 循环 $i$ = 缸 $i$ 热腔 + 缸 $i+1$ 冷腔 |
| **控制体积数** | 3 (膨胀缸 / 通道 / 压缩缸) | 12 (4 循环 × 热侧/回热器/冷侧) |
| **位移来源** | 内嵌正弦轨迹 $s_d = \frac{1+\sin(u_1 t + \pi/2)}{10}$, $s_p = \frac{1+\sin(ut)}{10}$, **与机械机构无关** | 由 MultiBody 曲柄滑块机构位置传感器输入 $s[4]$, **机械-热力学双向耦合** |
| **速度来源** | 同一正弦解析给定 | 机械模型输出解析求导 $v_j = \dot{s}_j$ |

### 5.1 状态方程与压力求解

| 项 | Gas_Dynamic_new | 本模型 |
|----|-----------------|--------|
| 形式 | 摩尔基: $V_1 P_1 = n_1 R T_1$, $V_2 P_2 = n_2 R T_2$ ($R$ = 8314.472 J/(kmol·K), $M$ = 4 kg/kmol) | 质量基: $P V = m R_g T$ ($R_g$ = 2077 J/(kg·K)) |
| 通道/回热器压力 | $P_l = \dfrac{P_1 + P_2}{2}$ **人为算术平均, 无独立状态方程** | $P_{reg,i} V_{reg} = m_{reg,i} R_g T_{reg,i}$ **独立状态方程** |

> **缺陷修正 1**: 本模型开发初期曾模仿 $P_{reg} = (P_h + P_c)/2$ 人为平均, 仿真中热侧压力从 20 MPa 飙升至 100 MPa 而发散。回热器是实际容积 $V_{reg} = 2.67\times10^{-3}\ \text{m}^3$ 的气室, 必须有独立状态方程约束其压力, 算术平均违反质量与状态耦合关系。

### 5.2 质量流驱动机制 (核心差异)

| 项 | Gas_Dynamic_new | 本模型 |
|----|-----------------|--------|
| 机制 | **体积驱动**: $\dot{m}_1 = c\,A_{an}\,\rho^{\ast}$ (通道流速 × 环形间隙面积 × 迎风密度) | **压差驱动**: $\dot{m} = \dfrac{\Delta P}{R}$ |
| 表达式 | $\dot{m}_1 = \begin{cases} c A_{an} \rho_l, & c<0 \\ c A_{an} \rho_1, & c>0 \end{cases}$, $\dot{m}_2 = \begin{cases} c A_{an} \rho_2, & c<0 \\ c A_{an} \rho_l, & c>0 \end{cases}$ | $\dot{m}_{h,i} = \frac{P_{h,i}-P_{reg,i}}{R_h}$, $\dot{m}_{c,i} = \frac{P_{reg,i}-P_{c,i}}{R_c}$ |
| 压力平衡 | 无法自洽 (质量流不响应压差, 热侧压力畸变至 85 MPa vs 冷侧 19 MPa) | 自动保证三腔压力平衡 (稳态压差 0.3%) |
| 温度自洽 | 热侧温度飙至 960 K, **超过热源 673 K, 违反热力学第二定律** | $T_h = 673.8\ \text{K}$, 低于热源, 物理正确 |
| 动量/流阻 | 半经验动量方程 $(P_1-P_2)A_{an} - A_l\mu\frac{\dot{s}_d}{(d_c-d_1)/2} = \frac{c\,\dot{m}_l}{20u} + \frac{m_l\,\dot{c}}{20u}$ | 集总流阻 $R$ 直接定义 $\dot{m} = \Delta P/R$ |

> **缺陷修正 2** (本模型开发历程): 体积驱动质量流 $\dot{m} = \dot{V}\rho$ 只反映"扫过的体积", 不响应压差——热侧体积被压缩时质量来不及流出, 压力持续畸变; 温度因压缩功加热超过热源温度 (第二定律违反); 功率反向 (被倒拖)。改为压差驱动后全部症状消失。

### 5.3 能量方程形式

| 项 | Gas_Dynamic_new | 本模型 |
|----|-----------------|--------|
| 状态量 | 热量 $Q = m c_v T$ 作为微分状态 (`der(Qc)`, `der(Q_l)`, `der(Qf)`) | $m c_v T$ 直接求导 (质量与温度同时为状态) |
| 焓流 | **携带 $c_v T$**: 如 $\dot{m}_1 c_v T^{\ast}$ | **携带 $c_p T$**: $\dot{m} c_p T^{\ast}$ — 质量流携带焓而非内能, 热力学更严格 |
| 迎风判断 | `if c<0 / c>0` 按活塞速度方向分段 | 按质量流本身符号 $\dot{m} \gtrless 0$ 判断 (与压差驱动自洽) |
| 体积功 | 无显式 $P\dot{V}$ 项 (功率单独经验式计算) | 显式 $-P\dot{V}$ 体积功项 |
| 回热器热流 | 通道能量方程加 $Q_{p,reg}$ | 回热器工质独立能量方程, $Q_{reg}$ 在回热器腔内部 |

### 5.4 换热与回热器

| 项 | Gas_Dynamic_new | 本模型 |
|----|-----------------|--------|
| 热源换热 | $Q_{pc} = U_c (u_2 - T_1)$ | $Q_{h,i} = U_h (T_{na} - T_{h,i})$ |
| 冷源换热 | $Q_{pf} = -U_f (T_2 - u_3)$ | $Q_{c,i} = U_c (T_{water} - T_{c,i})$ |
| 换热能力 | 未列数值, 需外部给定 `Uc/Uf/Ac/Af` | $U_h = U_c = 2.0\times10^5$ W/K (经标定可传 MW 级热量) |
| 回热器 | 单一蓄热器: $\frac{d}{dt}(m_{reg} c_{p,reg} T_{reg}) = -U_{reg}(T_{reg} - T_l)$ (工质温度作为蓄热温度) | **工质腔 + 材料两级**: 工质温度 $T_{reg}$ 由能量方程求, 材料温度 $T_{mat}$ 由 $\frac{dT_{mat}}{dt} = -\frac{Q_{reg}}{m_{reg,mat} c_{p,reg,mat}}$ 求, 换热 $Q_{reg} = U_{reg}(T_{mat} - T_{reg})$ |
| 蓄热损失 | 经验式 $Q_{pr} = n_t \times 15000 \times (T_1 - T_2)$ | 无经验项, 由控制体积方程严格推出 |

### 5.5 功率计算

| 项 | Gas_Dynamic_new | 本模型 |
|----|-----------------|--------|
| 方法 1 | Beale 经验式: $\dot{W}_{cal} = \pm \frac{B_n Z \pi}{8} P_l d_1^2 c$, $B_n = 0.33\frac{u_2-u_3}{u_2+u_3}$ | — |
| 方法 2 | 能量平衡: $\dot{W} = Q_{pc} + Q_{pf} - Q_{po} - Q_{pr}$ | 能量平衡检验: $Q_{in} - Q_{out}$ 与指示功率对照 |
| 指示功率 | 无 (经验式代替) | $\dot{W} = -\sum F_j v_j$ (**力 × 速度直接积分**, 物理意义最直接) |
| 热损失 | $Q_{po} = k_o (u_2 - u_3)$, $k_o = 5$ | $Q_{out}$ 含 $k_o (T_{na} - T_{water})$, 当前 $k_o = 0$ (预留) |

### 5.6 活塞力

| 项 | Gas_Dynamic_new | 本模型 |
|----|-----------------|--------|
| 压缩活塞 | $f = (P_2 - P_{ini}) A_2$ (对大气压 $P_{ini}$ = 100 kPa) | — |
| 膨胀活塞 | $f_1 = (P_1 - P_{ini}) A_1 \times \frac{16}{25}$ | — |
| 双作用活塞 | — | $F_j = (P_{h,j} - P_{c,j-1}) A$ (**两循环压差直接作用**, 无大气压基准, 符合闭式循环) |

### 5.7 接口与可耦合性

| 项 | Gas_Dynamic_new | 本模型 |
|----|-----------------|--------|
| 外部温度输入 | 有 ($u_2$ 热源 / $u_3$ 冷源) | 有 ($T_{na}$ 钠热源 / $T_{water}$ 冷却水, 已为耦合钠冷快堆一/二回路预留) |
| 位移/速度 | **内部正弦, 不可由机构驱动** | 输入 $s[4]$, $v[4]$, 由机构反馈 — 可做机械-热力学闭环 |
| 力输出 | 有 ($f$, $f_1$) | 有 ($f[4]$ 直接进各缸 gasForce) |
| 转速 | 外部给定 $u$ (开环) | **自洽求解** (气体扭矩 vs 阻尼平衡) |

---

## 6. 数值验证结果

### 6.1 正弦驱动测试 (DA_Gas_Dynamic_test, 转速固定 100 rad/s)

| 量 | 结果 |
|----|------|
| 指示功率 | +71 kW (周期稳态) |
| 三腔压差 | 0.1% (压力平衡验证) |
| $T_h / T_c / T_{reg}$ | 674.4 / 305.3 / 470.7 K |
| 质量守恒 | 总质量恒定 ✓ |

### 6.2 机械-热力学闭环 (DA_4Cylinder_Validation, J = 15, D = 15)

| 量 | 结果 |
|----|------|
| 转速 | 100 → 56.8 rad/s (543 rpm) 自洽收敛 |
| 指示功率 | 45.4 kW (均值 48.9 kW) |
| 阻尼消耗 | $D\omega^2 = 48.5$ kW — 与气体功率能量平衡吻合 ✓ |
| $T_h / T_c / T_{reg}$ | 673.8 / 304.2 / 478 K |
| 循环压力 | $P_h \approx P_c \approx 21.5$ MPa (压差 0.3%) |
| 热效率 | ≈ 7.4% (偏低, 待标定 $U_{reg}$ 及换热系数向文献单组 250 kW 靠拢) |

---

## 7. 开发历程中的物理缺陷修复

| 缺陷 | 症状 | 根因 | 修复 |
|------|------|------|------|
| 1. 回热器缺状态方程 | $P_h$ 从 20 飙到 100 MPa, 发散 | $P_{reg} = (P_h + P_c)/2$ 人为平均 (沿袭 Gas_Dynamic_new 的做法) | 加独立状态方程 $P_{reg} V_{reg} = m_{reg} R_g T_{reg}$ |
| 2. 体积驱动质量流 | $T_h = 960$ K 超热源 673 K (违反第二定律); $P_h = 85$ MPa vs $P_c = 19$ MPa; 功率为负 | $\dot{m} = \dot{V}\rho$ 不响应压差 | 改为压差驱动 $\dot{m} = \Delta P / R$ |
| 3. 换热能力不足 | MW 级热量传不动 | $U = 2000$ W/K 太小 | $U_h = U_c = 2.0\times10^5$ W/K |

**结论**: Gas_Dynamic_new 的三大核心做法 —— (a) 通道压力算术平均、(b) 体积驱动质量流、(c) 焓流取 $c_v T$ —— 在前两者上均被本模型的仿真验证证伪, 压差驱动 + 独立状态方程 + $c_p T$ 焓流是物理上自洽的组合。

---

## 8. 总结

本模型在 Gas_Dynamic_new 的 β 型单机框架基础上做了五项本质改进:

1. **构型**: β 型 → 4 缸双作用 (循环跨缸闭环, 力为两循环压差);
2. **压力**: 人为平均 → 三腔独立状态方程;
3. **质量流**: 体积驱动 → 压差驱动 (压力平衡与第二定律自洽);
4. **能量**: $c_v T$ 焓流 + 经验功率 → $c_p T$ 焓流 + 显式 $P\dot{V}$ 体积功 + $-\sum F v$ 指示功率;
5. **耦合**: 开环正弦位移 → 机械-热力学双向闭环 (转速自洽, 为后续与钠冷快堆一/二回路温度输入耦合奠定基础)。
