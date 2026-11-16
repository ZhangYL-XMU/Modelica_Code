# pipe 管道与 TRANSFORM 库比对：待办清单与操作步骤

- **文档用途**：记录 `SFR.Fluid.Pipes.pipe` 与 TRANSFORM 库（`E:\华为云盘\Dymola File\TRANSFORM-Library-master\TRANSFORM`）逐项比对后发现的待修复项、具体修改内容、操作步骤与验证方法。供后续逐项批准、落地与回归验证使用。
- **任务编号 / 时间戳**：20260820（2026-08-20 生成）
- **涉及模型**：`SFR.Fluid.Pipes.pipe`、`SFR.Fluid.Pipes.BaseClasses.pipe_Base`、`SFR.Fluid.Pipes.BaseClasses.PressureDrop.Detail`、`SFR.Fluid.Pipes.BaseClasses.HeatTransfer.circle`、`SFR.Utilities.PressureDrop.Weishach`、`SFR.Utilities.Functions.reynoldsNumberSmooth`、`SFR.Thermal.HeatExchange.HE1`
- **参照基准**：TRANSFORM 库（ReynoldsNumber_m_flow、SinglePhase_*_NumStable、LaminarTurbulent_MSLDetailed、Nus_SinglePhase_2Region、Math.spliceTanh、Nu_LiquidMetal_Developed_Circular、ExternalFlow.LiquidMetal.* 等）

---

## 一、状态总览

### 1.1 已完成修复（均已仿真验证通过，勿重复修改）

| # | 修复内容 | 位置 | 验证结果 |
|---|---|---|---|
| 1 | 守恒方程统一"总流量口径"（质量/能量方程流量乘 `n_pipe`，Q 用总热流） | pipe.mo L123、L127 | 稳态温升 79.94 K，与解析值误差 <0.001 K |
| 2 | `initial equation` 硬锚定节点焓 `h[2..N]=h_start`，消除奇偶棋盘振荡（负温度 −226.85 K） | pipe.mo L64–67 | begin 时刻 h[2..5]=500000、T[2..5]=697.83 K |
| 3 | 传热面积下标修复 `Dhyd[i]*L[i]`（消除 4 倍面积误算） | circle.mo L57 | T_wall 与理论误差 0.01 K |
| 4 | 密度单位三重换算修复（删除 3 处 `*1e3`） | Detail.mo L38/L46/L49、pipe.mo L97 | u=1.18 m/s、Dpf=1564 Pa/段（真实量级） |
| 5 | 总压降恒等式 `dp = Dpf − Dpele`（删除 if 分支，向下/向上流统一） | Detail.mo L52 | 向下流 p[1]−p[5]=−2206.7 Pa、向上流 +14719.6 Pa，与伯努利精确一致 |
| 6 | 液金属传热关联式系数修正 `Nu=5.5+0.025·(Re·Pr)^0.8` | circle.mo L54 | T_wall 与新 γ 自洽（894.97 K） |
| 7 | 雷诺数平滑钳位函数 `reynoldsNumberSmooth`（softplus 型下限钳位，Re_min=1、delta=0.5 写死在函数内） | Utilities\Functions\Re_number.mo；pipe.mo L98、circle.mo L49、Detail.mo L39 已接入 | Re=170008.95，远端零偏差 |

### 1.2 当前已验证正确的行为

- 稳态能量守恒：$\Delta T=\frac{Q_总}{c_p\dot m_总}$，逐控制体精确；
- 摩擦压降：$Dpf=f\frac{L}{D}\frac{\rho u^2}{2}$（单向流、非零流量工况）；
- 提升压降：$Dpele=\rho g(z_a-z_b)$，符号随流向正确；
- 传热：$Q=\gamma N_t\pi D L(T_w-T_f)$，$\gamma=Nu\,k/D$；
- 质量守恒（总口径）、动量守恒（单管口径）自洽；
- 瞬态时间常数 $\tau=\frac{V_{tot}\rho}{\dot m_{tot}}\approx1.7$ s（物理正确）。

