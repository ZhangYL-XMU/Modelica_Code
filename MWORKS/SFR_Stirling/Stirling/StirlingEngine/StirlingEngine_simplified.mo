within SFR.Stirling.StirlingEngine;
model StirlingEngine_simplified
  import Modelica.Units.SI;
  replaceable package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium;
  //液体参数
  parameter SI.Angle cylinderInclinationAngle=0;
  parameter SI.Angle crankAngleOffset=0;
  parameter SI.Angle cylinderInclinationAngle1=0;
  parameter SI.Angle crankAngleOffset1=0.785398163397448;
  parameter Real heff = 1 "传热效率";
  SI.Power Power;
  SI.SpecificEnthalpy hA ;
  SI.SpecificEnthalpy hB ;
  SI.Temperature TA ;
  SI.Temperature TB ;
  SI.MassFraction X[1];

  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true, n(
        displayUnit="1") = {1,0,0}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-26,-20})));
  inner Modelica.Mechanics.MultiBody.World world 
    annotation (Placement(transformation(extent={{-80,38},{-60,58}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=2) 
    annotation (Placement(transformation(extent={{-64,-74},{-44,-54}})));
  MechanicalGas.Stirling stirling(crankAngleOffset=-1.5707963267949,cylinderInclinationAngle1(displayUnit="deg")=0.785398163397448,crankAngleOffset1=-1.5707963267949,animation=false) 
    annotation (Placement(transformation(origin={120,32},
  extent={{-52,-26},{52,26}})));
  TYThermoFluidSys.Blocks.RealExpression hot_T(y=TA) 
    annotation (Placement(transformation(origin={52,92},
  extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a(
     redeclare package Medium = Medium,
     h_outflow = inStream(port_a.h_outflow)
    ) 
    annotation (Placement(transformation(origin={52,126},
  extent={{-10,-10},{10,10}}),
  iconTransformation(origin={-102,2},
  extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(
    redeclare package Medium = Medium) 
    annotation (Placement(transformation(origin={176,126},
  extent={{-10,-10},{10,10}}),
  iconTransformation(origin={202,2},
  extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant cold_T(k=273.15+50) annotation (Placement(transformation(origin={176,92},
  extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Interfaces.RealOutput power 
    annotation (Placement(transformation(origin={194,-24},
  extent={{-10,-10},{10,10}}),
  iconTransformation(origin={50,-110},
  extent={{-10,-10},{10,10}},
  rotation=-90)));
equation
  X = {1};
  //边界条件
  hA = inStream(port_a.h_outflow);
  hB = port_b.h_outflow;
  port_a.Xi_outflow = inStream(port_b.Xi_outflow);
  port_b.Xi_outflow = inStream(port_a.Xi_outflow);
  port_a.C_outflow = inStream(port_b.C_outflow);
  port_b.C_outflow = inStream(port_a.C_outflow);
  //温度计算
  TA = Medium.temperature_phX(p,hA,X);
  TB = Medium.temperature_phX(p,hB,X);
  //能量守恒
  P = power * 8 * 10;
  hA * m_flow = hB * m_flow + P;
  //质量守恒
  port_a.m_flow + port_b.m_flow = 0;
  port_a.m_flow = m_flow;
  //动量守恒
  port_a.p = port_b.p;
  port_a.p = p;

  connect(world.frame_b, revolute.frame_b) annotation (Line(
      points={{-60,48},{-52,48},{-52,-20},{-36,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(inertia.flange_b, revolute.axis) 
    annotation (Line(points={{-44,-64},{-26,-64},{-26,-30}}, color={0,0,0}));
  connect(world.frame_b, stirling.cylinder_a) annotation (Line(origin={0,0},
  points={{-60,48},{-17.04,48},{-17.04,57.4902},{68,57.4902}},
  color={95,95,95},
  thickness=0.5));
  connect(revolute.frame_a, stirling.crank_a) annotation (Line(origin={0,0},
  points={{-16,-20},{14.96,-20},{14.96,6.5098},{68,6.5098}},
  color={95,95,95},
  thickness=0.5));
  connect(hot_T.y, stirling.Hot) 
  annotation(Line(origin={85,77},
  points={{-22,15},{20.1711,15},{20.1711,-14.873}},
  color={0,0,127}));
  connect(cold_T.y, stirling.Cold) 
  annotation(Line(origin={148,77},
  points={{17,15},{-16.73,15},{-16.73,-14.873}},
  color={0,0,127}));
  connect(stirling.power, power) 
  annotation(Line(origin={150,-10},
  points={{-43.2471,12.4921},{-43.2471,-12},{34,-12},{34,-14},{44,-14}},
  color={0,0,127}));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {200,100}})), Diagram(coordinateSystem(extent={{-100,-100},{200,100}},
  grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.0001,StartTime=0,StopTime=5,StoreEventValue=0,Tolerance=0.0001),__MWORKS(ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=5,ContinueTimeVector)));
end StirlingEngine_simplified;