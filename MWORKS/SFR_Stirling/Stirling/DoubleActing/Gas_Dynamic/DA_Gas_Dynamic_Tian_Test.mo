within SFR.Stirling.DoubleActing.Gas_Dynamic;
model DA_Gas_Dynamic_Tian_Test
  // DA_Gas_Dynamic_Tian 的测试驱动模型(侯斌论文工况)
  // 输入全部使用 Modelica 基础库组件:
  //   位移: Sine(相位0/90/180/270°, 25Hz) × FirstOrder阶跃包络(1-exp(-t/0.15)平滑启动) + s_ref偏置
  //   速度: 模型内部变量对位移求导(v=der(s)), 无需外部提供
  //   温度: Constant 常量源(表6: 钠进口530°C; 430°C出口是斯特林取热结果, 不另计; 冷却水30°C)
  // 验证锚点(侯斌表6/表7): 单组4缸热功率≈1MW, 热效率≈25%, 峰值压力≤20MPa, 氦气温度≈400°C(673K)

  import Modelica.Units.SI;

  parameter Real f_hz = 25 "曲轴频率(侯斌论文未给转速, 按1500rpm假设) [Hz]";
  parameter SI.Length s_ref = 0.0 "测试用位移参考(行程中点) [m]";
  parameter SI.Length amp = 0.025 "活塞行程半幅=S/2(表7行程50mm) [m]";
  parameter SI.Time tau_start = 0.15 "启动平滑时间常数 [s]";

  // ================= 输入源组件(Modelica 基础库) =================
  // ---- 启动包络: Constant(1) → FirstOrder 阶跃响应 = 1-exp(-t/tau_start) ----
  Modelica.Blocks.Sources.Constant envStep(k = 1) "单位阶跃输入(生成平滑启动包络)" annotation(Placement(transformation(extent={{-128,-10},{-108,10}})));
  Modelica.Blocks.Continuous.FirstOrder envelope(T = tau_start, k = 1, y_start = 0) "启动包络 1-exp(-t/0.15)(0→1平滑过渡)" annotation(Placement(transformation(extent={{-98,-10},{-78,10}})));

  // ---- 4 缸位移: 相位 0/90/180/270°, 热腔体积领先冷腔 90°(田4.2.1节第9条) ----
  Modelica.Blocks.Sources.Sine sine1(amplitude = amp, f = f_hz, phase = 0) "缸1位移正弦(相位0°)" annotation(Placement(transformation(extent={{-80,80},{-60,100}})));
  Modelica.Blocks.Sources.Sine sine2(amplitude = amp, f = f_hz, phase = Modelica.Constants.pi/2) "缸2位移正弦(相位90°)" annotation(Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Blocks.Sources.Sine sine3(amplitude = amp, f = f_hz, phase = Modelica.Constants.pi) "缸3位移正弦(相位180°)" annotation(Placement(transformation(extent={{-80,-40},{-60,-20}})));
  Modelica.Blocks.Sources.Sine sine4(amplitude = amp, f = f_hz, phase = 3*Modelica.Constants.pi/2) "缸4位移正弦(相位270°)" annotation(Placement(transformation(extent={{-80,-100},{-60,-80}})));

  // ---- 包络×正弦 + 位移参考偏置 ----
  Modelica.Blocks.Math.Product prod1 annotation(Placement(transformation(extent={{-50,80},{-30,100}})));
  Modelica.Blocks.Math.Product prod2 annotation(Placement(transformation(extent={{-50,20},{-30,40}})));
  Modelica.Blocks.Math.Product prod3 annotation(Placement(transformation(extent={{-50,-40},{-30,-20}})));
  Modelica.Blocks.Math.Product prod4 annotation(Placement(transformation(extent={{-50,-100},{-30,-80}})));
  Modelica.Blocks.Sources.Constant sOffset(k = s_ref) "位移行程中点偏置" annotation(Placement(transformation(extent={{-32,68},{-12,88}})));
  Modelica.Blocks.Math.Add add1 annotation(Placement(transformation(extent={{-2,68},{18,88}})));
  Modelica.Blocks.Math.Add add2 annotation(Placement(transformation(extent={{-2,16},{18,36}})));
  Modelica.Blocks.Math.Add add3 annotation(Placement(transformation(extent={{-2,-36},{18,-16}})));
  Modelica.Blocks.Math.Add add4 annotation(Placement(transformation(extent={{-2,-88},{18,-68}})));

  // ---- 热源/冷源温度(表6: 钠进口530°C; 冷却水30°C) ----
  Modelica.Blocks.Sources.Constant T_na_src(k = 803.15) "钠热源温度(表6钠进口530°C) [K]" annotation(Placement(transformation(origin={72,118},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant T_water_src(k = 303.15) "冷却水温度 [K]" annotation(Placement(transformation(origin={166,128},
extent={{-10,-10},{10,10}})));

  // ================= 被测试的气体动力学组件(默认参数=侯斌表6/表7) =================
  DA_Gas_Dynamic_Tian gas(s_ref = s_ref) 
    annotation(Placement(transformation(origin={152,0},
extent={{-60,-60},{60,60}})));

equation
  // ---- 启动包络: 1-exp(-t/0.15) ----
  connect(envStep.y, envelope.u) annotation(Line(points={{-108,0},{-98,0}}));

  // ---- 位移: (正弦×包络) + 偏置 ----
  connect(sine1.y, prod1.u1) annotation(Line(points={{-60,90},{-50,90}}));
  connect(envelope.y, prod1.u2) annotation(Line(points={{-78,0},{-64,0},{-64,90},{-50,90}}));
  connect(sine2.y, prod2.u1) annotation(Line(points={{-60,30},{-50,30}}));
  connect(envelope.y, prod2.u2) annotation(Line(points={{-78,0},{-64,0},{-64,30},{-50,30}}));
  connect(sine3.y, prod3.u1) annotation(Line(points={{-60,-30},{-50,-30}}));
  connect(envelope.y, prod3.u2) annotation(Line(points={{-78,0},{-64,0},{-64,-30},{-50,-30}}));
  connect(sine4.y, prod4.u1) annotation(Line(points={{-60,-90},{-50,-90}}));
  connect(envelope.y, prod4.u2) annotation(Line(points={{-78,0},{-64,0},{-64,-90},{-50,-90}}));
  connect(prod1.y, add1.u1) annotation(Line(points={{-30,90},{-16,90},{-16,78},{-2,78}}));
  connect(sOffset.y, add1.u2) annotation(Line(points={{-12,78},{-2,78}}));
  connect(prod2.y, add2.u1) annotation(Line(points={{-30,30},{-16,30},{-16,26},{-2,26}}));
  connect(sOffset.y, add2.u2) annotation(Line(points={{-12,78},{-7,78},{-7,26},{-2,26}}));
  connect(prod3.y, add3.u1) annotation(Line(points={{-30,-30},{-16,-30},{-16,-26},{-2,-26}}));
  connect(sOffset.y, add3.u2) annotation(Line(points={{-12,78},{-7,78},{-7,-26},{-2,-26}}));
  connect(prod4.y, add4.u1) annotation(Line(points={{-30,-90},{-16,-90},{-16,-78},{-2,-78}}));
  connect(sOffset.y, add4.u2) annotation(Line(points={{-12,78},{-7,78},{-7,-78},{-2,-78}}));

  // ---- 位移 → 气体动力学 ----
  connect(add1.y, gas.s[1]) annotation(Line(origin={0,0},
points={{19,78},{22,78},{22,3.6},{78.8,3.6}}));
  connect(add2.y, gas.s[2]) annotation(Line(origin={0,0},
points={{19,26},{22,26},{22,3.6},{78.8,3.6}}));
  connect(add3.y, gas.s[3]) annotation(Line(origin={0,0},
points={{19,-26},{22,-26},{22,3.6},{78.8,3.6}}));
  connect(add4.y, gas.s[4]) annotation(Line(origin={0,0},
points={{19,-78},{22,-78},{22,3.6},{78.8,3.6}}));

  // ---- 热源/冷源温度 ----
  connect(T_na_src.y, gas.T_na) annotation(Line(origin={0,0},
points={{83,118},{128,118},{128,72}}));
  connect(T_water_src.y, gas.T_water) annotation(Line(origin={0,0},
points={{177,128},{180,128},{180,86},{176,86},{176,72}}));

  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.01,StartTime=0,StopTime=100,StoreEventValue=0,Tolerance=0.001),__MWORKS(ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=20,ContinueTimeVector)));
end DA_Gas_Dynamic_Tian_Test;