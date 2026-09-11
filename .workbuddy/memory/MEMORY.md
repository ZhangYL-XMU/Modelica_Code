# 项目长期记忆：钠冷快堆 + 斯特林热机耦合建模（MWORKS.Sysplorer）

> 来源：`.mnemon/runtime/MEMORY.md`（12 条 critical）+ `.mnemon/documents/active/` 30 篇会话档案，2026-09-11 蒸馏注入。
> 详细技术档案（模型地图、标定参数、故障根因表）：[mnemon-project-context.md](./mnemon-project-context.md)
> 原始记忆库仍在 `E:\Modelica Code\.mnemon\`，按需索引。

## 一句话
用户是硕士研究生，课题＝在 MWORKS.Sysplorer 上做小型钠冷快堆（SFR）＋ 双作用斯特林热气机的耦合建模（方向含数据驱动模型降阶）。交流中文，偏好先结论后细节，成果文档 Markdown、公式 LaTeX，倾向自己在 GUI 搭模型（需要提供参数表＋布置图）。

## 硬性纪律（踩过坑，违反必出事故）
- **禁用 TY 商业组件/介质**（TYMedia、TYThermoFluidSys.*）；Modelica 基础库 TY 版 4.0.0.TY.1 可用。介质/组件一律基于 MSL 接口自建。
- **禁用 `check_model(reload_mo_path=…)`**：会触发 smart_layout 写回，把大模型图面整体重排并落盘。改用 `unload SFR + load_file(顶层 package.mo, skip_if_unchanged=false)`。
- 变体模型布局必须照源模型原样保留（用户明确）。
- 改完模型 → 重载库 → 第一时间 check 被改的那个模型。
- 长仿真在用户 GUI 跑，MCP 只读结果；仿真期间 MCP 超时/卡死属正常，不要重启 Sysplorer、不要干等。结果目录 `E:\Users\Admin\Documents\MWORKS\Simulation\<模型名-N>\`。
- 读结果只用官方 API：`run_script` + `ModelingPy.OpenResult(path)`（必须校验返回 True）+ `GetVarValueAt`；`result_manager` 的 `time_point="end"`/批量接口会给假值。
- 目录库单 `.mo` 文件只允许一个顶层类（多类整文件被静默跳过）；新类须登记 `package.order`。
- Sysplorer 图标渲染器不支持 `Circle` 图元 → 用 `Ellipse`（同 extent）。

## 设计基准（尹凯论文版为主）
核功率 40 MW；一回路堆芯进/出口 440/550 ℃、流量 280.6 kg/s、cp=1296；二回路 IHX 二次侧 430/530 ℃、308.4 kg/s；斯特林单组 4 缸 250 kW@1500 rpm、40 组＝10 MW 电。堆芯功率份额 **内 22.37% / 外 77.63%**（勿用旧 19.09/80.91）。运行限值：核功率 <113% Pn、出口钠温升 ≤30 ℃。

## 仿真“正常值”锚点（用于判断对错）
- PrimaryLoop 300 s 稳态：Q=40.004 MW、堆芯入口 440.04 ℃、出口 550.05 ℃、二回路出 HE1 530.09 ℃、ρ≈0。
- 总装 1000 s：39.999 MW、438.91/548.89 ℃、引擎 246.6 kW@1479 rpm（功率 ±4% 周期振荡为固有）。
- 读数警号：冷却剂平直 430 ℃ 无加热 ⇒ 检查 MSL Ramp（`time<startTime` 输出 0，不是 offset）。

## 工作流约定
- 排查卡 t=0：先看 `SimulationDebugInfo.log` 是“时间不推进＋反复 Zero-Crossing”（离散事件震荡）还是“初始化残差不收敛”（代数环/奇异）。
- 建模文档归档：一回路文献→`建模文档/一回路/`，二回路→`二回路/`，根目录只留跨回路总览。建模文档/ 被 .gitignore 忽略，重要结论必须同时落在 memory/md 里。

## 长期未决（等用户拍板）
1. 堆芯子通道规划 178（内 37＋外 114＋反射 12＋控制棒流道 15）尚未落盘。
2. α_coolant=−2e-4（TRANSFORM 惯例自定值）比尹凯论文强 20~25 倍，导致 flowDown 趋势与论文相反。
3. TubeWall 径向 1 节点 ⇒ T_wall 是棒体平均温度，非燃料中心温度；熔限/热点校核需升级径向 2~3 节点。
4. 44 MW 变工况会撞 HE1 二次侧边界（Boundary_pT=803.15 K 钉住 ⇒ 吸热上限≈40 MW）。
