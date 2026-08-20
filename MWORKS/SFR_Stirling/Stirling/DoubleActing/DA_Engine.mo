within SFR.Stirling.DoubleActing;
model DA_Engine
  annotation(__MWORKS(version="26.1.3"),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})));
  replaceable package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium;
  import Modelica.Units.SI;

  parameter SI.Angle cylinderInclinationAngle=0;
  parameter SI.Angle crankAngleOffset=0;
  parameter Real heff = 1 "传热效率";
  SI.Power power;
  SI.SpecificEnthalpy hA(start = 506655)  "二回路钠进口焓";
  SI.SpecificEnthalpy hB(start = 468500)  "二回路钠出口焓";
  SI.Temperature TA ;
  SI.Temperature TB ;
  SI.MassFraction X[1];

  DA_Cylinder cyl1(crankAngleOffset = crankAngleOffset,cylinderInclinationAngle=cylinderInclinationAngle) annotation(Placement(transformation(origin={-55,-27},
extent={{-15,-21},{15,21}})));
  DA_Cylinder cyl2(crankAngleOffset = crankAngleOffset+Modelica.Constants.pi/2,cylinderInclinationAngle=cylinderInclinationAngle) annotation(Placement(transformation(origin={-18,-27},
extent={{-15,-21},{15,21}})));
  DA_Cylinder cyl3(crankAngleOffset = crankAngleOffset + Modelica.Constants.pi,cylinderInclinationAngle=cylinderInclinationAngle) annotation(Placement(transformation(origin={19,-27},
extent={{-15,-21},{15,21}})));
  DA_Cylinder cyl4(crankAngleOffset = crankAngleOffset + 3*Modelica.Constants.pi/2,cylinderInclinationAngle=cylinderInclinationAngle) annotation(Placement(transformation(origin={56,-27},
extent={{-15,-21},{15,21}})));
  Gas_Dynamic.DA_Gas_Dynamic_Tian dA_Gas_Dynamic_Tian 
    annotation (Placement(transformation(origin={104,-22},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant const1(k=50+273.15) 
    annotation (Placement(transformation(origin={140,22},
extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=TA) 
    annotation (Placement(transformation(origin={72,30},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Interfaces.FluidPort_a hot_Na(h_outflow = inStream(hot_Na.h_outflow),m_flow(start = 280.6)) 
    annotation (Placement(transformation(origin={-40,100},
extent={{-10,-10},{10,10}}),
iconTransformation(origin={-50,102},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b cold_Na(h_outflow = hB,m_flow(start = -280.6)) 
    annotation (Placement(transformation(origin={51,100},
extent={{-10,-10},{10,10}}),
iconTransformation(origin={50,102},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_a 
    annotation (Placement(transformation(origin={-82.54,-13.56},
extent={{-5.54,-5.54},{5.54,5.54}}),
iconTransformation(origin={-100,60},
extent={{-16,-16},{16,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_a1 
    annotation (Placement(transformation(origin={-82.54,-37.08},
extent={{-5.54,-5.54},{5.54,5.54}}),
iconTransformation(origin={-100,-80},
extent={{-16,-16},{16,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a 
    annotation (Placement(transformation(origin={80,-13.56},
extent={{-8,-8},{8,8}}),
iconTransformation(origin={99,59},
extent={{-15,-15},{15,15}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1 
    annotation (Placement(transformation(origin={80,-37.08},
extent={{-8,-8},{8,8}}),
iconTransformation(origin={100,-80},
extent={{-16,-16},{16,16}})));
  equation
  power = dA_Gas_Dynamic_Tian.power * 4 * 10;
  hA = inStream(hot_Na.h_outflow);
  hA * hot_Na.m_flow = hB * hot_Na.m_flow + 4 * 10 * dA_Gas_Dynamic_Tian.Q_in / heff ;
  hot_Na.m_flow + cold_Na.m_flow = 0;
  hot_Na.p = cold_Na.p;

  TA = Medium.temperature_phX(hot_Na.p,hA,X);
  TB = Medium.temperature_phX(cold_Na.p,hB,X);
  X = {1.0};

  connect(cyl1.cylinder_b, cyl2.cylinder_a) 
  annotation(Line(origin={-2,108},
points={{-41,-121.56},{-28.3,-121.56}},
color={0,0,127}));
  connect(cyl2.cylinder_b, cyl3.cylinder_a) 
  annotation(Line(origin={-2,108},
points={{-4,-121.56},{8.7,-121.56}},
color={0,0,127}));
  connect(cyl3.cylinder_b, cyl4.cylinder_a) 
  annotation(Line(origin={-2,108},
points={{33,-121.56},{45.7,-121.56}},
color={0,0,127}));
  connect(cyl1.crank_b, cyl2.crank_a) 
  annotation(Line(origin={-2,108},
points={{-41,-145.08},{-28,-145.08}},
color={0,0,127}));
  connect(cyl2.crank_b, cyl3.crank_a) 
  annotation(Line(origin={-2,108},
points={{-4,-145.08},{9,-145.08}},
color={0,0,127}));
  connect(cyl3.crank_b, cyl4.crank_a) 
  annotation(Line(origin={-2,108},
points={{33,-145.08},{46,-145.08}},
color={0,0,127}));
  connect(cyl1.s_out, dA_Gas_Dynamic_Tian.s[1]) 
  annotation(Line(origin={18,-2},
points={{-73,-1.9},{-73,20},{69.8,20},{69.8,-19.4},{73.8,-19.4}},
color={0,0,127}));
  connect(cyl2.s_out, dA_Gas_Dynamic_Tian.s[2]) 
  annotation(Line(origin={37,-11},
points={{-55,7.1},{-55,29},{50.8,29},{50.8,-10.4},{54.8,-10.4}},
color={0,0,127}));
  connect(cyl3.s_out, dA_Gas_Dynamic_Tian.s[3]) 
  annotation(Line(origin={55,-5},
points={{-36,1.1},{-36,23},{32.8,23},{32.8,-16.4},{36.8,-16.4}},
color={0,0,127}));
  connect(cyl4.s_out, dA_Gas_Dynamic_Tian.s[4]) 
  annotation(Line(origin={74,-1},
points={{-18,-2.9},{-18,19},{13.8,19},{13.8,-20.4},{17.8,-20.4}},
color={0,0,127}));
  connect(dA_Gas_Dynamic_Tian.f[1], cyl1.f_mt) 
  annotation(Line(origin={47,-46},
points={{69,24},{87,24},{87,-24},{-102,-24},{-102,-4.1}},
color={0,0,127}));
  connect(cyl2.f_mt, dA_Gas_Dynamic_Tian.f[2]) 
  annotation(Line(origin={51,-45},
points={{-69,-5.1},{-69,-25},{83,-25},{83,23},{65,23}},
color={0,0,127}));
  connect(cyl3.f_mt, dA_Gas_Dynamic_Tian.f[3]) 
  annotation(Line(origin={70,-38},
points={{-51,-12.1},{-51,-32},{64,-32},{64,16},{46,16}},
color={0,0,127}));
  connect(cyl4.f_mt, dA_Gas_Dynamic_Tian.f[4]) 
  annotation(Line(origin={88,-38},
points={{-32,-12.1},{-32,-32},{46,-32},{46,16},{28,16}},
color={0,0,127}));
  connect(const1.y, dA_Gas_Dynamic_Tian.T_water) 
  annotation(Line(origin={110,26},
points={{19,-4},{-2,-4},{-2,-36}},
color={0,0,127}));
  connect(realExpression.y, dA_Gas_Dynamic_Tian.T_na) 
  annotation(Line(origin={93,18},
points={{-10,12},{7,12},{7,-28}},
color={0,0,127}));
  connect(cylinder_a, cyl1.cylinder_a) 
  annotation(Line(origin={-84,23},
points={{1.46,-36.56},{16.7,-36.56}},
color={95,95,95},
thickness=0.5));
  connect(cylinder_a1, cyl1.crank_a) 
  annotation(Line(origin={-83,-59},
points={{0.46,21.92},{16,21.92}},
color={95,95,95},
thickness=0.5));
  connect(cyl4.crank_b, frame_a1) 
  annotation(Line(origin={84,-59},
points={{-16,21.92},{-4,21.92}},
color={95,95,95},
thickness=0.5));
  connect(frame_a, cyl4.cylinder_b) 
  annotation(Line(origin={84,23},
points={{-4,-36.56},{-16,-36.56}},
color={95,95,95},
thickness=0.5),__MWORKS(BlockSystem(NamedSignal)));
  end DA_Engine;