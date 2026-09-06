within SFR.Thermal.Volumes;
model test_TubeWall
  "TubeWall 最小集成测试：单管 pipe + TubeWall + 100kW 热源，验证能量平衡/稳态温差/λ 取值"
  Fluid.Pipes.pipe p1(
    N=2, n_pipe=1, L_total=1, Dh=0.0415, initFromEnthalpy=true, h_start=506655,
    wallHeatTransfer=true, momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium)
    annotation(Placement(transformation(origin={-60,0}, extent={{-10,-10},{10,10}})));
  TubeWall w1(N=1, n_tubes=1, r_inner=0.0028, r_outer=0.003, length=1, T_start=823.15)
    annotation(Placement(transformation(origin={-20,80}, extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow q1(Q_flow=100000 "100kW 注入")
    annotation(Placement(transformation(origin={30,80}, extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_T src(nPorts=1, T=703.15, m_flow=1,
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium)
    annotation(Placement(transformation(origin={-120,0}, extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.Boundary_pT sink(nPorts=1, T=703.15, p=100000,
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium)
    annotation(Placement(transformation(origin={0,0}, extent={{-10,-10},{10,10}})));
equation
  connect(src.ports[1], p1.portA);
  connect(p1.portB, sink.ports[1]);
  connect(w1.port_a, p1.wall);
  connect(q1.port, w1.port_b[1]);
  annotation(experiment(Algorithm=Dassl, StopTime=20, Interval=0.01, Tolerance=0.0001));
end test_TubeWall;
