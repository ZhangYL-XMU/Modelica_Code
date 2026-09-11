model v1
  annotation(__MWORKS(version="26.6.0",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=0.02,ContinueTimeVector)),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.01,StartTime=0,StopTime=120,StoreEventValue=0,Tolerance=0.0001));
  Modelica.Blocks.Math.Gain gain1(k=-1/4) 
    annotation (Placement(transformation(origin={48.75,36.42},
extent={{-10,-10},{10,10}},
rotation=90)));
  Modelica.Blocks.Math.Gain gain(k=1/4) 
    annotation (Placement(transformation(origin={48.75,-69.86},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary4(nPorts=1,redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,m_flow=200,T=273.15 +38) 
    annotation (Placement(transformation(origin={114.768,-25.72},
extent={{-10,-10},{10,10}},
rotation=-90)));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=(water.T[1]+water.T[2]+water.T[3]+water.T[4]) / 4) 
    annotation (Placement(transformation(origin={-39.25,-69.86},
extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1[4] 
    annotation (Placement(transformation(origin={84.75,-69.86},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.Boundary_ph boundary2(nPorts=1, redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, p=9.999999999999999e5, h=506655) 
    annotation(Placement(transformation(origin={114.75,-114},
extent={{10,-10},{-10,10}},
rotation=-90)));
  Fluid.Pipes.pipe water(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, N=5, L_total=0.12, m_flow_start=100, n_pipe=70000, Dh=0.001, CF_HeatTransfer=1, initFromEnthalpy=false, T_start=311.15, T_wall_start=311.15) 
    annotation (Placement(transformation(origin={114.75,-69.86},
extent={{-10,10},{10,-10}},
rotation=-90)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=(Engine_pipe.T[1]+Engine_pipe.T[2]+Engine_pipe.T[3]+Engine_pipe.T[4]) / 4) 
    annotation (Placement(transformation(origin={-53.25,36.42},
extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow[4] 
    annotation (Placement(transformation(origin={-1.25,64.122},
extent={{-10,-10},{10,10}},
rotation=90)));
  Fluid.Pipes.pipe Engine_pipe(redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, N=5, L_total=0.5, m_flow_start=100, n_pipe=3200, Dh=0.004, CF_HeatTransfer=6, initFromEnthalpy=false, T_start=803.15, T_wall_start=803.15) 
    annotation (Placement(transformation(origin={-1.25,91.031},
extent={{-10,10},{10,-10}})));
  SFR_Striling.Stirling.DoubleActing.DA_Engine_v3 Engine(U_h=2.0e4, U_c=4.5e5, U_reg=2.0e6, heff_Na=1.4862, heff_water=1.0) 
    annotation (Placement(transformation(origin={6,-14},
extent={{-30.75,-28.9},{30.75,28.9}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true, n(
        displayUnit="1") = {1,0,0}) annotation(Placement(transformation(origin={-75.75,-37.26},
extent={{10,10},{-10,-10}})));
  inner Modelica.Mechanics.MultiBody.World world 
    annotation(Placement(transformation(origin={-114.75,3.34},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=2, phi(start=0, fixed=true), w(start=100, fixed=true)) 
    annotation(Placement(transformation(origin={-95.75,-102.06},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed_ground annotation(Placement(transformation(origin={-153.75,-126.06},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d=9.9936) annotation(Placement(transformation(origin={-135.75,-102.06},
extent={{10,-10},{-10,10}})));
  Thermal.HeatExchange.HE1 hE1_1(shell(momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)) 
    annotation (Placement(transformation(origin={-153.75,114},
extent={{10,10},{-10,-10}},
rotation=90)));
  TRANSFORM.Fluid.Machines.Pump_SimpleMassFlow pump2(m_flow_nominal=308.4, redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, use_input=false) 
    annotation (Placement(transformation(origin={-71.25,163.049},
extent={{10,-10},{-10,10}})));
  Fluid.Vessels.SpecifiedResistance resistance_toExpTank(redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, R=0.1) 
    annotation(Placement(transformation(origin={33.509,183.049},
extent={{10,-10},{-10,10}},
rotation=-90)));
  Fluid.Vessels.ExpansionTank expansionTank1(redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, A=1, V0=0.001, level_start=1, h_start=506655, p_start=100000.0) 
    annotation(Placement(transformation(origin={33.509,217.049},
extent={{-10,-10},{10,10}})));
  Fluid.Vessels.MixingVolume volumeTube(redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, nPorts_a=1, nPorts_b=1, V=1, h_start=654480 "HE1出口530℃(设计剖面初值)") 
    annotation(Placement(transformation(origin={-67.25,91.049},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(nPorts=1,redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium,m_flow=280.6,T=273.15 +550) 
    annotation (Placement(transformation(origin={-192,152},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.Boundary_ph boundary3(nPorts=1, redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, p=100000, h=506655) 
    annotation(Placement(transformation(origin={-192,91.031},
extent={{10,-10},{-10,10}},
rotation=-180)));
  equation
  connect(world.frame_b, revolute.frame_b) 
  annotation(Line(origin={-67.75,-62.06},
points={{-37,65.4},{-23.6,65.4},{-23.6,24.8},{-18,24.8}}));
  connect(inertia.flange_b, revolute.axis) 
  annotation(Line(origin={-67.75,-62.06},
points={{-18,-40},{-8,-40},{-8,14.8}}));
  connect(damper.flange_b, fixed_ground.flange) 
  annotation(Line(origin={-25.75,-112.06},
points={{-120,10},{-128,10},{-128,-14}},
color={0,0,0}));
  connect(damper.flange_a, inertia.flange_a) 
  annotation(Line(origin={-111.75,-102.06},
points={{-14,0},{6,0}},
color={0,0,0}));
  connect(world.frame_b, Engine.cylinder_a) 
  annotation(Line(origin={-71.25,3.14},
points={{-33.5,0.2},{46.5,0.2}},
color={95,95,95},
thickness=0.5));
  connect(revolute.frame_a, Engine.cylinder_a1) 
  annotation(Line(origin={-45.25,-36.86},
points={{-20.5,-0.4},{20.5,-0.4},{20.5,-0.26}},
color={95,95,95},
thickness=0.5));
  connect(realExpression1.y, Engine.T_Na) 
  annotation(Line(origin={-4.25,36.14},
points={{-38,0.28},{-8.2,0.28},{-8.2,-15.46}},
color={0,0,127}));
  connect(water.portB, boundary2.ports[1]) 
  annotation(Line(origin={187.018,-207.878},
points={{-72.2499,127.996},{-72.268,103.878}},
color={0,127,255}));
  connect(prescribedHeatFlow1.port, water.wall) 
  annotation(Line(origin={97.75,-70},
points={{-3,0.14},{13.2,0.14}},
color={191,0,0}));
  connect(prescribedHeatFlow.port, Engine_pipe.wall) 
  annotation(Line(origin={-1.25,82.122},
points={{0,-8},{0,5.109}},
color={191,0,0}));
  connect(realExpression3.y, Engine.T_water) 
  annotation(Line(origin={34.75,28.14},
points={{-63,-98},{-47.2,-98},{-47.2,-76.82}},
color={0,0,127}));
  connect(water.portA, boundary4.ports[1]) 
  annotation(Line(origin={114.75,-48},
points={{0.0180755,-11.8823},{0.018,12.28}},
color={0,127,255}));
  connect(Engine.Q_out, gain.u) 
  annotation(Line(origin={39.75,-51.86},
points={{-14.9925,3.18},{-14.9925,-18},{-3,-18}},
color={0,0,127}));
  connect(gain.y, prescribedHeatFlow1[1].Q_flow) 
  annotation(Line(origin={68.75,-45.86},
points={{-9,-24},{6,-24}},
color={0,0,127}));
  connect(gain.y, prescribedHeatFlow1[2].Q_flow) 
  annotation(Line(origin={67.75,-69.86},
points={{-8,0},{7,0}},
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain.y, prescribedHeatFlow1[3].Q_flow) 
  annotation(Line(origin={67.75,-69.86},
points={{-8,0},{7,0}},
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain.y, prescribedHeatFlow1[4].Q_flow) 
  annotation(Line(origin={67.75,-69.86},
points={{-8,0},{7,0}},
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(Engine.Q_in, gain1.u) 
  annotation(Line(origin={24.75,18.14},
points={{0.0075,-0.35},{24,-0.35},{24,6.28}},
color={0,0,127}));
  connect(gain1.y, prescribedHeatFlow[1].Q_flow) 
  annotation(Line(origin={23.75,51.14},
points={{25,-3.72},{25,-0.72},{-25,-0.72},{-25,2.982}},
color={0,0,127}));
  connect(gain1.y, prescribedHeatFlow[2].Q_flow) 
  annotation(Line(origin={23.75,51.14},
points={{25,-3.72},{25,-1},{-25,-1},{-25,2.982}},
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain1.y, prescribedHeatFlow[3].Q_flow) 
  annotation(Line(origin={23.75,51.14},
points={{25,-3.72},{25,-0.72},{-25,-0.72},{-25,2.982}},
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain1.y, prescribedHeatFlow[4].Q_flow) 
  annotation(Line(origin={23.75,51.14},
points={{25,-3.72},{25,-0.72},{-25,-0.72},{-25,2.982}},
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(expansionTank1.port, resistance_toExpTank.port_b) 
  annotation(Line(origin={234.75,277.049},
points={{-201.241,-68.4},{-201.241,-84}}));
  connect(volumeTube.port_a[1], hE1_1.tube_out) 
  annotation(Line(origin={-100.75,113.049},
points={{27.5,-22},{7,-22},{7,22},{-47.00181,22},{-47.00181,11.151}},
color={0,127,255}));
  connect(pump2.port_b, hE1_1.tube_in) 
  annotation(Line(origin={-104.75,126.049},
points={{23.5,37},{-5,37},{-5,-37},{-43.00181,-37},{-43.00181,-22.249}},
color={0,127,255}));
  connect(volumeTube.port_b[1], Engine_pipe.portA) 
  annotation(Line(origin={-36.491,93.049},
points={{-24.759,-2},{25.2633,-1.99992}},
color={0,127,255}));
  connect(pump2.port_a, Engine_pipe.portB) 
  annotation(Line(origin={-6.491,127.049},
points={{-54.759,36},{54,36},{54,-35.9999},{15.2632,-35.9999}},
color={0,127,255}));
  connect(resistance_toExpTank.port_a, pump2.port_a) 
  annotation(Line(origin={-13.491,176.049},
points={{47,-3},{47,-13},{-47.759,-13}},
color={0,127,255}));
  connect(boundary1.ports[1], hE1_1.shell_in) 
  annotation(Line(origin={-171,138},
  points={{-11,14},{11.0482,14},{11.0482,-13.8}},
  color={0,127,255}));
  connect(hE1_1.shell_out, boundary3.ports[1]) 
  annotation(Line(origin={-171,97},
  points={{11.0482,6.8},{11.0482,-5.969},{-11,-5.969}},
  color={0,127,255}));
  end v1;