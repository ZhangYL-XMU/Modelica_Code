within SFR.Test;
model medium_test
  Modelica.Fluid.Pipes.DynamicPipe pipe(redeclare package Medium = SFR.Media.Sodium.Sodium_table, length=10, diameter=0.1, T_start=573.15, nNodes=10, use_HeatTransfer=true, m_flow_start=100) 
    annotation (Placement(transformation(origin = {2.46492, -1.84869}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.MassFlowSource_h boundary(nPorts=1, redeclare package Medium = SFR.Media.Sodium.Sodium_table, m_flow=300) 
    annotation (Placement(transformation(origin = {-75.1802, -2.77304}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_ph boundary1(nPorts=1, redeclare package Medium = SFR.Media.Sodium.Sodium_table) 
    annotation (Placement(transformation(origin={58.542,-1.23246}, extent={
            {10,-10},{-10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T=873.15) 
    annotation (Placement(transformation(origin={-49.2985,35.1252}, extent=
            {{-10,-10},{10,10}})));
equation
  connect(boundary.ports[1], pipe.port_a) 
  annotation(Line(origin={-36,-2},
  points={{-29.1802,-0.77304},{28.46492,-0.77304},{28.46492,0.15131}},
  color={0,127,255}));
  connect(pipe.port_b, boundary1.ports[1]) 
  annotation(Line(origin={41,-2},
      points={{-28.53508,0.15131},{7.542,0.15131},{7.542,0.76754}},
      color={0,127,255}));
  connect(fixedTemperature.port, pipe.heatPorts[5]) 
  annotation(Line(origin={-18,19},
  points={{-21.2985,16.1252},{12.2727,16.1252},{12.2727,-16.44869},{20.56492,-16.44869}},
  color={191,0,0}));
end medium_test;