---

## 二、待办清单（按建议优先级）

### P0-1 修正系数"死参数"断链（功能缺陷，用户调参无效）

**问题**：`pipe_Base` 声明 8 个修正参数，全部未接入计算链路：

| 参数 | 声明 | 应生效处 | 现状 |
|---|---|---|---|
| `CF_PressureLoss` | pipe_Base L53 | Detail 的 dp | 未乘 |
| `CF_HeatTransfer` | pipe_Base L54 | circle 的 Q | 未乘 |
| `CF_length`、`L_total_internal`、`V_internal` | L57–60 | 守恒方程容积/长度 | pipe.mo 仍用 `V`、`L` |
| `L_heat`、`A_heat`、`A_heat_internal` | L22、62–63 | circle 换热面积（加热段概念） | circle 用 `L[i]`（全段长） |
| `flowFraction0`、`dpFraction0` | L55–56 | 流阻 | 未用 |

**TRANSFORM 参照**：`PartialHeatTransfer_setT` 中 `CF[nHT]` 真实乘在 Q 上（`Q = CF*alpha*A*dT`）；MSL 管道修正系数全部生效。

**操作步骤与修改内容**：

1. `circle.mo` 增加输入参数 `input Real CF_HeatTransfer=1.0 "传热修正系数"`，Q 公式改为：

```modelica
Q[i] = CF_HeatTransfer * gamma[i] * Nt * Constants.pi * Dhyd[i] * L[i] * (Tw[i] - Tf[i]);
```

2. `Detail.mo` 增加输入参数 `input Real CF_PressureLoss=1.0 "压降修正系数"`，仅修正摩擦项（重力项不修正）：

```modelica
dp[i] = CF_PressureLoss * Dpf[i] - Dpele[i];
```

3. `pipe.mo` 两处实例传参接线：`heatTransfer(..., CF_HeatTransfer=CF_HeatTransfer)`、`friction(..., CF_PressureLoss=CF_PressureLoss)`；守恒方程按需把 `V` 换 `V_internal`、动量方程 `L` 换 `L*CF_length`（或删除 CF_length 参数）。
4. 决策并执行其一：
   - **方案 A（推荐）**：接入上述三处，其余死参数（flowFraction0/dpFraction0/L_heat/A_heat/A_heat_internal）从 pipe_Base 删除；
   - **方案 B**：全部 8 个参数删除，面板干净。

**验证方法**：test_pipe 内存级设 `CF_HeatTransfer=2` → 能量守恒不变、Tw−Tf 减半；设 `CF_PressureLoss=2` → 总压降翻倍（重力项不变）。

---

### P0-2 壳侧管束传热关联式（HE1 精度）

**问题**：HE1 壳侧（360 根管束、Dh=0.016）与管内共用圆管 Lyon 类关联式。液金属**管束**应采用专用关联式，二者在 Pe=897 量级可差数倍。

**TRANSFORM 参照**（`HeatAndMassTransfer.ClosureRelations.HeatTransfer.Functions.SinglePhase.ExternalFlow.LiquidMetal`）：

- Graber-Rieger（150≤Pe≤3000，1.25≤P/D≤1.95）：
$$Nu=0.25+6.2\frac{P}{D}+\left(0.32\frac{P}{D}-0.007\right)Pe^{\,0.8-0.024\,P/D}$$
- FFTF（20≤Pe≤1000）：
$$Nu=4.0+0.16\left(\frac{P}{D}\right)^{5}+0.33\left(\frac{P}{D}\right)^{3.8}\left(\frac{Pe}{100}\right)^{0.86}$$
- 另备 Borishanskii、modifiedSchad。

