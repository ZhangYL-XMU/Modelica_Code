within SFR.Fluid.Vessels;
model test_MixingVolume "混合体积自写实现验证：单进单出守恒 + 双进单出混合"
  annotation(__MWORKS(version="26.1.3"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, grid={2,2})), experiment(Algorithm=Dassl, InlineIntegrator=false, InlineStepSize=false, Interval=0.01, StartTime=0, StopTime=100, StoreEventValue=0, Tolerance=0.0001));

  // ---------- 场景一：单进单出（验证质量/能量守恒与定压边界） ----------
  MixingVolume volume(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    nPorts_a=1, nPorts_b=1, p_start=1e5, T_start=823.15,
    V=10)
    annotation (Placement(transformation(origin={-40,40}, extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_h boundary(
    nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, m_flow=10, h=656775)
    annotation (Placement(transformation(origin={-90,40}, extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.Boundary_ph boundary1(
    nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, p=1e5, h=656775)
    annotation (Placement(transformation(origin={10,40}, extent={{10,-10},{-10,10}})));

  // ---------- 场景二：双进单出（验证混合温度：两股 5 kg/s，823.15 K 与 903.09 K 混合） ----------
  MixingVolume volume2(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    nPorts_a=2, nPorts_b=1, p_start=1e5, T_start=863.12,
    V=10)
    annotation (Placement(transformation(origin={-40,-40}, extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_h boundary2(
    nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, m_flow=5, h=656775)
    annotation (Placement(transformation(origin={-90,-20}, extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_h boundary3(
    nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, m_flow=5, h=756775)
    annotation (Placement(transformation(origin={-90,-60}, extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.Boundary_ph boundary4(
    nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, p=1e5)
    annotation (Placement(transformation(origin={10,-40}, extent={{10,-10},{-10,10}})));
equation
  connect(boundary.ports[1], volume.port_a[1]) annotation(Line(origin={-65,40}, points={{-15,0},{15,0}}, color={0,127,255}));
  connect(volume.port_b[1], boundary1.ports[1]) annotation(Line(origin={-15,40}, points={{-15,0},{15,0}}, color={0,127,255}));
  connect(boundary2.ports[1], volume2.port_a[1]) annotation(Line(origin={-65,-20}, points={{-15,0},{15,-20}}, color={0,127,255}));
  connect(boundary3.ports[1], volume2.port_a[2]) annotation(Line(origin={-65,-60}, points={{-15,0},{15,20}}, color={0,127,255}));
  connect(volume2.port_b[1], boundary4.ports[1]) annotation(Line(origin={-15,-40}, points={{-15,0},{15,0}}, color={0,127,255}));
end test_MixingVolume;
