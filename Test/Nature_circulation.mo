within SFR.Test;
model Nature_circulation
  replaceable package Medium = SFR.Media.Sodium.ConstantSodim;
  TYThermoFluidSys.Pipelines.DistributePipe_Onephase distributePipe_Onephase(redeclare
      package                                                                                  Medium =
        Modelica.Media.Water.StandardWater,                                                                                                n=10,L_total=10,includeStaticHead=true,height_ab=10) 
    annotation (Placement(transformation(origin={-22.9292,10.5827},
extent={{-10,-10},{10,10}},
rotation=90)));
  TYThermoFluidSys.Volumes.ExpansionTank expansionTank(static_head=false,A=1,redeclare
      package                                                                                  Medium =
        Modelica.Media.Water.StandardWater) 
    annotation (Placement(transformation(origin={-12.3464,50.7087},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Blocks.Ramp ramp(height=80,duration=10,offset=293.15,startTime=100) 
    annotation (Placement(transformation(origin={-112.441,29.5433},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Add add 
    annotation (Placement(transformation(origin={-73.1969,10.5827},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Pipelines.DistributePipe_Onephase distributePipe_Onephase1(redeclare
      package                                                                                   Medium =
        Modelica.Media.Water.StandardWater,                                                                                                 n=10,L_total=10,includeStaticHead=true,height_ab=-10) 
    annotation (Placement(transformation(origin={-3.55271e-15,10.1417},
extent={{-10,-10},{10,10}},
rotation=270)));
  TYThermoFluidSys.Blocks.Ramp ramp1(height=-80,duration=10,offset=0,startTime=400) 
    annotation (Placement(transformation(origin={-110.678,-5.29136},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Add add1 
    annotation (Placement(transformation(origin={52.3306,9.55906},
extent={{-10,-10},{10,10}},
rotation=180)));
  TYThermoFluidSys.Blocks.Ramp ramp2(height=80,duration=10,offset=293.15,startTime=500) 
    annotation (Placement(transformation(origin={85.1019,29.1023},
extent={{-10,-10},{10,10}},
rotation=180)));
  TYThermoFluidSys.Blocks.Ramp ramp3(height=-80,duration=10,startTime=800) 
    annotation (Placement(transformation(origin={85.9838,-6.61419},
extent={{-10,-10},{10,10}},
rotation=180)));
  TYThermoFluidSys.Boundaries.BoundaryTemperature boundaryTemperature(use_T_in=true,n=10) 
    annotation (Placement(transformation(origin={-44.5355,10.5827},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Boundaries.BoundaryTemperature boundaryTemperature1(use_T_in=true,n=10) 
    annotation (Placement(transformation(origin={21.1654,10.1417},
extent={{10,-10},{-10,10}})));
equation
  connect(distributePipe_Onephase.portB, expansionTank.port_a) 
  annotation(Line(origin={-22,30},
points={{-0.9292,-9.4173},{-0.9292,10.7087},{4.65356,10.7087}},
color={0,127,255}));
  connect(ramp.y, add.u1) 
  annotation(Line(origin={-93,23},
  points={{-8.44051,6.54332},{-0.92126,6.54332},{-0.92126,-6.41733},{7.80313,-6.41733}},
  color={0,0,127}));
  connect(expansionTank.port_b, distributePipe_Onephase1.portA) 
  annotation(Line(origin={-3,30},
  points={{-3.94644,10.7087},{-3.94644,7.03937},{0.795276,7.03937},{0.795276,-9.85827},{3,-9.85827}},
  color={0,127,255}));
  connect(distributePipe_Onephase.portA, distributePipe_Onephase1.portB) 
  annotation(Line(origin={-11,-5},
  points={{-11.9292,5.5827},{-11.9292,-4.70079},{11,-4.70079},{11,5.14173}},
  color={0,127,255}));
  connect(ramp1.y, add.u2) 
  annotation(Line(origin={-92,0},
  points={{-7.67765,-5.29136},{-0.598425,-5.29136},{-0.598425,4.58267},{6.80313,4.58267}},
  color={0,0,127}));
  connect(add1.u2, ramp2.y) 
  annotation(Line(origin={65,17},
points={{-0.669361,-1.44094},{9.1019,-1.44094},{9.1019,12.1023}},
color={0,0,127}));
  connect(add1.u1, ramp3.y) 
  annotation(Line(origin={67,-1},
points={{-2.66936,4.55906},{3.55118,4.55906},{3.55118,-5.61419},{7.9838,-5.61419}},
color={0,0,127}));
  connect(add.y, boundaryTemperature.T_in) 
  annotation(Line(origin={-59,11},
  points={{-3.1969,-0.4173},{2.46452,-0.4173},{2.46452,-0.417319}},
  color={0,0,127}));
  connect(boundaryTemperature.port, distributePipe_Onephase.q) 
  annotation(Line(origin={-31,11},
  points={{-3.53548,-0.417319},{3.0708,-0.417319},{3.0708,-0.4173}},
  color={191,0,0}));
  connect(boundaryTemperature1.T_in, add1.y) 
  annotation(Line(origin={37,10},
  points={{-3.83465,0.141732},{4.33064,0.141732},{4.33064,-0.440945}},
  color={0,0,127}));
  connect(boundaryTemperature1.port, distributePipe_Onephase1.q) 
  annotation(Line(origin={8,10},
  points={{3.16535,0.141732},{-3,0.141732},{-3,0.1417}},
  color={191,0,0}));
  annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,NumberOfIntervals=1000,StartTime=0,StopTime=1000,Tolerance=0.0001),__MWORKS(ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=2,ContinueTimeVector)));
end Nature_circulation;

