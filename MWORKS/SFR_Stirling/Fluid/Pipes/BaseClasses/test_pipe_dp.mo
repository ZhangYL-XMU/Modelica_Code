within SFR.Fluid.Pipes.BaseClasses;
model test_pipe_dp
  Flow1DFVbase_dp flow1DFVbase(redeclare package Medium = Modelica.Media.Water.StandardWater,  N=5,height_ab=-1) 
    annotation (Placement(transformation(origin={14,0.0181},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.Boundary_ph boundary(nPorts=1,redeclare package Medium =
        Modelica.Media.Water.StandardWater,                                                                          p(displayUnit="Pa")=100000,h=4.725e4) 
    annotation (Placement(transformation(origin={60,0},
extent={{10,-10},{-10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_h boundary1(nPorts=1,m_flow=10,redeclare
      package                                                                            Medium =
        Modelica.Media.Water.StandardWater,                                                                                          use_m_flow_in=true,h=4.725e4) 
    annotation (Placement(transformation(origin={-26,-0.0181},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Ramp ramp(offset=10,startTime=50,height=0,duration=5) 
    annotation (Placement(transformation(origin={-70,7.9819},
extent={{-10,-10},{10,10}})));
equation
  connect(flow1DFVbase.port_a, boundary1.ports[1]) 
  annotation(Line(origin={10,74},
points={{-5.97774,-74},{-26,-74.0181}},
color={0,127,255}));
  connect(flow1DFVbase.port_b, boundary.ports[1]) 
  annotation(Line(origin={10,74},
points={{14.0222,-74},{40,-74}},
color={0,127,255}));
  connect(boundary1.m_flow_in, ramp.y) 
  annotation(Line(origin={10,74},
points={{-46,-66.0181},{-69,-66.0181}},
color={0,0,127}));

  annotation(__MWORKS(version="2025b"),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,NumberOfIntervals=500,StartTime=0,StopTime=100,StoreEventValue=0,Tolerance=0.0001));
end test_pipe_dp;
