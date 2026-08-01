within SFR.Stirling.Mechanical_part;
model ModelMacanic_V8_Test
  ModelMechanic_Stirling modelMechanic_Stirling 
    annotation (Placement(transformation(origin={-6.2,34},
extent={{-21.8,-10},{21.6,10}})));
  inner Modelica.Mechanics.MultiBody.World world 
    annotation (Placement(transformation(origin={-158,45.8},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(n={1, 0, 0},useAxisFlange=true) 
    annotation (Placement(transformation(origin={-112,-4},
extent={{-10,10},{10,-10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=0.5) 
    annotation (Placement(transformation(origin={-166,-44},
extent={{-10,-10},{10,10}})));
  ModelMechanic_Stirling modelMechanic_Stirling1(cylinderInclinationAngle=0.785398163397448,cylinderInclinationAngle1=1.5707963267949,crankAngleOffset=-0.785398163397448,crankAngleOffset1=-0.785398163397448) 
    annotation (Placement(transformation(origin={55.8,34},
extent={{-21.8,-10},{21.6,10}})));
  ModelMechanic_Stirling modelMechanic_Stirling2(cylinderInclinationAngle=1.5707963267949,cylinderInclinationAngle1=2.35619449019234,crankAngleOffset=0,crankAngleOffset1=0) 
    annotation (Placement(transformation(origin={117.8,34},
extent={{-21.8,-10},{21.6,10}})));
  ModelMechanic_Stirling modelMechanic_Stirling3(cylinderInclinationAngle=2.35619449019234,cylinderInclinationAngle1=3.14159265358979,crankAngleOffset=0.785398163397448,crankAngleOffset1=0.785398163397448) 
    annotation (Placement(transformation(origin={179.8,34},
extent={{-21.8,-10},{21.6,10}})));
  ModelMechanic_Stirling modelMechanic_Stirling4(cylinderInclinationAngle=3.14159265358979,cylinderInclinationAngle1=3.92699081698724,crankAngleOffset=1.5707963267949,crankAngleOffset1=1.5707963267949) 
    annotation (Placement(transformation(origin={241.8,34},
extent={{-21.8,-10},{21.6,10}})));
  ModelMechanic_Stirling modelMechanic_Stirling5(cylinderInclinationAngle=3.92699081698724,cylinderInclinationAngle1=4.71238898038469,crankAngleOffset=2.35619449019234,crankAngleOffset1=2.35619449019234) 
    annotation (Placement(transformation(origin={303.8,34},
extent={{-21.8,-10},{21.6,10}})));
  ModelMechanic_Stirling modelMechanic_Stirling6(cylinderInclinationAngle=4.71238898038469,cylinderInclinationAngle1=5.49778714378214,crankAngleOffset=3.14159265358979,crankAngleOffset1=3.14159265358979) 
    annotation (Placement(transformation(origin={365.8,34},
extent={{-21.8,-10},{21.6,10}})));
  ModelMechanic_Stirling modelMechanic_Stirling7(cylinderInclinationAngle=5.49778714378214,cylinderInclinationAngle1=6.28318530717959,crankAngleOffset=3.92699081698724,crankAngleOffset1=3.92699081698724) 
    annotation (Placement(transformation(origin={427.8,34},
extent={{-21.8,-10},{21.6,10}})));
  equation
  connect(world.frame_b, revolute.frame_a) 
  annotation(Line(origin={-135,21},
points={{-13,24.8},{9.4,24.8},{9.4,-25},{13,-25}},
color={95,95,95},
thickness=0.5));
  connect(world.frame_b, modelMechanic_Stirling.cylinder_a) 
  annotation(Line(origin={-87,46},
points={{-61,-0.2},{55.6,-0.2},{55.6,-2.2},{59.2,-2.2}},
color={95,95,95},
thickness=0.5));
  connect(revolute.frame_b, modelMechanic_Stirling.crank_a) 
  annotation(Line(origin={-64,11},
points={{-38,-15},{36.2,-15},{36.2,12.8}},
color={95,95,95},
thickness=0.5));
  connect(inertia.flange_b, revolute.axis) 
  annotation(Line(origin={-134,-29},
  points={{-22,-15},{20,-15},{20,12},{22,12},{22,15}},
  color={0,0,0}));
  annotation(__MWORKS(version="2025b",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=0.5,ContinueTimeVector)),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.0001,StartTime=0,StopTime=5,StoreEventValue=0,Tolerance=0.0001),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})));
  connect(modelMechanic_Stirling.cylinder_b1, modelMechanic_Stirling1.cylinder_a) 
  annotation(Line(origin={25,44},
  points={{-9.6,-0.2},{9.2,-0.2}},
  color={95,95,95},
  thickness=0.5));
  connect(modelMechanic_Stirling.crank_b1, modelMechanic_Stirling1.crank_a) 
  annotation(Line(origin={25,24},
  points={{-9.6,-0.2},{9.2,-0.2}},
  color={95,95,95},
  thickness=0.5));
  connect(modelMechanic_Stirling1.cylinder_b1, modelMechanic_Stirling2.cylinder_a) 
  annotation(Line(origin={87,44},
  points={{-9.6,-0.2},{9.2,-0.2}},
  color={95,95,95},
  thickness=0.5));
  connect(modelMechanic_Stirling1.crank_b1, modelMechanic_Stirling2.crank_a) 
  annotation(Line(origin={87,24},
  points={{-9.6,-0.2},{9.2,-0.2}},
  color={95,95,95},
  thickness=0.5));
  connect(modelMechanic_Stirling2.cylinder_b1, modelMechanic_Stirling3.cylinder_a) 
  annotation(Line(origin={149,44},
  points={{-9.6,-0.2},{9.2,-0.2}},
  color={95,95,95},
  thickness=0.5));
  connect(modelMechanic_Stirling2.crank_b1, modelMechanic_Stirling3.crank_a) 
  annotation(Line(origin={149,24},
  points={{-9.6,-0.2},{9.2,-0.2}},
  color={95,95,95},
  thickness=0.5));
  connect(modelMechanic_Stirling3.cylinder_b1, modelMechanic_Stirling4.cylinder_a) 
  annotation(Line(origin={211,44},
  points={{-9.6,-0.2},{9.2,-0.2}},
  color={95,95,95},
  thickness=0.5));
  connect(modelMechanic_Stirling3.crank_b1, modelMechanic_Stirling4.crank_a) 
  annotation(Line(origin={211,24},
  points={{-9.6,-0.2},{9.2,-0.2}},
  color={95,95,95},
  thickness=0.5));
  connect(modelMechanic_Stirling4.cylinder_b1, modelMechanic_Stirling5.cylinder_a) 
  annotation(Line(origin={273,44},
  points={{-9.6,-0.2},{9.2,-0.2}},
  color={95,95,95},
  thickness=0.5));
  connect(modelMechanic_Stirling4.crank_b1, modelMechanic_Stirling5.crank_a) 
  annotation(Line(origin={273,24},
  points={{-9.6,-0.2},{9.2,-0.2}},
  color={95,95,95},
  thickness=0.5));
  connect(modelMechanic_Stirling5.cylinder_b1, modelMechanic_Stirling6.cylinder_a) 
  annotation(Line(origin={335,44},
  points={{-9.6,-0.2},{9.2,-0.2}},
  color={95,95,95},
  thickness=0.5));
  connect(modelMechanic_Stirling5.crank_b1, modelMechanic_Stirling6.crank_a) 
  annotation(Line(origin={335,24},
points={{-9.6,-0.2},{9.2,-0.2}},
color={95,95,95},
thickness=0.5),__MWORKS(BlockSystem(NamedSignal)));
  connect(modelMechanic_Stirling6.cylinder_b1, modelMechanic_Stirling7.cylinder_a) 
  annotation(Line(origin={397,44},
  points={{-9.6,-0.2},{9.2,-0.2}},
  color={95,95,95},
  thickness=0.5));
  connect(modelMechanic_Stirling6.crank_b1, modelMechanic_Stirling7.crank_a) 
  annotation(Line(origin={397,24},
  points={{-9.6,-0.2},{9.2,-0.2}},
  color={95,95,95},
  thickness=0.5));
  end ModelMacanic_V8_Test;