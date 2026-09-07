within SFR_Striling.Nuclear;
model PointKinetics "点堆模型"

import    Modelica.Units.SI;

//初始化
parameter Boolean use_DecayHeat = false "true-考虑衰变热;false-不考虑衰变热";
parameter Real[nI] C_i_start = {beta_i[i] / (lambda_i[i] * Lambda) * Q_nominal for i in 1:nI}
                                                                                             "缓发中子先驱核浓度初值" 
    annotation (Dialog(tab = "初始化"));

//反应堆参数
parameter Real v(unit = "cm3") = 552640 "反应堆体积";
parameter Real Sigmaf(unit = "1/cm") = 3.6130E-03 "易裂变材料宏观裂变截面";
parameter Real Ef(unit = "MeV")=200 "每次裂变释放能量";

protected
parameter Real nt_nominal = Q_nominal / (Sigmaf * v * Ef* 1.6E-19 * 1e6);

public
parameter SI.Time T_op = 360 * 24 * 3600 "稳态运行时间";
parameter SI.Power Q_nominal = 40e6 "额定功率";

parameter Integer nI = 6 "缓发中子数对数" 
    annotation (Dialog(tab = "点堆", group = "中子动力学参数"));
parameter Real[nI] beta_i = {0.000125, 0.001424, 0.001274, 0.002568, 0.000748, 0.000273}  "缓发中子份额" 
    annotation (Dialog(tab = "点堆", group = "中子动力学参数"));
parameter Real[nI] lambda_i(unit = "1/s") = {0.0124, 0.0303, 0.111, 0.301, 1.14, 3.01}  "缓发中子衰变常数" 
    annotation (Dialog(tab = "点堆", group = "中子动力学参数"));
parameter SI.Time Lambda = 1e-5 "中子代时间" 
    annotation (Dialog(tab = "点堆", group = "中子动力学参数"));

parameter Real alpha_fuel(unit = "1/K") = -2.5e-5 "多普勒反馈系数" 
    annotation (Dialog(tab = "点堆", group = "反应性参数"));
parameter Real alpha_coolant(unit = "1/K") = -20e-5 "冷却剂反馈常数" 
    annotation (Dialog(tab = "点堆", group = "反应性参数"));
parameter SI.Temperature Teffref_fuel(displayUnit = "K") = 823.15 "燃料棒参考温度" 
    annotation (Dialog(tab = "点堆", group = "反应性参数"));
parameter SI.Temperature Teffref_coolant(displayUnit = "K") = 773.15 "冷却剂参考温度" 
    annotation (Dialog(tab = "点堆", group = "反应性参数"));

//变量
//SI.Power Q_total   "反应堆总功率";
SI.Power Q_fission(start = Q_nominal, fixed = true) "反应堆裂变功率（点堆动力学状态变量，初值=额定功率；fixed=true 防止初始化收敛到 Q=0 平凡解（2026-09-01 PrimaryLoop 温度异常根因））";
SI.Power Q_decay   "反应堆衰变功率";

Real nt(start = nt_nominal) "中子密度cm-3";

Real Reactivity_Fuel "燃料棒反应性";
Real Reactivity_Coolant "冷却剂反应性";
Real Reactivity_Total "总反应性";


Real Beta = sum(beta_i)
                       "总缓发中子份额";
Real[nI] C_i(start = C_i_start)
                               "缓发中子先驱核浓度";

