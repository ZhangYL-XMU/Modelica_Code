model KalmanFilter_windows
  annotation(version="1.0",uses(Modelica(version="4.0")),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0,NumberOfIntervals=500,StartTime=0,StopTime=50,Tolerance=0.0001));
  ImportedTypes.topsis random(base(redeclare function FuncConstructor = Interpreter.global_constructor,redeclare function FuncExchangeData = Interpreter.global_exchangedata_func,redeclare function FuncDestructor = Interpreter.global_destructor),period=1) 
    annotation (Placement(transformation(origin={0,0}, 
extent={{-10,-10},{10,10}})));
  InstrumentControl.Blocks.Sources.Step step(startTime=20,offset=9200000,height=1000000) 
    "阶跃信号" annotation (Placement(transformation(origin={-82.5,50}, 
extent={{-10,-10},{10,10}})));
  InstrumentControl.Blocks.Sources.Step step1(offset=30,height=-5,startTime=20) 
    "阶跃信号1" annotation (Placement(transformation(origin={-82.5,76}, 
extent={{-10,-10},{10,10}})));
  InstrumentControl.Blocks.Sources.Step step2(offset=0.014,startTime=20,height=-0.002) 
    "阶跃信号2" annotation (Placement(transformation(origin={-82.5,15}, 
extent={{-10,-10},{10,10}})));
  InstrumentControl.Blocks.Sources.Step step3(offset=2500,startTime=20,height=-1000) 
    "阶跃信号3" annotation (Placement(transformation(origin={-82.5,-10}, 
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.ContinuousClock continuousClock 
    annotation (Placement(transformation(origin={-82.5,-35}, 
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
    model random
      extends PythonIO.Communication.PythonSampleBase;
      extends Interpreter;
      import Modelica;
      import PythonIO.Communication.PythonFunction;
      annotation(Icon(coordinateSystem(extent={{-100.0, -100.0}, {100.0, 100.0}},grid={2.0, 2.0}),graphics={Rectangle(origin = {0.0, 0.0}, lineColor = {200, 200, 200}, fillColor = {248, 248, 248}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 25.0), Rectangle(origin = {0.0, 0.0}, lineColor = {128, 128, 128}, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 25.0), Ellipse(origin = {0.0, 0.0}, lineColor = {128, 128, 128}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-30.0, -30.0}, {30.0, 30.0}}), Rectangle(origin = {0.0, 0.0}, fillColor = {239, 239, 239}, fillPattern = FillPattern.Solid, lineThickness = 1.25, extent = {{-100.0, 100.0}, {100.0, -100.0}}), Text(origin = {0.0, 130.0}, lineColor = {0, 0, 255}, extent = {{-150.0, 20.0}, {150.0, -20.0}}, textString = "%name", textColor = {0, 0, 255}), Bitmap(origin = {-0.7500000000000071, 3.75}, extent = {{-89.25, -86.25}, {89.25, 86.25}}, fileName = "modelica://PythonIO/Resources/Images/PythonFunction.svg")}));
      PythonIO.Communication.PythonFunction.PythonFunctionBase base(inputDims={{-1}},inputTypes={0},hasInput=true,period=period,outputDims={{-1}},outputTypes={0},hasOutput=true,pythonPath=pythonEnvPath,pythonFilePath="C:/Program Files/MWORKS/Sysplorer 2024b/Library/PythonIO 1.0/PythonIO/Resources/PythonTests",functionName="random",moduleName="KalmanFilter") 
      annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={0.0, 0.0})));
      Modelica.Blocks.Interfaces.RealOutput output1 
      annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={110, 0})));
      ArrayConverter._V2A_1D_Real out_output1_converter(dims={1}) 
      annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={80, 0})));
      Modelica.Blocks.Interfaces.RealInput seed 
      annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={-110, 0})));
      ArrayConverter._A2V_1D_Real in_seed_converter(dims={1}) 
      annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={-80, 0})));
    equation
      connect(out_output1_converter.y[1], output1) 
      annotation(Line(origin={0,0}, 
      points={{110,0},{80,0}}, 
      color={255,0,0}));
      connect(base.outputs[1], out_output1_converter.u[1]) 
      annotation(Line(origin={0,0}, 
      points={{0,0},{80,0}}, 
      color={255,0,0}));
      connect(seed, in_seed_converter.u[1]) 
      annotation(Line(origin={0,0}, 
      points={{110,0},{80,0}}, 
      color={255,0,0}));
      connect(in_seed_converter.y[1], base.inputs[1]) 
      annotation(Line(origin={0,0}, 
      points={{80,0},{0,0}}, 
      color={255,0,0}));

    end random;
    model filter
      extends PythonIO.Communication.PythonSampleBase;
      extends Interpreter;
      import Modelica;
      import PythonIO.Communication.PythonFunction;
      annotation(Icon(coordinateSystem(extent={{-100.0, -100.0}, {100.0, 100.0}},grid={2.0, 2.0}),graphics={Rectangle(origin = {0.0, 0.0}, lineColor = {200, 200, 200}, fillColor = {248, 248, 248}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 25.0), Rectangle(origin = {0.0, 0.0}, lineColor = {128, 128, 128}, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 25.0), Ellipse(origin = {0.0, 0.0}, lineColor = {128, 128, 128}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-30.0, -30.0}, {30.0, 30.0}}), Rectangle(origin = {0.0, 0.0}, fillColor = {239, 239, 239}, fillPattern = FillPattern.Solid, lineThickness = 1.25, extent = {{-100.0, 100.0}, {100.0, -100.0}}), Text(origin = {0.0, 130.0}, lineColor = {0, 0, 255}, extent = {{-150.0, 20.0}, {150.0, -20.0}}, textString = "%name", textColor = {0, 0, 255}), Bitmap(origin = {-0.7500000000000071, 3.75}, extent = {{-89.25, -86.25}, {89.25, 86.25}}, fileName = "modelica://PythonIO/Resources/Images/PythonFunction.svg")}));
      PythonIO.Communication.PythonFunction.PythonFunctionBase base(inputDims={{-1}},inputTypes={0},hasInput=true,period=period,outputDims={{-1}},outputTypes={0},hasOutput=true,pythonPath=pythonEnvPath,pythonFilePath="C:/Program Files/MWORKS/Sysplorer 2024b/Library/PythonIO 1.0/PythonIO/Resources/PythonTests",functionName="filter",moduleName="KalmanFilter") 
      annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={0.0, 0.0})));
      Modelica.Blocks.Interfaces.RealOutput output1 
      annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={110, 0})));
      ArrayConverter._V2A_1D_Real out_output1_converter(dims={1}) 
      annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={80, 0})));
      Modelica.Blocks.Interfaces.RealInput u 
      annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={-110, 0})));
      ArrayConverter._A2V_1D_Real in_u_converter(dims={1}) 
      annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={-80, 0})));
    equation
      connect(out_output1_converter.y[1], output1) 
      annotation(Line(origin={0,0}, 
      points={{110,0},{80,0}}, 
      color={255,0,0}));
      connect(base.outputs[1], out_output1_converter.u[1]) 
      annotation(Line(origin={0,0}, 
      points={{0,0},{80,0}}, 
      color={255,0,0}));
      connect(u, in_u_converter.u[1]) 
      annotation(Line(origin={0,0}, 
      points={{110,0},{80,0}}, 
      color={255,0,0}));
      connect(in_u_converter.y[1], base.inputs[1]) 
      annotation(Line(origin={0,0}, 
      points={{80,0},{0,0}}, 
      color={255,0,0}));

    end filter;
    model topsis
      extends PythonIO.Communication.PythonSampleBase;
      extends Interpreter;
      import Modelica;
      import PythonIO.Communication.PythonFunction;
      annotation(Icon(coordinateSystem(extent={{-100.0, -100.0}, {100.0, 100.0}},grid={2.0, 2.0}),graphics={Rectangle(origin = {0.0, 0.0}, lineColor = {200, 200, 200}, fillColor = {248, 248, 248}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 25.0), Rectangle(origin = {0.0, 0.0}, lineColor = {128, 128, 128}, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 25.0), Ellipse(origin = {0.0, 0.0}, lineColor = {128, 128, 128}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-30.0, -30.0}, {30.0, 30.0}}), Rectangle(origin = {0.0, 0.0}, fillColor = {239, 239, 239}, fillPattern = FillPattern.Solid, lineThickness = 1.25, extent = {{-100.0, 100.0}, {100.0, -100.0}}), Text(origin = {0.0, 130.0}, lineColor = {0, 0, 255}, extent = {{-150.0, 20.0}, {150.0, -20.0}}, textString = "%name", textColor = {0, 0, 255}), Bitmap(origin = {-0.7500000000000071, 3.75}, extent = {{-89.25, -86.25}, {89.25, 86.25}}, fileName = "modelica://PythonIO/Resources/Images/PythonFunction.svg")}));
      PythonIO.Communication.PythonFunction.PythonFunctionBase base(inputDims={{5}},inputTypes={0},hasInput=true,period=period,outputDims={{21}},outputTypes={0},hasOutput=true,pythonPath=pythonEnvPath,pythonFilePath="C:/Users/23021/Desktop/mworks_digital",functionName="topsis",moduleName="h_choose_numap") 
      annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={0.0, 0.0})));
      Modelica.Blocks.Interfaces.RealOutput output1[21] 
      annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={110, 0})));
      ArrayConverter._V2A_1D_Real out_output1_converter(dims={21}) 
      annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={80, 0})));
      Modelica.Blocks.Interfaces.RealInput new_variables[5] 
      annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={-110, 0})));
      ArrayConverter._A2V_1D_Real in_new_variables_converter(dims={5}) 
      annotation(Placement(transformation(extent={{-10.0, -10.0}, {10.0, 10.0}},origin={-80, 0})));
    equation
      connect(out_output1_converter.y, output1) 
      annotation(Line(origin={0,0}, 
      points={{110,0},{80,0}}, 
      color={255,0,0}));
      connect(base.outputs[1:21], out_output1_converter.u) 
      annotation(Line(origin={0,0}, 
      points={{0,0},{80,0}}, 
      color={255,0,0}));
      connect(new_variables, in_new_variables_converter.u) 
      annotation(Line(origin={0,0}, 
      points={{110,0},{80,0}}, 
      color={255,0,0}));
      connect(in_new_variables_converter.y, base.inputs[1:5]) 
      annotation(Line(origin={0,0}, 
      points={{80,0},{0,0}}, 
      color={255,0,0}));

    end topsis;
    end ImportedTypes;
  annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, 
grid={2,2})));
equation
  connect(continuousClock.y, random.new_variables[5]) 
  annotation(Line(origin={-41,-17}, 
  points={{-30.5,-18},{30,-18},{30,17}}, 
  color={0,0,127}));
  connect(step.y, random.new_variables[2]) 
  annotation(Line(origin={-41,38}, 
points={{-30.5,12},{30,12},{30,-38}}, 
color={0,0,127}));
  connect(step2.y, random.new_variables[3]) 
  annotation(Line(origin={-41,8}, 
  points={{-30.5,7},{30,7},{30,-8}}, 
  color={0,0,127}));
  connect(step1.y, random.new_variables[1]) 
  annotation(Line(origin={-41,38}, 
  points={{-30.5,38},{30,38},{30,-38}}, 
  color={0,0,127}));
  connect(step3.y, random.new_variables[4]) 
  annotation(Line(origin={-41,-5}, 
points={{-30.5,-5},{30,-5},{30,5}}, 
color={0,0,127}),__MWORKS(BlockSystem(NamedSignal)));
  end KalmanFilter_windows;