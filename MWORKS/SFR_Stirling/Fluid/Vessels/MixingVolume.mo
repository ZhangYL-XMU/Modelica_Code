within SFR.Fluid.Vessels;
model MixingVolume "混合体积"
  import SI = Modelica.SIunits;
  parameter Integer nPorts_a=0 "Number of port_a connections" annotation(Dialog(connectorSizing=true));
  parameter Integer nPorts_b=0 "Number of port_b connections" annotation(Dialog(connectorSizing=true));
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(choicesAllMatching=true);
  Modelica.Fluid.Interfaces.FluidPort_a port_a[nPorts_a](redeclare package Medium = Medium) annotation(Placement(transformation(extent={{-70,-10},{-50,10}}), iconTransformation(extent={{-70,-10},{-50,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b[nPorts_b](redeclare package Medium = Medium) annotation(Placement(transformation(extent={{50,-10},{70,10}}), iconTransformation(extent={{50,-10},{70,10}})));

  /******************************/
  /*           几何参数         */
  /******************************/
  parameter SI.Volume V=1 "体积" annotation(Dialog(group="几何参数"));
  parameter SI.Length dheight=0 "高度差(port_b - port_a)，向上为正" annotation(Dialog(group="几何参数"));

  input SI.Acceleration g_n = Modelica.Constants.g_n "重力加速度" annotation(Dialog(tab="Advanced", group="Inputs"));
  parameter Boolean use_HeatPort = false "=true 时启用热端口" annotation(Dialog(tab="Advanced", group="Heat Transfer"), Evaluate=true);
  input SI.HeatFlowRate Q_gen=0 "内部热源" annotation(Dialog(tab="Advanced", group="Heat Transfer"));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort if use_HeatPort annotation(Placement(transformation(extent={{-10,-70},{10,-50}}), iconTransformation(extent={{-10,-70},{10,-50}})));
  parameter Boolean showName = true annotation(Dialog(tab="Visualization"));

  /******************************/
  /*           初始化           */
  /******************************/
  parameter SI.AbsolutePressure p_start = Medium.p_default "初始压力" annotation(Dialog(tab="Initialization", group="压力"));
  parameter SI.Temperature T_start = Medium.T_default "初始温度" annotation(Dialog(tab="Initialization", group="温度"));
  parameter SI.SpecificEnthalpy h_start = Medium.specificEnthalpy_pTX(p_start, T_start, Medium.X_default) "初始比焓" annotation(Dialog(tab="Initialization", group="比焓"));

  /******************************/
  /*         状态与物性         */
  /******************************/
  SI.AbsolutePressure p(start=p_start) "体积压力";
  SI.SpecificEnthalpy h(start=h_start) "体积比焓";
  Medium.ThermodynamicState state "热力状态(ph)";
  SI.Density d "密度";
  SI.Temperature T "温度";
  SI.SpecificInternalEnergy u "比内能";
  SI.Mass m "体积内工质质量";
  SI.InternalEnergy U "体积内工质内能";
  SI.HeatFlowRate H_flows_a[nPorts_a] "port_a 各口焓流率";
  SI.HeatFlowRate H_flows_b[nPorts_b] "port_b 各口焓流率";

protected
  SI.HeatFlowRate Q_flow_internal;

equation
  if not use_HeatPort then
    Q_flow_internal = 0;
  end if;

  /**************************************热力状态与物性*************************************/
  state = Medium.setState_phX(p, h, Medium.X_default);
  d = Medium.density(state);
  T = Medium.temperature(state);
  u = Medium.specificInternalEnergy(state);

  /**************************************热端口（可选）*************************************/
  if use_HeatPort then
    heatPort.T = T;
    heatPort.Q_flow = Q_flow_internal;
  end if;

  /**************************************端口边界条件*************************************/
  port_a.p = fill(p + d*g_n*0.5*dheight, nPorts_a);
  port_b.p = fill(p - d*g_n*0.5*dheight, nPorts_b);
  port_a.h_outflow = fill(h, nPorts_a);
  port_b.h_outflow = fill(h, nPorts_b);
  port_a.Xi_outflow = zeros(nPorts_a, Medium.nXi);
  port_b.Xi_outflow = zeros(nPorts_b, Medium.nXi);
  port_a.C_outflow = zeros(nPorts_a, Medium.nC);
  port_b.C_outflow = zeros(nPorts_b, Medium.nC);

  for i in 1:nPorts_a loop
    H_flows_a[i] = port_a[i].m_flow*actualStream(port_a[i].h_outflow);
  end for;
  for i in 1:nPorts_b loop
    H_flows_b[i] = port_b[i].m_flow*actualStream(port_b[i].h_outflow);
  end for;

  /**************************************质量与能量守恒***********************************/
  der(m) = sum(port_a.m_flow) + sum(port_b.m_flow);
  der(U) = sum(H_flows_a) + sum(H_flows_b) + Q_flow_internal + Q_gen;
  m = d*V;
  U = m*u;

initial equation
  // 硬锚定初始焓（避免状态初始猜测 0 → 温度从冷态启动）
  h = h_start;

  annotation (
    defaultComponentName="volume",
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={Ellipse(
          extent={{60,60},{-60,-60}},
          lineColor={0,0,0},
          fillColor={0,128,255},
          fillPattern=FillPattern.Sphere),
        Text(
          extent={{-151,104},{149,64}},
          lineColor={0,0,255},
          textString="%name",
          visible=DynamicSelect(true,showName))}),
    Diagram(coordinateSystem(preserveAspectRatio=false)));
end MixingVolume;