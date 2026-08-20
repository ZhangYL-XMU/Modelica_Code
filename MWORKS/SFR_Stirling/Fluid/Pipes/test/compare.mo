within SFR.Fluid.Pipes.test;
model compare
  annotation(__MWORKS(version="26.1.3"));
  TYThermoFluidSys.Pipelines.DistributePipe_Incompressible distributePipe_Incompressible(n=4, redeclare package Medium = TYMedia.Incompressible.Pb, redeclare model DP = TYThermoFluidSys.Pipelines.Basic.DP_OnePhase.DarcyWeisbach, initOpt=TYThermoFluidSys.Utilities.Types.InitOptions.noInit, from_dp=false) 
    annotation (Placement(transformation(origin={-18,12},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Boundaries.BoundaryMdot boundaryMdot(m_flow=10, redeclare package Medium = TYMedia.Incompressible.Pb, energyDefinition="h", h=4.725e4) 
    annotation (Placement(transformation(origin={-62,12},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Boundaries.BoundaryPressure boundaryPressure(redeclare package Medium = TYMedia.Incompressible.Pb, energyDefinition="h", h=4.725e4) 
    annotation (Placement(transformation(origin={18,12},
extent={{10,-10},{-10,10}})));
  TYThermoFluidSys.Boundaries.BoundaryHeatFlow boundaryHeatFlow(n=4, Q_flow=0) 
    annotation (Placement(transformation(origin={-40,44},
extent={{-10,-10},{10,10}})));
equation
  connect(distributePipe_Incompressible.portA, boundaryMdot.fluidPort) 
  annotation(Line(origin={-41,12},
  points={{13,-1.77636e-15},{-13,-1.77636e-15}},
  color={0,178,226}));
  connect(distributePipe_Incompressible.portB, boundaryPressure.fluidPort) 
  annotation(Line(origin={1,12},
  points={{-9,-1.77636e-15},{9,-1.77636e-15}},
  color={0,178,226}));
  connect(boundaryHeatFlow.port, distributePipe_Incompressible.q) 
  annotation(Line(origin={-22,31},
points={{-8,13},{4,13},{4,-14}},
color={191,0,0}));

end compare;
