model tcp
  annotation(version="1.0",uses(Modelica(version="4.0")),Icon(coordinateSystem(extent={{-100,-100},{100,100}}, 
grid={2,2}),graphics = {Bitmap(origin={-1,-5}, 
extent={{-119,-121},{119,121}}, 
fileName="modelica://SCO2_loop/../../../Pictures/Saved Pictures/图片1.png", 
imageSource="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"
)}),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0,NumberOfIntervals=500,StartTime=0,StopTime=1000,Tolerance=0.0001));
  //Real R_1[20]"管道段局部导热热阻";
    //Real R_2[20]"管道段局部对流热阻";
    //Real R_3[20];
    //Real R_add[20]"管道段局部总热阻";
    //Real h_20[20] "管道段对流换热系数h";
    //Real T_wall[20]"管道段外壁面温度";
    //Real T_wall_degC[20]"管道段外壁面温度degC";
    //Real trans[20];
  ImportedTypes.var_choose h_cal1(base(redeclare function FuncConstructor = Interpreter.global_constructor,redeclare function FuncExchangeData = Interpreter.global_exchangedata_func,redeclare function FuncDestructor = Interpreter.global_destructor),period=1) 
    annotation (Placement(transformation(origin={-90,0}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput t 
    annotation (Placement(transformation(origin={110,60}, 
extent={{-10,-10},{10,10}}), 
iconTransformation(origin={-130,40}, 
extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Interfaces.RealOutput p 
    annotation (Placement(transformation(origin={110,0}, 
extent={{-10,-10},{10,10}}), 
iconTransformation(origin={-130,-34}, 
extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Interfaces.RealOutput q 
    annotation (Placement(transformation(origin={110,-60}, 
extent={{-10,-10},{10,10}})));
  InstrumentControl.Blocks.Continuous.FirstOrder firstOrder(y_start=20,T=3,k=1,initType=InstrumentControl.Blocks.Basics.Types.Init.InitialState) 
    "一阶环节" annotation (Placement(transformation(origin={-34,60}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Nonlinear.SlewRateLimiter slewRateLimiter(y_start=25,initType=Modelica.Blocks.Types.Init.InitialState) 
    annotation (Placement(transformation(origin={14,60}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Nonlinear.SlewRateLimiter slewRateLimiter1(initType=Modelica.Blocks.Types.Init.InitialState,y_start=8200000,Rising=1000000) 
    annotation (Placement(transformation(origin={14,0}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Nonlinear.SlewRateLimiter slewRateLimiter2(initType=Modelica.Blocks.Types.Init.InitialState,y_start=2500,Rising=1000) 
    annotation (Placement(transformation(origin={14,-60}, 
extent={{-10,-10},{10,10}})));
  InstrumentControl.Blocks.Continuous.FirstOrder firstOrder1(y_start=20,T=2,k=1,initType=InstrumentControl.Blocks.Basics.Types.Init.InitialState) 
    "一阶环节1" annotation (Placement(transformation(origin={-34,0}, 
extent={{-10,-10},{10,10}})));
  InstrumentControl.Blocks.Continuous.FirstOrder firstOrder2(y_start=20,T=2,k=1,initType=InstrumentControl.Blocks.Basics.Types.Init.InitialState) 
    "一阶环节2" annotation (Placement(transformation(origin={-34,-60}, 
extent={{-10,-10},{10,10}})));
  InstrumentControl.Blocks.Nonlinear.Limiter limiter(uMax=35,uMin=15) 
    "限制器" annotation (Placement(transformation(origin={62,60}, 
extent={{-10,-10},{10,10}})));
  InstrumentControl.Blocks.Nonlinear.Limiter limiter1(uMax=11000000,uMin=8000000) 
    "限制器1" annotation (Placement(transformation(origin={62,0}, 
extent={{-10,-10},{10,10}})));
  InstrumentControl.Blocks.Nonlinear.Limiter limiter2(uMax=5000,uMin=0) 
    "限制器2" annotation (Placement(transformation(origin={62,-60}, 
extent={{-10,-10},{10,10}})));
  model Interpreter
   String pythonEnvPath = "C:/Program Files/MWORKS/Sysplorer 2024b/External/python64";
    function global_constructor = ImportedTypes.UseConstructorWindowspython37 annotation(__MWORKS(hide=true));
    function global_exchangedata_func = ImportedTypes.FunctionUseExchangeDataWindowspython37 annotation(__MWORKS(hide=true));
    function global_exchangedata_obj = ImportedTypes.ObjectUseExchangeDataWindowspython37 annotation(__MWORKS(hide=true));
    function global_destructor = ImportedTypes.UseDestructorWindowspython37 annotation(__MWORKS(hide=true));
   end Interpreter;
  package ImportedTypes
    package ArrayConverter
      model _A2V_1D_Real 
      "1 dimension Real array to Real vector"
        extends Modelica.Icons.InterfacesPackage;
        annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}},preserveAspectRatio=false,grid={2.0,2.0})));
        import Modelica;
        parameter Integer dims[1] = {2};
        Modelica.Blocks.Interfaces.RealInput u[dims[1]] 
          annotation(Placement(transformation(origin ={-120.0,0.0},extent ={{-20.0,-20.0}, {20.0, 20.0}})));
        Modelica.Blocks.Interfaces.RealOutput y[product(dims)] 
          annotation(Placement(transformation(origin={110.0,0.0},extent={{-10.0,-10.0},{10.0,10.0}})));
      protected
        Integer pos;
      algorithm
        pos := 1;
        for i1 in 1:dims[1] loop
          y[pos] := u[i1];
          pos := pos + 1;
        end for;
      end _A2V_1D_Real;
      model _V2A_1D_Real 
      "Real vector to 1 dimension Real array"
        extends Modelica.Icons.InterfacesPackage;
        annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}},preserveAspectRatio=false,grid={2.0,2.0})));
        import Modelica;
        parameter Integer dims[1] = {2};
        Modelica.Blocks.Interfaces.RealInput u[product(dims)] 
        annotation(Placement(transformation(origin ={-120.0,0.0},extent ={{-20.0,-20.0}, {20.0, 20.0}})));
        Modelica.Blocks.Interfaces.RealOutput y[dims[1]] 
        annotation(Placement(transformation(origin={110.0,0.0},extent={{-10.0,-10.0},{10.0,10.0}})));
      protected
        Integer pos;
      algorithm
        pos := 1;
        for i1 in 1:dims[1] loop
          y[i1] := u[pos];
          pos := pos + 1;
        end for;
      end _V2A_1D_Real;
      model h
        inner ThermoHydraulicLib.System.System system "全局设置" annotation (Placement(transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}})));
        annotation(__MWORKS(NUMAP(StartTime=0,StopTime=1e100),ContinueSimConfig(SaveContinueFile=true)),experiment(NumberOfIntervals=500,StartTime=0,StopTime=1));

      end h;

    end ArrayConverter;
    function UseConstructorWindowspython38 
      "Construct an external Function that can be used to store a Python Function - Windows"
    extends PythonIO.Communication.PythonFunction.constructor;
    external "C" initPythonMemory() 
    annotation(Library = { "python_io_python38", "python38" }, 
    LibraryDirectory ="modelica://PythonIO/Resources/Library", 
      __iti_dll = "python_io_python38", 
      __iti_dllNoExport = true);
    annotation(Documentation);
    end UseConstructorWindowspython38;
    function FunctionUseExchangeDataWindowspython38 
      "Function that communicates with Python"
    extends PythonIO.Communication.PythonFunction.exchangeData;
    external "C" stepFunction(pythonPath, pythonFilePath, moduleName, functionName, 
    inputs, inputs_int, inputs_str, inputDims, 
    inputTypes, 
    size(inputDims, 1), size(inputDims, 2), 
    outputDims, outputTypes, 
    size(outputDims, 1), size(outputDims, 2), 
    outputs, outputs_int, 
    hasInput, hasOutput) 
    annotation(Library = { "python_io_python38", "python38" }, 
    LibraryDirectory ="modelica://PythonIO/Resources/Library", 
    IncludeDirectory ="modelica://PythonIO/Resources/C-Sources", 
    Include = "#include \"pythonWrapper.c\"", 
      __iti_dll = "python_io_python38", 
      __iti_dllNoExport = true);
    end FunctionUseExchangeDataWindowspython38;
    function UseDestructorWindowspython38 
      "Release memory"
    extends PythonIO.Communication.PythonFunction.destructor;
    external "C" freePythonMemory() 
    annotation(Library = { "python_io_python38", "python38" }, 
    LibraryDirectory ="modelica://PythonIO/Resources/Library", 
      __iti_dll = "python_io_python38", 
      __iti_dllNoExport = true);
    annotation(Documentation);
    end UseDestructorWindowspython38;
    function UseConstructorWindowspython37 
      "Construct an external Function that can be used to store a Python Function - Windows"
    extends PythonIO.Communication.PythonFunction.constructor;
    external "C" initPythonMemory() 
    annotation(Library = { "python_io_python37", "python37" }, 
    LibraryDirectory ="modelica://PythonIO/Resources/Library", 
      __iti_dll = "python_io_python37", 
      __iti_dllNoExport = true);
    annotation(Documentation);
    end UseConstructorWindowspython37;
    function FunctionUseExchangeDataWindowspython37 
      "Function that communicates with Python"
    extends PythonIO.Communication.PythonFunction.exchangeData;
    external "C" stepFunction(pythonPath, pythonFilePath, moduleName, functionName, 
    inputs, inputs_int, inputs_str, inputDims, 
    inputTypes, 
    size(inputDims, 1), size(inputDims, 2), 
    outputDims, outputTypes, 
    size(outputDims, 1), size(outputDims, 2), 
    outputs, outputs_int, 
    hasInput, hasOutput) 
    annotation(Library = { "python_io_python37", "python37" }, 
    LibraryDirectory ="modelica://PythonIO/Resources/Library", 
    IncludeDirectory ="modelica://PythonIO/Resources/C-Sources", 
    Include = "#include \"pythonWrapper.c\"", 
      __iti_dll = "python_io_python37", 
      __iti_dllNoExport = true);
    end FunctionUseExchangeDataWindowspython37;
    function UseDestructorWindowspython37 
      "Release memory"
    extends PythonIO.Communication.PythonFunction.destructor;
    external "C" freePythonMemory() 
    annotation(Library = { "python_io_python37", "python37" }, 
    LibraryDirectory ="modelica://PythonIO/Resources/Library", 
      __iti_dll = "python_io_python37", 
      __iti_dllNoExport = true);
    annotation(Documentation);
    end UseDestructorWindowspython37;
    function ObjectUseExchangeDataWindowspython37 
      "Function that communicates with Python"
    extends PythonIO.Communication.PythonObject.exchangeData;
    external "C" stepImpl(pythonPath, pythonFilePath, moduleName, className, 
    inputs, inputs_int, inputs_str, inputDims, 
    inputTypes, 
    size(inputDims, 1), size(inputDims, 2), 
    outputDims, outputTypes, 
    size(outputDims, 1), size(outputDims, 2), 
    outputs, outputs_int, 
    hasInput, hasOutput) 
    annotation(Library = { "python_io_python37", "" }, 
    LibraryDirectory ="modelica://PythonIO/Resources/Library", 
    IncludeDirectory ="modelica://PythonIO/Resources/C-Sources", 
    Include = "#include \"pythonWrapper.c\"");
    end ObjectUseExchangeDataWindowspython37;
    model topsis_with_weights_and_average
      extends PythonIO.Communication.PythonSampleBase;
      extends Interpreter;
      import Modelica;
      import PythonIO.Communication.PythonFunction;
      annotation(Icon(coordinateSystem(extent={{-100.0, -100.0}, {100.0, 100.0}},grid={2.0, 2.0}),graphics={Rectangle(origin = {0.0, 0.0}, lineColor = {200, 200, 200}, fillColor = {248, 248, 248}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 25.0), Rectangle(origin = {0.0, 0.0}, lineColor = {128, 128, 128}, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 25.0), Ellipse(origin = {0.0, 0.0}, lineColor = {128, 128, 128}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-30.0, -30.0}, {30.0, 30.0}}), Rectangle(origin = {0.0, 0.0}, fillColor = {239, 239, 239}, fillPattern = FillPattern.Solid, lineThickness = 1.25, extent = {{-100.0, 100.0}, {100.0, -100.0}}), Text(origin = {0.0, 130.0}, lineColor = {0, 0, 255}, extent = {{-150.0, 20.0}, {150.0, -20.0}}, textString = "%name", textColor = {0, 0, 255}), Bitmap(origin = {-0.7500000000000071, 3.75}, extent = {{-89.25, -86.25}, {89.25, 86.25}}, fileName = "modelica://PythonIO/Resources/Images/PythonFunction.svg")}));
      PythonIO.Communication.PythonFunction.PythonFunctionBase base(inputDims={{4}},inputTypes={0},hasInput=true,period=period,outputDims={{20}},outputTypes={0},hasOutput=true,pythonPath=pythonEnvPath,pythonFilePath="C:/Users/23021/Desktop/mworks_digital",functionName="topsis_with_weights_and_average",moduleName="h_choose") 
      annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={0.0, 0.0})));
      Modelica.Blocks.Interfaces.RealOutput output1[20] 
      annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={110, 0})));
      ArrayConverter._V2A_1D_Real out_output1_converter(dims={20}) 
      annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={80, 0})));
      Modelica.Blocks.Interfaces.RealInput new_variables[4] 
      annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={-110, 0})));
      ArrayConverter._A2V_1D_Real in_new_variables_converter(dims={4}) 
      annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={-80, 0})));
    equation
      connect(out_output1_converter.y, output1) 
      annotation(Line(origin={0,0}, 
      points={{110,0},{80,0}}, 
      color={255,0,0}));
      connect(base.outputs[1:20], out_output1_converter.u) 
      annotation(Line(origin={0,0}, 
      points={{0,0},{80,0}}, 
      color={255,0,0}));
      connect(new_variables, in_new_variables_converter.u) 
      annotation(Line(origin={0,0}, 
      points={{110,0},{80,0}}, 
      color={255,0,0}));
      connect(in_new_variables_converter.y, base.inputs[1:4]) 
      annotation(Line(origin={0,0}, 
      points={{80,0},{0,0}}, 
      color={255,0,0}));

    end topsis_with_weights_and_average;
    model var_choose
      extends PythonIO.Communication.PythonSampleBase;
      extends Interpreter;
      import Modelica;
      import PythonIO.Communication.PythonFunction;
      annotation(Icon(coordinateSystem(extent={{-100.0, -100.0}, {100.0, 100.0}},grid={2.0, 2.0}),graphics={Rectangle(origin = {0.0, 0.0}, lineColor = {200, 200, 200}, fillColor = {248, 248, 248}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 25.0), Rectangle(origin = {0.0, 0.0}, lineColor = {128, 128, 128}, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 25.0), Ellipse(origin = {0.0, 0.0}, lineColor = {128, 128, 128}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-30.0, -30.0}, {30.0, 30.0}}), Rectangle(origin = {0.0, 0.0}, fillColor = {239, 239, 239}, fillPattern = FillPattern.Solid, lineThickness = 1.25, extent = {{-100.0, 100.0}, {100.0, -100.0}}), Text(origin = {0.0, 130.0}, lineColor = {0, 0, 255}, extent = {{-150.0, 20.0}, {150.0, -20.0}}, textString = "%name", textColor = {0, 0, 255}), Bitmap(origin = {-0.7500000000000071, 3.75}, extent = {{-89.25, -86.25}, {89.25, 86.25}}, fileName = "modelica://PythonIO/Resources/Images/PythonFunction.svg")}));
      PythonIO.Communication.PythonFunction.PythonFunctionBase base(hasInput=false,period=period,outputDims={{3}},outputTypes={0},hasOutput=true,pythonPath=pythonEnvPath,pythonFilePath="C:/Users/Administrator/Desktop/Numap",functionName="var_choose",moduleName="numap") 
      annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={0.0, 0.0})));
      Modelica.Blocks.Interfaces.RealOutput output1[3] 
      annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={110, 0})));
      ArrayConverter._V2A_1D_Real out_output1_converter(dims={3}) 
      annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={80, 0})));
    equation
      connect(out_output1_converter.y, output1) 
      annotation(Line(origin={0,0}, 
      points={{110,0},{80,0}}, 
      color={255,0,0}));
      connect(base.outputs[1:3], out_output1_converter.u) 
      annotation(Line(origin={0,0}, 
      points={{0,0},{80,0}}, 
      color={255,0,0}));

    end var_choose;
    end ImportedTypes;
  annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, 
