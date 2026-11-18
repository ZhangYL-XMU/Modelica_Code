# FirstLoop + HE1 与 TRANSFORM 模型库对照核对（2026-08-28）

> 背景：用户要求所有建模参考 TRANSFORM 模型库（`E:\华为云盘\Dymola File\TRANSFORM-Library-master\TRANSFORM`）。
> 本文档记录 t2 任务（一回路+IHX 审查完善）交付物与 TRANSFORM 对应组件的逐项核对结论。
> 核对基于 TRANSFORM 库源码（开源库，可直接阅读）；TYThermoFluidSys 为商业库，仅用官方类文档核对（`get_lib_model_document`）。

## 0. 结论摘要

1. **换热器**：SFR HE1 的结构与 TRANSFORM `HeatExchangers.GenericDistributed_HX`（分布参数壳/管式换热器母版）逐项同构：壳侧流体 + 管侧流体 + 圆柱管壁 + 逆流配对。几何参数数值自洽（Φ16×1.2、360 根、L=2 m）。
2. **动量公式**：TRANSFORM GenericDistributed_HX 的 `momentumDynamics` 默认值即 `{SteadyState, SteadyState}`（壳/管侧）——t2 将 SFR HE1 壳/管侧显式改为 SteadyState 与 TRANSFORM 默认**完全一致**。
3. **泵**：SFR.Fluid.Machines.Pump_SimpleMassFlow 已从 TRANSFORM `Fluid.Machines.Pump_SimpleMassFlow` 移植（参数/方程同构），FirstLoop 已改用 SFR 版。
4. **定压边界**：TRANSFORM 钠快堆示例 `Examples.SodiumFastReactor.Components.IHTS5_AHX3` 采用「ExpansionTank_1Port + SpecifiedResistance 死端支路」锚压——FirstLoop 的「ExpansionTank + SpecifiedResistance(R=0.1)」方案与之**同构**（TRANSFORM 取 R=1/m_flow≈0.0036，FirstLoop 取 0.1，功能等价）。
5. **已知坑**：TRANSFORM MixingVolume 在 MWORKS 报 5204 空切片（nX=0 钠介质），SFR 用自写 MixingVolume（方程等价、初值硬锚更稳）——与既定纪律一致。

---

## 1. HE1 ↔ TRANSFORM.GenericDistributed_HX 结构对照

TRANSFORM 参考：`TRANSFORM/HeatExchangers/GenericDistributed_HX.mo`（注意：TRANSFORM 中无 `Fluid.HeatExchangers` 包，双侧流体换热器在顶层 `HeatExchangers` 包；几何在 `Fluid.ClosureRelations.Geometry.Models.DistributedVolume_1D.HeatExchanger`）。

| 结构要素 | TRANSFORM GenericDistributed_HX | SFR HE1（t2 交付） | 结论 |
|---|---|---|---|
| 壳侧流体 | `GenericPipe_MultiTransferSurface shell`（nParallel） | `SFR.Fluid.Pipes.pipe shell`（n_pipe=360） | 同构（课题自研 pipe 等效） |
| 管侧流体 | `GenericPipe_MultiTransferSurface tube`（nParallel=geometry.nTubes） | `SFR.Fluid.Pipes.pipe tube`（n_pipe=360） | 同构 |
| 管壁 | `Conduction_2D tubeWall`（Cylinder_2D_r_z：r_inner=dim_tube/2、r_outer=dim_tube_outer/2、nR、nZ=nV） | `TYThermoFluidSys.Thermal.TubeWall`（N=4、r_inner=0.0136 内径、r_outer=0.016 外径） | 等效（TY 轴向 N=4；TRANSFORM 2D r-z 轴向 nZ=nV） |
| 逆流配对 | `HeatAndMassTransfer.BoundaryConditions.Heat.CounterFlow counterFlow(counterCurrent, n=nV)`：shell.heatPorts[:,1] ↔ wall.port_b1 | `SFR.Thermal.HeatExchange.CounterFlowPair counterFlow(n=4, counterCurrent=true)`：shell.wall ↔ tubeWall.port_b | 已移植（t2 新建；类名避开与 TRANSFORM 简单名冲突） |
| 传热链 | tube.heatPorts[:,1] ↔ tubeWall.port_a1（管内壁）；tubeWall.port_b1 ↔ counterFlow ↔ shell（壳侧） | tube.wall ↔ counterFlow.port_b；counterFlow.port_a ↔ tubeWall.port_b；tubeWall.port_a ↔ shell.wall | 同构 |
| 动量公式 | `momentumDynamics={SteadyState, SteadyState}`（默认值，壳/管） | shell/tube 均显式 `momentumDynamics=SteadyState`（t2 修改） | **一致**（TRANSFORM 默认即如此） |
| 逆流默认 | `counterCurrent=true`（默认） | `counterCurrent=true` | 一致 |
| 壳侧压力状态 | `exposeState_a_shell=true`（port_a 压力为状态） | SFR pipe p[1] 节点压力状态 | 概念一致 |
| 壁初值 | 逆流时 `Ts_wall_start` 沿轴向 reverse（线性剖面） | T_wall_start=713.15 均匀 | SFR 简化（均匀初值，实测初始化收敛） |

