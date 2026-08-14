model py_h1
  annotation(__MWORKS(NUMAP(StartTime=0,StopTime=1e100),ContinueSimConfig(SaveContinueFile=true)),experiment(NumberOfIntervals=500,StartTime=0,StopTime=1),Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, 
grid={2,2})));
  Modelica.Blocks.Interfaces.RealInput T[20] 
    annotation (Placement(transformation(origin={-100,-90}, 
extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Interfaces.RealInput pin 
    annotation (Placement(transformation(origin={-100,90}, 
extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Interfaces.RealInput tin 
    annotation (Placement(transformation(origin={-100,50}, 
extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Interfaces.RealInput g 
    annotation (Placement(transformation(origin={-100,10}, 
extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Interfaces.RealInput q 
    annotation (Placement(transformation(origin={-100,-30}, 
extent={{-20,-20},{20,20}})));
  end py_h1;