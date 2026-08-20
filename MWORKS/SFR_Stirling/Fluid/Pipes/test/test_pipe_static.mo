within SFR.Fluid.Pipes.test;
model test_pipe_static
  annotation(__MWORKS(version = "2025b"), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}},
    grid = {2, 2})));
  pipe_static pipe_static1(redeclare package Medium = TYMedia.Incompressible.LBE, initFromEnthalpy=true, h_start=4.725e4, wallHeatTransfer=false) if false 
    annotation(Placement(transformation(origin = {1, 64.0180755},
    extent = {{-10, -10}, {10, 10}})));
  TYThermoFluidSys.Boundaries.BoundaryMdot boundaryMdot(redeclare package Medium = TYMedia.Incompressible.LBE, m_flow=10) if false 
    annotation(Placement(transformation(origin = {-36, 64.0180755},
    extent = {{-10, -10}, {10, 10}})));
  TYThermoFluidSys.Boundaries.BoundaryPressure boundaryPressure(redeclare package Medium = TYMedia.Incompressible.LBE) if false 
    annotation(Placement(transformation(origin = {38, 64},
    extent = {{10, -10}, {-10, 10}})));
  Modelica.Fluid.Sources.MassFlowSource_h boundary(nPorts=1, redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, m_flow=10, h=1e5) 
    annotation(Placement(transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_ph boundary1(nPorts=1, redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, p=100000) 
    annotation(Placement(transformation(origin = {50, -10},
    extent = {{10, -10}, {-10, 10}})));
  pipe_static pipe_static2(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, N=5) 
    annotation(Placement(transformation(origin = {-4.44089e-16, -9.98192},
    extent = {{-10, -10}, {10, 10}})));
  equation
  connect(pipe_static1.portB, boundaryPressure.fluidPort) 
    annotation(Line(origin = {21, 63.9999755},
    points = {{-9.9778, 2.45e-5}, {9, 2.45e-5}},
    color = {0, 178, 226}));
  connect(boundaryMdot.fluidPort, pipe_static1.portA) 
    annotation(Line(origin = {-18, 63.9999755},
    points = {{-10, 0.0181}, {9.02226, 2.45e-5}},
    color = {0, 178, 226}));
  connect(boundary.ports[1], pipe_static2.portA) 
    annotation(Line(origin = {-25, -10},
    points = {{-15, 0}, {15.02226, -1.77636e-15}},
    color = {0, 127, 255}));
  connect(boundary1.ports[1], pipe_static2.portB) 
    annotation(Line(origin = {25, -10},
    points = {{15, 0}, {-14.9778, -1.77636e-15}},
    color = {0, 127, 255}));
end test_pipe_static;
