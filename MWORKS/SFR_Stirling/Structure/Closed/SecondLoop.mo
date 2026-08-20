within SFR.Structure.Closed;
model SecondLoop
  annotation(__MWORKS(version="26.1.3",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=10,ContinueTimeVector)),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.001,StartTime=0,StopTime=10,StoreEventValue=0,Tolerance=0.0001));
  Thermal.HeatExchange.HE1 hE1_1() 
    annotation(Placement(transformation(origin={-158,22},
extent={{10,-10},{-10,10}},
rotation=-90)));
  TRANSFORM.Fluid.Machines.Pump_SimpleMassFlow pump2(m_flow_nominal=280.6, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation(Placement(transformation(origin={-110,66},
extent={{10,-10},{-10,10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary1(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, p=100000.0) 
    annotation(Placement(transformation(origin={-178,-52},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary4(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, m_flow=8.0, T(displayUnit="degC")=823.15) 
    annotation(Placement(transformation(origin={-190,-4},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, T=713.15, p=100000.0) 
    annotation(Placement(transformation(origin={-194,60},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = 15) annotation(Placement(transformation(origin={134,-42},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed_ground annotation(Placement(transformation(origin={22,-80},
extent={{-10,-10},{10,10}})));
  Stirling.DoubleActing.DA_Engine dA_Engine(TA(start=773.15),TB(start=673.15)) 
    annotation(Placement(transformation(origin={-30,22},
extent={{-30.5,-29},{30.5,29}},
rotation=90)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=2,w(start=100),phi(start=0)) 
    annotation(Placement(transformation(origin={63.6,-42},
extent={{10,-10},{-10,10}})));
  inner Modelica.Mechanics.MultiBody.World world 
    annotation(Placement(transformation(origin={-90,-58},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true, n(
        displayUnit="1") = {1,0,0}) annotation(Placement(transformation(origin={-6.8,-48},
extent={{-10,-10},{10,10}},
rotation=-90)));
  equation
  connect(pump2.port_b, hE1_1.tube_in) 
  annotation(Line(origin={0,0},
points={{-120,66},{-152.00181,66},{-152.00181,32.2}}));
  connect(boundary1.ports[1], hE1_1.tube_out) 
  annotation(Line(origin={0,0},
points={{-168,-52},{-152.00181,-52},{-152.00181,11.8}}));
  connect(boundary4.ports[1], hE1_1.shell_in) 
  annotation(Line(origin={0,0},
points={{-180,-4},{-164.20181,-4},{-164.20181,11.8}}));
  connect(hE1_1.shell_out, boundary.ports[1]) 
  annotation(Line(origin={0,0},
points={{-164.20181,32.2},{-164.20181,60},{-184,60}}));
  connect(world.frame_b, revolute.frame_b) 
  annotation(Line(origin={0,0},
points={{-80,-58},{-24.3,-58},{-24.3,-61.6},{-6.8,-61.6},{-6.8,-58}}));
  connect(inertia.flange_b, revolute.axis) 
  annotation(Line(origin={0,0},
points={{53.6,-42},{6.2,-42},{6.2,-48},{3.2,-48}}));
  connect(dA_Engine.cylinder_a1, revolute.frame_a) 
  annotation(Line(origin={0,0},
points={{-6.8,-8.5},{-6.8,-38}}));
  connect(damper.flange_b, fixed_ground.flange) 
  annotation(Line(origin={0,0},
points={{144,-42},{147,-42},{147,-80},{22,-80}}));
  connect(damper.flange_a, inertia.flange_a) 
  annotation(Line(origin={0,0},
points={{124,-42},{73.6,-42}}));
  connect(dA_Engine.cylinder_a, world.frame_b) 
  annotation(Line(origin={0,0},
points={{-47.4,-8.5},{-47.4,-58},{-80,-58}}));
  connect(dA_Engine.cold_Na, pump2.port_a) 
  annotation(Line(origin={0,0},
points={{-59.58,37.25},{-97,37.25},{-97,66},{-100,66}}));
  connect(dA_Engine.hot_Na, hE1_1.tube_out) 
  annotation(Line(origin={0,0},
points={{-59.58,6.75},{-152.00181,6.75},{-152.00181,11.8}}));
  end SecondLoop;
