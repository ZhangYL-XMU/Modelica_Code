model SecondLoop_v2
  annotation(__MWORKS(version="26.6.0"),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})));
  Modelica.Blocks.Math.Gain gain1(k=-1/4) 
    annotation (Placement(transformation(origin={87.241,59.371},
extent={{-10,-10},{10,10}},
rotation=90)));
  Modelica.Blocks.Math.Gain gain(k=-1/4) 
    annotation (Placement(transformation(origin={87.241,-46.909},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary4(nPorts=1,redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,m_flow=200,T=273.15 +38) 
    annotation (Placement(transformation(origin={153.259,-2.769},
extent={{-10,-10},{10,10}},
rotation=-90)));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=(water.T[1]+water.T[2]+water.T[3]+water.T[4]) / 4) 
    annotation (Placement(transformation(origin={-0.759,-46.909},
extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1[4] 
    annotation (Placement(transformation(origin={123.241,-46.909},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.Boundary_ph boundary2(nPorts=1, redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, p=9.999999999999999e5, h=506655) 
    annotation(Placement(transformation(origin={153.241,-91.049},
extent={{10,-10},{-10,10}},
rotation=-90)));
  Fluid.Pipes.pipe water(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, N=5, L_total=0.12, m_flow_start=100, n_pipe=70000, Dh=0.001, CF_HeatTransfer=1, initFromEnthalpy=false, T_start=311.15, T_wall_start=311.15) 
    annotation (Placement(transformation(origin={153.241,-46.909},
extent={{-10,10},{10,-10}},
rotation=-90)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=(Engine_pipe.T[1]+Engine_pipe.T[2]+Engine_pipe.T[3]+Engine_pipe.T[4]) / 4) 
    annotation (Placement(transformation(origin={-14.759,59.371},
extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow[4] 
    annotation (Placement(transformation(origin={37.241,87.073},
extent={{-10,-10},{10,10}},
rotation=90)));
  Fluid.Pipes.pipe Engine_pipe(redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, N=5, L_total=0.5, m_flow_start=100, n_pipe=3200, Dh=0.004, CF_HeatTransfer=6, initFromEnthalpy=false, T_start=803.15, T_wall_start=803.15) 
    annotation (Placement(transformation(origin={37.241,113.982},
extent={{-10,10},{10,-10}})));
  SFR_Striling.Stirling.DoubleActing.DA_Engine_v3 Engine(U_h=2.0e4, U_c=4.5e5, U_reg=2.0e6, heff_Na=1.53, heff_water=1.0) 
    annotation (Placement(transformation(origin={44.491,8.951},
extent={{-30.75,-28.9},{30.75,28.9}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true, n(
        displayUnit="1") = {1,0,0}) annotation(Placement(transformation(origin={-37.259,-14.309},
extent={{10,10},{-10,-10}})));
  inner Modelica.Mechanics.MultiBody.World world 
    annotation(Placement(transformation(origin={-89.259,26.291},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=2, phi(start=0, fixed=true), w(start=w_start, fixed=true)) 
    annotation(Placement(transformation(origin={-57.259,-79.109},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed_ground annotation(Placement(transformation(origin={-115.259,-103.109},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d=10.30) annotation(Placement(transformation(origin={-97.259,-79.109},
extent={{10,-10},{-10,10}})));
  Thermal.HeatExchange.HE1 hE1_1(shell(momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)) 
    annotation (Placement(transformation(origin={-95.23,136.009},
extent={{10,10},{-10,-10}},
rotation=90)));
  TRANSFORM.Fluid.Machines.Pump_SimpleMassFlow pump2(m_flow_nominal=308.4, redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, use_input=false) 
    annotation (Placement(transformation(origin={-32.759,186},
extent={{10,-10},{-10,10}})));
  Fluid.Vessels.SpecifiedResistance resistance_toExpTank(redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, R=0.1) 
    annotation(Placement(transformation(origin={11.241,212},
extent={{10,-10},{-10,10}})));
  Fluid.Vessels.ExpansionTank expansionTank1(redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, A=1, V0=0.001, level_start=1, h_start=506655, p_start=100000.0) 
    annotation(Placement(transformation(origin={-14.759,236},
extent={{-10,-10},{10,10}})));
  Fluid.Vessels.MixingVolume volumeTube(redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, nPorts_a=1, nPorts_b=1, V=1, h_start=654480 "HE1出口530℃(设计剖面初值)") 
    annotation(Placement(transformation(origin={-28.759,114},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(nPorts=1,redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,m_flow=200,T=273.15 +38) 
    annotation (Placement(transformation(origin={-146,180},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.Boundary_ph boundary3(nPorts=1, redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, p=9.999999999999999e5, h=506655) 
    annotation(Placement(transformation(origin={-146,87.073},
extent={{10,-10},{-10,10}},
rotation=-180)));
  equation
  connect(world.frame_b, revolute.frame_b) 
  annotation(Line(origin={-29.259,-39.109},
  points={{-50,65.4},{-23.6,65.4},{-23.6,24.8},{-18,24.8}}));
  connect(inertia.flange_b, revolute.axis) 
  annotation(Line(origin={-29.259,-39.109},
  points={{-18,-40},{-8,-40},{-8,14.8}}));
  connect(damper.flange_b, fixed_ground.flange) 
  annotation(Line(origin={12.741,-89.109},
  points={{-120,10},{-128,10},{-128,-14}},
  color={0,0,0}));
  connect(damper.flange_a, inertia.flange_a) 
  annotation(Line(origin={-73.259,-79.109},
  points={{-14,0},{6,0}},
  color={0,0,0}));
  connect(world.frame_b, Engine.cylinder_a) 
  annotation(Line(origin={-32.759,26.091},
  points={{-46.5,0.2},{46.5,0.2}},
  color={95,95,95},
  thickness=0.5));
  connect(revolute.frame_a, Engine.cylinder_a1) 
  annotation(Line(origin={-6.759,-13.909},
  points={{-20.5,-0.4},{20.5,-0.4},{20.5,-0.26}},
  color={95,95,95},
  thickness=0.5));
  connect(realExpression1.y, Engine.T_Na) 
  annotation(Line(origin={34.241,59.091},
  points={{-38,0.28},{-5.125,0.28},{-5.125,-14.882}},
  color={0,0,127}));
  connect(water.portB, boundary2.ports[1]) 
  annotation(Line(origin={225.509,-184.927},
  points={{-72.2499,127.996},{-72.268,103.878}},
  color={0,127,255}));
  connect(prescribedHeatFlow1.port, water.wall) 
  annotation(Line(origin={136.241,-47.049},
  points={{-3,0.14},{13.2,0.14}},
  color={191,0,0}));
  connect(prescribedHeatFlow.port, Engine_pipe.wall) 
  annotation(Line(origin={37.241,105.073},
points={{0,-8},{0,5.10892}},
color={191,0,0}));
  connect(realExpression3.y, Engine.T_water) 
  annotation(Line(origin={73.241,51.091},
  points={{-63,-98},{-47.2,-98},{-47.2,-76.82}},
  color={0,0,127}));
  connect(water.portA, boundary4.ports[1]) 
  annotation(Line(origin={153.241,-25.049},
  points={{0.0180755,-11.8823},{0.018,12.28}},
  color={0,127,255}));
  connect(Engine.Q_out, gain.u) 
  annotation(Line(origin={78.241,-28.909},
  points={{-14.9925,6.07},{-14.9925,-18},{-3,-18}},
  color={0,0,127}));
  connect(gain.y, prescribedHeatFlow1[1].Q_flow) 
  annotation(Line(origin={107.241,-22.909},
  points={{-9,-24},{6,-24}},
  color={0,0,127}));
  connect(gain.y, prescribedHeatFlow1[2].Q_flow) 
  annotation(Line(origin={106.241,-46.909},
  points={{-8,0},{7,0}},
  color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain.y, prescribedHeatFlow1[3].Q_flow) 
  annotation(Line(origin={106.241,-46.909},
  points={{-8,0},{7,0}},
  color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain.y, prescribedHeatFlow1[4].Q_flow) 
  annotation(Line(origin={106.241,-46.909},
  points={{-8,0},{7,0}},
  color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(Engine.Q_in, gain1.u) 
  annotation(Line(origin={63.241,41.091},
  points={{0.0075,-0.35},{24,-0.35},{24,6.28}},
  color={0,0,127}));
  connect(gain1.y, prescribedHeatFlow[1].Q_flow) 
  annotation(Line(origin={62.241,74.091},
  points={{25,-3.72},{25,-0.72},{-25,-0.72},{-25,2.982}},
  color={0,0,127}));
  connect(gain1.y, prescribedHeatFlow[2].Q_flow) 
  annotation(Line(origin={62.241,74.091},
  points={{25,-3.72},{25,-1},{-25,-1},{-25,2.982}},
  color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain1.y, prescribedHeatFlow[3].Q_flow) 
  annotation(Line(origin={62.241,74.091},
  points={{25,-3.72},{25,-0.72},{-25,-0.72},{-25,2.982}},
  color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain1.y, prescribedHeatFlow[4].Q_flow) 
  annotation(Line(origin={62.241,74.091},
  points={{25,-3.72},{25,-0.72},{-25,-0.72},{-25,2.982}},
  color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  connect(expansionTank1.port, resistance_toExpTank.port_b) 
  annotation(Line(origin={273.241,300},
points={{-288,-72.4},{-288,-88},{-272,-88}}));
  connect(volumeTube.port_a[1], hE1_1.tube_out) 
  annotation(Line(origin={-62.259,136},
points={{27.5,-22},{7,-22},{7,22},{-26.9728,22},{-26.9728,10.209}},
color={0,127,255}));
  connect(pump2.port_b, hE1_1.tube_in) 
  annotation(Line(origin={-66.259,149},
points={{23.5,37},{-5,37},{-5,-37},{-22.9728,-37},{-22.9728,-23.191}},
color={0,127,255}));
  connect(volumeTube.port_b[1], Engine_pipe.portA) 
  annotation(Line(origin={2,116},
points={{-24.759,-2},{25.26326,-2}},
color={0,127,255}));
  connect(pump2.port_a, Engine_pipe.portB) 
  annotation(Line(origin={32,150},
points={{-54.759,36},{54,36},{54,-36},{15.2632,-36}},
color={0,127,255}));
  connect(resistance_toExpTank.port_a, pump2.port_a) 
  annotation(Line(origin={25,199},
  points={{-3.759,13},{47,13},{47,-13},{-47.759,-13}},
  color={0,127,255}));
  connect(boundary1.ports[1], hE1_1.shell_in) 
  annotation(Line(origin={-119,163},
  points={{-17,17},{17.5682,17},{17.5682,-16.791}},
  color={0,127,255}));
  connect(hE1_1.shell_out, boundary3.ports[1]) 
  annotation(Line(origin={-119,114},
points={{17.5682,11.809},{17.5682,-26.927},{-17,-26.927}},
color={0,127,255}));
  end SecondLoop_v2;