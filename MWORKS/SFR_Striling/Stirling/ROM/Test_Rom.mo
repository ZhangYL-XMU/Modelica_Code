model Test_Rom
  annotation(__MWORKS(version="26.6.0"),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})));
  v3Test.ROM.ROM_Basis rOM_Basis 
    annotation (Placement(transformation(origin={-46,9},
extent={{-22,-25},{22,25}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=747) 
    annotation (Placement(transformation(origin={-118,10.8498},
extent={{-10,-10},{10,10}})));
  equation
  connect(rOM_Basis.ROM_IN[1], realExpression.y) 
  annotation(Line(origin={-87,11},
  points={{19.44,-0.150173},{-20,-0.150173}},
  color={0,0,127}));
  end Test_Rom;