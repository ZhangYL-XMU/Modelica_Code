within SFR.Structure.MW;
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
