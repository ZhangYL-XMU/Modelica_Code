within SFR.Structure;
package MW
  annotation(__MWORKS(version="26.1.3"));
  model FirstLoop_noReactor
    annotation(__MWORKS(version="2025b",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=8,ContinueTimeVector)),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
  grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=1,StartTime=0,StopTime=3600,StoreEventValue=0,Tolerance=0.0001));
    TYThermoFluidSys.Pipelines.DistributePipe_Incompressible Heat_pipe(redeclare package Medium = TYMedia.Incompressible.LBE,redeclare model DP = TYThermoFluidSys.Pipelines.Basic.DP_OnePhase.DarcyWeisbach,includeStaticHead=true,initOpt=TYThermoFluidSys.Utilities.Types.InitOptions.noInit,p_start_in=1.35e7,p_start_out=1.35e7,T_start_in=773.15,T_start_out=773.15,T_wall_start_1=773.15,from_dp=false,Dh(displayUnit="mm")=0.05) 
      annotation (Placement(transformation(origin={-100,11.695},
  extent={{-10,-10},{10,10}},
  rotation=90)));
    TYThermoFluidSys.Pipelines.DistributePipe_Incompressible Average_pipe(redeclare package Medium = TYMedia.Incompressible.LBE,includeStaticHead=true,redeclare model DP = TYThermoFluidSys.Pipelines.Basic.DP_OnePhase.DarcyWeisbach,initOpt=TYThermoFluidSys.Utilities.Types.InitOptions.noInit,p_start_in=1.35e7,p_start_out=1.35e7,T_start_in=773.15,T_start_out=773.15,from_dp=false,m_flow_nom=300,Dh(displayUnit="mm")=0.05,n_channels=fill(9.0,2)) 
      annotation (Placement(transformation(origin={-4,11.695},
  extent={{-10,-10},{10,10}},
  rotation=90)));
    TYThermoFluidSys.Pipelines.DistributePipe_Incompressible distributePipe_Incompressible2(wallHeatTransfer=false,redeclare package Medium = TYMedia.Incompressible.LBE,initOpt=TYThermoFluidSys.Utilities.Types.InitOptions.noInit,p_start_in=1.35e7,p_start_out=1.35e7,T_start_in=773.15,T_start_out=773.15,from_dp=false,Dh=0.5) 
      annotation (Placement(transformation(origin={28,106},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Pipelines.DistributePipe_Incompressible distributePipe_Incompressible3(wallHeatTransfer=false,redeclare package Medium = TYMedia.Incompressible.LBE,initOpt=TYThermoFluidSys.Utilities.Types.InitOptions.noInit,p_start_in=1.35e7,p_start_out=1.35e7,T_start_in=773.15,T_start_out=773.15,from_dp=false,Dh=0.5) 
      annotation (Placement(transformation(origin={42,-98},
  extent={{10,-10},{-10,10}})));
    TYThermoFluidSys.Boundaries.BoundaryMdot boundaryMdot(m_flow=280.6,T=713.15,redeclare package Medium = TYMedia.Incompressible.LBE) 
      annotation (Placement(transformation(origin={86,-98},
  extent={{10,-10},{-10,10}})));
    TYThermoFluidSys.Boundaries.BoundaryPressure boundaryPressure(p(displayUnit="bar")=13.5e6,redeclare package Medium = TYMedia.Incompressible.LBE) 
      annotation (Placement(transformation(origin={86,106},
  extent={{10,-10},{-10,10}})));
    TYThermoFluidSys.Junctions.Tjunction spiltTjunction(redeclare package Medium = TYMedia.Incompressible.LBE,flowSituation=TYThermoFluidSys.Utilities.Types.JunctionFlowSituation.Split_Symmetric,d_hyd_1=0.05,d_hyd_2=0.05,d_hyd_3=0.05) 
      annotation (Placement(transformation(origin={-42,-54},
  extent={{-10,10},{10,-10}},
  rotation=-180)));
    TYThermoFluidSys.Junctions.Tjunction joinTjunction(redeclare package Medium = TYMedia.Incompressible.LBE,flowSituation=TYThermoFluidSys.Utilities.Types.JunctionFlowSituation.Tjoin_Symmetric,d_hyd_1=8e-1,d_hyd_2=8e-1,d_hyd_3=8e-1) 
      annotation (Placement(transformation(origin={-52,88},
  extent={{-10,-10},{10,10}},
  rotation=180)));
    TYThermoFluidSys.Boundaries.BoundaryHeatFlow boundaryHeatFlow(Q_flow=32365.79e2) 
      annotation (Placement(transformation(origin={-30,11.695},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Boundaries.BoundaryHeatFlow boundaryHeatFlow1(Q_flow=7634.21e2) 
      annotation (Placement(transformation(origin={-138,11.695},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Sensors.SensorT TSensor(redeclare package Medium = TYMedia.Incompressible.LBE) 
      annotation (Placement(transformation(origin={22,52},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Sensors.SensorT TSensor1(redeclare package Medium = TYMedia.Incompressible.LBE) 
      annotation (Placement(transformation(origin={-116,48},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Sensors.SensorT TSensor2(redeclare package Medium = TYMedia.Incompressible.LBE) 
      annotation (Placement(transformation(origin={-64,124},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Machines.SuterPump suterPump(redeclare package Medium = TYMedia.Incompressible.LBE,n(start=3600)) 
      annotation (Placement(transformation(origin={-4,-98},
  extent={{10,-10},{-10,10}})));
    TYThermoFluidSys.Volumes.OnephaseVolume onephaseVolume(redeclare model volume_type = TYThermoFluidSys.PartialLib.Volumes.Volumes.IncompressibleVolume,redeclare package Medium = TYMedia.Incompressible.LBE) 
      annotation (Placement(transformation(origin={70,11.695},
  extent={{-10,-10},{10,10}})));
    equation
    connect(distributePipe_Incompressible3.portA, boundaryMdot.fluidPort) 
    annotation(Line(origin={52,-99.2},
  points={{0,1.2},{26,1.2}},
  color={0,178,226}));
    connect(boundaryPressure.fluidPort, distributePipe_Incompressible2.portB) 
    annotation(Line(origin={65,106},
  points={{13,0},{-27,0}},
  color={0,178,226}));
    connect(distributePipe_Incompressible2.portA, joinTjunction.port_3) 
    annotation(Line(origin={-17,102},
  points={{35,4},{-35,4},{-35,-4}},
  color={0,178,226}));
    connect(joinTjunction.port_1, Average_pipe.portB) 
    annotation(Line(origin={-23,53},
  points={{-18.8,32},{17,32},{17,-31.305},{19,-31.305}},
  color={0,178,226}));
    connect(joinTjunction.port_2, Heat_pipe.portB) 
    annotation(Line(origin={-81,53},
  points={{19,32},{-19,32},{-19,-31.305}},
  color={0,178,226}));
    connect(Heat_pipe.portA, spiltTjunction.port_2) 
    annotation(Line(origin={-76,-25},
  points={{-24,26.695},{-24,-26},{24,-26}},
  color={0,178,226}));
    connect(Average_pipe.portA, spiltTjunction.port_1) 
    annotation(Line(origin={-18,-25},
  points={{14,26.695},{14,-26},{-13.8,-26}},
  color={0,178,226}));
    connect(Average_pipe.q[1], boundaryHeatFlow.port[1]) 
    annotation(Line(origin={-20,12},
  points={{11,-0.305},{0,-0.305}},
  color={191,0,0}));
    connect(Heat_pipe.q[1], boundaryHeatFlow1.port[1]) 
    annotation(Line(origin={-116,12},
  points={{11,-0.305},{-12,-0.305}},
  color={191,0,0}));
    connect(TSensor.port_a, Average_pipe.portB) 
    annotation(Line(origin={9,32},
  points={{13,10},{3,10},{3,-10.305},{-13,-10.305}},
  color={0,178,226}));
    connect(TSensor1.port_a, Heat_pipe.portB) 
    annotation(Line(origin={-108,30},
  points={{-8,8},{6,8},{6,-8.305},{8,-8.305}},
  color={0,178,226}));
    connect(TSensor2.port_a, joinTjunction.port_3) 
    annotation(Line(origin={-58,106},
  points={{-6,8},{6,8},{6,-8}},
  color={0,178,226}));
    connect(spiltTjunction.port_3, suterPump.port_b) 
    annotation(Line(origin={-27,-81},
  points={{-15,17},{-15,-17},{12.6,-17}},
  color={0,178,226}));
    connect(suterPump.port_a, distributePipe_Incompressible3.portB) 
    annotation(Line(origin={20,-98},
  points={{-14.8,0},{12,0}},
  color={0,178,226}));
    end FirstLoop_noReactor;
  model FirstLoop_noReactor_volumetest
    annotation(__MWORKS(version="2025b",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=8,ContinueTimeVector)),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
  grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=1,StartTime=0,StopTime=3600,StoreEventValue=0,Tolerance=0.0001));
    TYThermoFluidSys.Pipelines.DistributePipe_Incompressible Heat_pipe(redeclare package Medium = TYMedia.Incompressible.LBE,redeclare model DP = TYThermoFluidSys.Pipelines.Basic.DP_OnePhase.DarcyWeisbach,includeStaticHead=true,initOpt=TYThermoFluidSys.Utilities.Types.InitOptions.noInit,p_start_in=1.35e7,p_start_out=1.35e7,T_start_in=773.15,T_start_out=773.15,T_wall_start_1=773.15,from_dp=false,Dh(displayUnit="mm")=0.05) 
      annotation (Placement(transformation(origin={-242,141.695},
  extent={{-10,-10},{10,10}},
  rotation=90)));
    TYThermoFluidSys.Pipelines.DistributePipe_Incompressible Average_pipe(redeclare package Medium = TYMedia.Incompressible.LBE,includeStaticHead=true,redeclare model DP = TYThermoFluidSys.Pipelines.Basic.DP_OnePhase.DarcyWeisbach,initOpt=TYThermoFluidSys.Utilities.Types.InitOptions.noInit,p_start_in=1.35e7,p_start_out=1.35e7,T_start_in=773.15,T_start_out=773.15,from_dp=false,m_flow_nom=300,Dh(displayUnit="mm")=0.05,n_channels=fill(9.0,2)) 
      annotation (Placement(transformation(origin={-146,141.695},
  extent={{-10,-10},{10,10}},
  rotation=90)));
    TYThermoFluidSys.Pipelines.DistributePipe_Incompressible distributePipe_Incompressible2(wallHeatTransfer=false,redeclare package Medium = TYMedia.Incompressible.LBE,initOpt=TYThermoFluidSys.Utilities.Types.InitOptions.noInit,p_start_in=1.35e7,p_start_out=1.35e7,T_start_in=773.15,T_start_out=773.15,from_dp=false,Dh=0.5) 
      annotation (Placement(transformation(origin={-114,236},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Pipelines.DistributePipe_Incompressible distributePipe_Incompressible3(wallHeatTransfer=false,redeclare package Medium = TYMedia.Incompressible.LBE,initOpt=TYThermoFluidSys.Utilities.Types.InitOptions.noInit,p_start_in=1.35e7,p_start_out=1.35e7,T_start_in=773.15,T_start_out=773.15,from_dp=false,Dh=0.5) 
      annotation (Placement(transformation(origin={-120,32},
  extent={{10,-10},{-10,10}})));
    TYThermoFluidSys.Boundaries.BoundaryMdot boundaryMdot(m_flow=280.6,T=713.15,redeclare package Medium = TYMedia.Incompressible.LBE) 
      annotation (Placement(transformation(origin={-56,32},
  extent={{10,-10},{-10,10}})));
    TYThermoFluidSys.Boundaries.BoundaryPressure boundaryPressure(p(displayUnit="bar")=13.5e6,redeclare package Medium = TYMedia.Incompressible.LBE) 
      annotation (Placement(transformation(origin={-56,236},
  extent={{10,-10},{-10,10}})));
    TYThermoFluidSys.Boundaries.BoundaryHeatFlow boundaryHeatFlow(Q_flow=32365.79e2) 
      annotation (Placement(transformation(origin={-172,141.695},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Boundaries.BoundaryHeatFlow boundaryHeatFlow1(Q_flow=7634.21e2) 
      annotation (Placement(transformation(origin={-280,141.695},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Sensors.SensorT TSensor(redeclare package Medium = TYMedia.Incompressible.LBE) 
      annotation (Placement(transformation(origin={-120,182},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Sensors.SensorT TSensor1(redeclare package Medium = TYMedia.Incompressible.LBE) 
      annotation (Placement(transformation(origin={-258,178},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Sensors.SensorT TSensor2(redeclare package Medium = TYMedia.Incompressible.LBE) 
      annotation (Placement(transformation(origin={-206,254},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Volumes.MultiportVolume onephaseVolume(redeclare package Medium = TYMedia.Incompressible.LBE,N=3,redeclare model volume_type = TYThermoFluidSys.PartialLib.Volumes.Volumes.IncompressibleVolume,initOpt=TYThermoFluidSys.Utilities.Types.InitOptions.noInit,usePositiveFlow=false,p_start=1.35e7) 
      annotation (Placement(transformation(origin={-224,68},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Volumes.MultiportVolume onephaseVolume1(redeclare package Medium = TYMedia.Incompressible.LBE,N=3,redeclare model volume_type = TYThermoFluidSys.PartialLib.Volumes.Volumes.IncompressibleVolume,initOpt=TYThermoFluidSys.Utilities.Types.InitOptions.noInit,p_start=1.35e7) 
      annotation (Placement(transformation(origin={-212,220},
  extent={{-10,-10},{10,10}})));
    equation
    connect(distributePipe_Incompressible3.portA, boundaryMdot.fluidPort) 
    annotation(Line(origin={-90,30.8},
  points={{-20,1.2},{26,1.2}},
  color={0,178,226}));
    connect(boundaryPressure.fluidPort, distributePipe_Incompressible2.portB) 
    annotation(Line(origin={-77,236},
  points={{13,0},{-27,0}},
  color={0,178,226}));
    connect(distributePipe_Incompressible2.portA, onephaseVolume1.port[1]) 
    annotation(Line(origin={-159,232},
  points={{35,4},{32,4},{32,-12},{-42.6,-12}},
  color={0,178,226}));
    connect(onephaseVolume1.port[3], Average_pipe.portB) 
    annotation(Line(origin={-165,183},
  points={{-36.6,37},{17,37},{17,-31.305},{19,-31.305}},
  color={0,178,226}));
    connect(onephaseVolume1.port[2], Heat_pipe.portB) 
    annotation(Line(origin={-223,183},
  points={{21.4,37},{24.4,37},{24.4,-31.305},{-19,-31.305}},
  color={0,178,226}));
    connect(Heat_pipe.portA, onephaseVolume.port[2]) 
    annotation(Line(origin={-218,105},
  points={{-24,26.695},{28,26.695},{28,-37},{4.4,-37}},
  color={0,178,226}));
    connect(Average_pipe.portA, onephaseVolume.port[3]) 
    annotation(Line(origin={-160,105},
  points={{14,26.695},{14,-37},{-53.6,-37}},
  color={0,178,226}));
    connect(onephaseVolume.port[1], distributePipe_Incompressible3.portB) 
    annotation(Line(origin={-157,49},
  points={{-56.6,19},{-33,19},{-33,-17},{27,-17}},
  color={0,178,226}));
    connect(Average_pipe.q[1], boundaryHeatFlow.port[1]) 
    annotation(Line(origin={-162,142},
  points={{11,-0.305},{0,-0.305}},
  color={191,0,0}));
    connect(Heat_pipe.q[1], boundaryHeatFlow1.port[1]) 
    annotation(Line(origin={-258,142},
    points={{11,-0.305},{-12,-0.305}},
    color={191,0,0}));
    connect(TSensor.port_a, Average_pipe.portB) 
    annotation(Line(origin={-133,162},
    points={{13,10},{3,10},{3,-10.305},{-13,-10.305}},
    color={0,178,226}));
    connect(TSensor1.port_a, Heat_pipe.portB) 
    annotation(Line(origin={-250,160},
    points={{-8,8},{6,8},{6,-8.305},{8,-8.305}},
    color={0,178,226}));
    connect(TSensor2.port_a, onephaseVolume1.port[1]) 
    annotation(Line(origin={-200,236},
  points={{-6,8},{1.4,8},{1.4,-16},{-1.6,-16}},
  color={0,178,226}));
    end FirstLoop_noReactor_volumetest;
  model FirstLoop_noReactorwithHX
    annotation(__MWORKS(version="26.1.3"),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
  grid={2,2})));
    TYThermoFluidSys.Pipelines.DistributePipe_Incompressible Heat_pipe(redeclare package Medium = TYMedia.Incompressible.LBE,redeclare model DP = TYThermoFluidSys.Pipelines.Basic.DP_OnePhase.DarcyWeisbach,includeStaticHead=true,initOpt=TYThermoFluidSys.Utilities.Types.InitOptions.noInit,p_start_in=1.35e7,p_start_out=1.35e7,T_start_in=773.15,T_start_out=773.15,T_wall_start_1=773.15,from_dp=false,Dh(displayUnit="mm")=0.05) 
      annotation (Placement(transformation(origin={-174,9.695},
  extent={{-10,-10},{10,10}},
  rotation=90)));
    TYThermoFluidSys.Pipelines.DistributePipe_Incompressible Average_pipe(redeclare package Medium = TYMedia.Incompressible.LBE,includeStaticHead=true,redeclare model DP = TYThermoFluidSys.Pipelines.Basic.DP_OnePhase.DarcyWeisbach,initOpt=TYThermoFluidSys.Utilities.Types.InitOptions.noInit,p_start_in=1.35e7,p_start_out=1.35e7,T_start_in=773.15,T_start_out=773.15,from_dp=false,m_flow_nom=300,Dh(displayUnit="m")=0.05,n_channels=fill(9.0,2)) 
      annotation (Placement(transformation(origin={-78,9.695},
  extent={{-10,-10},{10,10}},
  rotation=90)));
    TYThermoFluidSys.Pipelines.DistributePipe_Incompressible distributePipe_Incompressible2(wallHeatTransfer=false,redeclare package Medium = TYMedia.Incompressible.LBE,initOpt=TYThermoFluidSys.Utilities.Types.InitOptions.noInit,p_start_in=1.35e7,p_start_out=1.35e7,T_start_in=773.15,T_start_out=773.15,from_dp=false,Dh=0.5) 
      annotation (Placement(transformation(origin={-46,104},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Pipelines.DistributePipe_Incompressible distributePipe_Incompressible3(wallHeatTransfer=false,redeclare package Medium = TYMedia.Incompressible.LBE,initOpt=TYThermoFluidSys.Utilities.Types.InitOptions.noInit,p_start_in=1.35e7,p_start_out=1.35e7,T_start_in=773.15,T_start_out=773.15,from_dp=false,Dh=0.5) 
      annotation (Placement(transformation(origin={-8,-100},
  extent={{10,-10},{-10,10}})));
    TYThermoFluidSys.Junctions.Tjunction spiltTjunction(redeclare package Medium = TYMedia.Incompressible.LBE,flowSituation=TYThermoFluidSys.Utilities.Types.JunctionFlowSituation.Split_Symmetric,d_hyd_1=0.05,d_hyd_2=0.05,d_hyd_3=0.5) 
      annotation (Placement(transformation(origin={-126,-56},
  extent={{-10,10},{10,-10}},
  rotation=-180)));
    TYThermoFluidSys.Junctions.Tjunction joinTjunction(redeclare package Medium = TYMedia.Incompressible.LBE,flowSituation=TYThermoFluidSys.Utilities.Types.JunctionFlowSituation.Tjoin_Symmetric,d_hyd_1=0.05,d_hyd_2=0.05,d_hyd_3=0.05) 
      annotation (Placement(transformation(origin={-126,86},
  extent={{-10,-10},{10,10}},
  rotation=180)));
    TYThermoFluidSys.Boundaries.BoundaryHeatFlow boundaryHeatFlow(Q_flow=32365.79e2) 
      annotation (Placement(transformation(origin={-104,9.695},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Boundaries.BoundaryHeatFlow boundaryHeatFlow1(Q_flow=7634.21e2) 
      annotation (Placement(transformation(origin={-212,9.695},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Sensors.SensorT TSensor(redeclare package Medium = TYMedia.Incompressible.LBE) 
      annotation (Placement(transformation(origin={-52,50},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Sensors.SensorT TSensor1(redeclare package Medium = TYMedia.Incompressible.LBE) 
      annotation (Placement(transformation(origin={-190,46},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Sensors.SensorT TSensor2(redeclare package Medium = TYMedia.Incompressible.LBE) 
      annotation (Placement(transformation(origin={-138,122},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Machines.SuterPump suterPump(redeclare package Medium = TYMedia.Incompressible.LBE,n(start=3600)) 
      annotation (Placement(transformation(origin={-72,-100},
  extent={{10,-10},{-10,10}})));
    equation
    connect(distributePipe_Incompressible2.portA, joinTjunction.port_3) 
    annotation(Line(origin={-91,100},
  points={{35,4},{-35,4},{-35,-4}},
  color={0,178,226}));
    connect(joinTjunction.port_1, Average_pipe.portB) 
    annotation(Line(origin={-97,51},
  points={{-18.8,32},{17,32},{17,-31.305},{19,-31.305}},
  color={0,178,226}));
    connect(joinTjunction.port_2, Heat_pipe.portB) 
    annotation(Line(origin={-155,51},
  points={{19,32},{-19,32},{-19,-31.305}},
  color={0,178,226}));
    connect(Heat_pipe.portA, spiltTjunction.port_2) 
    annotation(Line(origin={-150,-27},
  points={{-24,26.695},{-24,-26},{14,-26}},
  color={0,178,226}));
    connect(Average_pipe.portA, spiltTjunction.port_1) 
    annotation(Line(origin={-92,-27},
  points={{14,26.695},{14,-26},{-23.8,-26}},
  color={0,178,226}));
    connect(Average_pipe.q[1], boundaryHeatFlow.port[1]) 
    annotation(Line(origin={-94,10},
  points={{11,-0.305},{0,-0.305}},
  color={191,0,0}));
    connect(Heat_pipe.q[1], boundaryHeatFlow1.port[1]) 
    annotation(Line(origin={-190,10},
  points={{11,-0.305},{-12,-0.305}},
  color={191,0,0}));
    connect(TSensor.port_a, Average_pipe.portB) 
    annotation(Line(origin={-65,30},
  points={{13,10},{3,10},{3,-10.305},{-13,-10.305}},
  color={0,178,226}));
    connect(TSensor1.port_a, Heat_pipe.portB) 
    annotation(Line(origin={-182,28},
  points={{-8,8},{6,8},{6,-8.305},{8,-8.305}},
  color={0,178,226}));
    connect(TSensor2.port_a, joinTjunction.port_3) 
    annotation(Line(origin={-132,104},
  points={{-6,8},{6,8},{6,-8}},
  color={0,178,226}));
    connect(distributePipe_Incompressible3.portB, suterPump.port_a) 
    annotation(Line(origin={-40,-100},
    points={{22,0},{-22.8,0}},
    color={0,178,226}));
    connect(suterPump.port_b, spiltTjunction.port_3) 
    annotation(Line(origin={-104,-83},
    points={{21.6,-17},{-20,-17},{-20,14},{-22,14},{-22,17}},
    color={0,178,226}));
    connect(distributePipe_Incompressible3.portA, distributePipe_Incompressible2.portB) 
    annotation(Line(origin={-17,2},
points={{19,-102},{77,-102},{77,102},{-19,102}},
color={0,178,226}));

  end FirstLoop_noReactorwithHX;
  model FirstLoop_noHeatexchanger
    annotation(__MWORKS(version="2025b",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=500,ContinueTimeVector)),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
  grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.0001,StartTime=0,StopTime=500,StoreEventValue=0,Tolerance=0.0001));
    SFR.Nuclear.PointKinetics pointKinetics(Teffref_fuel(displayUnit="K"),Teffref_coolant(displayUnit="K")) 
      annotation (Placement(transformation(origin={-378,9.17875},
  extent={{-18,-20.5},{18,20.5}})));
    Modelica.Blocks.Continuous.LimPID PID(controllerType=Modelica.Blocks.Types.SimpleController.PID,yMax=0.021,initType=Modelica.Blocks.Types.Init.SteadyState,withFeedForward=false,k=2,wd=1) 
      annotation (Placement(transformation(origin={-514,23.58005},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Blocks.Constant const1(k=0) 
      annotation (Placement(transformation(origin={-446,45.67875},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Blocks.Constant const3(k=0) 
      annotation (Placement(transformation(origin={-412,73.67875},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Blocks.Ramp ramp(offset=40e6,height=-4e6,duration=100,startTime=200) 
      annotation (Placement(transformation(origin={-562,23.58005},
  extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Sources.RealExpression realExpression1(y=TSensor2.T) 
      annotation (Placement(transformation(origin={-446,-47.32125},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Pipelines.DistributePipe_Incompressible Heat_pipe(redeclare package Medium = TYMedia.Incompressible.LBE,redeclare model DP = TYThermoFluidSys.Pipelines.Basic.DP_OnePhase.DarcyWeisbach,includeStaticHead=true,initOpt=TYThermoFluidSys.Utilities.Types.InitOptions.noInit,p_start_in=1.35e7,p_start_out=1.35e7,T_start_in=773.15,T_start_out=773.15,T_wall_start_1=773.15,from_dp=false,Dh(displayUnit="mm")=0.05) 
      annotation (Placement(transformation(origin={-194,3.695},
  extent={{-10,-10},{10,10}},
  rotation=90)));
    TYThermoFluidSys.Pipelines.DistributePipe_Incompressible Average_pipe(redeclare package Medium = TYMedia.Incompressible.LBE,includeStaticHead=true,redeclare model DP = TYThermoFluidSys.Pipelines.Basic.DP_OnePhase.DarcyWeisbach,initOpt=TYThermoFluidSys.Utilities.Types.InitOptions.noInit,p_start_in=1.35e7,p_start_out=1.35e7,T_start_in=773.15,T_start_out=773.15,from_dp=false,m_flow_nom=300,Dh(displayUnit="mm")=0.05,n_channels=fill(9.0,2)) 
      annotation (Placement(transformation(origin={-98,3.695},
  extent={{-10,-10},{10,10}},
  rotation=90)));
    TYThermoFluidSys.Pipelines.DistributePipe_Incompressible distributePipe_Incompressible2(wallHeatTransfer=false,redeclare package Medium = TYMedia.Incompressible.LBE,initOpt=TYThermoFluidSys.Utilities.Types.InitOptions.noInit,p_start_in=1.35e7,p_start_out=1.35e7,T_start_in=773.15,T_start_out=773.15,from_dp=false,Dh=0.5) 
      annotation (Placement(transformation(origin={-66,98},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Pipelines.DistributePipe_Incompressible distributePipe_Incompressible3(wallHeatTransfer=false,redeclare package Medium = TYMedia.Incompressible.LBE,initOpt=TYThermoFluidSys.Utilities.Types.InitOptions.noInit,p_start_in=1.35e7,p_start_out=1.35e7,T_start_in=773.15,T_start_out=773.15,from_dp=false,Dh=0.5) 
      annotation (Placement(transformation(origin={-72,-106},
  extent={{10,-10},{-10,10}})));
    TYThermoFluidSys.Boundaries.BoundaryMdot boundaryMdot(m_flow=280.6,T=713.15,redeclare package Medium = TYMedia.Incompressible.LBE) 
      annotation (Placement(transformation(origin={-8,-106},
  extent={{10,-10},{-10,10}})));
    TYThermoFluidSys.Boundaries.BoundaryPressure boundaryPressure(p(displayUnit="bar")=13.5e6,redeclare package Medium = TYMedia.Incompressible.LBE) 
      annotation (Placement(transformation(origin={-8,98},
  extent={{10,-10},{-10,10}})));
    TYThermoFluidSys.Junctions.Tjunction spiltTjunction(redeclare package Medium = TYMedia.Incompressible.LBE,flowSituation=TYThermoFluidSys.Utilities.Types.JunctionFlowSituation.Split_Symmetric,d_hyd_1=8e-1,d_hyd_2=8e-1,d_hyd_3=8e-1) 
      annotation (Placement(transformation(origin={-136,-62},
  extent={{-10,10},{10,-10}},
  rotation=-180)));
    TYThermoFluidSys.Junctions.Tjunction joinTjunction(redeclare package Medium = TYMedia.Incompressible.LBE,flowSituation=TYThermoFluidSys.Utilities.Types.JunctionFlowSituation.Tjoin_Symmetric,d_hyd_1=8e-1,d_hyd_2=8e-1,d_hyd_3=8e-1) 
      annotation (Placement(transformation(origin={-146,80},
  extent={{-10,-10},{10,10}},
  rotation=180)));
    TYThermoFluidSys.Boundaries.BoundaryHeatFlow boundaryHeatFlow(Q_flow=32365.79e2,use_Qflow_in=true) 
      annotation (Placement(transformation(origin={-124,3.695},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Boundaries.BoundaryHeatFlow boundaryHeatFlow1(Q_flow=7634.21e2,use_Qflow_in=true) 
      annotation (Placement(transformation(origin={-262,3.695},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Sensors.SensorT TSensor(redeclare package Medium = TYMedia.Incompressible.LBE) 
      annotation (Placement(transformation(origin={-72,44},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Sensors.SensorT TSensor1(redeclare package Medium = TYMedia.Incompressible.LBE) 
      annotation (Placement(transformation(origin={-210,45.67875},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Sensors.SensorT TSensor2(redeclare package Medium = TYMedia.Incompressible.LBE) 
      annotation (Placement(transformation(origin={-158,116},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Blocks.Constant const2(k=823.15) 
      annotation (Placement(transformation(origin={-446,3.7975},
  extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Math.Gain gain(k=0.1) 
      annotation (Placement(transformation(origin={-290,3.695},
  extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Math.Gain gain1(k=0.1) 
      annotation (Placement(transformation(origin={-290,40},
  extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Sources.RealExpression realExpression2(y=gain1.y) 
      annotation (Placement(transformation(origin={-156,3.695},
  extent={{-10,-10},{10,10}})));
    TYThermoFluidSys.Thermal.TubeWall tubeWall(redeclare package solid = TYMedia.Solid.Steel) 
      annotation (Placement(transformation(origin={-224,3.695},
  extent={{-10,-10},{10,10}})));
    equation
    connect(pointKinetics.Q_total, PID.u_m) 
    annotation(Line(origin={-399,4.67875},
  points={{41.115,18.69625},{49,18.69625},{49,-35},{-115,-35},{-115,6.9013}},
  color={0,0,127}));
    connect(const1.y, pointKinetics.Reactivity_Other) 
    annotation(Line(origin={-416,29.67875},
  points={{-19,16},{-12,16},{-12,-15.73375},{18.245,-15.73375}},
  color={0,0,127}));
    connect(realExpression1.y, pointKinetics.Teff_coolant) 
    annotation(Line(origin={-409,-9.32125},
  points={{-26,-38},{7.49,-38},{7.49,2.97125},{11.245,2.97125}},
  color={0,0,127}));
    connect(const3.y, pointKinetics.Q_in) 
    annotation(Line(origin={-390,52.67875},
  points={{-11,21},{10,21},{10,-20.89875},{11.685,-20.89875}},
  color={0,0,127}));
    connect(pointKinetics.Teff_fuel, const2.y) 
    annotation(Line(origin={-416,3.67875},
  points={{18.245,0.11875},{-19,0.11875}},
  color={0,0,127}));
    connect(ramp.y, PID.u_s) 
    annotation(Line(origin={-539,24.68865},
  points={{-12,-1.1086},{13,-1.1086}},
  color={0,0,127}));
    connect(PID.y, pointKinetics.Reactivity_CR) 
    annotation(Line(origin={-473,23.67875},
  points={{-30,-0.0987},{75.245,-0.09875}},
  color={0,0,127}));
    connect(distributePipe_Incompressible3.portA, boundaryMdot.fluidPort) 
    annotation(Line(origin={-42,-107.2},
  points={{-20,1.2},{26,1.2}},
  color={0,178,226}));
    connect(boundaryPressure.fluidPort, distributePipe_Incompressible2.portB) 
    annotation(Line(origin={-29,98},
  points={{13,0},{-27,0}},
  color={0,178,226}));
    connect(distributePipe_Incompressible2.portA, joinTjunction.port_3) 
    annotation(Line(origin={-111,94},
  points={{35,4},{-35,4},{-35,-4}},
  color={0,178,226}));
    connect(joinTjunction.port_1, Average_pipe.portB) 
    annotation(Line(origin={-117,45},
  points={{-18.8,32},{17,32},{17,-31.305},{19,-31.305}},
  color={0,178,226}));
    connect(joinTjunction.port_2, Heat_pipe.portB) 
    annotation(Line(origin={-175,45},
  points={{19,32},{-19,32},{-19,-31.305}},
  color={0,178,226}));
    connect(Heat_pipe.portA, spiltTjunction.port_2) 
    annotation(Line(origin={-170,-33},
  points={{-24,26.695},{-24,-26},{24,-26}},
  color={0,178,226}));
    connect(Average_pipe.portA, spiltTjunction.port_1) 
    annotation(Line(origin={-112,-33},
  points={{14,26.695},{14,-26},{-13.8,-26}},
  color={0,178,226}));
    connect(spiltTjunction.port_3, distributePipe_Incompressible3.portB) 
    annotation(Line(origin={-109,-89},
  points={{-27,17},{-27,-17},{27,-17}},
  color={0,178,226}));
    connect(Average_pipe.q[1], boundaryHeatFlow.port[1]) 
    annotation(Line(origin={-114,4},
  points={{11,-0.305},{0,-0.305}},
  color={191,0,0}));
    connect(TSensor.port_a, Average_pipe.portB) 
    annotation(Line(origin={-85,24},
  points={{13,10},{3,10},{3,-10.305},{-13,-10.305}},
  color={0,178,226}));
    connect(TSensor1.port_a, Heat_pipe.portB) 
    annotation(Line(origin={-202,22},
  points={{-8,13.67875},{8,13.67875},{8,-8.305}},
  color={0,178,226}));
    connect(TSensor2.port_a, joinTjunction.port_3) 
    annotation(Line(origin={-152,98},
  points={{-6,8},{6,8},{6,-8}},
  color={0,178,226}));
    connect(pointKinetics.Q_HotChannel, gain.u) 
    annotation(Line(origin={-330,4},
    points={{-27.885,-0.305},{28,-0.305}},
    color={0,0,127}));
    connect(boundaryHeatFlow1.Q_flow_in, gain.y) 
    annotation(Line(origin={-260,4},
  points={{-12,-0.305},{-19,-0.305}},
  color={0,0,127}));
    connect(pointKinetics.Q_AverageChannel, gain1.u) 
    annotation(Line(origin={-330,27},
  points={{-27.885,-13.26},{8,-13.26},{8,13},{28,13}},
  color={0,0,127}));
    connect(boundaryHeatFlow.Q_flow_in, realExpression2.y) 
    annotation(Line(origin={-139,4},
    points={{5,-0.305},{-6,-0.305}},
    color={0,0,127}));
    connect(Heat_pipe.q, tubeWall.port_b) 
    annotation(Line(origin={-206,4},
    points={{7,-0.305},{-8,-0.305}},
    color={191,0,0}));
    connect(boundaryHeatFlow1.port[1], tubeWall.port_a[1]) 
    annotation(Line(origin={-243,4},
    points={{-9,-0.305},{9,-0.305}},
    color={191,0,0}));
    end FirstLoop_noHeatexchanger;

end MW;
