within SFR.Stirling.MechanicalGas;
model test
  annotation(__MWORKS(version="26.2.0",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=20,ContinueTimeVector)),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.01,StartTime=0,StopTime=20,StoreEventValue=0,Tolerance=0.0001));
  t1.ROM.ROM_Basis rOM_Basis 
    annotation (Placement(transformation(origin={-2,1},
extent={{-12,-13},{12,13}})));
  Modelica.Blocks.Sources.Ramp ramp(

    duration=0,
    offset=0,height=10,startTime=10)   annotation (Placement(transformation(origin={-44,1.96191},
extent={{-10,-10},{10,10}})));
  equation
  connect(rOM_Basis.ROM_IN[1], ramp.y) 
  annotation(Line(origin={-23,2},
  points={{9.24,-0.0380901},{-10,-0.0380901}},
  color={0,0,127}));
  end test;