# SFR_Stirling 项目技术档案（从 .mnemon 蒸馏）

> 生成时间：2026-09-11。来源：`E:\Modelica Code\.mnemon\runtime\memories.json`（12 条）+ `documents\active\*.md`（30 篇），覆盖 2026-08-21 ~ 2026-09-08。
> 本文档是带 landed 结论的参考档案；日常记住的关键纪律在 `MEMORY.md`。

---

## 1. 项目画像
- 平台：MWORKS.Sysplorer 2026b + sysplorer_mcp（attach 模式，端口通常 49152+）。
- 课题：小型钠冷快堆（SFR）一/二回路 + 双作用斯特林热气机耦合建模，方向含数据驱动降阶。
- 主库路径：`E:\Modelica Code\MWORKS\SFR_Striling\`（2026-09-07 由 `SFR_Stirling` 更名）。
- 结果目录：`E:\Users\Admin\Documents\MWORKS\Simulation\<模型名-N>\`（Result.msr + SimulationDebugInfo.log + Settings.xml）。
- 参考库：TRANSFORM-Library（`E:\华为云盘\Dymola File\TRANSFORM-Library-master`），随 Sysplorer 启动自动加载。

## 2. 模型库地图（2026-09-08 现状）
| 包 | 成员 | 状态 |
|---|---|---|
| `Structure\PrimaryLoop\`（文件夹式包，类全名 `SFR.Structure.PrimaryLoop.*`） | PrimaryLoop、FirstLoop_fixed、FirstLoop | PrimaryLoop 本体已改造为**无 PID 标定版**（40.004 MW 复验通过） |
| `Structure\Closed\` | SecondLoop、SFR_Stirling、SFR_Stirling_PK、SFR_Stirling_Steady_noPID、SFR_flowDown、v3 | 总装与全系统验证用 |
| `Nuclear\` | PointKinetics（图标＝TRANSFORM 风格定稿） | Λ=1e-5、β≈6.4e-3、α_fuel=−2.5e-5、α_coolant=−2e-4、`Q_fission(start=Q_nominal, fixed=true)` |
| `Media\Sodium\` | Sodium（关联式 ph 版，主用）、Sodium_table、ConstantPropertyLiquidSodium（cp=1296/cv=1121） | ph 版已替换全部工况 |
| `Thermal\Volumes\` | TubeWall（自建）、test_TubeWall、test_TubeWall_SS316 | λ 为死变量（见 §6） |
| `Thermal\HeatExchange\` | HE1、test_1 | n_tubes=1440/Dh_shell=0.0178/CF=1.086 |
| `Stirling\DoubleActing\` | DA_Engine_v2、DA_Engine_v3、Test_Engine_v2/v3、DA_Gas_Dynamic_Tian | v3 为双回路闭环定稿 |
| 已删除 | Closed 下 FirstLoop_fixed/PrimaryLoop 旧件、SFR_Stirling_noPID（草稿，勿重建）、SFR_Stirling_Steady 本体 | — |

## 3. 设计数据基线
**尹凯（2024，两篇，主用）**：40 MW；堆芯 440/550 ℃、280.6 kg/s、2 环路；IHX 二次侧 430/530 ℃，二回路 308.4 kg/s；斯特林 10×1 MW、16 缸/台、热壁 440/冷壁 50 ℃、He 13.5 MPa（平均）/20 MPa（最高）、循环水冷却器 28.6/20 ℃、最终热阱 4 ℃、效率 33.5%（25% 净电口径）。稳态校核基准（<1%）：40.122 MW、440.51/550.46 ℃、280.56 kg/s、429.94/529.97 ℃。
**运行限值**：核功率 <113% Pn、堆芯出口钠温升 ≤30 ℃、IHX 二次侧出口钠温升 ≤30 ℃。
**侯斌（2018，几何/设备）**：组件对边距 59 mm、61 棒/组件、139 燃料组件、活性区 1100 mm、富集度 60%（内低外高）、3000 EFPD、燃耗损失 7.79% Δk/k、径向功率不均匀因子 1.22、控制棒 6/3/3/2 组 B4C；各圈功率 内堆芯 8948.31 kW(22.37%) / 外堆芯 31051.69 kW(77.63%)；IHX φ16×1.2、360 根、长 2 m、外套筒内径 450 mm；余热排出 1.2 MW；斯特林 缸径 160/行程 50、加热器 φ4×80×500、回热器 φ165/255×90、冷却器 φ1×1750×120。
**尹 vs 侯 差异**：进口 440 vs 400 ℃；流量 280.6 vs 210.6 kg/s；ΔT 110 vs 150 K；cp 反推 1296 vs 1266。侯文表4 IHX 温度与其表6 互斥，判为早期迭代数据，**标定不采用**。
**论文未给（自定）**：k_D/α_fuel、k_Na/α_coolant、β、Λ，现用 TRANSFORM 惯例值，需注明。

## 4. 关键组件实现要点
- **pipe / pipe_static**：方程级仅差换热项（pipe 有 wall 端口 + heatTransfer；pipe_static 直写 Q=0/T_wall 平均）。共用 MSL 端口、`initial equation h[2..N]=h_start`、u 无 1e3、`reynoldsNumberSmooth`（softplus 钳位 Re_min=1/delta=0.5 写死函数内）、Detail 摩擦（dp=Dpf−Dpele，height 语义 z_a−z_b）、Lyon Nu=5.5+0.025·Pe^0.8。`pipe_Base` 有 `momentumDynamics`（默认 DynamicFreeInitial；SteadyState 用于泵锁总流量+并联分流/大回路，防线性奇异）。`pipe_static` 保留**单管口径无 n_pipe 因子**（FirstLoop 的 pipe2 n_pipe=180 依赖，统一口径会 6144 奇异）。
- **堆芯换热**：`HeatTransfer=core`（Westinghouse 棒束，Pitch=0.0074/D_rod=0.006）vs 默认 `circle`（圆管 Lyon）。**PrimaryLoop 已 redeclare core，flowDown 已同步**——两者曾差 27 K 额定壁温。
- **Sodium 介质（ph 版）**：`PartialPureSubstance`、nX=1/nXi=0、singleState=true、`ThermoStates=ph`；`T=temperature_phX`（Cardano 闭式三次反演，带 derivative）；`u=h−reference_p/d`；cv=cp；声速近似 2400 m/s。
  - 焓基准陷阱：换介质后绝对 h 必须重算。ConstantProperty（cp=1296 版）h=1296·(T−298.15)：430 ℃→527257、510.6 ℃→631755、530 ℃→656857；关联式 Sodium 版 T_ph 反演零点含 (h₀⁰)sol=280.995 kJ/kg，550 ℃→1.0094e6（切勿混用）。
  - `Medium.T_default` 仍是 MSL 的 20 ℃，取默认值的组件必须显式传 T_start/h_start。
  - T 反演对比：test_pipe_sodium 台架（双端固定焓）是**过约束病理结构**，初始化不可收敛非介质缺陷；真实回路（下游 h 由 inStream + 容积锚决定）正常。
- **SFR.Thermal.Volumes.TubeWall**：径向 1 节点集总、`n_tubes` 并行缩放热容/几何、半径口径、默认材料 `TRANSFORM.Media.Solids.UO2`、端口 T 暴露（`port_a[i].T=port_b[i].T=T[i]`）避免过约束。**λ 是死变量**（不进方程，无导热路径）——实测 UO₂ λ=4.21 vs SS316 λ=21.61（×5.1）稳态 T_wall 完全相同（差 3e-6）；只影响 ρ/cp 与瞬态热容。
- **PointKinetics**：多普勒对数式 `α_fuel·ln(T_f/Teffref_fuel)`；冷却剂线性式 `α_coolant·(T_c−Teffref_coolant)`；`Q_fission(start=Q_nominal, fixed=true)`。
- **HE1**：CF 是**整体 UA 乘数**不是面积系数。「4 台→CF=4」是错的（每管流量虚高 4 倍 + Lyon 常数项 5.5 过修正）。正确＝`n_tubes=1440`（4×360）后 CF=1.086。
- **DA_Engine_v3**：T_Na/T_water 信号输入、Q_in/Q_out 40 组口径、Tian 气体动力学，U_h/U_c/U_reg/heff_Na/heff_water 透传。v2＝固定冷端/信号驱动口径，v3＝双回路闭环口径。

## 5. 标定参数终值
### 5.1 无 PID 自稳标定套（当前主线）
- `constCR(k=0)` 接 `Reactivity_CR`（CR 恒 0，PID/ramp/gain 链保留在图上不参与）。
- 燃料反馈 `realExpression4(y=sum(innerCore.T_wall)/10*0.2237 + sum(outerCore.T_wall)/10*0.7763)`（全节点算术平均）。
- 冷却剂反馈 `realExpression1(y=sum(innerCore.T)/11*0.2237 + sum(outerCore.T)/11*0.7763)`。
- `Teffref_fuel=885.5 K`、`Teffref_coolant=768.29 K`（2026-09-08 重标：原 863.2 是 T_wall[6] 单节点口径，比平均偏热 +5.51 K）。
- 功率份额 `realExpression2/3 = Q_total*0.2237/10`、`*0.7763/10`。
- 配流 R：内 22.1 / 外 4.20 / 屏蔽 6400 ⇒ 流量 62.78 / 217.3 / 0.50 kg/s。
- 活性段热态初值 `h_start=607863`（cp=1296，勿再用 cp=1251 时代的常数）。顶层参数 `Q0_start`（默认 40e6，扰动试验改 44e6）。
- HE1：`N=10`、`CF_HeatTransfer=1.086`、`n_tubes=1440`、`Dh_shell=0.0178`、`D_shell_in=0.45`。
- 参考信号：`Modelica.Blocks.Sources.Constant(k=40e6)`（不用 Ramp）。PID `initType=NoInit`。

### 5.2 斯特林 v3 台架（2026-09-07 定稿）
`U_h=2.0e4 / U_c=4.5e5 / U_reg=3.0e6`、`heff_Na=1.53 / heff_water=1.0`、`damper d=10.30`；钠 308.4 kg/s、水 200 kg/s@38 ℃；钠入口 h=656857（530 ℃）、出口 Boundary_ph h=527257（430 ℃）；两侧采样用**流体温 T**（非壁温）。
20 s 稳态实测：Q_in 40.13 MW、钠 530.00→429.60 ℃、power 245.25 kW、η 24.45 %、1506.6 rpm。
对照组 v2（已并入 v3 文档第 7 章）：250.5 kW@1508 rpm、Q_in 712.8 kW/组、η 35.1%（固定冷端口径）。

### 5.3 二回路 SecondLoop（B1 热效率法，待同步到总装）
`Q_flow = −40 × Q_in × heatEff`，`heatEff=1.40`；damper d=10.6、Engine heff=1.41、U_h=3.0e4、U_c=2.0e5、U_reg=1.0e6、w_start=157.08。300 s：吸热 40.6 MW、功率 244.7 kW@1535 rpm、管侧 427.1/529.7 ℃。

## 6. 故障—根因—修复总表（最有价值部分）
| 现象 | 真根因 | 修复 | 出处 |
|---|---|---|---|
| FirstLoop_fixed 卡 t=0 | LimPID 限幅用**零交叉事件**，输出贴 ±0.021 后浮点噪声无限触发 chattering（时间钉死 0.0006 s，日志 292 MB） | 初始临界化（Teffref_coolant 对齐初值）+ PID 输入归一化（÷40e6）+ **PID+Nonlinear.Limiter 连续限幅**（勿回退 LimPID） | 50c6ad26 |
| PrimaryLoop 卡 t=0 | TY `ThermoFluidSys.Thermal.TubeWall` 是**单棒薄壁无并管参数**，被 pipe wall 端口的 n_pipe=37/114 管总热流灌爆（0.036 s 达 3075/5951 K，DASSL 重启失败） | 自建 `SFR.Thermal.Volumes.TubeWall`（n_tubes 并行缩放）+ 去 TY Blocks | e30552d7 |
| 去 TY 化后温度平直 430 ℃ | **MSL `Blocks.Sources.Ramp` 在 time<startTime 输出 0**（TY Ramp 输出 offset）⇒ u_s=0 ⇒ PID 输出触限 ⇒ CR 满插压堆 | 换 `Constant(k=40e6)`；教训：去 TY 化不能只换类名，必须核对行为语义 | b79ad71f / 40df111a |
| 翻译报 **6142** 初始条件冗余 | `Q_fission(fixed=true)` 与所有 PID `initType=SteadyState` 的初始方程冲突 | PID 统一改 `initType=NoInit`（行为等价，e(0)=0 时 y 相同）。已修：PrimaryLoop / SFR_Stirling_PK / SFR_Stirling / FirstLoop_fixed | 40df111a / 8e9324f7 |
| 初始化报 **6144** 线性奇异 | 无容积闭合流体回路（理想泵+管道）的**焓环**：inStream 透传 + 线性物性形成导数代数环 | 串入 MixingVolume 焓锚。**通用规律：无容积闭合回路必须 ≥1 个容积焓锚；压力锚（膨胀箱）解决不了焓环** | 69d5012b |
| 编译报 6180 求导失败 | pipe 能量方程 `der(rho·IE)` 需要物性导数；单 .mo 多类 → 整文件静默跳过导致 derivative 函数丢失 | 每个导数函数独立 .mo（`d_T_der.mo` 等）并登记 package.order；Cardano 闭式替代 Newton 循环 | f1849534 |
| edit 报 EIO 1175 | 模型文件被 GUI/进程锁定 | pwsh `[System.IO.File]::WriteAllText` 绕过（中文注释会乱码用 ASCII/正则） | b79ad71f |
| 图面被重排（36 组件） | `check_model(reload_mo_path)` 触发 smart_layout 写回并落盘 | 从 git HEAD 恢复（git 需 `-c safe.directory='E:/Modelica Code'`）；此后禁用 reload_mo_path | 91132a5c / 66cd2ad5 |
| MCP 频繁断连 + Sysplorer 多开 | 客户端 `toolCallTimeoutMs=60000` 掐断长调用 → 服务端 AssertionError 崩溃 → 重启 → 新进程丢失专用端口再开新 GUI | A：`cordis.patch.yml` 加 `toolCallTimeoutMs: 600000`；B：`mcp_attach_launcher.py`（`runpy.run_path`，禁止 `os.execv`，须手动设 `sys.argv`） | ef5ba358 |
| 手写 WebGL 圆柱压成扁盘 | `M4.ident().slice(0,9)` **不是** 3×3 单位阵（末位为 0） | 显式 `const I3=[1,0,0,0,1,0,0,0,1]`；调试用 `?diag=1` 把数值写进 HUD 再无头截图读 | 6926455d |
| 斯特林机构初始化不收敛 | 测试台飞轮 inertia 缺固定初始条件 | `phi(start=0,fixed=true)` + `w(start=w_start,fixed=true)`（与钠侧方程无关，旧"删钠方程致矛盾环"是误诊） | memories.json 第 3 条 |

## 7. 分析与结论
- **无 PID 自稳（成立）**：PrimaryLoop_noPID 工况A（Q0=40e6）300 s＝40.004 MW（+0.01%）、ρ≈0、440.04/550.05 ℃；工况B（+10% 扰动 44 MW）→ 瞬发压低到 24 MW → 峰值 48.8 MW（+22%）→ 300 s 回落到 40.004 MW。全系统 `SFR_Stirling_Steady_noPID` 300 s＝40.17 MW（峰值 49.93 MW@10 s）、引擎 247.3 kW@1482 rpm。
- **冷态无棒不可自稳**：默认初值下 Teff_coolant(0)=713.15 K → ρ₀≈+1100 pcm > β≈640 pcm（超瞬发临界），Λ=1e-5 ⇒ 毫秒级发散。自稳性只在**额定平衡点邻域**有意义。
- **flowDown（±流量 −30%，3600 s）**：
  - `PrimaryLoop_flowDown`（二回路固定 430 ℃ 恒温入口）：40.004 → **29.515 MW（−26.2%）**，入口 437.08 / 出口 553.02 ℃，流体平均温度几乎不变，壁温 885.51 → 867.48 K（−18 K）。
  - 壁温反降机理：功率降幅（26.2%）≈ 流量降幅（30%）⇒ 单位流量功率仅 +5.4%；ΔT_w ∝ Q/γ，Q 降 26% 而 γ 仅降 13%（Nu∝Re^0.8）⇒ ΔT_w 缩 15.4%。
  - `SFR_flowDown`（斯特林固定冷端热阱）：40.17 → **43.51 MW（+8.3%）**，580.5/409.5 ℃，Teff_fuel 890.2 K，引擎 265~270 kW@1534 rpm。与尹凯论文（−1.1%、出口 +23.5 K）**同族行为**：排热能力下降时以温度平台上移换散热；早期"不合理"初判作废。
  - 剩余趋势差根因：本项目 α_coolant=−2e-4 比论文强约 20~25 倍（论文未给 k_D/k_Na 数值）。
- **热阱特性决定响应方向**：固定恒温边界 ⇒ 排热 ∝ 流量 ⇒ 功率随之下潜；斯特林（冷端恒温＋U 固定）⇒ 排热随温度自增强 ⇒ 停在更高温度/更高功率平衡。

## 8. 斯特林结构图（可复用资产，`建模文档/二回路/`）
`斯特林热机结构图.svg/.png`、`_动画.svg/.gif`、`_3D.html`（~30 KB 原生 WebGL 单文件，离线可开，含 `?yaw/pitch/dist/t`、`?only=/hide=`、`?cull=0` 钩子）。
真实结构：**三换热器同轴套在缸筒外**（回热器环 φ165/255×90 内径 165 ≈ 缸孔 160）；每缸自上而下＝加热器 U 形管束笼（80×φ4×500，取腿长 250）→ 回热器环 → 冷却器管束（1750×φ1×120）；4 缸沿共用曲轴 inline 排开，曲柄相位依次 90°，跨缸气路走机后（缸4→缸1 长回路）；缸套 62°~168° 切口剖开。
能量口径：Q_in≈1.003 MW/组（含穿梭损失）、P≈245 kW、Q_out≈0.758 MW、η≈24.5%；回热器内部回收约 95% 循环热量，不计入 Q_in/Q_out。
版式纪律：只留主图框，关键参数/图例放图外纯文字，**不要**能流平衡面板。

## 9. 未决 / 待办
1. 堆芯子通道规划 178（内 37＋外 114＋反射 12＋控制棒流道 15）尚未落盘；`shieldReflector` 的 n_pipe=54 仍未改。
2. n_tubes=37/114 现为**组件流道数**，真实 61 棒/组件 ⇒ 稳态不受影响，瞬态壁热容差 61 倍。
3. TubeWall 径向 1 节点 ⇒ λ 不生效、无燃料中心温度；熔限/热点校核需升级到 TRANSFORM `Conduction_2D` 式径向 2~3 节点。
4. 44 MW 变工况：`Boundary_pT(T=803.15 K)` 把 HE1 管侧出口钉死 ⇒ 吸热上限≈40 MW；需同步把 boundary2 提到 ~813 K 或改质量流源边界。
5. 严格 250 kW/530 ℃ 需 U_h 3.0e4→~3.1e4（+3.3%），但 U_h 是 `DA_Gas_Dynamic_Tian` 全局默认，需先给 DA_Engine_v2 加 U_h 透传再按实例覆盖。
6. SFR 自然循环唯一实质缺口＝**泵族**（仅 `Pump_SimpleMassFlow` 锁流量）；若要建模"泵→自然循环切换/余热排出"，需补带 H-Q 曲线（转速输入）泵（可移植 TRANSFORM `Fluid/Machines`）。
7. `SFR_Stirling`（总装）二回路参数仍落后于 v3 口径（Smaster: SecondLoop 为 heff 法），需同步后终验。
8. 待确认/已知近似：`beta_T` 关联式中间项疑似缺 `t` 一次项；cp 为旧关联式数据（较现代值高 5~10%）；声速为近似常值 2400 m/s；`T_wall` 为棒体平均温度口径，与尹凯"燃料热点 1148.5 K(875 ℃)"不可直接比。
