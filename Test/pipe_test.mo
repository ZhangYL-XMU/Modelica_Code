within SFR.Test;
model pipe_test
  TYThermoFluidSys.Pipelines.DistributePipe_Incompressible distributePipe_Incompressible(redeclare model DP = TYThermoFluidSys.Pipelines.Basic.DP_OnePhase.DarcyWeisbach,initOpt=TYThermoFluidSys.Utilities.Types.InitOptions.noInit,redeclare package Medium =
        Modelica.Media.Water.StandardWater,n=4) 
    annotation (Placement(transformation(origin={-9,6},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.Boundary_ph boundary(nPorts=1,redeclare package Medium =
        Modelica.Media.Water.StandardWater,                                                                          p=100000) 
    annotation (Placement(transformation(origin={34,6},
extent={{10,-10},{-10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_h boundary1(nPorts=1,m_flow=10,redeclare
      package                                                                            Medium =
        Modelica.Media.Water.StandardWater,                                                                                          use_m_flow_in=true) 
    annotation (Placement(transformation(origin={-52,5.9819},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Ramp ramp(offset=10,startTime=50,height=0,duration=5) 
    annotation (Placement(transformation(origin={-96,13.9819},
extent={{-10,-10},{10,10}})));
equation
  annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})));
  connect(boundary1.m_flow_in, ramp.y) 
  annotation(Line(origin={-16,80},
points={{-46,-66.0181},{-69,-66.0181}},
color={0,0,127}));
  connect(boundary1.ports[1], distributePipe_Incompressible.portA) 
  annotation(Line(origin={-34,6},
points={{-8,-0.0181},{15,0}},
color={0,127,255}));
  connect(distributePipe_Incompressible.portB, boundary.ports[1]) 
  annotation(Line(origin={9,6},
points={{-8,0},{15,0}},
color={0,178,226}));
end pipe_test;