**操作步骤**：
1. 在 `SFR.Utilities.Functions`（或 HeatTransfer 子包）新建函数 `Nu_GraberRieger(Re, Pr, PDratio)`、`Nu_FFTF(Re, Pr, PDratio)`（照 TRANSFORM 公式，不复制其代码文件——注意版权与规则②，自行实现公式）；
2. `circle.mo` 增加枚举/整数参数 `correlation`（1=圆管 Lyon、2=GraberRieger、3=FFTF），Nu 按选择计算（if 或 replaceable function）；
3. HE1 中壳侧 pipe 实例选择管束关联式；**P/D（管间距/管径）需按课题几何提供**（缺省可先按 P/D≈1.3 试算）。

**验证方法**：对照圆管式与管束式的 Nu、γ 数值；重仿 HE1（或 test_pipe 壳侧参数）比较换热量与壁温。

---

### P0-3 粗糙度默认值不匹配钠回路

**问题**：`roughness=0.0015 m`、Dh=0.05 → 相对粗糙度 e=0.03（混凝土/锈蚀管水平）。钠回路不锈钢管典型 e≈4.5e-5 m。当前 f=0.0520 vs Swamee-Jain（不锈钢）约 0.027，**摩擦压降偏高约 1 倍**。

**操作步骤**：`pipe_Base` L25 `roughness = 0.0015` → `4.5e-5`（注释"不锈钢绝对粗糙度"）；或保持默认但 HE1/主回路实例显式传 `roughness=4.5e-5`。

**验证方法**：test_pipe 重仿，f 由 0.0520 降至约 0.027，压降 6.26 kPa → 约 3.2 kPa。

---

### P1-4 默认介质不可实例化

**问题**：`pipe_Base` L7 默认 `redeclare package Medium = Modelica.Media.Interfaces.PartialMedium`（abstract 基类），用户不 redeclare 时检查/仿真必失败；`Detail`/`circle` 内部默认却为 `Water.StandardWater`，三者不一致。TRANSFORM 管道默认即可用。

**操作步骤**：`pipe_Base` L7 改为：

```modelica
redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium
  annotation(choicesAllMatching = true);
```

（或保持 PartialMedium 但加 `assert(Medium.nX > 0 ...)` 明确报错提示 redeclare；推荐前者。）

**验证方法**：不传 Medium 的新建 pipe 实例可直接检查通过。

---

### P1-5 replaceable 模型缺少 constrainedby 约束接口

**问题**：`replaceable model Friction = ...`、`HeatTransfer = ...` 无 `constrainedby`，替换模型接口不受约束，接口不匹配只在编译后期报错。TRANSFORM 全部 constrainedby 各自 Partial。

**操作步骤**：
1. 新建 `SFR.Fluid.Pipes.BaseClasses.PressureDrop.PartialPressureDrop`（partial model，声明 N/Nw/L/Dhyd/A/height/roughness/mu/rho/Re/u/f_W/dp/Dpf/Dpele 与 input 接口）；
2. `Detail` 改为 `extends ...PartialPressureDrop`；
3. 新建 `...HeatTransfer.PartialHeatTransfer`（partial），`circle` 改 extends；
4. `pipe.mo` L34/L48 replaceable 加 `constrainedby` 对应 Partial。

**验证方法**：检查 + 仿真 test_pipe 无回归；替换一个自写摩擦模型编译报错信息提前到约束检查。

---

### P1-6 低流量区摩擦系数偏低（自然循环启动段，已知限制）

**问题**：`reynoldsNumberSmooth` 下限钳 1 → Re_raw<1 时 f=64/1≈60，而物理层流 f=64/Re_raw（Re=0.1 时 640）。压降本身→0 无碍，但自然循环建立期阻力被低估。

**可选操作**（如自然循环模型启动段敏感再修）：
- 方案 A：`reynoldsNumberSmooth` 增加第二输出 `Re_raw`，`Weishach` 层流分支用 `64/max(Re_raw, Re_min)`；
- 方案 B（TRANSFORM 正统）：摩擦改 λ2 形式 $dp=\frac{L\mu^2}{2\rho D^3}\lambda_2$，层流 $\lambda_2=64Re$ 在 Re=0 处精确线性（改动较大，涉及 Detail 重构，见 P2-9 一并考虑）。

