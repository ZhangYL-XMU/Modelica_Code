within SFR.Stirling.MechanicalGas;
model Stirling_test
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true, n(
        displayUnit="1") = {1,0,0}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-26,-20})));
  inner Modelica.Mechanics.MultiBody.World world 
    annotation (Placement(transformation(extent={{-80,38},{-60,58}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=2) 
    annotation (Placement(transformation(extent={{-64,-74},{-44,-54}})));
  Stirling stirling(crankAngleOffset=-1.5707963267949,cylinderInclinationAngle1(displayUnit="deg")=0.785398163397448,crankAngleOffset1=-1.5707963267949) 
    annotation (Placement(transformation(origin={120,32},
extent={{-52,-26},{52,26}})));
  Modelica.Blocks.Sources.Ramp ramp(

    duration=0,
    offset=273.15+440,height=0,startTime=0)   annotation (Placement(transformation(origin={20,120},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant const1(k=273.15+50) annotation (Placement(transformation(origin={194,120},
extent={{10,-10},{-10,10}})));
  equation
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
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {200,100}})), Diagram(coordinateSystem(extent={{-100,-100},{200,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.01,StartTime=0,StopTime=10,StoreEventValue=0,Tolerance=0.0001),__MWORKS(ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=10,ContinueTimeVector)));
  connect(const1.y, stirling.Cold) 
  annotation(Line(origin={157,96},
points={{26,24},{-25.73,24},{-25.73,-33.873}},
color={0,0,127}));
  connect(ramp.y, stirling.Hot) 
  annotation(Line(origin={68,98},
points={{-37,22},{37.1711,22},{37.1711,-35.873}},
color={0,0,127}));
  end Stirling_test;