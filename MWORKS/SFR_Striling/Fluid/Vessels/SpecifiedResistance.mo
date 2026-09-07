within SFR_Striling.Fluid.Vessels;
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
    Icon(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2}),graphics = {Bitmap(origin={0,0},
extent={{-120,-67},{120,67}},
fileName="modelica://SFR_Striling/Resources/Images/Icons/Resistance_Fluid.jpg"), Text(origin={1,-88},
lineColor={0,0,255},
extent={{-150,20},{150,-20}},
textString="%name",
textColor={0,0,255})}),
    Diagram(coordinateSystem(preserveAspectRatio=false)));
end SpecifiedResistance;