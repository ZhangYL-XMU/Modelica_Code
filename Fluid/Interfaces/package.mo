within SFR.Fluid;
package Interfaces
  connector FluidPort
    "用于管道网络中准一维流体流动的接口（可压缩或不可压缩流体，单相或多相，单一或多种物质）"

    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      "Medium model" annotation (choicesAllMatching=true);

    flow Medium.MassFlowRate m_flow
      "Mass flow rate from the connection point into the component";
    Medium.AbsolutePressure p "Thermodynamic pressure in the connection point";
    stream Medium.SpecificEnthalpy h_outflow
      "Specific thermodynamic enthalpy close to the connection point if m_flow < 0";
    stream Medium.MassFraction Xi_outflow[Medium.nXi]
      "Independent mixture mass fractions m_i/m close to the connection point if m_flow < 0";
    stream Medium.ExtraProperty C_outflow[Medium.nC]
      "Properties c_i/m close to the connection point if m_flow < 0";
  end FluidPort;

  connector FluidPort_Flow
    "Generic fluid connector for defined flow variable (e.g., mass flow rate - m_flow)"
    extends Modelica.Fluid.Interfaces.FluidPort;
    annotation (
      defaultComponentName="port_a",
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={Ellipse(
            extent={{-40,40},{40,-40}},
            lineColor={0,127,255},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid), Text(extent={{-150,110},{150,50}},
              textString="%name")}),
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
          graphics={Ellipse(
            extent={{40,20},{80,-20}},
            lineColor={0,127,255},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid), Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={0,127,255},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid)}));
  end FluidPort_Flow;

  connector FluidPort_a
    extends FluidPort;
    annotation (defaultComponentName="port_a",
                Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Ellipse(
            extent={{-40,40},{40,-40}},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid), Text(extent={{-150,110},{150,50}},
              textString="%name")}),
         Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={0,127,255},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid), Ellipse(
            extent={{-100,100},{100,-100}},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid)}));
  end FluidPort_a;

  connector FluidPort_b "Generic fluid connector at design outlet"
    extends FluidPort;
    annotation (defaultComponentName="port_b",
                Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={
          Ellipse(
            extent={{-40,40},{40,-40}},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-30,30},{30,-30}},
            lineColor={0,127,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Text(extent={{-150,110},{150,50}}, textString="%name")}),
         Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={
          Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={0,127,255},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-100,100},{100,-100}},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-80,80},{80,-80}},
            lineColor={0,127,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}));
  end FluidPort_b;

  connector FluidPorts_a
    "Fluid connector with filled, large icon to be used for vectors of FluidPorts (vector dimensions must be added after dragging)"
    extends FluidPort;
    annotation (defaultComponentName="ports_a",
                Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-50,-200},{50,200}},
          initialScale=0.2), graphics={
          Text(extent={{-75,130},{75,100}}, textString="%name"),
          Rectangle(
            extent={{25,-100},{-25,100}},
            lineColor={0,127,255}),
          Ellipse(
            extent={{-25,90},{25,40}},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-25,25},{25,-25}},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-25,-40},{25,-90}},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid)}),
         Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-50,-200},{50,200}},
          initialScale=0.2), graphics={
          Rectangle(
            extent={{50,-200},{-50,200}},
            lineColor={0,127,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-50,180},{50,80}},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-50,50},{50,-50}},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-50,-80},{50,-180}},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid)}));
  end FluidPorts_a;

  connector FluidPorts_b
    "Fluid connector with outlined, large icon to be used for vectors of FluidPorts (vector dimensions must be added after dragging)"
    extends FluidPort;
    annotation (defaultComponentName="ports_b",
                Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-50,-200},{50,200}},
          initialScale=0.2), graphics={
          Text(extent={{-75,130},{75,100}}, textString="%name"),
          Rectangle(
            extent={{-25,100},{25,-100}}),
          Ellipse(
            extent={{-25,90},{25,40}},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-25,25},{25,-25}},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-25,-40},{25,-90}},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-15,-50},{15,-80}},
            lineColor={0,127,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-15,15},{15,-15}},
            lineColor={0,127,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-15,50},{15,80}},
            lineColor={0,127,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}),
         Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-50,-200},{50,200}},
          initialScale=0.2), graphics={
          Rectangle(
            extent={{-50,200},{50,-200}},
            lineColor={0,127,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-50,180},{50,80}},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-50,50},{50,-50}},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-50,-80},{50,-180}},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-30,30},{30,-30}},
            lineColor={0,127,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-30,100},{30,160}},
            lineColor={0,127,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-30,-100},{30,-160}},
            lineColor={0,127,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}));
  end FluidPorts_b;

  partial model PartialTwoPort "Partial component with two ports"
    import Modelica.Constants;
    outer Modelica.Fluid.System system "System wide properties";

    replaceable package Medium =
        SFR.Media.Sodium.Sodium_table "Medium in the component" 
        annotation (choicesAllMatching = true);

    parameter Boolean allowFlowReversal = system.allowFlowReversal
      "= true to allow flow reversal, false restricts to design direction (port_a -> port_b)" 
      annotation(Dialog(tab="Assumptions"), Evaluate=true);

    Modelica.Fluid.Interfaces.FluidPort_a port_a(
                                  redeclare package Medium = Medium,
                       m_flow(min=if allowFlowReversal then -Constants.inf else 0))
      "Fluid connector a (positive design flow direction is from port_a to port_b)" 
      annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    Modelica.Fluid.Interfaces.FluidPort_b port_b(
                                  redeclare package Medium = Medium,
                       m_flow(max=if allowFlowReversal then +Constants.inf else 0))
      "Fluid connector b (positive design flow direction is from port_a to port_b)" 
      annotation (Placement(transformation(extent={{110,-10},{90,10}}), iconTransformation(extent={{110,-10},{90,10}})));
    // Model structure, e.g., used for visualization
  protected
    parameter Boolean port_a_exposesState = false
      "= true if port_a exposes the state of a fluid volume";
    parameter Boolean port_b_exposesState = false
      "= true if port_b.p exposes the state of a fluid volume";
    parameter Boolean showDesignFlowDirection = true
      "= false to hide the arrow in the model icon";

    annotation (
      Documentation(info="<html>
<p>
This partial model defines an interface for components with two ports.
The treatment of the design flow direction and of flow reversal are predefined based on the parameter <code><strong>allowFlowReversal</strong></code>.
The component may transport fluid and may have internal storage for a given fluid <code><strong>Medium</strong></code>.
</p>
<p>
An extending model providing direct access to internal storage of mass or energy through port_a or port_b
should redefine the protected parameters <code><strong>port_a_exposesState</strong></code> and <code><strong>port_b_exposesState</strong></code> appropriately.
This will be visualized at the port icons, in order to improve the understanding of fluid model diagrams.
</p>
</html>"),Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
          Polygon(
            points={{20,-70},{60,-85},{20,-100},{20,-70}},
            lineColor={0,128,255},
            fillColor={0,128,255},
            fillPattern=FillPattern.Solid,
            visible=showDesignFlowDirection),
          Polygon(
            points={{20,-75},{50,-85},{20,-95},{20,-75}},
            lineColor={255,255,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            visible=allowFlowReversal),
          Line(
            points={{55,-85},{-60,-85}},
            color={0,128,255},
            visible=showDesignFlowDirection),
          Text(
            extent={{-149,-114},{151,-154}},
            textColor={0,0,255},
            textString="%name"),
          Ellipse(
            extent={{-110,26},{-90,-24}},
            fillPattern=FillPattern.Solid,
            visible=port_a_exposesState),
          Ellipse(
            extent={{90,25},{110,-25}},
            fillPattern=FillPattern.Solid,
            visible=port_b_exposesState)}));
  end PartialTwoPort;
end Interfaces;
