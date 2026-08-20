within SFR.Structure.MW;
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
