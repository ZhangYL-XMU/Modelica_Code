within SFR_Stirling.Fluid.Vessels;
model SpecifiedResistance "固定水力阻力（移植自 TRANSFORM.Fluid.FittingsAndResistances.SpecifiedResistance，纯 MSL 端口）"
  import SI = Modelica.SIunits;
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(choicesAllMatching=true);
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Medium) "入口" annotation(Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Medium) "出口" annotation(Placement(transformation(extent={{90,-10},{110,10}})));
  input Real R(final quantity="HydraulicResistance", final unit="Pa.s/kg") "水力阻力系数，Pa·s/kg" annotation(Dialog(group="Inputs"));
equation
  port_a.m_flow + port_b.m_flow = 0;
  port_a.m_flow*R = port_a.p - port_b.p;
  // 流变量循环（与 TRANSFORM PartialResistance 一致的交叉写法：三通死端支路必须取支路内侧）
  port_a.h_outflow = inStream(port_b.h_outflow);
  port_b.h_outflow = inStream(port_a.h_outflow);
  port_a.Xi_outflow = inStream(port_b.Xi_outflow);
  port_b.Xi_outflow = inStream(port_a.Xi_outflow);
  port_a.C_outflow = inStream(port_b.C_outflow);
  port_b.C_outflow = inStream(port_a.C_outflow);
  annotation (
    defaultComponentName="resistance",
    Icon(
      coordinateSystem(extent={{-100,-100},{100,100}}, grid={2,2}),
      graphics={
        Line(
          points={{-80,0},{-60,0},{-50,30},{-36,-30},{-22,30},{-8,-30},{6,30},{20,-30},{34,30},{48,-30},{60,0},{80,0}},
          color={0,0,255},
          thickness=2,
          smooth=Smooth.None),
        Text(
          origin={0,-80},
          extent={{-150,20},{150,-20}},
          lineColor={0,0,255},
          textColor={0,0,255},
          textString="%name")}),
    Diagram(coordinateSystem(preserveAspectRatio=false)));
end SpecifiedResistance;