## 2. 几何参数对照（StraightPipeHX / ShellAndTubeHX ↔ HE1）

TRANSFORM 参考：`Geometry/.../DistributedVolume_1D/HeatExchanger/GenericHX.mo`、`StraightPipeHX.mo`、`ShellAndTubeHX.mo`、`Pipe_Wall/StraightPipe.mo`。

| 参数 | TRANSFORM 定义 | HE1 取值 | 核对 |
|---|---|---|---|
| 管内径 | `dimension_tube`（水力直径，默认 4A/P） | 管侧 `Dh=0.0136` m | ✓ 自洽 |
| 管外径 | `dimensions_tube_outer = dimensions_tube + 2·sum(drs)`（=内径+2×壁厚） | `r_outer=0.016`（TY 文档确认 r_outer 为**外径**） | ✓ 0.0136+2×0.0012=0.016 |
| 壁厚 | `th_wall`（StraightPipe 输入；drs=th_wall/nR） | (0.016-0.0136)/2=0.0012 m（1.2 mm） | ✓ Φ16×1.2 |
| 管数 | `nTubes`（GenericHX 参数） | 管侧 `n_pipe=360` | ✓ |
| 管长 | `length_tube` | `L_total=2` m | ✓ |
| 轴向节点 | `nV`（GenericHX） | `N=5`（Nw=4 控制体） | ✓ 概念一致 |
| 壁径向节点 | `nR` | TubeWall `N=4`（TY 分段数） | 概念一致（TY 轴向 4 段） |
| 壳侧特征尺寸 | `dimension_shell=4·crossArea_shell/perimeter_shell`（ShellAndTubeHX 用空壳面积减管束面积修正） | 壳侧 `Dh=0.016`（直接给定当量直径） | SFR 简化：TRANSFORM 由壳/管束几何推导，SFR 直接给 Dh，量级一致 |
| 壳侧换热面积 | `surfaceArea_shell = π·D_o_tube·length_tube·nTubes` | 壳侧 A_heat=π·Dh·L/Nw（circle 传热模型，单管口径） | 等效（面积口径一致） |
| 管侧换热面积 | `surfaceArea_tube = perimeter_tube·dlength_tube` | 管侧 A_heat=π·Dh·L/Nw | 等效 |

**数值校验**：管侧流通面积 = π·0.0136²/4×360 = 0.0523 m²；308.4 kg/s ÷ (863 kg/m³ × 0.0523) ≈ 6.8 m/s（快堆 IHX 高流速侧，可接受）。换热面积 = π·0.0136·2/4×360×4 ≈ 30.8 m²；40 MW / 30.8 m² ≈ 1.3 MW/m²（液态金属换热器典型 0.5~2 MW/m²）。300 s 仿真两侧焓平衡 40 MW 与堆芯功率一致。

## 3. 泵对照

| 项目 | TRANSFORM | SFR（t2） |
|---|---|---|
| 定流量泵 | `Fluid.Machines.Pump_SimpleMassFlow`（m_flow_nominal / use_input / in_m_flow / allowFlowReversal） | `SFR.Fluid.Machines.Pump_SimpleMassFlow` 已移植（参数同名兼容），FirstLoop 已改用 ✓ |
| 受控泵（备选） | `Fluid.Machines.Pump_Controlled` | 未移植（当前回路用定流量泵；如需变频调速可后续移植） |
| 泵在回路中的位置 | IHTS5_AHX3：pump → pipe_toIHX → … → resistance_toPump → pump | FirstLoop：泵 → pipe_static2 → volume1（下腔室）→ 堆芯；HE1 壳侧出口 → 泵 | 同构（锁流量泵 + 定流量） |

## 4. 膨胀箱 / 定压边界对照

