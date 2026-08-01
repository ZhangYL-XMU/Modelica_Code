within SFR.Thermal.HeatExchange;
model HE1
  annotation(__MWORKS(version="26.1.3",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=100,ContinueTimeVector)),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.01,StartTime=0,StopTime=100,StoreEventValue=0,Tolerance=0.0001));
  TYThermoFluidSys.Thermal.TubeWall tubeWall(N=4,r_inner(displayUnit="mm")=0.0136,r_outer(displayUnit="mm")=0.016,length=2,T_reference=fill(273.15+440,4),exposeState_a=true,exposeState_b=true,T_start=fill(298.15+440, 4)) 
    annotation (Placement(transformation(origin={7.10543e-15,-8},
extent={{-10,-10},{10,10}},
rotation=90)));
  SFR.Fluid.Pipes.pipe shell(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, L_total=2, Dh(displayUnit="mm")=0.016, n_pipe=360) 
    annotation (Placement(transformation(origin={7.10543e-15,-62},
extent={{-10,-10},{10,10}})));
  SFR.Fluid.Pipes.pipe tube(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, N=5, L_total=2, n_pipe=360, Dh(displayUnit="mm")=0.0136) 
    annotation (Placement(transformation(origin={7.10543e-15,59.9819},
extent={{-10,-10},{10,10}},
rotation=180)));
  Modelica.Fluid.Interfaces.FluidPort_a tube_in 
    annotation (Placement(transformation(origin={102,59.9819},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b tube_out 
    annotation (Placement(transformation(origin={-102,59.9819},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Interfaces.FluidPort_a shell_in 
    annotation (Placement(transformation(origin={-102,-62.0181},
extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b shell_out 
    annotation (Placement(transformation(origin={102,-62.0181},
extent={{-10,-10},{10,10}})));
  TRANSFORM.HeatAndMassTransfer.BoundaryConditions.Heat.CounterFlow counterFlow(n=4, counterCurrent=true) 
    annotation (Placement(transformation(origin={7.10543e-15,29.4864},
extent={{-10,-10},{10,10}},
rotation=90)));
  equation
  connect(tube.portB, tube_out) 
  annotation(Line(origin={-56,60},
points={{45.9778,-2.45e-5},{-46,-0.0181}},
color={0,127,255}));
  connect(tube.portA, tube_in) 
  annotation(Line(origin={54,60},
points={{-44.0223,-2.45e-5},{48,-0.0181}},
color={0,127,255}));
  connect(shell.portB, shell_out) 
  annotation(Line(origin={56,-62},
points={{-45.9778,-0.0180755},{46,-0.0181}},
color={0,127,255}));
  connect(shell.portA, shell_in) 
  annotation(Line(origin={-56,-62},
points={{46.02226,-0.0180755},{-46,-0.0181}},
color={0,127,255}));
  connect(counterFlow.port_b, tube.wall) 
  annotation(Line(origin={0,51},
points={{7.10543e-15,-11.5136},{7.10543e-15,5.1819}},
color={191,0,0}));
  connect(counterFlow.port_a, tubeWall.port_b) 
  annotation(Line(origin={0,17},
points={{7.10543e-15,2.4864},{7.10543e-15,-15}},
color={191,0,0}));
  connect(tubeWall.port_a, shell.wall) 
  annotation(Line(origin={0,-38},
  points={{7.10543e-15,20},{7.10543e-15,-20.2}},
  color={191,0,0}));
  end HE1;
