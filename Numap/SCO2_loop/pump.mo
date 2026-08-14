model pump
  inner ThermoHydraulicLib.System.System system "全局设置" annotation (Placement(transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}})));
  ThermoHydraulicLib.Pumps.CentrifugalPump centrifugalPump(isHidden=system.isHidden,Dh_set=2,m_flow_start=166.7,P_start=2e6,pmprfl=1250,pmprho=1000,L_set=3,pmprsp(displayUnit="rpm")=157.07963267949,A_set=3.141,pmprhd=113,pmprtk=190,T=294.15) 
    "离心泵" annotation (Placement(transformation(origin={32,0}, 
extent={{-10,-10},{8,8}})));
  ThermoHydraulicLib.Pipes.Pipe pipe(isHidden=system.isHidden,m_flow_start=166.7,L_tot=10,D=2,P_start={100000,100000},redeclare model HWModel = ThermoHydraulicLib.Pipes.BasicModels.ConstitutiveModels.WallHeatTransfer.HWModel1,redeclare model HIModel = ThermoHydraulicLib.Pipes.BasicModels.ConstitutiveModels.InterfaceHeatTransfer.HIModel1) 
    "常规管道" annotation (Placement(transformation(origin = {-40, 0}, extent = {{-20, -4}, {20, 8}})));
  ThermoHydraulicLib.Pipes.Pipe pipe1(isHidden=system.isHidden,D=2,L_tot=100,m_flow_start=166.7,P_start={100000,100000}) 
    "常规管道1" annotation (Placement(transformation(origin={104,8}, 
extent={{-20,-4},{20,8}})));
  InstrumentControl.Blocks.Sources.Ramp ramp(startTime=0,endTime=30,target=300) 
    "斜坡信号模块" annotation (Placement(transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}})));
  ThermoHydraulicLib.Boundaries.FluidBoundaries.PressureBoundary_In pressureBoundary_In(isHidden=system.isHidden,P_set=1e5,m_flow_start=166.7,T_set=294.15) 
    "入口压力边界" annotation (Placement(transformation(origin={-86,1.11022e-16}, 
extent={{-6,-6},{6,6}})));
  ThermoHydraulicLib.Boundaries.FluidBoundaries.FlowBoundary_Out fBound(isHidden=system.isHidden,P=1e5,mflow_set=166.7,T=294.15) 
    "出口流量边界" annotation (Placement(transformation(origin={146,8}, 
extent={{-6,-6},{6,6}})));
  annotation(__MWORKS(NUMAP(StartTime=0,StopTime=1e100),ContinueSimConfig(SaveContinueFile="true",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=0.002,ContinueTimeVector)),experiment(NumberOfIntervals=500,StartTime=0,StopTime=100,Interval=0));
equation
  connect(centrifugalPump.fluidPortIn, pipe.fluidPortOut) 
  annotation(Line(origin={1,0}, 
  points={{21,0},{-21,0}}, 
  color={0,127,255}));
  connect(centrifugalPump.fluidPortOut, pipe1.fluidPortIn) 
  annotation(Line(origin={62,8}, 
  points={{-22,0},{22,0}}, 
  color={0,127,255}));
  connect(ramp.y, centrifugalPump.N_sig) 
  annotation(Line(origin={27,19}, 
  points={{-6,11},{5,11},{5,-11}}, 
  color={0,0,127}));
  connect(pipe.fluidPortIn, pressureBoundary_In.fluidPortOut) 
  annotation(Line(origin={-70,0}, 
  points={{10,0},{-10,1.11022e-16}}, 
  color={0,127,255}));
  connect(pipe1.fluidPortOut, fBound.fluidPortIn) 
  annotation(Line(origin={132,8}, 
  points={{-8,0},{8,0}}, 
  color={0,127,255}));
  end pump;