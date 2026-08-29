within SFR.Fluid.Vessels.Test;
model test_ExpansionTank "膨胀箱充液验证：der(level)=m_flow/(rho*A)，p=p_surface+rho*g*level"
  annotation(__MWORKS(version="26.1.3"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, grid={2,2})), experiment(Algorithm=Dassl, InlineIntegrator=false, InlineStepSize=false, Interval=0.01, StartTime=0, StopTime=10, StoreEventValue=0, Tolerance=0.0001));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, m_flow=10, T=673.15) 
    annotation (Placement(transformation(origin={-70,0}, extent={{-10,-10},{10,10}})));
  SFR.Fluid.Vessels.ExpansionTank tank(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, A=1, V0=0.001, level_start=1, h_start=469125, p_start=100000.0) 
    annotation (Placement(transformation(origin={30,0}, extent={{-10,-10},{10,10}})));
equation
  connect(boundary.ports[1], tank.port) annotation(Line(origin={-20,0}, points={{-40,0},{40,-46}}, color={0,127,255}));
end test_ExpansionTank;