//接口
Modelica.Blocks.Interfaces.RealInput Reactivity_Other
    "其他额外引入反应性" annotation (Placement(transformation(origin={-111,22},
extent={{-9.5,-9.5},{9.5,9.5}}),
iconTransformation(origin={-109.75,23.25},
extent={{9.75,-10.25},{-9.75,10.25}},
rotation=180)));
Modelica.Blocks.Interfaces.RealInput Reactivity_CR "控制棒反应性" 
    annotation (Placement(transformation(origin={-111,40.5},
extent={{-9.5,-9.5},{9.5,9.5}}),
iconTransformation(origin={-109.75,70.25},
extent={{9.75,-10.25},{-9.75,10.25}},
rotation=180)));
// Modelica.Blocks.Interfaces.RealInput S_external_in "外部中子源热功率"
//     annotation (Placement(transformation(extent = {{-9.5, -9.5}, {9.5, 9.5}},
//       rotation = 0,
//       origin = {-111, 4}),
//       iconTransformation(extent = {{9.75, -10.25}, {-9.75, 10.25}},
//         rotation = 180,
//         origin = {-89.75, 0.25})));
Modelica.Blocks.Interfaces.RealInput Teff_fuel "燃料棒温度" 
    annotation (Placement(transformation(origin={-111.25,-16},
extent={{-9.5,-9.75},{9.5,9.75}}),
iconTransformation(origin={-109.75,-26.25},
extent={{9.75,-9.75},{-9.75,9.75}},
rotation=180)));
Modelica.Blocks.Interfaces.RealInput Teff_coolant "冷却剂温度" 
    annotation (Placement(transformation(origin={-111,-39.5},
extent={{-9.5,-9.5},{9.5,9.5}}),
iconTransformation(origin={-109.75,-75.75},
extent={{9.75,-10.25},{-9.75,10.25}},
rotation=180)));

Modelica.Blocks.Interfaces.RealOutput Q_total(start = Q_nominal)
    "反应堆输出功率" 
    annotation (Placement(transformation(origin={112.25,44.5},
extent={{-11.25,-10.5},{11.25,10.5}}),
iconTransformation(origin={111.75,69.25},
extent={{-9.75,-9.25},{9.75,9.25}})));
Modelica.Blocks.Interfaces.RealInput Q_in "外部中子源热功率" 
    annotation (Placement(transformation(origin={0,89.5},
extent={{-9.5,-9.5},{9.5,9.5}},
rotation=270),
iconTransformation(origin={-1.75,110.25},
extent={{9.75,-10.25},{-9.75,10.25}},
rotation=90)));
Modelica.Blocks.Interfaces.RealOutput Q_innerCore(start = Q_nominal)
    "堆芯内部输出功率" 
    annotation (Placement(transformation(origin={112.25,-38.5},
extent={{-11.25,-10.5},{11.25,10.5}}),
iconTransformation(origin={111.75,-26.75},
extent={{-9.75,-9.25},{9.75,9.25}})));
Modelica.Blocks.Interfaces.RealOutput Q_outerCore(start = Q_nominal)
    "堆芯边缘输出功率" 
    annotation (Placement(transformation(origin={112.25,3},
extent={{-11.25,-10.5},{11.25,10.5}}),
iconTransformation(origin={111.75,22.25},
extent={{-9.75,-9.25},{9.75,9.25}})));
Modelica.Blocks.Interfaces.RealOutput Power_nt 
    annotation (Placement(transformation(origin={112,-76},
extent={{-10,-10},{10,10}})));


equation
//连接
  Power_nt=nt;
  // FirstLoop 双通道语义：热通道（圈8）份额 = 7634.21/40000 = 0.19085525（侯斌表3）
  // 注意：FirstLoop_fixed 三通道模型不使用这两个输出，改用 Q_total×0.2237/0.7763（内外堆芯份额）
  Q_innerCore = Q_total * 0.19085525;
  Q_outerCore = Q_total - Q_innerCore;

//功率计算
  Q_fission=nt * Sigmaf * v * Ef * 1.6E-19 * 1e6;
  Q_decay = (0.1 * ((time + 10) ^ (-0.2) - (time + T_op) ^ (-0.2) +
             0.87 * (time +T_op + 2e7) ^ (-0.2) - 0.87 * (time + 2e7) ^ (-0.2))) * Q_nominal;
if use_DecayHeat then
  Q_total=Q_fission+Q_decay+Q_in;
  else
  Q_total=Q_fission+Q_in;
  end if;

//点堆动力学（功率形式：dQ/dt=(ρ−β)/Λ·Q+ΣλᵢCᵢ；C_i 为功率当量先驱核浓度，初值=稳态值）
  der(Q_fission) = (Reactivity_Total - Beta) / Lambda * Q_fission + sum(lambda_i .* C_i);
  der(C_i) = beta_i / Lambda * Q_fission - lambda_i .* C_i;

