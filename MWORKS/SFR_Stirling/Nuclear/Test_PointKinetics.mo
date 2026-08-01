within SFR.Nuclear;
model Test_PointKinetics
  PointKinetics kinetics(Teffref_fuel(displayUnit="K")=823.15,Teffref_coolant(displayUnit="K")=773.15,Sigmaf=3.6130E-03,alpha_fuel=-2.1e-4,alpha_coolant=-1.2e-3) 
    annotation (Placement(transformation(origin={8.5,17.7236}, extent={{-53.5,
            -50.2798},{53.5,50.27985}})));
  Modelica.Blocks.Sources.Constant const(k=773.15) 
    annotation (Placement(transformation(origin={-96,-20.3633}, extent={{-10,
            -10},{10,10}})));
  Modelica.Blocks.Sources.Constant const2(k=0) 
    annotation (Placement(transformation(origin={-96,29.4137}, extent={{-10,
            -10},{10,10}})));
  Modelica.Blocks.Sources.Constant const4(k=0) 
    annotation (Placement(transformation(origin={-42,106}, extent={{-10,-10},
            {10,10}})));
  Modelica.Blocks.Sources.Ramp ramp(offset=823.15,height=0,startTime=100,duration=20) 
    annotation (Placement(transformation(origin={-136,4.52517}, extent={{-10,
            -10},{10,10}})));
  Modelica.Blocks.Sources.Ramp ramp1(offset=0,height=-0.01,startTime=100,duration=20) 
    annotation (Placement(transformation(origin={-120,53.0452},
extent={{-10,-10},{10,10}})));
equation
  connect(const.y, kinetics.Teff_coolant) 
  annotation(Line(origin={-69,-21},
      points={{-16,0.636658},{18.7837,0.636658}},
      color={0,0,127}));
  connect(kinetics.Teff_fuel, ramp.y) 
  annotation(Line(origin={-72,0},
      points={{21.7837,4.52517},{-53,4.52517}},
      color={0,0,127}));
  connect(kinetics.Reactivity_Other, const2.y) 
  annotation(Line(origin={-68,29},
  points={{17.7837,0.413684},{-17,0.413684}},
  color={0,0,127}));
  connect(kinetics.Reactivity_CR, ramp1.y) 
  annotation(Line(origin={-68,53},
points={{17.7837,0.0452021},{-41,0.0452021}},
color={0,0,127}));
  connect(const4.y, kinetics.Q_in) 
  annotation(Line(origin={-12,90},
  points={{-19,16},{16,16},{16,-9.94058},{19.56375,-9.94058},{19.56375,-16.8429}},
  color={0,0,127}));

  annotation(__MWORKS(version="2025b"),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),
    experiment(
      Algorithm=Dassl,
      InlineIntegrator=false,
      InlineStepSize=false,
      NumberOfIntervals=500,
      StartTime=0,
      StopTime=500,
      StoreEventValue=0,
      Tolerance=0.0001));
end Test_PointKinetics;
