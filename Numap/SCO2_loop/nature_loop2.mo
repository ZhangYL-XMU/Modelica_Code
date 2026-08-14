model nature_loop2
  inner ThermoHydraulicLib.System.System system(IsConnectSim=false) "全局设置" annotation (Placement(transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}})));
  ThermoHydraulicLib_CT.Pipes.Pipe_SCO2.Pipe_SCO2 pipe_SCO2_1(isHidden=system.isHidden,D=0.007,L_tot(displayUnit="m")=4,m_flow_start=0,volNum=2,P_start(displayUnit="Pa")={8000000,8000000}) 
    "SCO2常规管道_1" annotation (Placement(transformation(origin={-20,-96.4}, 
extent={{-20,-4},{20,8}})));
  ThermoHydraulicLib_CT.Pipes.Pipe_SCO2.CircularPipe_SCO2 circularPipe_SCO2_1(isHidden=system.isHidden,D=0.007,H_out(displayUnit="mm")=1.38,L_tot(displayUnit="mm")=1.33,P_tot_1=1000,redeclare package Material_1 = ThermoHydraulicLib_CT.Utilities.Media.SolidMedium.Steel,P_start={8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000},m_flow_start=0,isPtot1_Input=true,volNum=20,HeatBoundaryType=3,H_in(displayUnit="mm")=0.05,Thickness_1=0.0015,isHeatFlux=false,h_set=10,monitor_str="进口流体压力:%{P[1]} Pa
进口流体温度:%{T[1]} K",monitorDataFormat="normal") 
    "SCO2圆柱形加热管_1" annotation (Placement(transformation(origin={66,0}, 
extent={{-20,-4},{20,8}}, 
rotation=90)));
  InstrumentControl.Blocks.Sources.Ramp ramp(endTime=200,target=1000,usetarget=false,height=2200,offset=500,startTime=100) 
    "斜坡信号模块" annotation (Placement(transformation(origin={40,0}, 
extent={{-10,-10},{10,10}})));
  ThermoHydraulicLib_CT.Pipes.Pipe_SCO2.Pipe_SCO2 pipe_SCO2_2(isHidden=system.isHidden,D=0.007,L_tot(displayUnit="m")=2.5,P_start={8000000,8000000},m_flow_start=0,H_in=2.5,volNum=2) 
    "SCO2常规管道_2" annotation (Placement(transformation(origin={-66,0}, 
extent={{-20,-4},{20,8}}, 
rotation=270)));
  ThermoHydraulicLib_CT.Volumes.BasicComponents.Jun_SCO2 jun_SCO2_4(isHidden=system.isHidden,mflow_start=0) 
    "SCO2接管模型_4" annotation (Placement(transformation(origin={-54,96}, 
extent={{-6,-6},{6,6}}, 
rotation=180)));
  ThermoHydraulicLib_CT.Volumes.BasicComponents.Jun_SCO2 jun_SCO2_5(isHidden=system.isHidden,mflow_start=0) 
    "SCO2接管模型_5" annotation (Placement(transformation(origin={54,96}, 
extent={{-6,-6},{6,6}}, 
rotation=180)));
  ThermoHydraulicLib_CT.Pipes.Pipe_SCO2.Pipe_SCO2 pipe_SCO2_3(isHidden=system.isHidden,D=0.007,L_tot(displayUnit="mm")=0.55,m_flow_start=0,volNum=2,P_start(displayUnit="Pa")={8000000, 8000000},H_out(displayUnit="mm")=0.55,H_in(displayUnit="mm")) 
    "SCO2常规管道_3" annotation (Placement(transformation(origin={66,-66}, 
extent={{-20,-4},{20,8}}, 
rotation=90)));
  ThermoHydraulicLib_CT.Pipes.Pipe_SCO2.Pipe_SCO2 pipe_SCO2_4(isHidden=system.isHidden,D=0.007,L_tot(displayUnit="mm")=0.62,m_flow_start=0,volNum=2,P_start(displayUnit="Pa")={8000000, 8000000},H_in(displayUnit="mm")=1.88,H_out(displayUnit="mm")=2.5) 
    "SCO2常规管道_4" annotation (Placement(transformation(origin={66,68}, 
extent={{-20,-4},{20,8}}, 
rotation=90)));
  ThermoHydraulicLib_CT.Volumes.BasicComponents.Jun_SCO2 jun_SCO2_3(isHidden=system.isHidden,mflow_start=0) 
    "SCO2接管模型_3" annotation (Placement(transformation(origin={66,-33}, 
extent={{-6,-6},{6,6}}, 
rotation=90)));
  ThermoHydraulicLib_CT.Volumes.BasicComponents.Jun_SCO2 jun_SCO2_6(isHidden=system.isHidden,mflow_start=0) 
    "SCO2接管模型_6" annotation (Placement(transformation(origin={66,34}, 
extent={{-6,-6},{6,6}}, 
rotation=90)));
  ThermoHydraulicLib_CT.Joints.Resitances_SCO2 resitances_SCO2_1(isHidden=system.isHidden,mflow_start=0,ksi=36) 
    "SCO2通用阻力件_1" annotation (Placement(transformation(origin={-66,-54}, 
extent={{-8,-4},{8,4}}, 
rotation=270)));
  ThermoHydraulicLib_CT.Pipes.Pipe_SCO2.Pipe_SCO2 pipe_SCO2_5(isHidden=system.isHidden,D=0.007,L_tot(displayUnit="m")=3,m_flow_start=0,volNum=2,P_start(displayUnit="Pa")={8000000,8000000},useHeatTransfer=true,Aw1(displayUnit="cm2")=0.066,H_in=2.5,H_out=2.5) 
    "SCO2常规管道_5" annotation (Placement(transformation(origin={0,96}, 
extent={{-20,-4},{20,8}}, 
rotation=180)));
  ThermoHydraulicLib_CT.HeatStructures.CounterHeatFlow counterHeatFlow(isHidden=system.isHidden,N=2) 
    "编号反向" annotation (Placement(transformation(origin={0,74}, 
extent={{-4,-4},{4,4}}, 
rotation=90)));
  ThermoHydraulicLib_CT.HeatStructures.Wall_Double wall_Double(isHidden=system.isHidden,HeatStructureGeo=1,D_inner=0.007,L_tot=3,Thickness_1=0.0015,redeclare package Material_1 = ThermoHydraulicLib_CT.Utilities.Media.SolidMedium.Steel,wallNum=2) 
    "双侧热构件" annotation (Placement(transformation(origin={0,54}, 
extent={{-6,-6},{6,6}}, 
rotation=270)));
  ThermoHydraulicLib.Pipes.Pipe pipe(isHidden=system.isHidden,H_in=2.5,H_out=2.5,L_tot=3,useHeatTransfer=true,Aw1(displayUnit="cm2")=0.0942,P_start={100000,100000}) 
    "常规管道" annotation (Placement(transformation(origin={0,30}, 
extent={{-20,-4},{20,8}})));
  ThermoHydraulicLib.Boundaries.FluidBoundaries.FlowBoundary_In fBound1(isHidden=system.isHidden,P=5e5,T=283.15,mflow_set=0.6) 
    "入口流量边界1" annotation (Placement(transformation(origin={-40,30}, 
extent={{-6,-6},{6,6}})));
  ThermoHydraulicLib.Boundaries.FluidBoundaries.PressureBoundary_Out pressureBoundary_Out1(isHidden=system.isHidden,P_set=1e5,A_set=0.000314159,m_flow_start=0.6) 
    "出口压力边界1" annotation (Placement(transformation(origin={40,30}, 
extent={{-6,-6},{6,6}})));
  ThermoHydraulicLib_CT.Boundaries.FluidBoundaries.FluidBoundaries_SCO2.PressureBoundary_Out pressureBoundary_Out2(isHidden=system.isHidden,P_set=9.19e6,m_flow_start=0,A_set=0.01) 
    "SCO2出口压力边界2" annotation (Placement(transformation(origin={12,-30}, 
extent={{-6,-6},{8,6}})));
  ThermoHydraulicLib_CT.Joints.Branch_SCO2 branch_SCO2_1(isHidden=system.isHidden,JunIn=1,JunOut=2) 
    "多通_1" annotation (Placement(transformation(origin={40,-94.4}, 
extent={{-8,-4},{8,4}})));
  ThermoHydraulicLib_CT.Pipes.Pipe_SCO2.Pipe_SCO2 pipe_SCO2_6(isHidden=system.isHidden,D=0.007,L_tot(displayUnit="m")=0.05,P_start={8000000,8000000},m_flow_start=0,H_in=0,volNum=2) 
    "SCO2常规管道_6" annotation (Placement(transformation(origin={28,-54}, 
extent={{-20,-4},{20,8}}, 
rotation=90)));
  parameter Boolean showVarValueFlag = true annotation ( HideResult = true , HideVarTable = true);
  annotation(__MWORKS(NUMAP(StartTime=0,StopTime=1e100),ContinueSimConfig(SaveContinueFile="true",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=0.2,ContinueTimeVector)),experiment(NumberOfIntervals=500,StartTime=0,StopTime=100,Interval=0),Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, 
grid={2,2}),graphics={Text(origin = {153,0}, lineColor = { 0, 0, 0 }, extent =  {{-71,-13},{71,13}}, textString =  "进口流体压力:%{circularPipe_SCO2_1.P[1]} Pa
进口流体温度:%{circularPipe_SCO2_1.T[1]} K" , textStyle = { TextStyle.None }, textColor = { 0, 0, 0 }, horizontalAlignment = TextAlignment.Left, belongComp = "varValueShow_circularPipe_SCO2_1")}));
equation
  connect(ramp.y, circularPipe_SCO2_1.P_tot_1_Input) 
  annotation(Line(origin={49,-9}, 
points={{2,9},{12,9},{12,-9}}, 
color={0,0,127}));
  connect(jun_SCO2_4.fluidPortOut, pipe_SCO2_2.fluidPortIn) 
  annotation(Line(origin={-61,31}, 
points={{1,65},{-5,65},{-5,-11}}, 
color={55,115,175}));
  connect(circularPipe_SCO2_1.fluidPortIn, jun_SCO2_3.fluidPortOut) 
  annotation(Line(origin={66,-24}, 
points={{0,3},{0,-3}}, 
color={55,115,175}));
  connect(pipe_SCO2_3.fluidPortOut, jun_SCO2_3.fluidPortIn) 
  annotation(Line(origin={66,-42}, 
points={{0,-4},{0,3}}, 
color={55,115,175}));
  connect(circularPipe_SCO2_1.fluidPortOut, jun_SCO2_6.fluidPortIn) 
  annotation(Line(origin={66,25}, 
points={{0,-4},{0,3}}, 
color={55,115,175}));
  connect(pipe_SCO2_4.fluidPortIn, jun_SCO2_6.fluidPortOut) 
  annotation(Line(origin={66,44}, 
points={{0,4},{0,-4}}, 
color={55,115,175}));
  connect(jun_SCO2_5.fluidPortIn, pipe_SCO2_4.fluidPortOut) 
  annotation(Line(origin={63,92}, 
points={{-3,4},{3,4},{3,-4}}, 
color={55,115,175}));
  connect(pipe_SCO2_2.fluidPortOut, resitances_SCO2_1.fluidPortIn) 
  annotation(Line(origin={-66,-33}, 
points={{0,13},{0,-13}}, 
color={55,115,175}));
  connect(pipe_SCO2_1.fluidPortIn, resitances_SCO2_1.fluidPortOut) 
  annotation(Line(origin={-53,-79}, 
points={{13,-17.4},{-13,-17.4},{-13,17}}, 
color={55,115,175}));
  connect(jun_SCO2_5.fluidPortOut, pipe_SCO2_5.fluidPortIn) 
  annotation(Line(origin={34,96}, 
points={{14,0},{-14,0}}, 
color={55,115,175}));
  connect(jun_SCO2_4.fluidPortIn, pipe_SCO2_5.fluidPortOut) 
  annotation(Line(origin={-34,96}, 
points={{-14,0},{14,0}}, 
color={55,115,175}));
  connect(pipe.heatPort1[1], wall_Double.heatPort_B[1]) 
  annotation(Line(origin={0,41}, 
points={{0,-6.6},{0,7}}, 
color={191,0,0}));
  connect(pipe.fluidPortIn, fBound1.fluidPortOut) 
  annotation(Line(origin={-27,30}, 
points={{7,0},{-7,0}}, 
color={0,127,255}));
  connect(pipe.fluidPortOut, pressureBoundary_Out1.fluidPortIn) 
  annotation(Line(origin={27,30}, 
points={{-7,0},{7,0}}, 
color={0,127,255}));
  connect(wall_Double.heatPort_B[2], pipe.heatPort1[2]) 
  annotation(Line(origin={0,41}, 
points={{0,7},{0,-6.6}}, 
color={191,0,0}));
  connect(pipe_SCO2_5.heatPort1[1], counterHeatFlow.portB[1]) 
  annotation(Line(origin={0,85}, 
points={{0,6.6},{0,-7}}, 
color={191,0,0}));
  connect(pipe_SCO2_5.heatPort1[2], counterHeatFlow.portB[2]) 
  annotation(Line(origin={0,85}, 
points={{0,6.6},{0,-7}}, 
color={191,0,0}));
  connect(counterHeatFlow.portA[1], wall_Double.heatPort_A[1]) 
  annotation(Line(origin={0,65}, 
points={{0,5},{0,-5}}, 
color={191,0,0}));
  connect(counterHeatFlow.portA[2], wall_Double.heatPort_A[2]) 
  annotation(Line(origin={0,65}, 
points={{0,5},{0,-5}}, 
color={191,0,0}));
  connect(pipe_SCO2_1.fluidPortOut, branch_SCO2_1.fluidPortIn[1]) 
  annotation(Line(origin={16,-95}, 
  points={{-16,-1.4},{13,-1.4},{13,0.590303},{16,0.590303}}, 
  color={55,115,175}));
  connect(branch_SCO2_1.fluidPortOut[1], pipe_SCO2_3.fluidPortIn) 
  annotation(Line(origin={57,-90}, 
  points={{-9,-4.4},{9,-4.4},{9,4}}, 
  color={55,115,175}));
  connect(branch_SCO2_1.fluidPortOut[2], pipe_SCO2_6.fluidPortIn) 
  annotation(Line(origin={40,-84}, 
  points={{8,-10.4},{11,-10.4},{11,7},{-12,7},{-12,10}}, 
  color={55,115,175}));
  connect(pressureBoundary_Out2.fluidPortIn, pipe_SCO2_6.fluidPortOut) 
  annotation(Line(origin={10,-19}, 
points={{8,-11},{18,-11},{18,-15}}, 
color={55,115,175}));
  end nature_loop2;