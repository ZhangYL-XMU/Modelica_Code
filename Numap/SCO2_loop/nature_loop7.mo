model nature_loop7
  ThermoHydraulicLib_CT.Utilities.Model_varget model_varget24(isHidden = system.isHidden, coupling_variable = circularPipe_SCO2_1.T[1], var_name = "流体温度", var_unit = "K", comp_name = "SCO2圆柱形加热管_1", comp_icon_path = "modelica://ThermoHydraulicLib_CT/Icons2.0/核反应堆统一建模与分析平台- CT-36-常规管道.svg") 
    "参数抽取组件24" annotation(Placement(transformation(origin={164,65}, 
extent={{10,-10},{-10,10}}, 
rotation=180)));
  inner ThermoHydraulicLib.System.System system(IsConnectSim=false) "全局设置" annotation (Placement(transformation(origin={-90,90}, 
extent={{-10,-10},{10,10}})));
  ThermoHydraulicLib_CT.Pipes.Pipe_SCO2.Pipe_SCO2 pipe_SCO2_1(isHidden=system.isHidden,D=0.007,L_tot(displayUnit="m")=4,m_flow_start=0,volNum=2,P_start(displayUnit="Pa")={8000000,8000000}) 
    "SCO2常规管道_1" annotation (Placement(transformation(origin={20,-94.4}, 
extent={{-20,-4},{20,8}})));
  ThermoHydraulicLib_CT.Pipes.Pipe_SCO2.CircularPipe_SCO2 circularPipe_SCO2_1(isHidden=system.isHidden,D=0.007,H_out(displayUnit="mm")=1.38,L_tot(displayUnit="mm")=1.33,P_tot_1=1000,redeclare package Material_1 = ThermoHydraulicLib_CT.Utilities.Media.SolidMedium.Steel,P_start={8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000},m_flow_start=0,isPtot1_Input=true,volNum=20,HeatBoundaryType=3,H_in(displayUnit="mm")=0.05,Thickness_1=0.0015,isHeatFlux=true,h_set=3,Input_h=false,Input_q=true,EvenHeating_1=true,isPpart1_Input=true,isUserDefinedPorp_1=false,isSencond=false,monitor_str="",monitorDataFormat="normal") 
    "SCO2圆柱形加热管_1" annotation (Placement(transformation(origin={66,0}, 
extent={{-20,-4},{20,8}}, 
rotation=90)));
  InstrumentControl.Blocks.Sources.Ramp ramp(endTime=2000,target=1000,usetarget=false,height=2200,offset=2200,startTime=1000) 
    "斜坡信号模块" annotation (Placement(transformation(origin={13,-16}, 
extent={{-10,-10},{10,10}})));
  ThermoHydraulicLib_CT.Pipes.Pipe_SCO2.Pipe_SCO2 pipe_SCO2_2(isHidden=system.isHidden,D=0.007,L_tot(displayUnit="m")=2.5,P_start={8000000,8000000},m_flow_start=0,H_in=2.5,volNum=2) 
    "SCO2常规管道_2" annotation (Placement(transformation(origin={-66,0}, 
extent={{-20,-4},{20,8}}, 
rotation=270)));
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
    "SCO2通用阻力件_1" annotation (Placement(transformation(origin={-66,62}, 
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
    "SCO2出口压力边界2" annotation (Placement(transformation(origin={-38,-12}, 
extent={{-6,-6},{8,6}}, 
rotation=270)));
  ThermoHydraulicLib_CT.Joints.Branch_SCO2 branch_SCO2_1(isHidden=system.isHidden,JunIn=1,JunOut=2) 
    "多通_1" annotation (Placement(transformation(origin={-52,-94.4}, 
extent={{-8,-4},{8,4}})));
  ThermoHydraulicLib_CT.Pipes.Pipe_SCO2.Pipe_SCO2 pipe_SCO2_6(isHidden=system.isHidden,D=0.007,L_tot(displayUnit="m")=0.05,P_start={8000000,8000000},m_flow_start=0,H_in=0,volNum=2) 
    "SCO2常规管道_6" annotation (Placement(transformation(origin={-38,-54}, 
extent={{-20,-4},{20,8}}, 
rotation=90)));
  ThermoHydraulicLib_CT.Volumes.BasicComponents.Jun_SCO2 jun_SCO2_1(isHidden=system.isHidden,mflow_start=0) 
    "SCO2接管模型_1" annotation (Placement(transformation(origin={54,-94.4}, 
extent={{-6,-6},{6,6}}, 
rotation=360)));
  parameter Boolean showVarValueFlag = true annotation ( HideResult = true , HideVarTable = true);
  ThermoHydraulicLib_CT.Utilities.Model_varget model_varget1(isHidden = system.isHidden, coupling_variable = pipe_SCO2_3.P_out, var_name = "流体温度出口压力", var_unit = "bar", comp_name = "SCO2常规管道_3", comp_icon_path = "modelica://ThermoHydraulicLib_CT/Icons2.0/核反应堆统一建模与分析平台- CT-36-常规管道.svg") 
    "参数抽取组件1" annotation(Placement(transformation(origin={164,96.1}, 
extent={{10,-10},{-10,10}}, 
rotation=180)));
  py_h2 py_h2_1(h_cal1(period=10)) 
    annotation (Placement(transformation(origin={226,58}, 
extent={{-10,-10},{10,10}})));
  ThermoHydraulicLib_CT.Utilities.Model_varget model_varget2(isHidden = system.isHidden, coupling_variable = pipe_SCO2_3.T_out, var_name = "流体温度出口温度", var_unit = "K", comp_name = "SCO2常规管道_3", comp_icon_path = "modelica://ThermoHydraulicLib_CT/Icons2.0/核反应堆统一建模与分析平台- CT-36-常规管道.svg") 
    "参数抽取组件2" annotation(Placement(transformation(origin={164,94.1}, 
extent={{10,-10},{-10,10}}, 
rotation=180)));
  ThermoHydraulicLib_CT.Utilities.Model_varget model_varget3(isHidden = system.isHidden, coupling_variable = pipe_SCO2_3.mflow[1], var_name = "mflow[1]", var_unit = "kg/s", comp_name = "斜坡信号模块", comp_icon_path = "modelica://ThermoHydraulicLib_CT/Icons2.0/核反应堆统一建模与分析平台- CT-36-常规管道.svg") 
    "参数抽取组件3" annotation(Placement(transformation(origin={164,92.1}, 
extent={{10,-10},{-10,10}}, 
rotation=180)));
  ThermoHydraulicLib_CT.Utilities.Model_varget model_varget4(isHidden = system.isHidden, coupling_variable = ramp.y, var_name = "输出信号", var_unit = "W", comp_name = "SCO2常规管道_3", comp_icon_path = "modelica://ThermoHydraulicLib_CT/Icons2.0/核反应堆统一建模与分析平台- CT-36-常规管道.svg") 
    "参数抽取组件4" annotation(Placement(transformation(origin={164,90.1}, 
extent={{10,-10},{-10,10}}, 
rotation=180)));
  InstrumentControl.Blocks.Math.Add add 
    "加法器" annotation (Placement(transformation(origin={207,83.5}, 
extent={{-3,-3.5},{3,3.5}})));
  InstrumentControl.Blocks.Sources.RealExpression realExpression(y=-273.15) 
    "常值信号" annotation (Placement(transformation(origin={194,81.6}, 
extent={{-6,-1.5},{6,1.5}})));
  ThermoHydraulicLib_CT.Utilities.Model_varget model_varget5(isHidden = system.isHidden, coupling_variable = circularPipe_SCO2_1.T[2], var_name = "流体温度", var_unit = "K", comp_name = "SCO2圆柱形加热管_1", comp_icon_path = "modelica://ThermoHydraulicLib_CT/Icons2.0/核反应堆统一建模与分析平台- CT-36-常规管道.svg") 
    "参数抽取组件5" annotation(Placement(transformation(origin={164,63}, 
extent={{10,-10},{-10,10}}, 
rotation=180)));
  ThermoHydraulicLib_CT.Utilities.Model_varget model_varget6(isHidden = system.isHidden, coupling_variable = circularPipe_SCO2_1.T[3], var_name = "流体温度", var_unit = "K", comp_name = "SCO2圆柱形加热管_1", comp_icon_path = "modelica://ThermoHydraulicLib_CT/Icons2.0/核反应堆统一建模与分析平台- CT-36-常规管道.svg") 
    "参数抽取组件6" annotation(Placement(transformation(origin={164,61}, 
extent={{10,-10},{-10,10}}, 
rotation=180)));
  ThermoHydraulicLib_CT.Utilities.Model_varget model_varget7(isHidden = system.isHidden, coupling_variable = circularPipe_SCO2_1.T[4], var_name = "流体温度", var_unit = "K", comp_name = "SCO2圆柱形加热管_1", comp_icon_path = "modelica://ThermoHydraulicLib_CT/Icons2.0/核反应堆统一建模与分析平台- CT-36-常规管道.svg") 
    "参数抽取组件7" annotation(Placement(transformation(origin={164,59}, 
extent={{10,-10},{-10,10}}, 
rotation=180)));
  ThermoHydraulicLib_CT.Utilities.Model_varget model_varget8(isHidden = system.isHidden, coupling_variable = circularPipe_SCO2_1.T[5], var_name = "流体温度", var_unit = "K", comp_name = "SCO2圆柱形加热管_1", comp_icon_path = "modelica://ThermoHydraulicLib_CT/Icons2.0/核反应堆统一建模与分析平台- CT-36-常规管道.svg") 
    "参数抽取组件8" annotation(Placement(transformation(origin={164,57}, 
extent={{10,-10},{-10,10}}, 
rotation=180)));
  ThermoHydraulicLib_CT.Utilities.Model_varget model_varget9(isHidden = system.isHidden, coupling_variable = circularPipe_SCO2_1.T[6], var_name = "流体温度", var_unit = "K", comp_name = "SCO2圆柱形加热管_1", comp_icon_path = "modelica://ThermoHydraulicLib_CT/Icons2.0/核反应堆统一建模与分析平台- CT-36-常规管道.svg") 
    "参数抽取组件9" annotation(Placement(transformation(origin={164,55}, 
extent={{10,-10},{-10,10}}, 
rotation=180)));
  ThermoHydraulicLib_CT.Utilities.Model_varget model_varget10(isHidden = system.isHidden, coupling_variable = circularPipe_SCO2_1.T[7], var_name = "流体温度", var_unit = "K", comp_name = "SCO2圆柱形加热管_1", comp_icon_path = "modelica://ThermoHydraulicLib_CT/Icons2.0/核反应堆统一建模与分析平台- CT-36-常规管道.svg") 
    "参数抽取组件10" annotation(Placement(transformation(origin={164,53}, 
extent={{10,-10},{-10,10}}, 
rotation=180)));
  ThermoHydraulicLib_CT.Utilities.Model_varget model_varget11(isHidden = system.isHidden, coupling_variable = circularPipe_SCO2_1.T[8], var_name = "流体温度", var_unit = "K", comp_name = "SCO2圆柱形加热管_1", comp_icon_path = "modelica://ThermoHydraulicLib_CT/Icons2.0/核反应堆统一建模与分析平台- CT-36-常规管道.svg") 
    "参数抽取组件11" annotation(Placement(transformation(origin={164,51}, 
extent={{10,-10},{-10,10}}, 
rotation=180)));
  ThermoHydraulicLib_CT.Utilities.Model_varget model_varget12(isHidden = system.isHidden, coupling_variable = circularPipe_SCO2_1.T[9], var_name = "流体温度", var_unit = "K", comp_name = "SCO2圆柱形加热管_1", comp_icon_path = "modelica://ThermoHydraulicLib_CT/Icons2.0/核反应堆统一建模与分析平台- CT-36-常规管道.svg") 
    "参数抽取组件12" annotation(Placement(transformation(origin={164,49}, 
extent={{10,-10},{-10,10}}, 
rotation=180)));
  ThermoHydraulicLib_CT.Utilities.Model_varget model_varget13(isHidden = system.isHidden, coupling_variable = circularPipe_SCO2_1.T[10], var_name = "流体温度", var_unit = "K", comp_name = "SCO2圆柱形加热管_1", comp_icon_path = "modelica://ThermoHydraulicLib_CT/Icons2.0/核反应堆统一建模与分析平台- CT-36-常规管道.svg") 
    "参数抽取组件13" annotation(Placement(transformation(origin={164,47}, 
extent={{10,-10},{-10,10}}, 
rotation=180)));
  ThermoHydraulicLib_CT.Utilities.Model_varget model_varget14(isHidden = system.isHidden, coupling_variable = circularPipe_SCO2_1.T[11], var_name = "流体温度", var_unit = "K", comp_name = "SCO2圆柱形加热管_1", comp_icon_path = "modelica://ThermoHydraulicLib_CT/Icons2.0/核反应堆统一建模与分析平台- CT-36-常规管道.svg") 
    "参数抽取组件14" annotation(Placement(transformation(origin={164,47}, 
extent={{10,-10},{-10,10}}, 
rotation=180)));
  ThermoHydraulicLib_CT.Utilities.Model_varget model_varget15(isHidden = system.isHidden, coupling_variable = circularPipe_SCO2_1.T[12], var_name = "流体温度", var_unit = "K", comp_name = "SCO2圆柱形加热管_1", comp_icon_path = "modelica://ThermoHydraulicLib_CT/Icons2.0/核反应堆统一建模与分析平台- CT-36-常规管道.svg") 
    "参数抽取组件15" annotation(Placement(transformation(origin={164,45}, 
extent={{10,-10},{-10,10}}, 
rotation=180)));
  ThermoHydraulicLib_CT.Utilities.Model_varget model_varget16(isHidden = system.isHidden, coupling_variable = circularPipe_SCO2_1.T[13], var_name = "流体温度", var_unit = "K", comp_name = "SCO2圆柱形加热管_1", comp_icon_path = "modelica://ThermoHydraulicLib_CT/Icons2.0/核反应堆统一建模与分析平台- CT-36-常规管道.svg") 
    "参数抽取组件16" annotation(Placement(transformation(origin={164,43}, 
extent={{10,-10},{-10,10}}, 
rotation=180)));
  ThermoHydraulicLib_CT.Utilities.Model_varget model_varget17(isHidden = system.isHidden, coupling_variable = circularPipe_SCO2_1.T[14], var_name = "流体温度", var_unit = "K", comp_name = "SCO2圆柱形加热管_1", comp_icon_path = "modelica://ThermoHydraulicLib_CT/Icons2.0/核反应堆统一建模与分析平台- CT-36-常规管道.svg") 
    "参数抽取组件17" annotation(Placement(transformation(origin={164,41}, 
extent={{10,-10},{-10,10}}, 
rotation=180)));
  ThermoHydraulicLib_CT.Utilities.Model_varget model_varget18(isHidden = system.isHidden, coupling_variable = circularPipe_SCO2_1.T[15], var_name = "流体温度", var_unit = "K", comp_name = "SCO2圆柱形加热管_1", comp_icon_path = "modelica://ThermoHydraulicLib_CT/Icons2.0/核反应堆统一建模与分析平台- CT-36-常规管道.svg") 
    "参数抽取组件18" annotation(Placement(transformation(origin={164,39}, 
extent={{10,-10},{-10,10}}, 
rotation=180)));
  ThermoHydraulicLib_CT.Utilities.Model_varget model_varget19(isHidden = system.isHidden, coupling_variable = circularPipe_SCO2_1.T[16], var_name = "流体温度", var_unit = "K", comp_name = "SCO2圆柱形加热管_1", comp_icon_path = "modelica://ThermoHydraulicLib_CT/Icons2.0/核反应堆统一建模与分析平台- CT-36-常规管道.svg") 
    "参数抽取组件19" annotation(Placement(transformation(origin={164,37}, 
extent={{10,-10},{-10,10}}, 
rotation=180)));
  ThermoHydraulicLib_CT.Utilities.Model_varget model_varget20(isHidden = system.isHidden, coupling_variable = circularPipe_SCO2_1.T[17], var_name = "流体温度", var_unit = "K", comp_name = "SCO2圆柱形加热管_1", comp_icon_path = "modelica://ThermoHydraulicLib_CT/Icons2.0/核反应堆统一建模与分析平台- CT-36-常规管道.svg") 
    "参数抽取组件20" annotation(Placement(transformation(origin={164,35}, 
extent={{10,-10},{-10,10}}, 
rotation=180)));
  ThermoHydraulicLib_CT.Utilities.Model_varget model_varget21(isHidden = system.isHidden, coupling_variable = circularPipe_SCO2_1.T[18], var_name = "流体温度", var_unit = "K", comp_name = "SCO2圆柱形加热管_1", comp_icon_path = "modelica://ThermoHydraulicLib_CT/Icons2.0/核反应堆统一建模与分析平台- CT-36-常规管道.svg") 
    "参数抽取组件21" annotation(Placement(transformation(origin={164,33}, 
extent={{10,-10},{-10,10}}, 
rotation=180)));
  ThermoHydraulicLib_CT.Utilities.Model_varget model_varget22(isHidden = system.isHidden, coupling_variable = circularPipe_SCO2_1.T[19], var_name = "流体温度", var_unit = "K", comp_name = "SCO2圆柱形加热管_1", comp_icon_path = "modelica://ThermoHydraulicLib_CT/Icons2.0/核反应堆统一建模与分析平台- CT-36-常规管道.svg") 
    "参数抽取组件22" annotation(Placement(transformation(origin={164,31}, 
extent={{10,-10},{-10,10}}, 
rotation=180)));
  ThermoHydraulicLib_CT.Utilities.Model_varget model_varget23(isHidden = system.isHidden, coupling_variable = circularPipe_SCO2_1.T[20], var_name = "流体温度", var_unit = "K", comp_name = "SCO2圆柱形加热管_1", comp_icon_path = "modelica://ThermoHydraulicLib_CT/Icons2.0/核反应堆统一建模与分析平台- CT-36-常规管道.svg") 
    "参数抽取组件23" annotation(Placement(transformation(origin={164,29}, 
extent={{10,-10},{-10,10}}, 
rotation=180)));
  annotation(__MWORKS(NUMAP(StartTime=0,StopTime=1e100),ContinueSimConfig(SaveContinueFile="true",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=0.2,ContinueTimeVector)),experiment(NumberOfIntervals=500,StartTime=0,StopTime=100,Interval=0),Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, 
grid={2,2})));
equation
  connect(ramp.y, circularPipe_SCO2_1.P_tot_1_Input) 
  annotation(Line(origin={49,-9}, 
points={{-25,-7},{12,-7},{12,-9}}, 
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
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
  connect(jun_SCO2_5.fluidPortOut, pipe_SCO2_5.fluidPortIn) 
  annotation(Line(origin={34,96}, 
points={{14,0},{-14,0}}, 
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
  connect(branch_SCO2_1.fluidPortOut[2], pipe_SCO2_6.fluidPortIn) 
  annotation(Line(origin={-26,-84}, 
points={{-18,-10.4},{11,-10.4},{11,7},{-12,7},{-12,10}}, 
color={55,115,175}));
  connect(pressureBoundary_Out2.fluidPortIn, pipe_SCO2_6.fluidPortOut) 
  annotation(Line(origin={-56,-19}, 
points={{18,1},{18,-15}}, 
color={55,115,175}));
  connect(branch_SCO2_1.fluidPortOut[1], pipe_SCO2_1.fluidPortIn) 
  annotation(Line(origin={-9,-94}, 
points={{-35,-0.4},{9,-0.4}}, 
color={55,115,175}));
  connect(pipe_SCO2_1.fluidPortOut, jun_SCO2_1.fluidPortIn) 
  annotation(Line(origin={44,-94}, 
  points={{-4,-0.4},{4,-0.4}}, 
  color={55,115,175}));
  connect(jun_SCO2_1.fluidPortOut, pipe_SCO2_3.fluidPortIn) 
  annotation(Line(origin={63,-90}, 
  points={{-3,-4.4},{3,-4.4},{3,4}}, 
  color={55,115,175}));
  connect(pipe_SCO2_2.fluidPortIn, resitances_SCO2_1.fluidPortOut) 
  annotation(Line(origin={-66,37}, 
  points={{0,-17},{0,17}}, 
  color={55,115,175}));
  connect(resitances_SCO2_1.fluidPortIn, pipe_SCO2_5.fluidPortOut) 
  annotation(Line(origin={-43,83}, 
  points={{-23,-13},{-23,13},{23,13}}, 
  color={55,115,175}));
  connect(pipe_SCO2_2.fluidPortOut, branch_SCO2_1.fluidPortIn[1]) 
  annotation(Line(origin={-63,-57}, 
  points={{-3,37},{-3,-37.4097},{3,-37.4097}}, 
  color={55,115,175}));
  connect(model_varget1.y, py_h2_1.pin) 
  annotation(Line(origin={157,86}, 
points={{18.2,10.1},{59,10.1},{59,-19}}, 
color={0,0,127}));
  connect(model_varget3.y, py_h2_1.g) 
  annotation(Line(origin={157,56}, 
points={{18.2,36.1},{59,36.1},{59,3}}, 
color={0,0,127}));
  connect(model_varget4.y, py_h2_1.q) 
  annotation(Line(origin={157,41}, 
points={{18.2,49.1},{59,49.1},{59,14}}, 
color={0,0,127}));
  connect(model_varget2.y, add.u1) 
  annotation(Line(origin={153,70}, 
points={{22.2,24.1},{50.4,24.1},{50.4,15.6}}, 
color={0,0,127}));
  connect(add.y, py_h2_1.tin) 
  annotation(Line(origin={202,65}, 
points={{8.3,18.5},{14,18.5},{14,-2}}, 
color={0,0,127}));
  connect(add.u2, realExpression.y) 
  annotation(Line(origin={196,84}, 
points={{7.4,-2.6},{4.6,-2.6},{4.6,-2.4}}, 
color={0,0,127}));
  connect(model_varget24.y, py_h2_1.tb[1]) 
  annotation(Line(origin={196,57}, 
  points={{-20.8,8},{20,8},{20,-8}}, 
  color={0,0,127}));
  connect(model_varget5.y, py_h2_1.tb[2]) 
  annotation(Line(origin={196,56}, 
  points={{-20.8,7},{20,7},{20,-7}}, 
  color={0,0,127}));
  connect(model_varget6.y, py_h2_1.tb[3]) 
  annotation(Line(origin={196,55}, 
  points={{-20.8,6},{20,6},{20,-6}}, 
  color={0,0,127}));
  connect(model_varget7.y, py_h2_1.tb[4]) 
  annotation(Line(origin={196,54}, 
  points={{-20.8,5},{20,5},{20,-5}}, 
  color={0,0,127}));
  connect(model_varget8.y, py_h2_1.tb[5]) 
  annotation(Line(origin={196,53}, 
  points={{-20.8,4},{20,4},{20,-4}}, 
  color={0,0,127}));
  connect(model_varget9.y, py_h2_1.tb[6]) 
  annotation(Line(origin={196,52}, 
  points={{-20.8,3},{20,3},{20,-3}}, 
  color={0,0,127}));
  connect(model_varget10.y, py_h2_1.tb[7]) 
  annotation(Line(origin={196,51}, 
  points={{-20.8,2},{20,2},{20,-2}}, 
  color={0,0,127}));
  connect(model_varget11.y, py_h2_1.tb[8]) 
  annotation(Line(origin={196,50}, 
  points={{-20.8,1},{20,1},{20,-1}}, 
  color={0,0,127}));
  connect(model_varget12.y, py_h2_1.tb[9]) 
  annotation(Line(origin={196,49}, 
  points={{-20.8,0},{20,0}}, 
  color={0,0,127}));
  connect(model_varget13.y, py_h2_1.tb[10]) 
  annotation(Line(origin={196,48}, 
  points={{-20.8,-1},{20,-1},{20,1}}, 
  color={0,0,127}));
  connect(model_varget14.y, py_h2_1.tb[11]) 
  annotation(Line(origin={196,46}, 
points={{-20.8,1},{20,1},{20,3}}, 
color={0,0,127}));
  connect(model_varget15.y, py_h2_1.tb[12]) 
  annotation(Line(origin={196,45}, 
points={{-20.8,0},{20,0},{20,4}}, 
color={0,0,127}));
  connect(model_varget16.y, py_h2_1.tb[13]) 
  annotation(Line(origin={196,44}, 
points={{-20.8,-1},{20,-1},{20,5}}, 
color={0,0,127}));
  connect(model_varget17.y, py_h2_1.tb[14]) 
  annotation(Line(origin={196,43}, 
points={{-20.8,-2},{20,-2},{20,6}}, 
color={0,0,127}));
  connect(model_varget18.y, py_h2_1.tb[15]) 
  annotation(Line(origin={196,42}, 
points={{-20.8,-3},{20,-3},{20,7}}, 
color={0,0,127}));
  connect(model_varget19.y, py_h2_1.tb[16]) 
  annotation(Line(origin={196,41}, 
points={{-20.8,-4},{20,-4},{20,8}}, 
color={0,0,127}));
  connect(model_varget20.y, py_h2_1.tb[17]) 
  annotation(Line(origin={196,40}, 
points={{-20.8,-5},{20,-5},{20,9}}, 
color={0,0,127}));
  connect(model_varget21.y, py_h2_1.tb[18]) 
  annotation(Line(origin={196,39}, 
points={{-20.8,-6},{20,-6},{20,10}}, 
color={0,0,127}));
  connect(model_varget22.y, py_h2_1.tb[19]) 
  annotation(Line(origin={196,38}, 
points={{-20.8,-7},{20,-7},{20,11}}, 
color={0,0,127}));
  connect(model_varget23.y, py_h2_1.tb[20]) 
  annotation(Line(origin={196,37}, 
points={{-20.8,-8},{20,-8},{20,12}}, 
color={0,0,127}));
  end nature_loop7;