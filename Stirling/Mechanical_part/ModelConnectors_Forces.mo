within SFR.Stirling.Mechanical_part;
model ModelConnectors_Forces
  import SI=Modelica.SIunits;
  extends Modelica.Mechanics.Translational.Interfaces.PartialCompliant;
  Modelica.Blocks.Interfaces.RealInput f_mt 
    annotation (Placement(transformation(origin={0,110},
extent={{-10,-10},{10,10}},
rotation=-90)));
equation
  f=-f_mt;


end ModelConnectors_Forces;