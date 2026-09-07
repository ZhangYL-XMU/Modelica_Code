within SFR_Striling.Stirling.DoubleActing.Test;
model Test_Engine_v2
  annotation(__MWORKS(version="26.6.0",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=50,ContinueTimeVector)),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.001,StartTime=0,StopTime=50,StoreEventValue=0,Tolerance=0.0001));
  Modelica.Mechanics.Rotational.Components.Damper damper(d=10.14) annotation(Placement(transformation(origin={-88.5,-120.2},
extent={{10,-10},{-10,10}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed_ground annotation(Placement(transformation(origin={-106.5,-144.2},
extent={{-10,-10},{10,10}})));
  parameter Modelica.Units.SI.AngularVelocity w_start = 100 "初始角速度 [rad/s]";
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=2, phi(start=0, fixed=true), w(start=w_start, fixed=true)) 
    annotation(Placement(transformation(origin={-48.5,-120.2},
extent={{-10,-10},{10,10}})));
  inner Modelica.Mechanics.MultiBody.World world 
    annotation(Placement(transformation(origin={-80.5,-14.8},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true, n(
        displayUnit="1") = {1,0,0}) annotation(Placement(transformation(origin={-28.5,-55.4},
extent={{10,10},{-10,-10}})));
  DA_Engine_v2 Engine 
    annotation (Placement(transformation(origin={53.25,-32.14},
extent={{-30.75,-28.9},{30.75,28.9}})));
  Modelica.Blocks.Sources.Ramp ramp(offset=631755, height=0, startTime=5, duration=10) 
    annotation (Placement(transformation(origin={-126,90.018},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_h boundary(nPorts=1, redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, h=631755, m_flow=308.4, use_h_in=true) 
    annotation(Placement(transformation(origin={-78,90.018},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.Boundary_ph boundary1(nPorts=1, redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, p=9.999999999999999e5, h=506655) 
    annotation(Placement(transformation(origin={104,90},
extent={{10,-10},{-10,10}})));
  Fluid.Pipes.pipe Engine_pipe(redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium,N=5,L_total=5,m_flow_start=100) 
    annotation (Placement(transformation(origin={2,90.018},
extent={{-10,10},{10,-10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow[4] 
    annotation (Placement(transformation(origin={2,60},
extent={{-10,-10},{10,10}},
rotation=90)));
  Modelica.Blocks.Sources.RealExpression realExpression[4](y=- Engine.Q /4) 
    annotation (Placement(transformation(origin={-18,34},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=Engine_pipe.T[1]) 
    annotation (Placement(transformation(origin={26,42},
extent={{-10,-10},{10,10}})));
  equation
  connect(world.frame_b, revolute.frame_b) 
  annotation(Line(origin={-20.5,-80.2},
points={{-50,65.4},{-23.6,65.4},{-23.6,24.8},{-18,24.8}}));
  connect(inertia.flange_b, revolute.axis) 
  annotation(Line(origin={-20.5,-80.2},
points={{-18,-40},{-8,-40},{-8,14.8}}));
  connect(damper.flange_b, fixed_ground.flange) 
  annotation(Line(origin={21.5,-130.2},
points={{-120,10},{-128,10},{-128,-14}},
color={0,0,0}));
  connect(damper.flange_a, inertia.flange_a) 
  annotation(Line(origin={-64.5,-120.2},
points={{-14,0},{6,0}},
color={0,0,0}));
  connect(ramp.y, boundary.h_in) 
  annotation(Line(origin={-100,94.018},
points={{-15,-4},{6,-4},{6,0},{10,0}},
color={0,0,127}));
  connect(world.frame_b, Engine.cylinder_a) 
  annotation(Line(origin={-24,-15},
points={{-46.5,0.2},{46.5,0.2}},
color={95,95,95},
thickness=0.5));
  connect(revolute.frame_a, Engine.cylinder_a1) 
  annotation(Line(origin={2,-55},
points={{-20.5,-0.4},{20.5,-0.4},{20.5,-0.26}},
color={95,95,95},
thickness=0.5));
  connect(realExpression1.y, Engine.T_Na) 
  annotation(Line(origin={43,18},
points={{-6,24},{10.25,24},{10.25,-15.46}},
color={0,0,127}));
  connect(boundary.ports[1], Engine_pipe.portA) 
  annotation(Line(origin={-38,90},
points={{-30,0.018},{30.02226,0.0360755}},
color={0,127,255}));
  connect(Engine_pipe.portB, boundary1.ports[1]) 
  annotation(Line(origin={53,90},
points={{-40.9778,0.0360755},{41,0}},
color={0,127,255}));
  connect(realExpression.y, prescribedHeatFlow.Q_flow) 
  annotation(Line(origin={-26,46},
points={{19,-12},{30,-12},{30,0},{28,0},{28,4}},
color={0,0,127}));
  connect(prescribedHeatFlow.port, Engine_pipe.wall) 
  annotation(Line(origin={2,78},
  points={{0,-8},{0,8.218}},
  color={191,0,0}));
  end Test_Engine_v2;