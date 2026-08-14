package SCO2_loop
  model nature_loop
    inner ThermoHydraulicLib.System.System system(IsConnectSim=false) "全局设置" annotation (Placement(transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}})));
    ThermoHydraulicLib_CT.Pipes.Pipe_SCO2.Pipe_SCO2 pipe_SCO2_1(isHidden=system.isHidden,D=0.007,L_tot(displayUnit="m")=4,m_flow_start=0,volNum=2,P_start(displayUnit="Pa")={8000000,8000000}) 
      "SCO2常规管道_1" annotation (Placement(transformation(origin={-20,-96.4}, 
  extent={{-20,-4},{20,8}})));
    ThermoHydraulicLib_CT.Pipes.Pipe_SCO2.CircularPipe_SCO2 circularPipe_SCO2_1(isHidden=system.isHidden,D=0.007,H_out(displayUnit="mm")=1.38,L_tot(displayUnit="mm")=1.33,P_tot_1=1000,redeclare package Material_1 = ThermoHydraulicLib_CT.Utilities.Media.SolidMedium.Steel,P_start={8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000,8000000},m_flow_start=0,isPtot1_Input=true,volNum=20,HeatBoundaryType=3,H_in(displayUnit="mm")=0.05,Thickness_1=0.0015,isHeatFlux=false,h_set=10) 
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
    annotation(__MWORKS(NUMAP(StartTime=0,StopTime=1e100),ContinueSimConfig(SaveContinueFile="true",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=0.2,ContinueTimeVector)),experiment(NumberOfIntervals=500,StartTime=0,StopTime=100,Interval=0),Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, 
  grid={2,2})));
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
    end nature_loop;
  model heat_trans
    inner ThermoHydraulicLib.System.System system "全局设置" annotation (Placement(transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}})));
    ThermoHydraulicLib.Boundaries.FluidBoundaries.PressureBoundary_In pressureBoundary_In(isHidden=system.isHidden,P_set=1.5e5,m_flow_start=166.7,T_set=294.15) 
      "入口压力边界" annotation (Placement(transformation(origin={108,-6}, 
  extent={{-6,-6},{6,6}}, 
  rotation=180)));
    ThermoHydraulicLib.Boundaries.FluidBoundaries.FlowBoundary_Out fBound(isHidden=system.isHidden,P=1e5,mflow_set=166.7,T=421.15) 
      "出口流量边界" annotation (Placement(transformation(origin={-140,-6}, 
  extent={{-6,-6},{6,6}}, 
  rotation=180)));
    ThermoHydraulicLib.HeatExchangers.CountercurrentHeatExchanger countercurrentHeatExchanger(isHidden=system.isHidden,Aw_high=10000,Aw_low=10000,L_heat=100,A_set_high=3.14,Dh_set_high=2,A_set_low=3.14,Dh_set_low=2,P_start_high=6.8e6,P_start_low=1.5e5,T_start_high_in=433.15,T_start_high_out=393.15) 
      "逆流换热器" annotation (Placement(transformation(origin={-70,-4.4409e-16}, 
extent={{-30,-12},{30,12}})));
    ThermoHydraulicLib.HeatExchangers.CountercurrentHeatExchanger countercurrentHeatExchanger1(isHidden=system.isHidden,Aw_high=10000,Aw_low=10000,A_set_high=3.14,L_heat=100,Dh_set_high=2,A_set_low=3.14,Dh_set_low=2,P_start_low=1.5e5,P_start_high=6.8e6,T_start_high_in=393.15,T_start_high_out=306.15) 
      "逆流换热器1" annotation (Placement(transformation(origin = {40, 0}, extent = {{-30, -12}, {30, 12}})));
    ThermoHydraulicLib.Boundaries.FluidBoundaries.PressureBoundary_In pressureBoundary_In1(isHidden=system.isHidden,P_set=6.8e6,m_flow_start=230,T_set(displayUnit="degC")=433.15) 
      "入口压力边界" annotation (Placement(transformation(origin={-150,40}, 
extent={{-6,-6},{6,6}}, 
rotation=360)));
    ThermoHydraulicLib.Boundaries.FluidBoundaries.FlowBoundary_Out fBound1(isHidden=system.isHidden,P=6.6e6,mflow_set=230,IsConstFlow=true,A_set=3.14) 
      "出口流量边界1" annotation (Placement(transformation(origin = {100, 20}, extent = {{-6, -6}, {6, 6}})));
    ThermoHydraulicLib.Joints.Resitances resitances(isHidden=system.isHidden,m_flow_start=166) 
      "通用阻力件" annotation (Placement(transformation(origin={-15,-6}, 
extent={{-8,-4},{8,4}}, 
rotation=180)));
    annotation(__MWORKS(NUMAP(StartTime=0,StopTime=1e100),ContinueSimConfig(SaveContinueFile="true",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=0.002,ContinueTimeVector)),experiment(NumberOfIntervals=500,StartTime=0,StopTime=1000,Interval=0),Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, 
grid={2,2})));
  equation
    connect(pressureBoundary_In.fluidPortOut, countercurrentHeatExchanger1.fluidPortIn_low) 
    annotation(Line(origin={86,-6}, 
    points={{16,0},{-16,0}}, 
    color={0,127,255}));
    connect(countercurrentHeatExchanger.fluidPortOut_low, fBound.fluidPortIn) 
    annotation(Line(origin={-74,-6}, 
points={{-26,0},{-60,0}}, 
color={0,127,255}));
    connect(pressureBoundary_In1.fluidPortOut, countercurrentHeatExchanger.fluidPortIn_high) 
    annotation(Line(origin={-132,23}, 
points={{-12,17},{9,17},{9,-17},{32,-17}}, 
color={0,127,255}));
    connect(countercurrentHeatExchanger.fluidPortOut_high, countercurrentHeatExchanger1.fluidPortIn_high) 
    annotation(Line(origin={-25,6}, 
points={{-15,0},{35,0}}, 
color={0,127,255}));
    connect(countercurrentHeatExchanger1.fluidPortOut_high, fBound1.fluidPortIn) 
    annotation(Line(origin={82,13}, 
    points={{-12,-7},{9,-7},{9,7},{12,7}}, 
    color={0,127,255}));
    connect(countercurrentHeatExchanger1.fluidPortOut_low, resitances.fluidPortIn) 
    annotation(Line(origin={2,-6}, 
    points={{8,0},{-9,8.88178e-16}}, 
    color={0,127,255}));
    connect(countercurrentHeatExchanger.fluidPortIn_low, resitances.fluidPortOut) 
    annotation(Line(origin={-31,-6}, 
    points={{-9,-8.88178e-16},{8,8.88178e-16}}, 
    color={0,127,255}));
    end heat_trans;
  model show_real
    annotation(__MWORKS(NUMAP(StartTime=0,StopTime=1e100),ContinueSimConfig(SaveContinueFile=true)),experiment(NumberOfIntervals=500,StartTime=0,StopTime=1));
    Real show_1 "Value to display";
    Modelica.Blocks.Interfaces.RealInput u 
      annotation (Placement(transformation(origin={-100,0}, 
extent={{-20,-20},{20,20}})));
    equation
    show_1 = u;

  end show_real;
  model pytest
    InstrumentControl.Blocks.Sources.Step step(startTime=20,offset=8200000,height=1000000) 
      "阶跃信号" annotation (Placement(transformation(origin={-30,38}, 
extent={{-10,-10},{10,10}})));
    InstrumentControl.Blocks.Sources.Step step1(offset=25.1,height=-5,startTime=20) 
      "阶跃信号1" annotation (Placement(transformation(origin={-102,6}, 
extent={{-10,-10},{10,10}})));
    InstrumentControl.Blocks.Sources.Step step2(offset=0.014,startTime=20,height=-0.002) 
      "阶跃信号2" annotation (Placement(transformation(origin={-30,-22}, 
extent={{-10,-10},{10,10}})));
    InstrumentControl.Blocks.Sources.Step step3(offset=3500,startTime=20,height=-1000) 
      "阶跃信号3" annotation (Placement(transformation(origin={-94,-48}, 
extent={{-10,-10},{10,10}})));
    py_h3 py_h3_1(h_t1(period=1)) 
      annotation (Placement(transformation(origin={30,-6}, 
  extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Sources.ContinuousClock continuousClock 
      annotation (Placement(transformation(origin={-30,-72}, 
extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Sources.ContinuousClock continuousClock1 
      annotation (Placement(transformation(origin={-94,-22}, 
extent={{-10,-10},{10,10}})));
    InstrumentControl.Blocks.Math.Add add 
      "加法器" annotation (Placement(transformation(origin={-62,-32}, 
extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Sources.ContinuousClock continuousClock2 
      annotation (Placement(transformation(origin={-104,28}, 
extent={{-10,-10},{10,10}})));
    InstrumentControl.Blocks.Math.Add add1 
      "加法器1" annotation (Placement(transformation(origin={-72,18}, 
extent={{-10,-10},{10,10}})));
    annotation(__MWORKS(NUMAP(StartTime=0,StopTime=1e100),ContinueSimConfig(SaveContinueFile="true",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=0.002,ContinueTimeVector)),experiment(NumberOfIntervals=500,StartTime=0,StopTime=50,Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0,Tolerance=0.0001),Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, 
grid={2,2})));
    model Interpreter
     String pythonEnvPath = "C:/Program Files/MWORKS/Sysplorer 2024b/External/python64";
      function global_constructor = ImportedTypes.UseConstructorWindowspython37 annotation(__MWORKS(hide=true));
      function global_exchangedata_func = ImportedTypes.FunctionUseExchangeDataWindowspython37 annotation(__MWORKS(hide=true));
      function global_exchangedata_obj = ImportedTypes.ObjectUseExchangeDataWindowspython37 annotation(__MWORKS(hide=true));
      function global_destructor = ImportedTypes.UseDestructorWindowspython37 annotation(__MWORKS(hide=true));
     end Interpreter;
    package ImportedTypes
      package ArrayConverter
        model _A2V_1D_Real 
        "1 dimension Real array to Real vector"
          extends Modelica.Icons.InterfacesPackage;
          annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}},preserveAspectRatio=false,grid={2.0,2.0})));
          import Modelica;
          parameter Integer dims[1] = {2};
          Modelica.Blocks.Interfaces.RealInput u[dims[1]] 
            annotation(Placement(transformation(origin ={-120.0,0.0},extent ={{-20.0,-20.0}, {20.0, 20.0}})));
          Modelica.Blocks.Interfaces.RealOutput y[product(dims)] 
            annotation(Placement(transformation(origin={110.0,0.0},extent={{-10.0,-10.0},{10.0,10.0}})));
        protected
          Integer pos;
        algorithm
          pos := 1;
          for i1 in 1:dims[1] loop
            y[pos] := u[i1];
            pos := pos + 1;
          end for;
        end _A2V_1D_Real;
        model _V2A_1D_Real 
        "Real vector to 1 dimension Real array"
          extends Modelica.Icons.InterfacesPackage;
          annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}},preserveAspectRatio=false,grid={2.0,2.0})));
          import Modelica;
          parameter Integer dims[1] = {2};
          Modelica.Blocks.Interfaces.RealInput u[product(dims)] 
          annotation(Placement(transformation(origin ={-120.0,0.0},extent ={{-20.0,-20.0}, {20.0, 20.0}})));
          Modelica.Blocks.Interfaces.RealOutput y[dims[1]] 
          annotation(Placement(transformation(origin={110.0,0.0},extent={{-10.0,-10.0},{10.0,10.0}})));
        protected
          Integer pos;
        algorithm
          pos := 1;
          for i1 in 1:dims[1] loop
            y[i1] := u[pos];
            pos := pos + 1;
          end for;
        end _V2A_1D_Real;

      end ArrayConverter;
      model topsis_with_weights_and_average
        extends PythonIO.Communication.PythonSampleBase;
        extends Interpreter;
        import Modelica;
        import PythonIO.Communication.PythonFunction;
        annotation(Icon(coordinateSystem(extent={{-100.0, -100.0}, {100.0, 100.0}},grid={2.0, 2.0}),graphics={Rectangle(origin = {0.0, 0.0}, lineColor = {200, 200, 200}, fillColor = {248, 248, 248}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 25.0), Rectangle(origin = {0.0, 0.0}, lineColor = {128, 128, 128}, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 25.0), Ellipse(origin = {0.0, 0.0}, lineColor = {128, 128, 128}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-30.0, -30.0}, {30.0, 30.0}}), Rectangle(origin = {0.0, 0.0}, fillColor = {239, 239, 239}, fillPattern = FillPattern.Solid, lineThickness = 1.25, extent = {{-100.0, 100.0}, {100.0, -100.0}}), Text(origin = {0.0, 130.0}, lineColor = {0, 0, 255}, extent = {{-150.0, 20.0}, {150.0, -20.0}}, textString = "%name", textColor = {0, 0, 255}), Bitmap(origin = {-0.7500000000000071, 3.75}, extent = {{-89.25, -86.25}, {89.25, 86.25}}, fileName = "modelica://PythonIO/Resources/Images/PythonFunction.svg")}));
        PythonIO.Communication.PythonFunction.PythonFunctionBase base(inputDims={{4}},inputTypes={0},hasInput=true,period=period,outputDims={{20}},outputTypes={0},hasOutput=true,pythonPath=pythonEnvPath,pythonFilePath="C:/Users/23021/Desktop/mworks_digital",functionName="topsis_with_weights_and_average",moduleName="h_choose_numap") 
        annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={0.0, 0.0})));
        Modelica.Blocks.Interfaces.RealOutput output1[20] 
        annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={110, 0})));
        ArrayConverter._V2A_1D_Real out_output1_converter(dims={20}) 
        annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={80, 0})));
        Modelica.Blocks.Interfaces.RealInput new_variables[4] 
        annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={-110, 0})));
        ArrayConverter._A2V_1D_Real in_new_variables_converter(dims={4}) 
        annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={-80, 0})));
      equation
        connect(out_output1_converter.y, output1) 
        annotation(Line(origin={0,0}, 
        points={{110,0},{80,0}}, 
        color={255,0,0}));
        connect(base.outputs[1:20], out_output1_converter.u) 
        annotation(Line(origin={0,0}, 
        points={{0,0},{80,0}}, 
        color={255,0,0}));
        connect(new_variables, in_new_variables_converter.u) 
        annotation(Line(origin={0,0}, 
        points={{110,0},{80,0}}, 
        color={255,0,0}));
        connect(in_new_variables_converter.y, base.inputs[1:4]) 
        annotation(Line(origin={0,0}, 
        points={{80,0},{0,0}}, 
        color={255,0,0}));

      end topsis_with_weights_and_average;
      function UseConstructorWindowspython37 
        "Construct an external Function that can be used to store a Python Function - Windows"
      extends PythonIO.Communication.PythonFunction.constructor;
      external "C" initPythonMemory() 
      annotation(Library = { "python_io_python37", "" }, 
      LibraryDirectory ="modelica://PythonIO/Resources/Library");
      annotation(Documentation);
      end UseConstructorWindowspython37;
      function FunctionUseExchangeDataWindowspython37 
        "Function that communicates with Python"
      extends PythonIO.Communication.PythonFunction.exchangeData;
      external "C" stepFunction(pythonPath, pythonFilePath, moduleName, functionName, 
      inputs, inputs_int, inputs_str, inputDims, 
      inputTypes, 
      size(inputDims, 1), size(inputDims, 2), 
      outputDims, outputTypes, 
      size(outputDims, 1), size(outputDims, 2), 
      outputs, outputs_int, 
      hasInput, hasOutput) 
      annotation(Library = { "python_io_python37", "" }, 
      LibraryDirectory ="modelica://PythonIO/Resources/Library", 
      IncludeDirectory ="modelica://PythonIO/Resources/C-Sources", 
      Include = "#include \"pythonWrapper.c\"");
      end FunctionUseExchangeDataWindowspython37;
      function ObjectUseExchangeDataWindowspython37 
        "Function that communicates with Python"
      extends PythonIO.Communication.PythonObject.exchangeData;
      external "C" stepImpl(pythonPath, pythonFilePath, moduleName, className, 
      inputs, inputs_int, inputs_str, inputDims, 
      inputTypes, 
      size(inputDims, 1), size(inputDims, 2), 
      outputDims, outputTypes, 
      size(outputDims, 1), size(outputDims, 2), 
      outputs, outputs_int, 
      hasInput, hasOutput) 
      annotation(Library = { "python_io_python37", "" }, 
      LibraryDirectory ="modelica://PythonIO/Resources/Library", 
      IncludeDirectory ="modelica://PythonIO/Resources/C-Sources", 
      Include = "#include \"pythonWrapper.c\"");
      end ObjectUseExchangeDataWindowspython37;
      function UseDestructorWindowspython37 
        "Release memory"
      extends PythonIO.Communication.PythonFunction.destructor;
      external "C" freePythonMemory() 
      annotation(Library = { "python_io_python37", "" }, 
      LibraryDirectory ="modelica://PythonIO/Resources/Library");
      annotation(Documentation);
      end UseDestructorWindowspython37;

    end ImportedTypes;
  equation
    connect(step.y, py_h3_1.pin) 
    annotation(Line(origin={12,19}, 
points={{-31,19},{7,19},{7,-16}}, 
color={0,0,127}));
    connect(step2.y, py_h3_1.g) 
    annotation(Line(origin={12,-8}, 
points={{-31,-14},{7,-14},{7,7}}, 
color={0,0,127}));
    connect(continuousClock.y, py_h3_1.t) 
    annotation(Line(origin={0,-39}, 
    points={{-19,-33},{19,-33},{19,33}}, 
    color={0,0,127}));
    connect(continuousClock1.y, add.u1) 
    annotation(Line(origin={-78,-24}, 
    points={{-5,2},{4,2},{4,-2}}, 
    color={0,0,127}));
    connect(step3.y, add.u2) 
    annotation(Line(origin={-78,-43}, 
    points={{-5,-5},{4,-5},{4,5}}, 
    color={0,0,127}));
    connect(add.y, py_h3_1.q) 
    annotation(Line(origin={-16,-17}, 
    points={{-35,-15},{35,-15},{35,14}}, 
    color={0,0,127}));
    connect(continuousClock2.y, add1.u1) 
    annotation(Line(origin={-88,26}, 
points={{-5,2},{4,2},{4,-2}}, 
color={0,0,127}));
    connect(step1.y, add1.u2) 
    annotation(Line(origin={-87,9}, 
points={{-4,-3},{3,-3},{3,3}}, 
color={0,0,127}));
    connect(add1.y, py_h3_1.tin) 
    annotation(Line(origin={-21,15}, 
points={{-40,3},{40,3},{40,-14}}, 
color={0,0,127}));
    end pytest;
  model PythonFunctionBase
    import Modelica;
    import PythonIO.Communication.PythonFunction;
    replaceable function FuncConstructor = PythonIO.Communication.PythonFunction.constructor;
    replaceable function FuncExchangeData = PythonIO.Communication.PythonFunction.exchangeData;
    replaceable function FuncDestructor = PythonIO.Communication.PythonFunction.destructor;
    annotation(choicesAllMatching=true);

    parameter Integer inputDims[:,:] = {{0}} "dimension of each input variable" annotation (Dialog(enable = false));
    parameter Integer outputDims[:,:] = {{0}} "dimension of each output variable" annotation (Dialog(enable = false));
    parameter Integer inputTypes[size(inputDims, 1)] = {0} "type of each input variable, 0 for Real, 1 for Int, 2 for Boolean, 3 for PythonObject" annotation (Dialog(enable = false));
    parameter Integer outputTypes[size(outputDims, 1)] = {0} "type of each output variable, 0 for Real, 1 for Int, 2 for Boolean, 3 for PythonObject" annotation (Dialog(enable = false));
    String pythonPath = "" "The folder path which contains python.exe";
    parameter String pythonFilePath = "" "The folder path which contains python file";
    parameter String functionName = "" "The func name needed to be called in python file";
    parameter String moduleName = "" "The python file name";
    parameter Real startTime = 0;
    parameter Real period = 0;

    parameter Boolean hasInput = true annotation (Dialog(enable = false));
    parameter Boolean hasOutput = true annotation (Dialog(enable = false));

    String inputs_str[PythonFunction.CalcStrPortNumber(inputDims, inputTypes, hasInput)] "input String";

    Modelica.Blocks.Interfaces.RealInput inputs[PythonFunction.CalcRealPortNumber(inputDims, inputTypes, hasInput)] "input variables" 
      annotation (Placement(transformation(origin = {-120.83895131086143, 59.7777777777778}, 
        extent = {{-20.0, -20.0}, {20.0, 20.0}})));
    Modelica.Blocks.Interfaces.IntegerInput inputs_int[PythonFunction.CalcIntPortNumber(inputDims, inputTypes, hasInput)] "input int variables(python object type)" 
      annotation (Placement(transformation(origin = {-120.83895131086143, -59.73475624089137}, 
        extent = {{-20.0, -20.0}, {20.0, 20.0}})));
    Modelica.Blocks.Interfaces.RealOutput outputs[PythonFunction.CalcRealPortNumber(outputDims, outputTypes, hasOutput)] "output variables" 
      annotation (Placement(transformation(origin = {110.0, 59.7777777777778}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
    Modelica.Blocks.Interfaces.IntegerOutput outputs_int[PythonFunction.CalcIntPortNumber(outputDims, outputTypes, hasOutput)] "output int variables(python object type)" 
      annotation (Placement(transformation(origin = {110.0, -59.73475624089137}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  algorithm
    when initial() then

      FuncConstructor();
    end when;
    when sample(startTime, period) then

      (outputs,outputs_int) := FuncExchangeData(pythonPath, pythonFilePath, moduleName, functionName, inputs, inputs_int, inputs_str, inputDims, inputTypes, outputDims, outputTypes, hasInput, hasOutput);
    end when;
    when terminal() then
      FuncDestructor();
    end when;
    annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0})), 
      Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
        preserveAspectRatio = false, 
        grid = {2.0, 2.0}), graphics = {Text(origin = {0.0, 130.0}, 
        lineColor = {0, 0, 255}, 
        extent = {{-150.0, 20.0}, {150.0, -20.0}}, 
        textString = "%name", 
        textColor = {0, 0, 255}), Rectangle(origin = {0.0, 0.0}, 
        lineColor = {200, 200, 200}, 
        fillColor = {248, 248, 248}, 
        fillPattern = FillPattern.HorizontalCylinder, 
        extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
        radius = 25.0), Rectangle(origin = {0.0, 0.0}, 
        lineColor = {128, 128, 128}, 
        extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
        radius = 25.0), Ellipse(origin = {0.0, 0.0}, 
        lineColor = {128, 128, 128}, 
        fillColor = {255, 255, 255}, 
        fillPattern = FillPattern.Solid, 
        extent = {{-30.0, -30.0}, {30.0, 30.0}})}));
  end PythonFunctionBase;
  model h_t
    PythonFunctionBase pythonFunctionBase 
      annotation (Placement(transformation(origin={0,0}, 
extent={{-10,-10},{10,10}})));
    annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, 
    grid={2,2})));
  equation
    end h_t;

end SCO2_loop;