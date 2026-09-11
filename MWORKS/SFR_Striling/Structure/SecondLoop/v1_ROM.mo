model v1_ROM
  annotation(__MWORKS(version="26.6.0"),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})));
  Modelica.Blocks.Math.Gain gain1(k=-1/4) 
    annotation (Placement(transformation(origin={48.75,36.42},
extent={{-10,-10},{10,10}},
rotation=90)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=(Engine_pipe.T[1]+Engine_pipe.T[2]+Engine_pipe.T[3]+Engine_pipe.T[4]) / 4) 
    annotation (Placement(transformation(origin={-98,0.367778},
extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow[4] 
    annotation (Placement(transformation(origin={-1.25,64.122},
extent={{-10,-10},{10,10}},
rotation=90)));
  Fluid.Pipes.pipe Engine_pipe(redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, N=5, L_total=0.5, m_flow_start=100, n_pipe=3200, Dh=0.004, CF_HeatTransfer=6, initFromEnthalpy=false, T_start=803.15, T_wall_start=803.15) 
    annotation (Placement(transformation(origin={-1.25,91.031},
extent={{-10,10},{10,-10}})));
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
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(nPorts=1, redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, m_flow=280.6, T=273.15 + 550) 
    annotation (Placement(transformation(origin={-192,152},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.Boundary_ph boundary3(nPorts=1, redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium, p=100000, h=506655) 
    annotation(Placement(transformation(origin={-192,91.031},
extent={{10,-10},{-10,10}},
rotation=-180)));
  v3Test.ROM.ROM_Basis rOM_Basis 
    annotation (Placement(transformation(origin={-18.625,-2},
extent={{-34,-32},{34,32}})));
  equation
  connect(prescribedHeatFlow.port, Engine_pipe.wall) 
  annotation(Line(origin={-1.25,82.122},
points={{0,-8},{0,5.109}},
color={191,0,0}));
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
  connect(rOM_Basis.ROM_OUT[2], gain1.u) 
  annotation(Line(origin={32,12},
  points={{-16.625,-11.6322},{16.75,-11.6322},{16.75,12.42}},
  color={0,0,127}));
  connect(rOM_Basis.ROM_IN[1], realExpression1.y) 
  annotation(Line(origin={-69,0},
  points={{17.055,0.367778},{-18,0.367778}},
  color={0,0,127}));
  end v1_ROM;