grid={2,2})));

  //initial equation

  //for i in 1:20 loop
  //h_20[i] = 1500;
  //T_wall[i] = 325.15;
  //trans[i] = 273.15;
  //T_wall_degC[i] = 50;
  //end for;



equation
  connect(firstOrder.u, h_cal1.output1[1]) 
  annotation(Line(origin={-45,30}, 
points={{0,30},{-34,30},{-34,-30}}, 
color={0,0,127}));
  connect(firstOrder.y, slewRateLimiter.u) 
  annotation(Line(origin={8,60}, 
points={{-31,0},{-6,0}}, 
color={0,0,127}));
  connect(slewRateLimiter1.u, firstOrder1.y) 
  annotation(Line(origin={12,0}, 
points={{-10,0},{-35,0}}, 
color={0,0,127}));
  connect(h_cal1.output1[2], firstOrder1.u) 
  annotation(Line(origin={-55,0}, 
points={{-24,0},{10,0}}, 
color={0,0,127}));
  connect(firstOrder2.y, slewRateLimiter2.u) 
  annotation(Line(origin={12,-60}, 
points={{-35,0},{-10,0}}, 
color={0,0,127}));
  connect(firstOrder2.u, h_cal1.output1[3]) 
  annotation(Line(origin={-55,-30}, 
points={{10,-30},{-24,-30},{-24,30}}, 
color={0,0,127}));
  connect(slewRateLimiter.y, limiter.u) 
  annotation(Line(origin={38,60}, 
  points={{-13,0},{13,0}}, 
  color={0,0,127}));
  connect(t, limiter.y) 
  annotation(Line(origin={92,60}, 
points={{18,0},{-19,0}}, 
color={0,0,127}));
  connect(slewRateLimiter1.y, limiter1.u) 
  annotation(Line(origin={38,0}, 
  points={{-13,0},{13,0}}, 
  color={0,0,127}));
  connect(p, limiter1.y) 
  annotation(Line(origin={92,0}, 
  points={{18,0},{-19,0}}, 
  color={0,0,127}));
  connect(slewRateLimiter2.y, limiter2.u) 
  annotation(Line(origin={38,-60}, 
  points={{-13,0},{13,0}}, 
  color={0,0,127}));
  connect(limiter2.y, q) 
  annotation(Line(origin={92,-60}, 
points={{-19,0},{18,0}}, 
color={0,0,127}));
  //h_cal1.new_variables = {pin, tin, g, q};
  //for i in 1:20 loop
    //R_1[i] = 0.7569 / (0.0192 * T_wall_degC[i] + 6.1255);

    //T_tube[i] = port_b[i].T - fix;
    //热力状态
    //state_pT = Medium.setState_pTX(p_tube, T_tube);
    //导热系数
    //lambda[i] = lamdba(p_tube,T_tube[i]);
    //h_20[i]= h_cal1.output1[i];
    //R_2[i] = 606.6 / h_20[i];

    //R_3[i] = R_contact[i];
   // R_add[i] = R_1[i] + R_2[i];
    //h_cal1.new_variables[4]/20 = (T_wall[i]-tb[i])/R_add[i];
    //T_wall[i] = T_wall_degC[i] + 273.15;
    //end for;
  end tcp;