//反应性计算
  Reactivity_Fuel = alpha_fuel * log( Teff_fuel / Teffref_fuel);
  Reactivity_Coolant = alpha_coolant * (Teff_coolant - Teffref_coolant);
  Reactivity_Total = Reactivity_Fuel + Reactivity_Coolant + Reactivity_CR + Reactivity_Other;

  annotation(experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,NumberOfIntervals=500,StartTime=0,StopTime=500,StoreEventValue=0,Tolerance=0.0001),
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{28,-48.5},{40,-36.5}},
          fillColor={255,0,0},
          fillPattern=FillPattern.Sphere,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Text(
          extent={{-149,138.5},{151,98.5}},
          textString="%name",
          lineColor={0,0,255}),
        Ellipse(
          extent={{-14,7},{-2,19}},
          fillColor={0,0,255},
          fillPattern=FillPattern.Sphere,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Ellipse(
          extent={{-6,11},{6,23}},
          fillColor={255,0,0},
          fillPattern=FillPattern.Sphere,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Ellipse(
          extent={{2,7},{14,19}},
          fillColor={0,0,255},
          fillPattern=FillPattern.Sphere,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Ellipse(
          extent={{2,-1},{14,11}},
          fillColor={255,0,0},
          fillPattern=FillPattern.Sphere,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Ellipse(
          extent={{-6,3},{6,15}},
          fillColor={0,0,255},
          fillPattern=FillPattern.Sphere,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Ellipse(
          extent={{-6,-5},{6,7}},
          fillColor={0,0,255},
          fillPattern=FillPattern.Sphere,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Ellipse(
          extent={{-14,-1},{-2,11}},
          fillColor={255,0,0},
          fillPattern=FillPattern.Sphere,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Ellipse(
          extent={{-41.5,-41},{-29.5,-29}},
          fillColor={0,0,255},
          fillPattern=FillPattern.Sphere,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Ellipse(
          extent={{-33,-49},{-21,-37}},
          fillColor={0,0,255},
          fillPattern=FillPattern.Sphere,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Ellipse(
          extent={{-41.5,-49},{-29.5,-37}},
          fillColor={255,0,0},
          fillPattern=FillPattern.Sphere,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Ellipse(
          extent={{25.5,-39.5},{37.5,-27.5}},
          fillColor={0,0,255},
          fillPattern=FillPattern.Sphere,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Ellipse(
          extent={{19.5,-45},{31.5,-33}},
          fillColor={255,0,0},
          fillPattern=FillPattern.Sphere,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Ellipse(
          extent={{-6.5,55},{5.5,67}},
          fillColor={0,0,255},
          fillPattern=FillPattern.Sphere,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Polygon(
          points={{-5.5,40},{-0.5,30},{4.5,40},{-5.5,40}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-1,50},{0,40}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Polygon(
          points={{-5,5},{0,-5},{5,5},{-5,5}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={-20,-23.5},
          rotation=-30),
        Rectangle(
          extent={{-0.5,5},{0.5,-5}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={-15,-15},
          rotation=-30),
        Polygon(
          points={{-5,5},{0,-5},{5,5},{-5,5}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={20,-23.5},
          rotation=30),
        Rectangle(
          extent={{-0.5,5},{0.5,-5}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={15,-15},
          rotation=30),
        Ellipse(
          extent={{-13.5,-66.5},{-1.5,-54.5}},
          fillColor={0,0,255},
          fillPattern=FillPattern.Sphere,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Ellipse(
          extent={{1,-61.5},{13,-49.5}},
          fillColor={0,0,255},
          fillPattern=FillPattern.Sphere,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Polygon(
          points={{-5,5},{0,-5},{5,5},{-5,5}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={33.5,61},
          rotation=90),
        Rectangle(
          extent={{-0.5,5},{0.5,-5}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={23.5,61},
          rotation=90),
        Rectangle(
          extent={{-0.5,5},{0.5,-5}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={-34.5,61},
          rotation=90),
        Polygon(
          points={{-5,5},{0,-5},{5,5},{-5,5}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          origin={-24.5,61},
          rotation=90),
        Ellipse(
          extent={{-64.5,55},{-52.5,67}},
          fillColor={0,0,255},
          fillPattern=FillPattern.Sphere,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Ellipse(
          extent={{53.5,55},{65.5,67}},
          fillColor={0,0,255},
          fillPattern=FillPattern.Sphere,
          pattern=LinePattern.None,
          lineColor={0,0,0})}));
end PointKinetics;