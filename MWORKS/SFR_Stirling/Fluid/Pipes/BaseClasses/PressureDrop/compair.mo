within SFR.Fluid.Pipes.BaseClasses.PressureDrop;
model compair
  annotation(__MWORKS(version="2025b"));
  TYThermoFluidSys.Boundaries.BoundaryMdot boundaryMdot(redeclare package Medium = TYMedia.Incompressible.LBE,m_flow=10,energyDefinition="h",h=4.725e4) 
    annotation (Placement(transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}})));
  TYThermoFluidSys.Boundaries.BoundaryPressure boundaryPressure(redeclare package Medium = TYMedia.Incompressible.LBE,energyDefinition="h",h=4.725e4) 
    annotation (Placement(transformation(origin={84,-5.55112e-16},
extent={{10,-10},{-10,10}})));
  TYThermoFluidSys.Pipelines.DistributePipe_Incompressible distributePipe_Incompressible(n=4,wallHeatTransfer=false,redeclare package Medium = TYMedia.Incompressible.LBE,from_dp=false,redeclare model DP = TYThermoFluidSys.Pipelines.Basic.DP_OnePhase.DarcyWeisbach,initFromEnthalpy=true,h_start_in=4.725e4,h_start_out=4.725e4) 
    annotation (Placement(transformation(origin={12,-6.66134e-16},
extent={{-10,-10},{10,10}})));
  equation
  connect(boundaryMdot.fluidPort, distributePipe_Incompressible.portA) 
  annotation(Line(origin={-25,0},
  points={{-27,-3.33067e-17},{27,-6.66134e-16}},
  color={0,178,226}));
  connect(boundaryPressure.fluidPort, distributePipe_Incompressible.portB) 
  annotation(Line(origin={49,0},
  points={{27,-5.57888e-16},{-27,-6.66134e-16}},
  color={0,178,226}));
  end compair;
