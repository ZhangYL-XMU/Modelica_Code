within SFR.Nuclear;
model PID_Test
  annotation(__MWORKS(version="2025b",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=500,ContinueTimeVector)),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.0001,StartTime=0,StopTime=500,StoreEventValue=0,Tolerance=0.0001));
  PointKinetics pointKinetics(Teffref_fuel(displayUnit="K"),Teffref_coolant(displayUnit="K")) 
    annotation (Placement(transformation(origin={-24,-2.5},
extent={{-18,-20.5},{18,20.5}})));
  Modelica.Blocks.Continuous.LimPID PID(controllerType=Modelica.Blocks.Types.SimpleController.PID,yMax=0.021,initType=Modelica.Blocks.Types.Init.SteadyState,withFeedForward=false,k=2,wd=1) 
    annotation (Placement(transformation(origin={-160,11.9013},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Blocks.Constant const(k=36e6) if false 
    annotation (Placement(transformation(origin={-292,-28},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Blocks.Constant const1(k=0) 
    annotation (Placement(transformation(origin={-92,34},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Blocks.Constant const2(k=273.15+500) 
    annotation (Placement(transformation(origin={-92,-60},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Sine sine(offset=823.15,f=0.001,amplitude=30) 
    annotation (Placement(transformation(origin={-92,-7.88125},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Blocks.Constant const3(k=0) 
    annotation (Placement(transformation(origin={-58,62},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Blocks.Ramp ramp(offset=40e6,height=-4e6,duration=100,startTime=200) 
    annotation (Placement(transformation(origin={-208,11.9013},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Gain gain(k=-1) if false 
    annotation (Placement(transformation(origin={-292,42},
extent={{-10,-10},{10,10}})));
  equation
  connect(pointKinetics.Q_total, PID.u_m) 
  annotation(Line(origin={-45,-7},
points={{41.115,18.69625},{49,18.69625},{49,-35},{-115,-35},{-115,6.90125}},
color={0,0,127}));
  connect(const1.y, pointKinetics.Reactivity_Other) 
  annotation(Line(origin={-62,18},
  points={{-19,16},{-12,16},{-12,-15.73375},{18.245,-15.73375}},
  color={0,0,127}));
  connect(const2.y, pointKinetics.Teff_coolant) 
  annotation(Line(origin={-55,-21},
points={{-26,-39},{7.49,-39},{7.49,2.97125},{11.245,2.97125}},
color={0,0,127}));
  connect(const3.y, pointKinetics.Q_in) 
  annotation(Line(origin={-36,41},
  points={{-11,21},{10,21},{10,-20.89875},{11.685,-20.89875}},
  color={0,0,127}));
  connect(pointKinetics.Teff_fuel, sine.y) 
  annotation(Line(origin={-62,-8},
points={{18.245,0.11875},{-19,0.11875}},
color={0,0,127}));
  connect(ramp.y, PID.u_s) 
  annotation(Line(origin={-185,13.0099},
points={{-12,-1.1087},{13,-1.1087}},
color={0,0,127}));
  connect(PID.y, pointKinetics.Reactivity_CR) 
  annotation(Line(origin={-119,12},
points={{-30,-0.09875},{75.245,-0.09875}},
color={0,0,127}));
  end PID_Test;
