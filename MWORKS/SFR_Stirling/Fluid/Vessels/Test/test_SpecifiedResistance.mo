within SFR.Fluid.Vessels.Test;
model test_SpecifiedResistance "固定水力阻力验证：m_flow*R = p_a - p_b（10 kg/s × R=100 → Δp=1000 Pa）"
  annotation(__MWORKS(version="26.1.3"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, grid={2,2})), experiment(Algorithm=Dassl, InlineIntegrator=false, InlineStepSize=false, Interval=0.01, StartTime=0, StopTime=10, StoreEventValue=0, Tolerance=0.0001));
  Modelica.Fluid.Sources.MassFlowSource_h boundary(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, m_flow=10, h=469125) 
    annotation (Placement(transformation(origin={-80,0}, extent={{-10,-10},{10,10}})));
  SFR.Fluid.Vessels.SpecifiedResistance res(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=100) 
    annotation (Placement(transformation(origin={0,0}, extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.Boundary_ph boundary1(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, p=1e5, h=469125) 
    annotation (Placement(transformation(origin={80,0}, extent={{10,-10},{-10,10}})));
equation
  connect(boundary.ports[1], res.port_a) annotation(Line(origin={-40,0}, points={{-30,0},{30,0}}, color={0,127,255}));
  connect(res.port_b, boundary1.ports[1]) annotation(Line(origin={40,0}, points={{-30,0},{30,0}}, color={0,127,255}));
end test_SpecifiedResistance;