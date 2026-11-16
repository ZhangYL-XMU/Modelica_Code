# pipe 组件说明（SFR_Striling.Fluid.Pipes.pipe）

> 对象：`SFR_Striling.Fluid.Pipes.pipe`（一维有限体积管道，钠/水通用，`n_pipe` 并行管束）
> 来源：`pipe管道TRANSFORM比对待办清单_20260820` 转换（原待办清单已完成/未完成项见 §5，旧文归档于 `建模文档/_归档/`）
> 用途：一回路堆芯/主回路、二回路 Engine_pipe、冷却水管束等全部管道建模

---

## 1 结构与接口

- 节点：$N$ 个节点、$N_w=N-1$ 个控制体；`portA`/`portB` 为 MSL 流体端口；`wall[Nw]` 为热端口数组；
- 并行管：`n_pipe` 表示并联根数；**质量/能量方程按总流量口径**（乘 `n_pipe`），动量按单管口径；
- 介质：`replaceable package Medium`（默认 `PartialMedium`，使用时须 redeclare，如 `ConstantPropertyLiquidSodium`）；
- 参数：`L_total`/`L_heat`、`Dh`、`height_ab`、`roughness`、`initFromEnthalpy`/`h_start`/`T_start`、`CF_HeatTransfer`、`CF_PressureLoss`、`momentumDynamics`、`wallHeatTransfer`。

## 2 方程

### 2.1 质量守恒（总口径）

$$
\frac{d\rho_i}{dt}V_i=\left(\dot m_i-\dot m_{i+1}\right)n_{pipe}
$$

### 2.2 动量守恒

`SteadyState`：$0=p_i-p_{i+1}-\Delta p_i$；
`DynamicFreeInitial` 等：$\dfrac{d(\rho u)_i}{dt}L_i=p_i-p_{i+1}-\Delta p_i$。

压降恒等式（`Detail`）：

$$
\Delta p_i=\Delta p_{f,i}-\Delta p_{ele,i},\qquad
\Delta p_{f,i}=f_W\frac{L_i}{D_{h,i}}\frac{\rho_i u_i^2}{2},\qquad
\Delta p_{ele,i}=\rho_i g\,\Delta z_i
$$

$f_W$ 由 `Weishach`：$Re\le2300$ 时 $64/\max(Re,1)$，否则 $0.0055[1+(20000e+10^6/Re)^{1/3}]$；$Re$ 由 `reynoldsNumberSmooth`（softplus 下限钳位 $Re_{min}=1$、$\delta=0.5$）计算。`height` 语义为 $z_a-z_b$（`height_ab`）。

### 2.3 能量守恒（总口径）

$$
\frac{d(\rho\,IE)_i}{dt}V_i=\left(\dot m_i h_i-\dot m_{i+1}h_{i+1}\right)n_{pipe}+Q_i
$$

### 2.4 换热

$$
Q_i=CF\cdot\gamma_i\cdot N_t\cdot\pi D_{h,i}L_i\left(T_{w,i}-T_{f,i}\right),\qquad
\gamma_i=\frac{Nu_i k_i}{D_{h,i}},\qquad
Nu_i=5.5+0.025\left(Re_iPr_i\right)^{0.8}
$$

（液态金属 Lyon 式；`CF_HeatTransfer` 为整体换热乘数，见 §4.2。）

### 2.5 初始化

`initial equation`：$h_2=\dots=h_N=h_{start}$（硬锚定，消除奇偶棋盘振荡）；$h_1$ 由 `inStream(portA.h_outflow)` 给定（入口边界口径）。

---

## 3 已完成修复（08-20 清单，均已仿真验证）

| # | 修复内容 | 位置 | 验证 |
|---|---|---|---|
| 1 | 守恒方程统一总流量口径（质量/能量乘 `n_pipe`，$Q$ 用总热流） | `pipe.mo` L127/L135 | 稳态温升 79.94 K，解析误差 <0.001 K |
| 2 | `initial equation` 硬锚定 $h[2..N]=h_{start}$，消除负温度振荡 | `pipe.mo` L68-71 | $h[2..5]$=500000、$T$=697.83 K |
| 3 | 传热面积下标修复 $D_{h,i}L_i$（消除 4 倍面积误算） | `circle.mo` L58 | $T_{wall}$ 与理论误差 0.01 K |
| 4 | 密度单位三重换算修复（删除 3 处 ×1e3） | `Detail.mo`/`pipe.mo` | $u$=1.18 m/s、$\Delta p_f$=1564 Pa/段 |
| 5 | 总压降恒等式 $\Delta p=\Delta p_f-\Delta p_{ele}$（删除 if 分支） | `Detail.mo` L52 | 向下/向上流均与伯努利一致 |
| 6 | 液金属传热系数 $Nu=5.5+0.025(RePr)^{0.8}$ | `circle.mo` L55 | $T_{wall}$ 自洽（894.97 K） |
| 7 | 雷诺数平滑钳位 `reynoldsNumberSmooth` | `Utilities/Functions` | $Re$=170008.95，远端零偏差 |
| 8 | `CF_HeatTransfer` 接入计算链（`circle` input CF → $Q$ 乘子） | `circle.mo` L19/L58、`pipe.mo` L63 | HE1 标定即依赖此链 |

