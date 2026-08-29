within SFR.Fluid.Vessels.Test;
model test_ExpansionTank_branch "膨胀箱支路验证：主管道三通接膨胀箱+阻力，稳态支路零流量、液位平衡"
  annotation(__MWORKS(version="26.1.3"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, grid={2,2})), experiment(Algorithm=Dassl, InlineIntegrator=false, InlineStepSize=false, Interval=0.01, StartTime=0, StopTime=10, StoreEventValue=0, Tolerance=0.0001));
  Modelica.Fluid.Sources.MassFlowSource_h boundary(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, m_flow=10, h=469125) 
    annotation (Placement(transformation(origin={-80,0}, extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Fittings.TeeJunctionVolume tee(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, V=0.01, p_start=108466.4, T_start=673.15) 
    annotation (Placement(transformation(origin={-20,0}, extent={{-10,-10},{10,10}})));
  SFR.Fluid.Vessels.SpecifiedResistance res(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=0.1) 
    annotation (Placement(transformation(origin={0,-50}, extent={{-10,-10},{10,10}})));
  SFR.Fluid.Vessels.ExpansionTank tank(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, A=1, V0=0.001, level_start=1, h_start=469125, p_start=108466.4, p_surface=100000.0) 
    annotation (Placement(transformation(origin={30,-50}, extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.Boundary_ph boundary1(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, p=108466.4, h=469125) 
    annotation (Placement(transformation(origin={80,0}, extent={{10,-10},{-10,10}})));
equation
  connect(boundary.ports[1], tee.port_1) annotation(Line(origin={-50,0}, points={{-20,0},{20,0}}, color={0,127,255}));
  connect(tee.port_2, res.port_a) annotation(Line(origin={-10,-25}, points={{0,25},{0,-15},{10,-15}}, color={0,127,255}));
  connect(res.port_b, tank.port) annotation(Line(origin={15,-50}, points={{-5,0},{5,0}}, color={0,127,255}));
  connect(tee.port_3, boundary1.ports[1]) annotation(Line(origin={30,0}, points={{-40,0},{40,0}}, color={0,127,255}));
end test_ExpansionTank_branch;