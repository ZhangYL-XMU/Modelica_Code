within SFR.Structure.Closed;
model SecondLoop
  annotation(__MWORKS(version="26.1.3"),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.001,StartTime=0,StopTime=10,StoreEventValue=0,Tolerance=0.0001));
  // ========== 主回路组件 ==========
  Thermal.HeatExchange.HE1 hE1_1(shell(h_start=656775), tube(h_start=656775)) 
    annotation(Placement(transformation(origin={-42,57},
extent={{-10,10},{10,-10}},
rotation=90)));
  // ========== 热段缓冲容积：断开闭合回路 inStream 焓环（修复 6144 线性奇异，与 FirstLoop 上腔室同构） ==========
  SFR.Fluid.Vessels.MixingVolume volumeTube(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    nPorts_a=1, nPorts_b=1, V=1, h_start=656775 "热段550℃") 
    annotation(Placement(transformation(origin={24,36},
extent={{-10,-10},{10,10}})));
  // ========== 膨胀箱定压支路（参照 IHTS5_AHX3：死端膨胀箱经固定流阻接冷段） ==========
  SFR.Fluid.Vessels.ExpansionTank expansionTank(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium,
    A=1,
    V0=0.001,
    level_start=1,
    h_start=506655,
    p_start=100000.0) 
    annotation(Placement(transformation(origin={38,158},
extent={{-10,-10},{10,10}})));
  SFR.Fluid.Vessels.SpecifiedResistance resistance_toExpTank(
    redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, R=0.1) 
    annotation(Placement(transformation(origin={64,134},
extent={{10,-10},{-10,10}})));
  // ========== 壳侧回路 ==========
  Modelica.Fluid.Sources.MassFlowSource_T boundary4(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, m_flow=280, T=823.15) 
    annotation(Placement(transformation(origin={-102,4},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, T=713.15, p=100000.0) 
    annotation(Placement(transformation(origin={-106,96},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d=10.6) "发电负载（转速校准→1500rpm）发电负载 250kW@1500rpm 等效" annotation(Placement(transformation(origin={63,-170.06},
extent={{10,-10},{-10,10}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed_ground annotation(Placement(transformation(origin={45,-194.06},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=2, phi(start=0, fixed=true), w(start=0, fixed=true,displayUnit="rpm") "1500rpm 初值") 
    annotation(Placement(transformation(origin={103,-170.06},
extent={{-10,-10},{10,10}})));
  inner Modelica.Mechanics.MultiBody.World world 
    annotation(Placement(transformation(origin={71,-64.66},
extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true, n(
        displayUnit="1") = {1,0,0}) annotation(Placement(transformation(origin={123,-105.26},
extent={{10,10},{-10,-10}})));
  Stirling.DoubleActing.DA_Engine_v2 Engine(heff=1.41) 
    annotation (Placement(transformation(origin={204.75,-82},
extent={{-30.75,-28.9},{30.75,28.9}})));
  Fluid.Pipes.pipe Engine_pipe(redeclare package Medium = Media.Sodium.ConstantPropertyLiquidSodium,N=5,L_total=5,m_flow_start=100) 
    annotation (Placement(transformation(origin={71,36},
extent={{-10,10},{10,-10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow 
    annotation (Placement(transformation(origin={71,12},
extent={{-10,-10},{10,10}},
rotation=90)));
  Modelica.Blocks.Sources.RealExpression realExpression(y= - Engine.Q) "引擎吸热=40×Q_in×heff（heff 在 DA_Engine_v2 内，标定后 Q_in≈725kW → 40.6MW）" 
    annotation (Placement(transformation(origin={37.75,-14},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=Engine_pipe.T[1]) 
    annotation (Placement(transformation(origin={177.5,-7.86},
extent={{-10,-10},{10,10}})));
  TRANSFORM.Fluid.Machines.Pump_SimpleMassFlow pump2(m_flow_nominal=308.4, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
    annotation (Placement(transformation(origin={20,108},
extent={{10,-10},{-10,10}})));

  // ========== 引擎+机械部分：与 SFR.Stirling.DoubleActing.Test_Engine 逐字同构（含 Placement） ==========
  equation
  // ---------- 主回路（泵→HE1管侧→引擎热端→引擎→冷端→泵） ----------
  // ---------- 膨胀箱定压支路（接冷段三通） ----------
  connect(expansionTank.port, resistance_toExpTank.port_b) 
  annotation(Line(origin={326,222},
points={{-288,-72.4},{-288,-88},{-272,-88}}));
  // ---------- 壳侧（流量源→HE1壳侧→定压） ----------
  connect(boundary4.ports[1], hE1_1.shell_in) 
  annotation(Line(origin={192,8},
points={{-284,-4},{-240.20181,-4},{-240.20181,38.8}}));
  connect(hE1_1.shell_out, boundary.ports[1]) 
  annotation(Line(origin={192,8},
points={{-240.20181,59.2},{-240.20181,88},{-288,88}}));
  connect(world.frame_b, revolute.frame_b) 
  annotation(Line(origin={131,-130.06},
points={{-50,65.4},{-23.6,65.4},{-23.6,24.8},{-18,24.8}}));
  connect(inertia.flange_b, revolute.axis) 
  annotation(Line(origin={131,-130.06},
points={{-18,-40},{-8,-40},{-8,14.8}}));
  connect(damper.flange_b, fixed_ground.flange) 
  annotation(Line(origin={173,-180.06},
points={{-120,10},{-128,10},{-128,-14}},
color={0,0,0}));
  connect(damper.flange_a, inertia.flange_a) 
  annotation(Line(origin={87,-170.06},
points={{-14,0},{6,0}},
color={0,0,0}));
  connect(world.frame_b, Engine.cylinder_a) 
  annotation(Line(origin={127.5,-64.86},
points={{-46.5,0.2},{46.5,0.2}},
color={95,95,95},
thickness=0.5));
  connect(revolute.frame_a, Engine.cylinder_a1) 
  annotation(Line(origin={153.5,-104.86},
points={{-20.5,-0.4},{20.5,-0.4},{20.5,-0.26}},
color={95,95,95},
thickness=0.5));
  connect(realExpression1.y, Engine.T_Na) 
  annotation(Line(origin={194.5,-31.86},
points={{-6,24},{10.25,24},{10.25,-15.46}},
color={0,0,127}));
  connect(prescribedHeatFlow.port, Engine_pipe.wall[1]) 
  annotation(Line(origin={153.5,28.14},
points={{-82.5,-6.14},{-82.5,4.06}},
color={191,0,0}));
  connect(hE1_1.tube_out, volumeTube.port_a[1]) 
  annotation(Line(origin={4,52.4},
points={{-40.00181,-5.6},{-40.00181,-16.4},{14,-16.4}},
color={0,127,255}));
  connect(volumeTube.port_b[1], Engine_pipe.portA) 
  annotation(Line(origin={62.5,47},
points={{-32.5,-11},{-1.47774,-10.9819}},
color={0,127,255}));
  connect(resistance_toExpTank.port_a, Engine_pipe.portB) 
  annotation(Line(origin={126,83},
points={{-52,51},{-40,51},{-40,25},{40.5222,25},{40.5222,-46.9819},{-44.9778,-46.9819}},
color={0,127,255}));
  connect(Engine_pipe.portB, pump2.port_a) 
  annotation(Line(origin={107,73},
points={{-25.9778,-36.9819},{59.5222,-36.9819},{59.5222,35},{-77,35}},
color={0,127,255}));
  connect(pump2.port_b, hE1_1.tube_in) 
  annotation(Line(origin={-4,88},
points={{14,20},{-32.00181,20},{-32.00181,-20.8}},
color={0,127,255}));
  connect(realExpression.y, prescribedHeatFlow.Q_flow) 
  annotation(Line(origin={34,-6},
points={{14.75,-8},{37,-8},{37,8}},
color={0,0,127}));
  // ---------- 机械侧（同 Test_Engine） ----------
  end SecondLoop;