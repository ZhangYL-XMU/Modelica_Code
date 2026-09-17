package v4
  package Cfunc
    class MyTable
      extends ExternalObject;
      function constructor
        input Integer LogInfo = 0;
                input String FunAddress = loadResource("modelica://v4/Resources/Lib");
        output v4.Cfunc.MyTable table;
      external "C" table = bpnet_constructor_6aa906e2C6ODwM(LogInfo, FunAddress);
      annotation (
        Library = "bpnet_calllist_6aa906e2S26yDb",
        LibraryDirectory = "modelica://v4/Resources/Lib");
      end constructor;
      function destructor
        input v4.Cfunc.MyTable table;
      external "C" bpnet_Modelicadestructor_6aa906e2pH9Eqw(table);
      annotation (
        Library = "bpnet_calllist_6aa906e2S26yDb",
        LibraryDirectory = "modelica://v4/Resources/Lib");
      end destructor;
    end MyTable;
    function callc
      input v4.Cfunc.MyTable obj;
      input Integer length;
      input Real in_array[1];
      output Real out_array[2];
    external "C" bpnet_calllist_6aa906e2S26yDb(in_array, out_array, length, obj) 
      annotation (
        Library = "bpnet_calllist_6aa906e2S26yDb",
        LibraryDirectory = "modelica://v4/Resources/Lib");
    end callc;
  end Cfunc;

  package ROM
    model ROM_Basis
      parameter String FunAddress = loadResource("modelica://v4/Resources/Lib");
      v4.Cfunc.MyTable obj = v4.Cfunc.MyTable(0,FunAddress);
      parameter Integer input_length = 1;
      parameter Integer output_length = 2;
      Real input_array[input_length];
      Real output_array[output_length];

      Modelica.Blocks.Interfaces.RealInput ROM_IN[input_length] 
        annotation (Placement(transformation(origin = {-98.0, 7.399307280487209},
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Interfaces.RealOutput ROM_OUT[output_length] 
        annotation (Placement(transformation(origin = {100.00000000000003, 7.399307280487209},
          extent = {{-10.000000000000014, -10.000000000000002}, {10.0, 9.999999999999998}})));
      annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}},
        grid = {2.0, 2.0})),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}},
          grid = {2.0, 2.0}), graphics = {Rectangle(origin = {1.674766355140214, 7.745794392523365},
          fillColor = {255, 255, 255},
          fillPattern = FillPattern.Solid,
          extent = {{-88.76261682242992, 77.24859813084115}, {88.76261682242992, -77.24859813084115}}), Bitmap(origin = {0.13318649314047093, 7.399307280487232},
          extent = {{-78.5910144900306, -63.8124107760087}, {78.59101449003062, 63.81241077600866}},
          fileName = "modelica://v4/Resources/rom.svg")}));
    equation
      input_array = ROM_IN;
      output_array = v4.Cfunc.callc(obj,input_length,input_array);
      ROM_OUT = output_array;
    end ROM_Basis;
  end ROM;


end v4;