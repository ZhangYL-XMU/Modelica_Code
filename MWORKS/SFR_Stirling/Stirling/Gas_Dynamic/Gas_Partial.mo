within SFR.Stirling.Gas_Dynamic;
partial model Gas_Partial
  Modelica.Blocks.Interfaces.RealInput u 
    annotation (Placement(transformation(origin={60,142},
extent={{-20,-20},{20,20}},
rotation=-90)));
  Modelica.Blocks.Interfaces.RealInput u1 
    annotation (Placement(transformation(origin={60,-140},
extent={{-20,-20},{20,20}},
rotation=90)));
  Modelica.Blocks.Interfaces.RealOutput fo 
    annotation (Placement(transformation(origin={128,50},
extent={{-10,-10},{10,10}})));
  Modelica.Units.SI.Force f;
  Modelica.Units.SI.Force f1;
  Modelica.Blocks.Interfaces.RealInput u2 annotation (Placement(transformation(origin={-60,140},
extent={{-20,-20},{20,20}},
rotation=-90)));
  Modelica.Blocks.Interfaces.RealInput u3 annotation (Placement(transformation(origin={-60,-140},
extent={{-20,-20},{20,20}},
rotation=90)));
  Modelica.Blocks.Interfaces.RealOutput fo1 
    annotation (Placement(transformation(origin={128,-50},
extent={{-10,-10},{10,10}})));
equation
  fo = f;
  fo1 = f1;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Gas_Partial;