within SFR.Fluid.Pipes.test;
model test_pipe_sodium "no-TY rig with MixingVolume anchor (Sodium ph, 1MW, 550C)"
  annotation(__MWORKS(version="26.1.3"),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
    grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.01,StartTime=0,StopTime=30,StoreEventValue=0,Tolerance=0.0001));
  Modelica.Fluid.Sources.MassFlowSource_h boundary(nPorts=1,
    redeclare package Medium = SFR.Media.Sodium.Sodium,
    m_flow=10, h=1.0094334e6) 
    annotation(Placement(transformation(origin={-60,-0.0180755},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.Boundary_ph boundary1(nPorts=1,
    redeclare package Medium = SFR.Media.Sodium.Sodium,
    p=9.999999999999999e5, h=1.0094334e6) 
    annotation(Placement(transformation(origin={60,0},
extent={{10,-10},{-10,10}})));
  pipe pipe1(N=5,
    redeclare package Medium = SFR.Media.Sodium.Sodium,
    n_pipe=5, height_ab=1, h_start=1.0094334e6, p_start=1e6,
    T_start=823.15, T_wall_start=823.15,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_start=10) 
    annotation(Placement(transformation(extent={{-34,-10},{-14,10}})));
  SFR.Fluid.Vessels.MixingVolume volume(
    nPorts_a=1, nPorts_b=1,
    V=1, p_start=1e6, T_start=823.15, h_start=1.0094334e6,
    redeclare package Medium = SFR.Media.Sodium.Sodium) 
    annotation(Placement(transformation(extent={{14,-10},{34,10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow(Q_flow=1e6) 
    annotation(Placement(transformation(origin={-46,32},
extent={{-10,-10},{10,10}})));
equation
  connect(boundary.ports[1], pipe1.portA) 
    annotation(Line(origin={0,0},
points={{-50,-0.0180755},{-33.97774,-0.0180755}}));
  connect(pipe1.portB, volume.port_a[1]) 
    annotation(Line(points={{-14,0},{14,0}}));
  connect(volume.port_b[1], boundary1.ports[1]) 
    annotation(Line(origin={0,0},
points={{30,0},{50,0}}));
  connect(fixedHeatFlow.port, pipe1.wall[1]) 
    annotation(Line(origin={0,0},
points={{-36,32},{-24,32},{-24,3.8}}));
end test_pipe_sodium;