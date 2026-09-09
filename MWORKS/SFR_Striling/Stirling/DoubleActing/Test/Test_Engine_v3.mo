model Test_Engine_v3
  annotation(__MWORKS(version="26.6.0",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=30,ContinueTimeVector)),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.001,StartTime=0,StopTime=30,StoreEventValue=0,Tolerance=0.0001));
  Modelica.Mechanics.Rotational.Components.Damper damper(d=10.30) annotation(Placement(transformation(origin={-135.75,-97.16},
extent={{10,-10},{-10,10}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed_ground annotation(Placement(transformation(origin={-153.75,-121.16},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=2, phi(start=0, fixed=true), w(start=100, fixed=true)) 
    annotation(Placement(transformation(origin={-95.75,-97.16},
extent={{-10,-10},{10,10}})));
  inner Modelica.Mechanics.MultiBody.World world 
    annotation(Placement(transformation(origin={-127.75,8.24},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true, n(
        displayUnit="1") = {1,0,0}) annotation(Placement(transformation(origin={-75.75,-32.36},
extent={{10,10},{-10,-10}})));
  DA_Engine_v3 Engine(U_h=2.0e4, U_c=4.5e5, U_reg=3.0e6, heff_Na=1.53, heff_water=1.0) 
    annotation (Placement(transformation(origin={6,-9.1},
extent={{-30.75,-28.9},{30.75,28.9}})));
  Modelica.Blocks.Sources.Ramp ramp(offset=273.15 +530, height=0, startTime=0, duration=0) 
    annotation (Placement(transformation(origin={-114,95.0580755},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.Boundary_ph boundary1(nPorts=1, redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, p=9.999999999999999e5, h=527257) 
    annotation(Placement(transformation(origin={58.75,99.04},
extent={{10,-10},{-10,10}})));
  Fluid.Pipes.pipe Engine_pipe(redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, N=5, L_total=0.5, m_flow_start=100, n_pipe=3200, Dh=0.004, CF_HeatTransfer=6, initFromEnthalpy=false, T_start=803.15, T_wall_start=803.15) 
    annotation (Placement(transformation(origin={-1.25,99.04},
extent={{-10,10},{10,-10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow[4] 
    annotation (Placement(transformation(origin={-1.25,69.022},
extent={{-10,-10},{10,10}},
rotation=90)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=(Engine_pipe.T[1]+Engine_pipe.T[2]+Engine_pipe.T[3]+Engine_pipe.T[4]) / 4) 
    annotation (Placement(transformation(origin={-53.25,41.32},
extent={{-10,-10},{10,10}})));
  Fluid.Pipes.pipe water(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, N=5, L_total=0.12, m_flow_start=100, n_pipe=70000, Dh=0.001, CF_HeatTransfer=1, initFromEnthalpy=false, T_start=311.15, T_wall_start=311.15) 
    annotation (Placement(transformation(origin={114.75,-64.96},
extent={{-10,10},{10,-10}},
rotation=-90)));
  Modelica.Fluid.Sources.Boundary_ph boundary2(nPorts=1, redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, p=9.999999999999999e5, h=506655) 
    annotation(Placement(transformation(origin={114.75,-109.1},
extent={{10,-10},{-10,10}},
rotation=-90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1[4] 
    annotation (Placement(transformation(origin={84.75,-64.96},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=(water.T[1]+water.T[2]+water.T[3]+water.T[4]) / 4) 
    annotation (Placement(transformation(origin={-39.25,-64.96},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary4(nPorts=1,redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,m_flow=200,T=273.15 +38) 
    annotation (Placement(transformation(origin={114.768,-20.82},
extent={{-10,-10},{10,10}},
rotation=-90)));
  Modelica.Blocks.Math.Gain gain(k=-1/4) 
    annotation (Placement(transformation(origin={48.75,-64.96},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Gain gain1(k=-1/4) 
    annotation (Placement(transformation(origin={48.75,41.32},
extent={{-10,-10},{10,10}},
rotation=90)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary3(nPorts=1,redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium,m_flow=308.4,T=273.15 +530,use_T_in=true) 
    annotation (Placement(transformation(origin={-61.25,99.0580755},
extent={{10,-10},{-10,10}},
rotation=180)));
  equation
  connect(world.frame_b, revolute.frame_b) 
  annotation(Line(origin={-67.75,-57.16},
points={{-50,65.4},{-23.6,65.4},{-23.6,24.8},{-18,24.8}}));
  connect(inertia.flange_b, revolute.axis) 
  annotation(Line(origin={-67.75,-57.16},
points={{-18,-40},{-8,-40},{-8,14.8}}));
  connect(damper.flange_b, fixed_ground.flange) 
  annotation(Line(origin={-25.75,-107.16},
points={{-120,10},{-128,10},{-128,-14}},
color={0,0,0}));
  connect(damper.flange_a, inertia.flange_a) 
  annotation(Line(origin={-111.75,-97.16},
points={{-14,0},{6,0}},
color={0,0,0}));
  connect(world.frame_b, Engine.cylinder_a) 
  annotation(Line(origin={-71.25,8.04},
points={{-46.5,0.2},{46.5,0.2}},
color={95,95,95},
thickness=0.5));
  connect(revolute.frame_a, Engine.cylinder_a1) 
  annotation(Line(origin={-45.25,-31.96},
points={{-20.5,-0.4},{20.5,-0.4},{20.5,-0.26}},
color={95,95,95},
thickness=0.5));
  connect(realExpression1.y, Engine.T_Na) 
  annotation(Line(origin={-4.25,41.04},
points={{-38,0.28},{-8.2,0.28},{-8.2,-15.46}},
color={0,0,127}));
  connect(Engine_pipe.portB, boundary1.ports[1]) 
  annotation(Line(origin={49.75,99.022},
points={{-40.9778,0.0360755},{-1,0.018}},
color={0,127,255}));
  connect(water.portB, boundary2.ports[1]) 
  annotation(Line(origin={187.018,-202.978},
points={{-72.2499,127.996},{-72.268,103.878}},
color={0,127,255}));
  connect(prescribedHeatFlow1.port, water.wall) 
  annotation(Line(origin={97.75,-65.1},
points={{-3,0.14},{13.2,0.14}},
color={191,0,0}));
  connect(prescribedHeatFlow.port, Engine_pipe.wall) 
  annotation(Line(origin={-1.25,87.022},
points={{0,-8},{0,8.218}},
color={191,0,0}));
  connect(realExpression3.y, Engine.T_water) 
  annotation(Line(origin={34.75,33.04},
points={{-63,-98},{-47.2,-98},{-47.2,-76.82}},
color={0,0,127}));
  connect(water.portA, boundary4.ports[1]) 
  annotation(Line(origin={114.75,-43.1},
points={{0.0180755,-11.8823},{0.018,12.28}},
color={0,127,255}));
  connect(Engine.Q_out, gain.u) 
  annotation(Line(origin={39.75,-46.96},
points={{-14.9925,6.07},{-14.9925,-18},{-3,-18}},
color={0,0,127}));
  connect(gain.y, prescribedHeatFlow1[1].Q_flow) 
  annotation(Line(origin={68.75,-40.96},
points={{-9,-24},{6,-24}},
color={0,0,127}));
  connect(gain.y, prescribedHeatFlow1[2].Q_flow) 
  annotation(Line(origin={67.75,-64.96},
points={{-8,0},{7,0}},
color={0,0,127}));
  connect(gain.y, prescribedHeatFlow1[3].Q_flow) 
  annotation(Line(origin={67.75,-64.96},
points={{-8,0},{7,0}},
color={0,0,127}));
  connect(gain.y, prescribedHeatFlow1[4].Q_flow) 
  annotation(Line(origin={67.75,-64.96},
points={{-8,0},{7,0}},
color={0,0,127}));
  connect(Engine.Q_in, gain1.u) 
  annotation(Line(origin={24.75,23.04},
points={{0.0075,-0.35},{24,-0.35},{24,6.28}},
color={0,0,127}));
  connect(gain1.y, prescribedHeatFlow[1].Q_flow) 
  annotation(Line(origin={23.75,56.04},
points={{25,-3.72},{25,-0.72},{-25,-0.72},{-25,2.982}},
color={0,0,127}));
  connect(gain1.y, prescribedHeatFlow[2].Q_flow) 
  annotation(Line(origin={23.75,56.04},
points={{25,-3.72},{25,-1},{-25,-1},{-25,2.982}},
color={0,0,127}));
  connect(gain1.y, prescribedHeatFlow[3].Q_flow) 
  annotation(Line(origin={23.75,56.04},
points={{25,-3.72},{25,-0.72},{-25,-0.72},{-25,2.982}},
color={0,0,127}));
  connect(gain1.y, prescribedHeatFlow[4].Q_flow) 
  annotation(Line(origin={23.75,56.04},
points={{25,-3.72},{25,-0.72},{-25,-0.72},{-25,2.982}},
color={0,0,127}));
  connect(Engine_pipe.portA, boundary3.ports[1]) 
  annotation(Line(origin={-31,99},
  points={{19.77226,0.0580755},{-20.25,0.0580755}},
  color={0,127,255}));
  connect(boundary3.T_in, ramp.y) 
  annotation(Line(origin={-85,95},
points={{11.75,0.0580755},{-18,0.0580755}},
color={0,0,127}));
  end Test_Engine_v3;