## 4 关键使用约定

### 4.1 `n_pipe` 与流量口径

`n_pipe` 决定**每管流量**（$\dot m_{total}/n_{pipe}$）与总换热面积（$N_t=n_{pipe}$ 乘在 $Q$ 上）。因此：
- HE1 四台合并必须用 $n_{pipe}$=1440（4×360），不能只把 CF 设为 4（否则每管流量仍为设计 4 倍，$Re/Pe$ 虚高）；
- 堆芯内/外区用 $n_{pipe}$=37/114，配 `m_flow_start` 单管值 1.695/1.907 kg/s。

### 4.2 `CF_HeatTransfer` / `CF_PressureLoss`

- `CF_HeatTransfer`：已生效，$Q$ 的整体乘数（HE1 用 1.086，Engine_pipe 用 6，water 用 1）；
- `CF_PressureLoss`：**当前仍未接入**（`Detail` 的 $\Delta p_f$ 未乘该参数），设值无效，见 §5。

### 4.3 动量模式选择

- 主回路 `pipe_static1/2` 与 HE1 壳侧用 `SteadyState`（泵锁流量 + 并联分流，避免 $der(\dot m)$ 线性奇异）；
- 堆芯七管用 `DynamicFreeInitial` 并给 $m_{flow,start}$ 单管初值（全 SteadyState + 泵锁流量 + 三路并联阻力会卡 t=0）。

### 4.4 `height_ab` 与 `L_heat`

- `height_ab` = $z_a-z_b$（入口减出口），$\Delta p_{ele}=\rho g(z_a-z_b)$；
- `L_heat` 仅用于传热段长度（堆芯 `_in/_out` 无热源时 `wallHeatTransfer=false`）。

### 4.5 壁面热容

`pipe` 壁面**无热容**（`wall.T` 为零热容代数节点）；壁热容放在 HE1 的 `TubeWall`。因此单 pipe 演示壁温响应瞬时；水侧若用壁温反馈会形成代数正反馈（稳定条件 $\gamma A_w>40U_c$），系统模型中应取流体温。

---

## 5 未落地/已知限制（截至本文）

| # | 项 | 现状 | 影响 |
|---|---|---|---|
| 1 | `CF_PressureLoss` 断链 | 参数已声明、未乘入 $\Delta p_f$ | 调参无效；如需压降修正须先接线 |
| 2 | `roughness` 默认 0.0015 m | 对不锈钢钠回路偏大（建议 4.5e-5） | 摩擦压降偏高约 1 倍（f 0.052 vs 0.027） |
| 3 | 默认 `Medium=PartialMedium` | 新建实例不 redeclare 即检查失败 | 使用不便 |
| 4 | `replaceable` 无 `constrainedby` | 替换模型接口不受约束 | 编译后期才报错 |
| 5 | `Weishach` 过渡区硬跳变 | Re=2300 处 f 由 0.0278 跳至 ≈0.0612 | 可能诱发事件；可改 tanh 平滑 |
| 6 | 反向流未完整处理 | 压降无符号项、端口焓自指 | 仅建议正向流使用 |
| 7 | 低 Re 摩擦偏低 | `max(Re,1)` 钳位 | 自然循环启动段阻力低估 |
| 8 | 无 homotopy/nominal | 反解方向无简化路径 | 极端工况收敛性一般 |

> 上述 1~8 均不影响当前 Base.mo 的正向、高 Re 稳态结果；按需逐项批准后再改（原清单的“修改与验证规范”仍适用）。

---

## 6 变体与相关模型

| 模型 | 说明 |
|---|---|
| `pipe_static` | 独立类（`Fluid.Pipes.pipe_static`，单管端口口径、无 `n_pipe` 因子），当前模型未引用；Base/PrimaryLoop 中的 `pipe_static1/2` 只是 `pipe` 的实例名，不是该类 |
| `pipe_new` / `pipe_pT` | 试验版本（新状态变量/压力-温度接口），未进入 Base.mo 链 |
| `BaseClasses.HeatTransfer.core` | 堆芯棒束关联式（Westinghouse 5-95，P/D=7.4/6 mm），供 `innerCore/outerCore` 使用 |
| `BaseClasses.HeatTransfer.circle` | 圆管 Lyon 式，供主回路/HE1/Engine_pipe/water 使用 |

---

## 7 回归基准（test_pipe，`height_ab=−1 m`，`n_pipe=5`，`N=5`）

| 物理量 | 值 |
|---|---|
| 单管流量 / 总流量 | 2 kg/s / 10 kg/s |
| 流速 $u$ | 1.1803 m/s |
| $Re$（smooth） | 170008.95 |
| $Pr$ / $Nu$ / $\gamma$ | 5.277e-3 / 11.256 / 15987 W/(m²·K) |
| $f_W$（e=0.03） | 0.05204 |
| $\Delta p_f$ / $\Delta p_{ele}$ / $\Delta p$（每段） | +1564.10 / −2115.78 / +3679.89 Pa |
| $p_1-p_5$ | +14719.6 Pa |
| 稳态 $T[2..5]$ / $T_{wall}[1]$ | 903.086 K / 894.97 K |

> 修改 `pipe`/`Detail`/`circle` 后必须先跑该基准，确认以上数值不漂移。
