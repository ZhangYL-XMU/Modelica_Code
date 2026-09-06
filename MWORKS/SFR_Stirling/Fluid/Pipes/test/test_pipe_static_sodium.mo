within SFR.Fluid.Pipes.test;
model test_pipe_static_sodium "pipe_static + SFR.Media.Sodium.Sodium 初始化对照（绝热，550C）"
  annotation(__MWORKS(version="26.1.3"),experiment(Algorithm=Dassl,StartTime=0,StopTime=30,Tolerance=0.0001));
  replaceable package Medium = SFR.Media.Sodium.Sodium;
  Modelica.Fluid.Sources.MassFlowSource_h boundary(
    redeclare package Medium = Medium, nPorts=1, m_flow=10, h=1.0094334e6)
    annotation(Placement(transformation(extent={{-34,-40},{-14,-20}})));
  Modelica.Fluid.Sources.Boundary_ph boundary1(
    redeclare package Medium = Medium, nPorts=1, p=1e6, h=1.0094334e6)
    annotation(Placement(transformation(extent={{14,-40},{34,-20}})));
  SFR.Fluid.Pipes.pipe_static pipe1(
    redeclare package Medium = Medium,
    N=5, n_pipe=5, L_total=10, Dh=0.05, height_ab=1,
    h_start=1.0094334e6, p_start=1e6, T_start=823.15, T_wall_start=823.15,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_start=10, wallHeatTransfer=false)
    annotation(Placement(transformation(extent={{-10,-10},{10,10}})));
equation
  connect(boundary.ports[1], pipe1.portA)
    annotation(Line(points={{-24,-20},{-24,0},{-10,0}}));
  connect(pipe1.portB, boundary1.ports[1])
    annotation(Line(points={{10,0},{10,-24},{24,-24},{24,-20}}));
end test_pipe_static_sodium;
