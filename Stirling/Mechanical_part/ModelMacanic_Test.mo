within SFR.Stirling.Mechanical_part;
model ModelMacanic_Test
  ModelMechanic_Stirling modelMechanic_Stirling(crankAngleOffset=-0.785398163397448,crankAngleOffset1=-0.785398163397448) 
    annotation (Placement(transformation(origin={-6.2,34},
extent={{-21.8,-10},{21.6,10}})));
  inner Modelica.Mechanics.MultiBody.World world 
    annotation (Placement(transformation(origin={-158,45.8},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(n={1, 0, 0},useAxisFlange=true) 
    annotation (Placement(transformation(origin={-112,-4},
extent={{-10,10},{10,-10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=2) 
    annotation (Placement(transformation(origin={-166,-44},
extent={{-10,-10},{10,10}})));
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
  end ModelMacanic_Test;