**验证方法**：Re=0.1 单点函数值 f=640；自然循环测试模型启动段流量爬升无阻力凹陷。

---

### P1-7 注释矛盾（一行修复）

**问题**：`Detail.mo` L13 注释"高度差(b-a)"与 `pipe_Base` L24"高度差(a-b)"矛盾；计算已按 $z_a-z_b$ 统一（`Dpele=ρg(z_a−z_b)`、`dp=Dpf−Dpele`）。

**操作步骤**：`Detail.mo` L13 改为 `"高度差(a-b)"`。

**验证方法**：无（纯注释）。

---

### P2-8 反向流全套处理（单向流正确，反向流才暴露）

**问题清单与参照**：

| # | 位置 | 现状 | TRANSFORM/MSL 做法 |
|---|---|---|---|
| a | Detail.mo L46 | `Dpf` 用 $u^2$ 恒正，反向流阻力方向错误 | Simple 版：`noEvent(if m_flows[i]>=0 then +1 else -1)` 符号项；MSL 版：`if m_flow>=0 then λ2 else -λ2` |
| b | pipe.mo L12 | `portA.h_outflow = inStream(portA.h_outflow)` 自指病态 | MSL：`port_a.h_outflow = h[1]` |
| c | pipe.mo L67 | `h[1] = inStream(portA.h_outflow)` 把入口焓恒钉为上游焓 | MSL：节点焓由守恒方程决定，流入焓经 `m_flow·actualStream(port_a.h_outflow)` 进能量方程 |
| d | 无 | 无 `allowFlowReversal` 参数与断言 | TRANSFORM：`assert(m_flows[i] > -m_flow_small or allowFlowReversal, ...)` |
| e | pipe.mo L70–73 | 组分 inStream 交叉写法 | MSL 惯例自指写法（对纯钠无影响，随 c 一并改） |

**操作步骤**：
1. Detail.mo：`Dpf[i] = f_W[i]*(L[i]/Dhyd[i])*(rho[i]*u[i]^2/2)*noEvent(if m_flow[i] >= 0 then +1 else -1);`
2. pipe.mo 端口：`portA.h_outflow(start=h_start) = h[1];`（删除自指）；删除 L67 `h[1] = inStream(portA.h_outflow)`；
3. 能量方程流入边界改为迎风焓流：控制体 1 对流项 `m_flow[1]*actualStream(portA.h_outflow)`（需在循环外或条件写法处理，注意 h[1] 变为由控制体 1 能量方程确定的代数量，改后必须检查自由度，避免欠定/过定——**此步改动需谨慎，建议单独一轮验证**）；
4. pipe_Base 加 `parameter Boolean allowFlowReversal = false` + Detail/pipe 断言。

**验证方法**：正向 test_pipe 无回归；构造反向流测试（交换边界源方向），检查压降符号与出口焓。

---

### P2-9 Weishach 过渡区硬跳变

**问题**：Re=2300 处 f 从 64/2300=0.0278 跳变到 0.0055(1+(20000e+1e6/2300)^(1/3))≈0.0612（2.2 倍不连续）。TRANSFORM 用 Re_lam=2300/Re_turb=4000 间对数空间三次多项式插值或 spliceTanh 平滑。

**操作步骤**（tanh 全解析版，MWORKS 已验证可导）：

```modelica
// Weishach 函数内（Re 输入已是 smooth 钳位值 ≥ Re_min）
f_lam  := 64/Re;
f_turb := 0.0055*(1 + (20000*e + 1e6/Re)^(1/3));
w      := 0.5*(1 + tanh((Re - Re_center)/Re_width*4));
f      := (1 - w)*f_lam + w*f_turb;
```

其中 `Re_center = 3150`、`Re_width = 850`（对应 2300/4000 过渡带）。64/Re 因输入已钳位 ≥1 而有限。

**验证方法**：f 曲线在 2300–4000 连续可导（单点扫描函数）；test_pipe 重仿无跳变事件。

---

