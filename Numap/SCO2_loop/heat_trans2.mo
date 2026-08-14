model heat_trans2
  inner ThermoHydraulicLib.System.System system "全局设置" annotation (Placement(transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}})));
  ThermoHydraulicLib.Boundaries.FluidBoundaries.PressureBoundary_In pressureBoundary_In(isHidden=system.isHidden,P_set=1.5e5,m_flow_start=166.7,T_set=294.15) 
    "入口压力边界" annotation (Placement(transformation(origin={192,-6}, 
extent={{-6,-6},{6,6}}, 
rotation=180)));
  ThermoHydraulicLib.Boundaries.FluidBoundaries.FlowBoundary_Out fBound(isHidden=system.isHidden,P=1e5,mflow_set=166.7,T=421.15) 
    "出口流量边界" annotation (Placement(transformation(origin={-140,-6}, 
extent={{-6,-6},{6,6}}, 
rotation=180)));
  ThermoHydraulicLib.Boundaries.FluidBoundaries.PressureBoundary_In pressureBoundary_In1(isHidden=system.isHidden,P_set=6.8e6,m_flow_start=230,T_set(displayUnit="degC")=433.15) 
    "入口压力边界" annotation (Placement(transformation(origin={-48,-58}, 
extent={{-6,-6},{6,6}}, 
rotation=360)));
  ThermoHydraulicLib.HeatExchangers.DoublePipeHeatExchanger doublePipeHeatExchanger(isHidden=system.isHidden,D_innertube_inner=2,D_innertube_outer=2.02,D_outertube_inner=3,L=100,P_start_inner=1.5e5,T_start_inner_in=343.15,T_start_outer_in=403.15,T_start_outer_out=343.15,P_start_outer=6.8e6,T_start_inner_out=373.15,m_flow_start_outer=230) 
    "套管式换热器" annotation (Placement(transformation(origin={-48,4}, 
extent={{-30,-16},{30,16}})));
  ThermoHydraulicLib.HeatExchangers.DoublePipeHeatExchanger doublePipeHeatExchanger1(isHidden=system.isHidden,D_innertube_inner=2,D_innertube_outer=2.02,D_outertube_inner=3,L=100,P_start_inner=1.5e5,T_start_inner_in=298.15,T_start_outer_in=343.15,T_start_outer_out=306.15,P_start_outer=6.8e6,T_start_inner_out=343.15,m_flow_start_outer=230) 
    "套管式换热器1" annotation (Placement(transformation(origin={122,4}, 
extent={{-30,-16},{30,16}})));
  ThermoHydraulicLib.Pumps.CentrifugalPump centrifugalPump(isHidden=system.isHidden,Dh_set=2,m_flow_start=166.7,P_start=1e5,pmprfl=1250,pmprho=1000,L_set=3,pmprsp(displayUnit="rpm")=157.07963267949,A_set=3.141,pmprhd=30,pmprtk=50,T=294.15) 
    "离心泵" annotation (Placement(transformation(origin={41,31}, 
extent={{10,-10},{-8,8}})));
  InstrumentControl.Blocks.Sources.Ramp ramp(startTime=0,endTime=30,target=300) 
    "斜坡信号模块" annotation (Placement(transformation(origin={26,68}, 
extent={{-10,-10},{10,10}})));
  ThermoHydraulicLib.Boundaries.FluidBoundaries.PressureBoundary_Out pressureBoundary_Out(isHidden=system.isHidden,P_set=6.799940000000001e6,T_set=306.15,m_flow_start=230) 
    "出口压力边界" annotation (Placement(transformation(origin = {150, 50}, extent = {{-6, -6}, {6, 6}})));
  annotation(__MWORKS(NUMAP(StartTime=0,StopTime=1e100),ContinueSimConfig(SaveContinueFile="true",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=100,ContinueTimeVector)),experiment(NumberOfIntervals=500,StartTime=0,StopTime=10000,Interval=0),Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, 
grid={2,2})));
equation
  connect(pressureBoundary_In1.fluidPortOut, doublePipeHeatExchanger.FluidPortIn1) 
  annotation(Line(origin={-21,-34}, 
points={{-21,-24},{-7,-24},{-7,22}}, 
color={0,127,255}));
  connect(doublePipeHeatExchanger.FluidPortOut1, doublePipeHeatExchanger1.FluidPortIn1) 
  annotation(Line(origin={-5,4}, 
points={{-63,16},{-63,19},{-10,19},{-10,-19},{147,-19},{147,-16}}, 
color={0,127,255}));
  connect(pressureBoundary_In.fluidPortOut, doublePipeHeatExchanger1.FluidPortIn) 
  annotation(Line(origin={169,-1}, 
points={{17,-5},{-14,-5},{-14,5},{-17,5}}, 
color={0,127,255}));
  connect(doublePipeHeatExchanger.FluidPortOut, fBound.fluidPortIn) 
  annotation(Line(origin={-106,-1}, 
  points={{28,5},{-25,5},{-25,-5},{-28,-5}}, 
  color={0,127,255}));
  connect(doublePipeHeatExchanger1.FluidPortOut, centrifugalPump.fluidPortIn) 
  annotation(Line(origin={72,18}, 
  points={{20,-14},{-18,-14},{-18,13},{-21,13}}, 
  color={0,127,255}));
  connect(centrifugalPump.fluidPortOut, doublePipeHeatExchanger.FluidPortIn) 
  annotation(Line(origin={8,22}, 
points={{25,17},{13.5,17},{13.5,12},{2,12},{2,-18},{-26,-18}}, 
color={0,127,255}));
  connect(ramp.y, centrifugalPump.N_sig) 
  annotation(Line(origin={39,54}, 
  points={{-2,14},{2,14},{2,-15}}, 
  color={0,0,127}));
  connect(pressureBoundary_Out.fluidPortIn, doublePipeHeatExchanger1.FluidPortOut1) 
  annotation(Line(origin={123,35}, 
  points={{21,15},{-21,15},{-21,-15}}, 
  color={0,127,255}));
  end heat_trans2;