within SFR_Striling.Fluid.Pipes.test;
model test_HeatTransfer_cmp
  "圆管(Lyon) vs 棒束(Westinghouse) 换热对比：同几何/流量/入口/壁温，读 Nu/gamma/Q"
  SFR_Striling.Fluid.Pipes.pipe p_circle(
    N=2, Dh=0.0415, n_pipe=1, L_total=1.1, initFromEnthalpy=true, h_start=506655,
    wallHeatTransfer=true, momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium,
    redeclare model HeatTransfer = SFR_Striling.Fluid.Pipes.BaseClasses.HeatTransfer.circle)
    annotation(Placement(transformation(origin={-40,40}, extent={{-10,-10},{10,10}})));
  SFR_Striling.Fluid.Pipes.pipe p_core(
    N=2, Dh=0.0415, n_pipe=1, L_total=1.1, initFromEnthalpy=true, h_start=506655,
    wallHeatTransfer=true, momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium,
    redeclare model HeatTransfer = SFR_Striling.Fluid.Pipes.BaseClasses.HeatTransfer.core)
    annotation(Placement(transformation(origin={-40,-40}, extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_T src1(nPorts=1, m_flow=1.6967, T=713.15,
    redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium)
    annotation(Placement(transformation(origin={-100,40}, extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_T src2(nPorts=1, m_flow=1.6967, T=713.15,
    redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium)
    annotation(Placement(transformation(origin={-100,-40}, extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.Boundary_pT snk1(nPorts=1, p=100000, T=713.15,
    redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium)
    annotation(Placement(transformation(origin={20,40}, extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.Boundary_pT snk2(nPorts=1, p=100000, T=713.15,
    redeclare package Medium = SFR_Striling.Media.Sodium.ConstantPropertyLiquidSodium)
    annotation(Placement(transformation(origin={20,-40}, extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fx1(T=873.15 "壁温600C")
    annotation(Placement(transformation(origin={-40,90}, extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fx2(T=873.15 "壁温600C")
    annotation(Placement(transformation(origin={-40,10}, extent={{-10,-10},{10,10}})));
equation
  connect(src1.ports[1], p_circle.portA);
  connect(p_circle.portB, snk1.ports[1]);
  connect(fx1.port, p_circle.wall[1]);
  connect(src2.ports[1], p_core.portA);
  connect(p_core.portB, snk2.ports[1]);
  connect(fx2.port, p_core.wall[1]);
  annotation(experiment(Algorithm=Dassl, StopTime=2, Interval=0.001, Tolerance=1e-6));
end test_HeatTransfer_cmp;
