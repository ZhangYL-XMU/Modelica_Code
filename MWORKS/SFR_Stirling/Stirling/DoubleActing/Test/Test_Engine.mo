within SFR.Stirling.DoubleActing.Test;
model Test_Engine
  annotation(__MWORKS(version="26.1.3",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=50,ContinueTimeVector)),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.001,StartTime=0,StopTime=50,StoreEventValue=0,Tolerance=0.0001));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true, n(
        displayUnit="1") = {1,0,0}) annotation(Placement(transformation(origin={-8,24.8},
extent={{10,10},{-10,-10}})));
  inner Modelica.Mechanics.MultiBody.World world 
    annotation(Placement(transformation(origin={-60,65.4},
extent={{-10,-10},{10,10}})));
  parameter Modelica.Units.SI.AngularVelocity w_start = 100 "初始角速度(同DA_GasMachines; 固定phi/w使机构装配环可解, 否则revolute.phi被撕裂进无解环) [rad/s]";
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=2, phi(start=0, fixed=true), w(start=w_start, fixed=true)) 
    annotation(Placement(transformation(origin={-28,-40},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.Boundary_ph boundary1(nPorts=1, redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, p=9.999999999999999e5, h=506655) 
    annotation(Placement(transformation(origin={182,125.982},
extent={{10,-10},{-10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_h boundary(nPorts=1, redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, h=631755, m_flow=308.4, use_h_in=true) 
    annotation(Placement(transformation(origin={0,126},
extent={{-10,-10},{10,10}})));
  SFR.Stirling.DoubleActing.DA_Engine dA_Engine 
    annotation(Placement(transformation(origin={94.5,48},
extent={{-30.5,-29},{30.5,29}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed_ground annotation(Placement(transformation(origin={-86,-64},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d=15) annotation(Placement(transformation(origin={-68,-40},
extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Sources.Ramp ramp(offset=591755, height=40000, startTime=5, duration=10) 
    annotation (Placement(transformation(origin={-48,126},
extent={{-10,-10},{10,10}})));
  equation
  connect(world.frame_b, revolute.frame_b) 
  annotation(Line(origin={0,0},
points={{-50,65.4},{-23.6,65.4},{-23.6,24.8},{-18,24.8}}));
  connect(inertia.flange_b, revolute.axis) 
  annotation(Line(origin={0,0},
points={{-18,-40},{-8,-40},{-8,14.8}}));
  connect(dA_Engine.cylinder_a, world.frame_b) 
  annotation(Line(origin={0,0},
points={{64,65.4},{-50,65.4}}));
  connect(dA_Engine.cylinder_a1, revolute.frame_a) 
  annotation(Line(origin={0,0},
points={{64,24.8},{2,24.8}}));
  connect(damper.flange_b, fixed_ground.flange) 
  annotation(Line(origin={42,-50},
points={{-120,10},{-128,10},{-128,-14}},
color={0,0,0}));
  connect(damper.flange_a, inertia.flange_a) 
  annotation(Line(origin={-44,-40},
points={{-14,0},{6,0}},
color={0,0,0}));
  connect(ramp.y, boundary.h_in) 
  annotation(Line(origin={-22,130},
points={{-15,-4},{6,-4},{6,0},{10,0}},
color={0,0,127}));
  connect(boundary.ports[1], dA_Engine.hot_Na) 
  annotation(Line(origin={45,102},
  points={{-35,24},{34.25,24},{34.25,-24.42}},
  color={0,127,255}));
  connect(boundary1.ports[1], dA_Engine.cold_Na) 
  annotation(Line(origin={141,102},
  points={{31,23.982},{-31.25,23.982},{-31.25,-24.42}},
  color={0,127,255}));
  end Test_Engine;