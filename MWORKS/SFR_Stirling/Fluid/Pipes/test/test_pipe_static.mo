within SFR.Fluid.Pipes.test;
model test_pipe_static
  annotation(__MWORKS(version = "2025b"), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}},
    grid = {2, 2})));
  Modelica.Fluid.Sources.MassFlowSource_h boundary(nPorts=1, redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, m_flow=10, h=1e5) 
    annotation(Placement(transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_ph boundary1(nPorts=1, redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, p=100000) 
    annotation(Placement(transformation(origin = {50, -10},
    extent = {{10, -10}, {-10, 10}})));
  pipe_static pipe_static2(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, N=5) 
    annotation(Placement(transformation(origin = {-4.44089e-16, -9.98192},
    extent = {{-10, -10}, {10, 10}})));
  equation
  connect(boundary.ports[1], pipe_static2.portA) 
    annotation(Line(origin = {-25, -10},
    points = {{-15, 0}, {15.02226, -1.77636e-15}},
    color = {0, 127, 255}));
  connect(boundary1.ports[1], pipe_static2.portB) 
    annotation(Line(origin = {25, -10},
    points = {{15, 0}, {-14.9778, -1.77636e-15}},
    color = {0, 127, 255}));
end test_pipe_static;