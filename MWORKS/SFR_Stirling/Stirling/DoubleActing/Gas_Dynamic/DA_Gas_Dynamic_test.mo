within SFR.Stirling.DoubleActing.Gas_Dynamic;
model DA_Gas_Dynamic_test
  // 单组 4 缸双作用高保真气体动力学组件的测试驱动模型
  // 用 4 个相位差 90° 的正弦位移/速度源模拟曲柄滑块机构, 验证 DA_Gas_Dynamic 的热力学正确性
  // 速度源为位移源的解析导数(相位 +90°), 保证运动学自洽

  import Modelica.Units.SI;

  parameter Real w = 100 "曲轴角速度 [rad/s]";
  parameter Real f_hz = w/(2*Modelica.Constants.pi) "转速频率 [Hz]";
  parameter SI.Length s_ref = -0.12 "活塞行程中点参考 [m]";
  parameter SI.Length amp = 0.025 "活塞行程半幅(=S/2) [m]";

  // ---- 热源/冷源温度(耦合钠冷快堆一/二回路时改为外部输入) ----
  Modelica.Blocks.Sources.Constant T_na_src(k = 803.15) "钠热源 530°C(表6 钠进口; 430°C出口是斯特林取热结果, 不另计)" 
    annotation(Placement(transformation(origin={-110,70}, extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant T_water_src(k = 303.15) "冷却水 30°C" 
    annotation(Placement(transformation(origin={-110,30}, extent={{-10,-10},{10,10}})));

  // ---- 4 缸位移(相位 0 / 90 / 180 / 270°) ----
  Modelica.Blocks.Sources.Sine s1(amplitude = amp, f = f_hz, phase = 0, offset = s_ref) 
    annotation(Placement(transformation(origin={-110,-40}, extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Sine s2(amplitude = amp, f = f_hz, phase = Modelica.Constants.pi/2, offset = s_ref) 
    annotation(Placement(transformation(origin={-110,-70}, extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Sine s3(amplitude = amp, f = f_hz, phase = Modelica.Constants.pi, offset = s_ref) 
    annotation(Placement(transformation(origin={-110,-100}, extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Sine s4(amplitude = amp, f = f_hz, phase = 3*Modelica.Constants.pi/2, offset = s_ref) 
    annotation(Placement(transformation(origin={-110,-130}, extent={{-10,-10},{10,10}})));

  // ---- 4 缸速度(位移的解析导数, 相位 +90°) ----
  Modelica.Blocks.Sources.Sine v1(amplitude = amp*w, f = f_hz, phase = Modelica.Constants.pi/2) 
    annotation(Placement(transformation(origin={-40,-40}, extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Sine v2(amplitude = amp*w, f = f_hz, phase = Modelica.Constants.pi) 
    annotation(Placement(transformation(origin={-40,-70}, extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Sine v3(amplitude = amp*w, f = f_hz, phase = 3*Modelica.Constants.pi/2) 
    annotation(Placement(transformation(origin={-40,-100}, extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Sine v4(amplitude = amp*w, f = f_hz, phase = 2*Modelica.Constants.pi) 
    annotation(Placement(transformation(origin={-40,-130}, extent={{-10,-10},{10,10}})));

  // ---- 被测试的气体动力学组件 ----
  .SFR.Stirling.DoubleActing.Gas_Dynamic.DA_Gas_Dynamic gas annotation(Placement(transformation(origin={126,-6},
extent={{-60,-60},{60,60}})));

equation
  connect(T_na_src.y, gas.T_na) annotation(Line(origin={0,0},
points={{-99,70},{0,70},{0,80},{102,80},{102,66}},
color={0,0,127}));
  connect(T_water_src.y, gas.T_water) annotation(Line(origin={0,0},
points={{-99,30},{0,30},{0,80},{150,80},{150,66}},
color={0,0,127}));

  connect(s1.y, gas.s[1]) annotation(Line(origin={0,0},
points={{-99,-40},{-60,-40},{-60,30},{54,30}},
color={0,0,127}));
  connect(s2.y, gas.s[2]) annotation(Line(origin={0,0},
points={{-99,-70},{-52,-70},{-52,30},{54,30}},
color={0,0,127}));
  connect(s3.y, gas.s[3]) annotation(Line(origin={0,0},
points={{-99,-100},{-52,-100},{-52,30},{54,30}},
color={0,0,127}));
  connect(s4.y, gas.s[4]) annotation(Line(origin={0,0},
points={{-99,-130},{-52,-130},{-52,30},{54,30}},
color={0,0,127}));

  connect(v1.y, gas.v[1]) annotation(Line(origin={0,0},
points={{-29,-40},{0,-40},{0,-42},{54,-42}},
color={0,0,127}));
  connect(v2.y, gas.v[2]) annotation(Line(origin={0,0},
points={{-29,-70},{40,-70},{40,-42},{54,-42}},
color={0,0,127}));
  connect(v3.y, gas.v[3]) annotation(Line(origin={0,0},
points={{-29,-100},{40,-100},{40,-42},{54,-42}},
color={0,0,127}));
  connect(v4.y, gas.v[4]) annotation(Line(origin={0,0},
points={{-29,-130},{40,-130},{40,-42},{54,-42}},
color={0,0,127}));

  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(Algorithm = Dassl, InlineIntegrator = false, InlineStepSize = false,
      Interval = 0.0001, StartTime = 0, StopTime = 10, StoreEventValue = 0,
      Tolerance = 0.0001));
end DA_Gas_Dynamic_test;