### P2-10 数值稳健性三件套（homotopy / nominal / smoothOrder）

**问题**：反解方向（p→m_flow）无 homotopy 简化路径、无 nominal 缩放、关联式无 smoothOrder 注解。TRANSFORM NumStable 模型三件套齐全。

**操作步骤（按需渐进）**：
1. 轻量：`Weishach`、`reynoldsNumberSmooth` 加 `annotation(smoothOrder=1)`；状态/代数变量加 nominal（`m_flow` nominal=m_flow_nominal、`p` nominal=p_start）；
2. 进阶：pipe_Base 加 `m_flow_nominal`、`dp_nominal` 参数，动量方程改：
```modelica
der(rho[i]*u[i])*L[i] = homotopy(actual=p[i]-p[i+1]-friction.dp[i],
                                  simplified=dp_nominal/m_flow_nominal*(m_flow[i]-m_flow_nominal) + p_start - p[i+1]);
```
3. 零流量精确正则化（与 P1-6 方案 B 合并）：摩擦改 λ2 形式。

**验证方法**：自然循环/低流量启动仿真收敛性对比（迭代次数、无初始化失败）。

---

## 三、非缺陷设计说明（记录备查，无需修改）

1. **pipe 壁面无热容**：TRANSFORM GenericPipe 内置壁面传导/热容；课题把壁面热容放在 HE1 的 `TubeWall`（`TYThermoFluidSys.Thermal.TubeWall`），分工合理。单 pipe 演示时壁温响应瞬时。
2. **无轴向传导**：钠 Pe=Re·Pr≈897，轴向导热可忽略；TRANSFORM 分布式管道与 MSL DynamicPipe 同样不含。
3. **圆管几何假设**：`A=πD²/4`；HE1 壳侧环形流道用 Dh 等效圆管近似，属工程近似（关联式选择见 P0-2）。
4. **管束内各管壁温相同假设**：`Nt=n_pipe` 统一乘在 Q 上，边缘/中心管温差未区分（HE1 层面工程近似）。

---

## 四、修改与验证规范（每次落地必须遵守）

1. **规则②**：以上所有修改均涉及课题库组件，动手前必须逐项获得批准；批准后按本文档"操作步骤与修改内容"执行，不擅自扩大范围；
2. **修改后验证流程**（内存级为主）：
   1. `model_manager(action="load_file", file_path="E:\Modelica Code\MWORKS\SFR_Stirling\package.mo", force_reload=true)` 重载；
   2. `check_model("SFR.Fluid.Pipes.test.test_pipe")`；
   3. `simulate_model(target_time=[0,100])`；
   4. `result_manager(action="get_vars_value_at", time_point="end"/"begin")` 与解析值比对（误差阈值 <0.1%）；
   5. 涉及高度/反向流时，用 `SetModelParamValue` 内存级改参复测（不落盘）；
3. **回归基准**（当前已锁定）：u=1.1803 m/s、Dpf=1564.10 Pa/段、Re=170008.95、T[2..5]=903.086 K、T_wall[1]=894.97 K（height_ab=−1 工况下 dp[1]=3679.89 Pa）；height_ab=0 时 p[1]−p[5]=6.256 kPa；
4. 修改文件后同时更新本文档对应条目状态（待办 → 已完成 + 验证结果）。

---

## 五、参数基线（test_pipe，height_ab=−1 m，n_pipe=5，N=5）

| 物理量 | 值 |
|---|---|
| 单管流量 | 2 kg/s（总 10 kg/s） |
| 流速 u | 1.1803 m/s |
| Re（smooth） | 170008.95 |
| Pr / Nu / γ | 5.277e-3 / 11.256 / 15987 W/(m²K) |
| f_W（e=0.03） | 0.05204 |
| Dpf / Dpele / dp（每段） | +1564.10 / −2115.78 / +3679.89 Pa |
| p[1]−p[5] | +14719.6 Pa |
| 稳态 T[2..5] | 903.086 K |
| T_wall[1] | 894.97 K |
