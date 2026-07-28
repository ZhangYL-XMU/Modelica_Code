within SFR.Fluid;
package Vessels
  model test_volume
    annotation(__MWORKS(version="26.1.3"),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})));
    MixingVolume volume(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, nPorts_a=2, nPorts_b=1, redeclare model Geometry = TRANSFORM.Fluid.ClosureRelations.Geometry.Models.LumpedVolume.GenericVolume(V=1)) 
      annotation (Placement(transformation(origin={-2,6.66134e-16},
extent={{-10,-10},{10,10}})));
    Pipes.pipe_static pipe_static1(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={-40,16},
extent={{-10,-10},{10,10}})));
    Pipes.pipe_static pipe_static2(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={44,0},
extent={{-10,-10},{10,10}})));
    Pipes.pipe_static pipe_static3(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={-40,-14},
extent={{-10,-10},{10,10}})));
    Modelica.Fluid.Sources.MassFlowSource_T boundary(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, m_flow=10) 
      annotation (Placement(transformation(origin={-86,16},
extent={{-10,-10},{10,10}})));
    Modelica.Fluid.Sources.MassFlowSource_T boundary1(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, m_flow=10) 
      annotation (Placement(transformation(origin={-86,-14.0181},
extent={{-10,-10},{10,10}})));
    Modelica.Fluid.Sources.Boundary_ph boundary2(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, p=1e5) 
      annotation (Placement(transformation(origin={90,0},
extent={{10,-10},{-10,10}})));
    MixingVolume volume1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, nPorts_a=1, nPorts_b=2, redeclare model Geometry = TRANSFORM.Fluid.ClosureRelations.Geometry.Models.LumpedVolume.GenericVolume(V=1)) 
      annotation (Placement(transformation(origin={-6,-70},
extent={{-10,-10},{10,10}})));
    Pipes.pipe_static pipe_static4(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={-40,-70},
extent={{-10,-10},{10,10}})));
    Pipes.pipe_static pipe_static5(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={44,-50},
extent={{-10,-10},{10,10}})));
    Modelica.Fluid.Sources.MassFlowSource_T boundary3(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, m_flow=20) 
      annotation (Placement(transformation(origin={-86,-70},
extent={{-10,-10},{10,10}})));
    Modelica.Fluid.Sources.Boundary_ph boundary5(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, p=1e5) 
      annotation (Placement(transformation(origin={90,-50},
extent={{10,-10},{-10,10}})));
    Pipes.pipe_static pipe_static6(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={44,-96},
extent={{-10,-10},{10,10}})));
    Modelica.Fluid.Sources.Boundary_ph boundary4(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, p=1e5) 
      annotation (Placement(transformation(origin={90,-96},
extent={{10,-10},{-10,10}})));
    MixingVolume volume2(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, nPorts_a=2, nPorts_b=2, redeclare model Geometry = TRANSFORM.Fluid.ClosureRelations.Geometry.Models.LumpedVolume.GenericVolume(V=1)) 
      annotation (Placement(transformation(origin={-6,-162},
extent={{-10,-10},{10,10}})));
    Pipes.pipe_static pipe_static7(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={-44,-146},
extent={{-10,-10},{10,10}})));
    Pipes.pipe_static pipe_static9(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={-44,-176},
extent={{-10,-10},{10,10}})));
    Modelica.Fluid.Sources.MassFlowSource_T boundary6(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, m_flow=10) 
      annotation (Placement(transformation(origin={-90,-146},
extent={{-10,-10},{10,10}})));
    Modelica.Fluid.Sources.MassFlowSource_T boundary7(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, m_flow=10) 
      annotation (Placement(transformation(origin={-90,-176.0181},
extent={{-10,-10},{10,10}})));
    Pipes.pipe_static pipe_static8(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={54,-147},
extent={{-10,-10},{10,10}})));
    Modelica.Fluid.Sources.Boundary_ph boundary8(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, p=1e5) 
      annotation (Placement(transformation(origin={100,-147},
extent={{10,-10},{-10,10}})));
    Pipes.pipe_static pipe_static10(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
      annotation (Placement(transformation(origin={54,-193},
extent={{-10,-10},{10,10}})));
    Modelica.Fluid.Sources.Boundary_ph boundary9(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, p=1e5) 
      annotation (Placement(transformation(origin={100,-193},
extent={{10,-10},{-10,10}})));
    equation
    connect(volume.port_a[1], pipe_static1.portB) 
    annotation(Line(origin={-19,0},
points={{11,6.66134e-16},{-7.9778,6.66134e-16},{-7.9778,15.9819},{-10.9778,15.9819}},
color={0,127,255}));
    connect(volume.port_b[1], pipe_static2.portA) 
    annotation(Line(origin={19,0},
    points={{-15,6.66134e-16},{15.0223,-0.0180755}},
    color={0,127,255}));
    connect(pipe_static3.portB, volume.port_a[2]) 
    annotation(Line(origin={-19,-7},
    points={{-10.9778,-7.0180755},{11,-7.0180755},{11,7}},
    color={0,178,226}));
    connect(boundary.ports[1], pipe_static1.portA) 
    annotation(Line(origin={-63,16},
    points={{-13,0},{13.0223,-0.0180755}},
    color={0,127,255}));
    connect(boundary1.ports[1], pipe_static3.portA) 
    annotation(Line(origin={-63,-14},
    points={{-13,-0.0180755},{13.0223,-0.0180755}},
    color={0,127,255}));
    connect(pipe_static2.portB, boundary2.ports[1]) 
    annotation(Line(origin={67,0},
    points={{-12.9778,-0.0180755},{13,0}},
    color={0,178,226}));
    connect(volume1.port_a[1], pipe_static4.portB) 
    annotation(Line(origin={-23,-70},
points={{11,0},{-6.9778,-0.0180755}},
color={0,127,255}));
    connect(volume1.port_b[1], pipe_static5.portA) 
    annotation(Line(origin={15,-70},
points={{-15,0},{16.0223,0},{16.0223,19.9819},{19.0223,19.9819}},
color={0,127,255}));
    connect(boundary3.ports[1], pipe_static4.portA) 
    annotation(Line(origin={-63,-70},
points={{-13,0},{13.0223,-0.0180755}},
color={0,127,255}));
    connect(pipe_static5.portB, boundary5.ports[1]) 
    annotation(Line(origin={67,-50},
points={{-12.9778,-0.0180755},{13,0}},
color={0,178,226}));
    connect(pipe_static6.portB, boundary4.ports[1]) 
    annotation(Line(origin={67,-96},
points={{-12.9778,-0.0180755},{13,0}},
color={0,178,226}));
    connect(pipe_static6.portA, volume1.port_b[2]) 
    annotation(Line(origin={17,-83},
    points={{17.0223,-13.0181},{-9,-13.0181},{-9,13},{-17,13}},
    color={0,178,226}));
    connect(volume2.port_a[1], pipe_static7.portB) 
    annotation(Line(origin={-23,-162},
points={{11,0},{-7.9778,0},{-7.9778,15.9819},{-10.9778,15.9819}},
color={0,127,255}));
    connect(pipe_static9.portB, volume2.port_a[2]) 
    annotation(Line(origin={-23,-169},
points={{-10.9778,-7.01808},{11,-7.01808},{11,7}},
color={0,178,226}));
    connect(boundary6.ports[1], pipe_static7.portA) 
    annotation(Line(origin={-67,-146},
points={{-13,0},{13.0223,-0.0180755}},
color={0,127,255}));
    connect(boundary7.ports[1], pipe_static9.portA) 
    annotation(Line(origin={-67,-176},
points={{-13,-0.0181},{13.0223,-0.0180755}},
color={0,127,255}));
    connect(pipe_static8.portB, boundary8.ports[1]) 
    annotation(Line(origin={77,-147},
    points={{-12.9778,-0.0180755},{13,0}},
    color={0,178,226}));
    connect(pipe_static10.portB, boundary9.ports[1]) 
    annotation(Line(origin={77,-193},
    points={{-12.9778,-0.0180755},{13,0}},
    color={0,178,226}));
    connect(volume2.port_b[1], pipe_static8.portA) 
    annotation(Line(origin={24,-155},
points={{-24,-7},{4,-7},{4,7.98192},{20.0223,7.98192}},
color={0,127,255}));
    connect(pipe_static10.portA, volume2.port_b[2]) 
    annotation(Line(origin={22,-178},
    points={{22.0223,-15.0181},{-8,-15.0181},{-8,16},{-22,16}},
    color={0,178,226}));
    end test_volume;
  model MixingVolume
    parameter Integer nPorts_a=0 "Number of port_a connections" 
      annotation (Dialog(connectorSizing=true));
    parameter Integer nPorts_b=0 "Number of port_b connections" 
      annotation (Dialog(connectorSizing=true));
    TRANSFORM.Fluid.Interfaces.FluidPort_State port_a[nPorts_a](redeclare package Medium = Medium) 
      annotation (Placement(transformation(extent={{-70,-10},{-50,10}}),
          iconTransformation(extent={{-70,-10},{-50,10}})));
    TRANSFORM.Fluid.Interfaces.FluidPort_State port_b[nPorts_b](redeclare package Medium = Medium) 
      annotation (Placement(transformation(extent={{50,-10},{70,10}}),
          iconTransformation(extent={{50,-10},{70,10}})));
    extends TRANSFORM.Fluid.Volumes.BaseClasses.PartialVolume(final V=geometry.V, mb=sum(port_a.m_flow) + sum(port_b.m_flow), Ub=sum(H_flows_a) + sum(H_flows_b) + Q_flow_internal + Q_gen, mXib={sum(mXi_flows_a[:,i]) + sum(mXi_flows_b[:,i]) for i in 1:Medium.nXi}, mCb={sum(mC_flows_a[:,i]) + sum(mC_flows_b[:,i]) + mC_flow_internal[i] + mC_gen[i] for i in 1:Medium.nC});
    // Geometry Model
    replaceable model Geometry =
        TRANSFORM.Fluid.ClosureRelations.Geometry.Models.LumpedVolume.GenericVolume 
      constrainedby TRANSFORM.Fluid.ClosureRelations.Geometry.Models.LumpedVolume.GenericVolume
                                                                            "Geometry" 
      annotation (Dialog(group="Geometry"),choicesAllMatching=true);
    Geometry geometry annotation (Placement(transformation(extent={{-78,82},{-62,98}})));
    input Modelica.Units.SI.Acceleration g_n = Modelica.Constants.g_n "Gravitational acceleration" annotation(Dialog(tab="Advanced",group="Inputs"));
    Modelica.Units.SI.HeatFlowRate H_flows_a[nPorts_a] "Enthalpy flow rates at port_a";
    Modelica.Units.SI.MassFlowRate mXi_flows_a[nPorts_a,Medium.nXi]
      "Species mass flow rates at port_a";
    TRANSFORM.Units.ExtraPropertyFlowRate mC_flows_a[nPorts_a,Medium.nC]
      "Trace substance flow rates at port_a";
    Modelica.Units.SI.HeatFlowRate H_flows_b[nPorts_b] "Enthalpy flow rates at port_b";
    Modelica.Units.SI.MassFlowRate mXi_flows_b[nPorts_b,Medium.nXi]
      "Species mass flow rates at port_b";
    TRANSFORM.Units.ExtraPropertyFlowRate mC_flows_b[nPorts_b,Medium.nC]
      "Trace substance flow rates at port_b";
    parameter Boolean use_HeatPort = false "=true to toggle heat port" annotation(Dialog(tab="Advanced",group="Heat Transfer"),Evaluate=true);
    input Modelica.Units.SI.HeatFlowRate Q_gen=0 "Internal heat generation" annotation(Dialog(tab="Advanced",group="Heat Transfer"));
    parameter Boolean use_TraceMassPort = false "=true to toggle trace mass port" annotation(Dialog(tab="Advanced",group="Trace Mass Transfer"),Evaluate=true);
    parameter Real MMs[Medium.nC]=fill(1, Medium.nC)
      "Conversion from fluid mass-specific value to moles (e.g., molar mass [kg/mol] or Avogadro's number [atoms/mol])" 
      annotation (Dialog(tab="Advanced",group="Trace Mass Transfer", enable=use_TraceMassPort));
    input TRANSFORM.Units.ExtraPropertyFlowRate mC_gen[Medium.nC]=fill(0,Medium.nC) "Internal trace mass generation" 
      annotation (Dialog(tab="Advanced",group="Trace Mass Transfer"));
    TRANSFORM.HeatAndMassTransfer.Interfaces.HeatPort_State heatPort(T=medium.T, Q_flow=Q_flow_internal)                                                                      if use_HeatPort 
      annotation (Placement(transformation(extent={{-10,-70},{10,-50}}),
          iconTransformation(extent={{-10,-70},{10,-50}})));
    TRANSFORM.HeatAndMassTransfer.Interfaces.MolePort_State traceMassPort(nC=Medium.nC, C=C .* medium.d ./ MMs, n_flow=mC_flow_internal ./ MMs)                                                                                            if use_TraceMassPort 
      annotation (Placement(transformation(extent={{30,-50},{50,-30}}),
          iconTransformation(extent={{30,-50},{50,-30}})));
    // Visualization
    parameter Boolean showName = true annotation(Dialog(tab="Visualization"));
  protected
    Modelica.Units.SI.HeatFlowRate Q_flow_internal;
    TRANSFORM.Units.ExtraPropertyFlowRate mC_flow_internal[Medium.nC];
  equation
    if not use_HeatPort then
      Q_flow_internal = 0;
    end if;
    if not use_TraceMassPort then
      mC_flow_internal = zeros(Medium.nC);
    end if;
    // Boundary Conditions
    port_a.p = fill(medium.p + medium.d*g_n*0.5*geometry.dheight, nPorts_a);
    port_b.p = fill(medium.p - medium.d*g_n*0.5*geometry.dheight, nPorts_b);
    port_a.h_outflow = fill(medium.h, nPorts_a);
    port_b.h_outflow = fill(medium.h, nPorts_b);
    port_a.Xi_outflow = fill(medium.Xi, nPorts_a);
    port_b.Xi_outflow = fill(medium.Xi, nPorts_b);
    port_a.C_outflow = fill(C, nPorts_a);
    port_b.C_outflow = fill(C, nPorts_b);
    for i in 1:nPorts_a loop
      H_flows_a[i] = port_a[i].m_flow*actualStream(port_a[i].h_outflow);
      mXi_flows_a[i, :] = port_a[i].m_flow*actualStream(port_a[i].Xi_outflow);
      mC_flows_a[i, :] = port_a[i].m_flow*actualStream(port_a[i].C_outflow);
    end for;
    for i in 1:nPorts_b loop
      H_flows_b[i] = port_b[i].m_flow*actualStream(port_b[i].h_outflow);
      mXi_flows_b[i, :] = port_b[i].m_flow*actualStream(port_b[i].Xi_outflow);
      mC_flows_b[i, :] = port_b[i].m_flow*actualStream(port_b[i].C_outflow);
    end for;
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
end Vessels;
