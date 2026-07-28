within SFR.Stirling.StirlingEngine;
model Engine_V2
  import Modelica.Units.SI;
  annotation(Diagram(coordinateSystem(extent={{-142,-100},{140,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.001,StartTime=0,StopTime=10,StoreEventValue=0,Tolerance=0.0001),Icon(coordinateSystem(extent={{-140,-100},{140,100}},
grid={2,2})));
  replaceable package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium;

  parameter SI.Angle cylinderInclinationAngle=0;
  parameter SI.Angle crankAngleOffset=0;
  parameter SI.Angle cylinderInclinationAngle1=0;
  parameter SI.Angle crankAngleOffset1=0.785398163397448;
  parameter Real heff = 1 "传热效率";
  SI.Power power;
  SI.SpecificEnthalpy hA ;
  SI.SpecificEnthalpy hB ;
  SI.Temperature TA ;
  SI.Temperature TB ;
  SI.MassFraction X[1];

  MechanicalGas.Stirling stirling(cylinderInclinationAngle(displayUnit="deg"),crankAngleOffset(displayUnit="deg"),cylinderInclinationAngle1(displayUnit="deg"),crankAngleOffset1(displayUnit="deg")) 
    annotation (Placement(transformation(origin={-62,-8.2},
extent={{-52,-26},{52,26}})));
  MechanicalGas.Stirling stirling1(cylinderInclinationAngle(displayUnit="deg"),crankAngleOffset(displayUnit="deg"),cylinderInclinationAngle1(displayUnit="deg"),crankAngleOffset1(displayUnit="deg")) 
    annotation (Placement(transformation(origin={68,-8},
extent={{-52,-26},{52,26}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_a 
    annotation (Placement(transformation(origin={-142,48},
extent={{-16,-16},{16,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_a1 
    annotation (Placement(transformation(origin={-142,-62},
extent={{-16,-16},{16,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a 
    annotation (Placement(transformation(origin={140,48},
extent={{-16,-16},{16,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1 
    annotation (Placement(transformation(origin={140,-62},
extent={{-16,-16},{16,16}})));
  TYThermoFluidSys.Blocks.RealExpression realExpression1(y=TA) 
    annotation (Placement(transformation(origin={-104,48},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Interfaces.FluidPort_a hot(h_outflow = inStream(hot.h_outflow)) 
    annotation (Placement(transformation(origin={-84,98},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b cold(h_outflow = inStream(cold.h_outflow)) 
    annotation (Placement(transformation(origin={80.0608,98},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Blocks.RealExpression realExpression2(y=273.15+50) 
    annotation (Placement(transformation(origin={-12,66},
extent={{-10,-10},{10,10}})));
  equation
  power = stirling.power + stirling1.power"单台4缸斯特林机功率";
  hA = inStream(hot.h_outflow);
  hA * hot.m_flow = hB * hot.m_flow + power / heff * 4 * 10;
  hot.m_flow + cold.m_flow = 0;
  hot.p = cold.p;

  TA = Medium.temperature_phX(hot.p,hA,X);
  TB = Medium.temperature_phX(cold.p,hB,X);
  X = {1.0};



  connect(stirling.cylinder_b1, stirling1.cylinder_a) 
  annotation(Line(origin={3,3.8},
points={{-16.9544,9.04762},{16.1635,9.04762},{16.1635,8.83492}},
color={95,95,95},
thickness=0.5));
  connect(stirling.crank_b1, stirling1.crank_a) 
  annotation(Line(origin={3,-16.2},
points={{-17.3498,-12.6349},{16.1635,-12.6349},{16.1635,-12.4349}},
color={95,95,95},
thickness=0.5));
  connect(cylinder_a, stirling.cylinder_a) 
  annotation(Line(origin={-143,18},
points={{1,30},{1,-5.56508},{32.1635,-5.56508}},
color={95,95,95},
thickness=0.5));
  connect(stirling.crank_a, cylinder_a1) 
  annotation(Line(origin={-126,-29},
points={{15.1635,0.165079},{-16,0.165079},{-16,-33}},
color={95,95,95},
thickness=0.5));
  connect(stirling1.cylinder_b1, frame_a) 
  annotation(Line(origin={128,13},
points={{-11.9544,0.047619},{12,0.047619},{12,35}},
color={95,95,95},
thickness=0.5));
  connect(stirling1.crank_b1, frame_a1) 
  annotation(Line(origin={128,-29},
points={{-12.3498,0.365079},{12,0.365079},{12,-33}},
color={95,95,95},
thickness=0.5));
  connect(realExpression1.y, stirling.Hot) 
  annotation(Line(origin={-85,49},
points={{-8,-1},{8.1711,-1},{8.1711,-27.073}},
color={0,0,127}));
  connect(stirling1.Hot, realExpression1.y) 
  annotation(Line(origin={-20,35},
  points={{73.1711,-12.873},{73.1711,13},{-73,13}},
  color={0,0,127}));
  connect(stirling1.Cold, realExpression2.y) 
  annotation(Line(origin={63,45},
points={{16.27,-22.873},{16.27,21},{-64,21}},
color={0,0,127}));
  connect(stirling.Cold, realExpression2.y) 
  annotation(Line(origin={-19,44},
points={{-31.73,-22.073},{-31.73,-15.946},{31,-15.946},{31,22},{18,22}},
color={0,0,127}));
  end Engine_V2;