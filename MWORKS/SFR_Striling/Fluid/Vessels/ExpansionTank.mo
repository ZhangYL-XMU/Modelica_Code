within SFR_Striling.Fluid.Vessels;
model ExpansionTank "带覆盖气体的膨胀箱（移植自 TRANSFORM.Fluid.Volumes.ExpansionTank_1Port，纯 MSL 端口）"
  import SI = Modelica.SIunits;
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(choicesAllMatching=true);

  /******************************/
  /*           几何参数         */
  /******************************/
  parameter SI.Area A "液面横截面积" annotation(Dialog(group="几何参数"));
  parameter SI.Volume V0=0 "零液位时的液体体积" annotation(Dialog(group="几何参数"));
  input SI.Pressure p_surface=p_start "液面气体压力" annotation(Dialog(group="Inputs"));
  parameter SI.Length dheight=0 "端口与罐底的高度差（端口高于罐底为正）" annotation(Dialog(group="几何参数"));

  /******************************/
  /*           初始化           */
  /******************************/
  parameter SI.Pressure p_start=1e5 "初始压力" annotation(Dialog(tab="Initialization"));
  parameter SI.Length level_start "初始液位" annotation(Dialog(tab="Initialization"));
  parameter SI.SpecificEnthalpy h_start=Medium.specificEnthalpy_pTX(p_start, Medium.T_default, Medium.X_default) "初始比焓" annotation(Dialog(tab="Initialization"));

  /******************************/
  /*         状态与物性         */
  /******************************/
  SI.Length level(start=level_start, stateSelect=StateSelect.prefer) "液位";
  SI.SpecificEnthalpy h(start=h_start, stateSelect=StateSelect.prefer) "液体比焓";
  SI.Volume V "液体体积";
  SI.Mass m "液体质量";
  SI.InternalEnergy U "液体内能";
  SI.AbsolutePressure p(start=p_start) "罐底压力";
  Medium.ThermodynamicState state_liquid "液体热力状态";

  /******************************/
  /*           端口             */
  /******************************/
  Modelica.Fluid.Interfaces.FluidPort_a port(
    redeclare package Medium = Medium,
    m_flow(min=-Modelica.Constants.inf),
    h_outflow(start=h_start),
    p(start=p_start + Medium.density(Medium.setState_phX(p_start, h_start, Medium.X_default))*Modelica.Constants.g_n*level_start))
    "流体端口（正设计流向为流入膨胀箱）" annotation(Placement(transformation(extent={{-20,-100},{20,-60}}), iconTransformation(extent={{-10,-94},{10,-74}})));

  /******************************/
  /*         热端口（可选）     */
  /******************************/
  parameter Boolean use_HeatPort=false "=true 时启用热端口" annotation(Dialog(tab="Advanced", group="Heat Transfer"), Evaluate=true);
  input SI.HeatFlowRate Q_gen=0 "内部热源" annotation(Dialog(tab="Advanced", group="Heat Transfer"));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort if use_HeatPort annotation(Placement(transformation(extent={{74,-10},{94,10}}), iconTransformation(extent={{74,-10},{94,10}})));
  parameter Boolean showName=true annotation(Dialog(tab="Visualization"));

protected
  SI.HeatFlowRate Q_flow_internal;

initial equation
  level = level_start;
  h = h_start;

equation
  if not use_HeatPort then
    Q_flow_internal = 0;
  end if;

  if use_HeatPort then
    heatPort.T = Medium.temperature(state_liquid);
    heatPort.Q_flow = Q_flow_internal;
  end if;

  /**************************************液体物性与体积*************************************/
  state_liquid = Medium.setState_phX(p_surface, h, Medium.X_default);
  V = V0 + A*level;
  m = V*Medium.density(state_liquid);
  U = m*Medium.specificInternalEnergy(state_liquid);

  /**************************************静压与守恒*************************************/
  p - p_surface = Medium.density(state_liquid)*Modelica.Constants.g_n*level;
  der(m) = port.m_flow;
  der(U) = port.m_flow*actualStream(port.h_outflow) + Q_flow_internal + Q_gen;

  /**************************************端口边界条件*************************************/
  port.h_outflow = h;
  port.p = p + Medium.density(state_liquid)*Modelica.Constants.g_n*dheight;
  port.Xi_outflow = zeros(Medium.nXi);
  port.C_outflow = zeros(Medium.nC);

  annotation (
    defaultComponentName="tank",
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Ellipse(
          extent={{-85,85},{85,-85}},
          fillColor={0,128,255},
          fillPattern=FillPattern.Sphere,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Ellipse(
          extent={{-85,-85},{85,85}},
          pattern=LinePattern.None,
          lineColor={135,135,135},
          fillColor={255,255,255},
          fillPattern=FillPattern.Sphere,
          startAngle=0,
          endAngle=180),
        Text(
          extent={{-151,134},{149,94}},
          lineColor={0,0,255},
          textString="%name",
          visible=DynamicSelect(true,showName))}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}})));
end ExpansionTank;