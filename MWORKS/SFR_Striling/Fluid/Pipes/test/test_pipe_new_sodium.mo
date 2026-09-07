within SFR_Striling.Fluid.Pipes.test;
model test_pipe_new_sodium "pipe_new + SFR.Media.Sodium.Sodium（550C，1MW，MixingVolume 锚）"
  annotation(__MWORKS(version="26.1.3"),experiment(Algorithm=Dassl,StartTime=0,StopTime=30,Tolerance=0.0001));
  replaceable package Medium = SFR_Striling.Media.Sodium.Sodium;
  Modelica.Fluid.Sources.MassFlowSource_h boundary(
    redeclare package Medium = Medium, nPorts=1, m_flow=10, h=1.0094334e6) 
    annotation(Placement(transformation(origin={-60,0}, extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.Boundary_ph boundary1(
    redeclare package Medium = Medium, nPorts=1, p=1e6, h=1.0094334e6) 
    annotation(Placement(transformation(origin={60,0}, extent={{10,-10},{-10,10}})));
  SFR_Striling.Fluid.Pipes.pipe_new pipe1(
    redeclare package Medium = Medium,
    N=5, n_pipe=5, L_total=10, Dh=0.05, height_ab=1,
    h_start=1.0094334e6, p_start=1e6, T_start=823.15, T_wall_start=823.15,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_start=10) 
    annotation(Placement(transformation(origin={0,0}, extent={{-10,-10},{10,10}})));
  SFR_Striling.Fluid.Vessels.MixingVolume volume(
    nPorts_a=1, nPorts_b=1,
    V=1, p_start=1e6, T_start=823.15, h_start=1.0094334e6,
    redeclare package Medium = Medium) 
    annotation(Placement(transformation(origin={30,0}, extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow(Q_flow=1e6) 
    annotation(Placement(transformation(origin={-24,42},
extent={{-10,-10},{10,10}})));
equation
  connect(boundary.ports[1], pipe1.portA) 
    annotation(Line(origin={-30,0}, points={{-20,0},{20,0}}, color={0,127,255}));
  connect(pipe1.portB, volume.port_a[1]) 
    annotation(Line(origin={15,0}, points={{10,0},{5,0}}, color={0,127,255}));
  connect(volume.port_b[1], boundary1.ports[1]) 
    annotation(Line(origin={45,0}, points={{5,0},{5,0},{10,0}}, color={0,127,255}));
  connect(fixedHeatFlow.port, pipe1.wall[1]) 
    annotation(Line(origin={0,20},
points={{-14,22},{0,22},{0,-16.2}},
color={191,0,0}));
end test_pipe_new_sodium;