| 项目 | TRANSFORM | SFR（t2） |
|---|---|---|
| 膨胀箱 | `Fluid.Volumes.ExpansionTank_1Port`（A、V0=0、p_surface、level_start、h_start、dheight；p-p_surface=ρ·g·level；port.p=p+ρ·g·dheight） | `SFR.Fluid.Vessels.ExpansionTank` 已移植（参数同名兼容，方程一致；SFR 版 initial equation 硬锚 level/h，TRANSFORM 用 massDynamics 条件——SFR 更稳） ✓ |
| 锚压支路 | `IHTS5_AHX3`：`expansionTank ↔ resistance_toExpTank(R=1/m_flow_IHX_IHTS) ↔ volume_fromAHX.port_b[1]`（死端支路） | `FirstLoop`：`expansionTank ↔ resistance_toBoundary(R=0.1) ↔ pipe_static1.portB`（死端支路，热端） | **同构**；R 值差异说明见下 |
| 混合体积 | `Fluid.Volumes.MixingVolume`（nPorts_a/nPorts_b 多口；5204 坑） | `SFR.Fluid.Vessels.MixingVolume` 自写（setState_phX + 质量/能量守恒 + h_start 硬锚），FirstLoop volume/volume1 多口用法与 IHTS5 的 volume_fromAHX(nPorts_a=3,nPorts_b=2)/volume_toAHX 一致 | 等效（SFR 自写规避 5204） |
| 阻力件 | `Fluid.FittingsAndResistances.SpecifiedResistance`（R=dp/m_flow，交叉 inStream） | `SFR.Fluid.Vessels.SpecifiedResistance` 已移植（方程一致） ✓ | 一致 |

**R 值差异说明**：TRANSFORM 示例取 `R=1/m_flow`（m_flow=280.6 → R≈0.0036 Pa·s/kg）；FirstLoop 取 R=0.1。两者都远小于主回路阻力（堆芯/管道压降 Pa 级 → 主回路 R 总量 ≥ 数十），死端支路流量 ≤ m_flow·(0.1/R_loop) 很小，均不干扰主路径分配；R=0.1 使支路流量更小（更接近死端），锚压更稳。后续可对齐 TRANSFORM 量级（R=1/m_flow），非必需。

## 5. 阀门

TRANSFORM `Fluid.Valves`：ValveIncompressible / ValveLinear / CheckValve / StopValve / ValveDiscrete 等。
当前 FirstLoop 无阀门（定流量泵 + 固定阻力网络），**未移植**。后续如需要（启停/失流瞬态、Stirling 侧调节阀）优先移植 `ValveIncompressible`（不可压缩流体，R=1/(k·ζ) 结构，与 SFR 介质兼容性需实测）。

## 6. 与 TRANSFORM 的差异与后续建议

| # | 差异 | 说明 / 建议 |
|---|---|---|
| 1 | HE1 壁初值均匀（713.15 K）而非 TRANSFORM 逆流线性剖面 | 均匀初值实测初始化收敛（300 s 仿真正常）；如遇慢瞬态可改逆流线性剖面（T_tube_in=703.15 → T_tube_out=803.15 反向插值） |
| 2 | 壳侧 Dh 直接给定（0.016）而非由壳体几何推导 | TRANSFORM ShellAndTubeHX 由 D_i/D_o_shell + 管束面积推导；SFR 简化直接给当量直径。如需精确壳程压降/换热，可按 TRANSFORM 公式反算 |
| 3 | CounterFlow 类名 CounterFlowPair | Sysplorer 简单类名全局注册，与已加载 TRANSFORM CounterFlow 冲突（实测整文件被跳过），故改名；功能与 TRANSFORM 版逐方程一致 |
| 4 | 泵/膨胀箱/阻力件均已完成 SFR 移植 | 后续新组件（阀、Pump_Controlled、GenericPipe 类）按「先移植到 SFR 再引用」纪律执行 |
| 5 | TYThermoFluidSys.TubeWall（商业库）替代 TRANSFORM Conduction_2D | 两者均圆柱管壁热容；TY 为商业库仅文档核对（r_inner/r_outer=内/外径）。如需完全脱离商业库，可后续移植 TRANSFORM Conduction_2D（工作量较大，非必需） |

## 7. 核对结论

- **HE1 与 TRANSFORM GenericDistributed_HX 结构、几何参数、动量设置（SteadyState 默认）、逆流配对完全对齐**；设计点（一次侧 550→440 ℃ @280.6 kg/s、二次侧 430→530 ℃ @308.4 kg/s）经 300 s 仿真验证两侧焓平衡 40 MW。
- **FirstLoop 定压方案与 TRANSFORM 钠快堆示例 IHTS5_AHX3 同构**（膨胀箱+阻力死端支路锚压）；泵、膨胀箱、阻力件均为 TRANSFORM 移植版。
- 遗留差异均为简化项（壁初值剖面、壳侧 Dh 推导、阀门未用），不阻塞当前可初始化基线；后续集成 t4 可在需要时按上表补齐。
