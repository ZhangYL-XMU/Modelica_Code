within SFR.Fluid.Pipes.BaseClasses.HeatTransfer;
      model compair
        annotation(__MWORKS(version="2025b"),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})));
        TYThermoFluidSys.Pipelines.DistributePipe_Incompressible distributePipe_Incompressible(n=4,Dh=0.1,wallHeatTransfer=true,redeclare model DP = TYThermoFluidSys.Pipelines.Basic.DP_OnePhase.LinearLoss,initFromEnthalpy=true,h_start_in=1e6,h_start_out=1e6,from_dp=false,redeclare package Medium = TYMedia.Incompressible.LBE,initOpt=TYThermoFluidSys.Utilities.Types.InitOptions.noInit,CF_PressureLoss=1,redeclare model HT = TYThermoFluidSys.Pipelines.Basic.HT_OnePhase.DittusBoelter) 
          annotation (Placement(transformation(origin={-4,4},
      extent={{-10,-10},{10,10}})));
        TYThermoFluidSys.Boundaries.BoundaryMdot boundaryMdot(m_flow=10,redeclare package Medium = TYMedia.Incompressible.LBE,energyDefinition="h",h=1e6) 
          annotation (Placement(transformation(origin={-42,4},
      extent={{-10,-10},{10,10}})));
        TYThermoFluidSys.Boundaries.BoundaryPressure boundaryPressure(redeclare package Medium = TYMedia.Incompressible.LBE,energyDefinition="h",h=1e6) 
          annotation (Placement(transformation(origin={34,4},
      extent={{10,-10},{-10,10}})));
        TYThermoFluidSys.Boundaries.BoundaryHeatFlow boundaryHeatFlow1(n=4,Q_flow=10000) 
          annotation (Placement(transformation(origin={-42,38},
extent={{-10,-10},{10,10}})));
      equation
        connect(distributePipe_Incompressible.portA, boundaryMdot.fluidPort) 
        annotation(Line(origin={-24,4},
        points={{10,0},{-10,0}},
        color={0,178,226}));
        connect(distributePipe_Incompressible.portB, boundaryPressure.fluidPort) 
        annotation(Line(origin={16,4},
        points={{-10,0},{10,0}},
        color={0,178,226}));
        connect(boundaryHeatFlow1.port, distributePipe_Incompressible.q) 
        annotation(Line(origin={-18,24},
        points={{-14,14},{14,14},{14,-15}},
        color={191,0,0}));

      end compair;
