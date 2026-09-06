within SFR.Fluid.Pipes.test;
model test_pipe_msl_sodium "MSL DynamicPipe + SFR.Media.Sodium.Sodium 初始化对照台架（绝热，550C）"
  annotation(__MWORKS(version="26.1.3"),experiment(Algorithm=Dassl,StartTime=0,StopTime=30,Tolerance=0.0001));
  replaceable package Medium = SFR.Media.Sodium.Sodium;
  Modelica.Fluid.Sources.MassFlowSource_h boundary(
    redeclare package Medium = Medium, nPorts=1, m_flow=10, h=1.0094334e6)
    annotation(Placement(transformation(extent={{-34,-40},{-14,-20}})));
  Modelica.Fluid.Sources.Boundary_ph boundary1(
    redeclare package Medium = Medium, nPorts=1, p=1e6, h=1.0094334e6)
    annotation(Placement(transformation(extent={{14,-40},{34,-20}})));
  Modelica.Fluid.Pipes.DynamicPipe pipe1(
    redeclare package Medium = Medium,
    nNodes=5, length=10, diameter=0.05, height_ab=1,
    modelStructure=Modelica.Fluid.Types.ModelStructure.av_b,
    p_a_start=1e6, p_b_start=1e6, T_start=823.15, m_flow_start=10,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    annotation(Placement(transformation(extent={{-10,-10},{10,10}})));
equation
  connect(boundary.ports[1], pipe1.port_a)
    annotation(Line(points={{-24,-20},{-24,0},{-10,0}}));
  connect(pipe1.port_b, boundary1.ports[1])
    annotation(Line(points={{10,0},{10,-24},{24,-24},{24,-20}}));
end test_pipe_msl_sodium;
