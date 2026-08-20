within SFR.Utilities.Functions;
function reynoldsNumberSmooth "雷诺数计算"
  import SI = Modelica.SIunits;
  extends Modelica.Icons.Function;

  input SI.MassFlowRate m_flow "单管质量流量，kg/s";
  input SI.Length Dhyd "水力直径，m";
  input SI.Area A "单管流通截面积，m2";
  input SI.DynamicViscosity mu "动力粘度，Pa·s";

  output SI.ReynoldsNumber Re_smooth "平滑钳位后的雷诺数（输出 >= Re_min）";

protected
  constant SI.ReynoldsNumber Re_min = 1.0 "钳位下限——手动修改处①";
  constant SI.ReynoldsNumber delta = 0.5 "平滑过渡半宽——手动修改处②";
  SI.ReynoldsNumber Re_raw "原始雷诺数";
  SI.ReynoldsNumber t "偏移量 t = Re_raw - Re_min";

algorithm
  // 防御性检查（不需要可整段删除）：防止几何/物性输入为零导致除零
  assert(A > 0, "reynoldsNumberSmooth：截面积 A 必须为正");
  assert(mu > 0, "reynoldsNumberSmooth：动力粘度 mu 必须为正");

  // ① 原始雷诺数（与 TRANSFORM 库 ReynoldsNumber_m_flow 的定义一致）
  Re_raw := noEvent(abs(m_flow*Dhyd/(A*mu)));

  // ② 平滑下限钳位：Re_smooth = Re_min + 0.5*(t + sqrt(t^2 + delta^2))
  //    t -> +∞ 时 Re_smooth -> Re_raw（远端零偏差）；
  //    t -> -∞ 时 Re_smooth -> Re_min（零流量输出约 Re_min + delta^2/(4*Re_min)）。
  t := Re_raw - Re_min;
  Re_smooth := Re_min + 0.5*(t + sqrt(t*t + delta*delta));

  annotation(Inline = true);
end reynoldsNumberSmooth;