within SFR.Structure.MW;
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
