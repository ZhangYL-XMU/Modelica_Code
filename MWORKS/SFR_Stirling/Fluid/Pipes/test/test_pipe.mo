within SFR.Fluid.Pipes.test;
    model test_pipe
      annotation(__MWORKS(version="26.1.3"),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.01,StartTime=0,StopTime=100,StoreEventValue=0,Tolerance=0.0001));
      Modelica.Fluid.Sources.MassFlowSource_h boundary(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, m_flow=10, h=656775) 
        annotation(Placement(transformation(origin={-50,-2},
extent={{-10,-10},{10,10}})));
      Modelica.Fluid.Sources.Boundary_ph boundary1(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, p=9.999999999999999e5, h=656775) 
        annotation(Placement(transformation(origin={50,-2},
extent={{10,-10},{-10,10}})));
      pipe pipe1(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, n_pipe=5,height_ab=1) 
        annotation (Placement(transformation(origin={0,-1.98192},
extent={{-10,-10},{10,10}})));
      Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow(Q_flow=1e6) 
        annotation (Placement(transformation(origin={-22,38},
extent={{-10,-10},{10,10}})));
      TYThermoFluidSys.Sensors.SensorT TSensor1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
        annotation (Placement(transformation(origin={26,22},
extent={{-10,-10},{10,10}})));
      equation
      connect(boundary.ports[1], pipe1.portA) 
      annotation(Line(origin={-25,-2},
points={{-15,0},{15.02226,0}},
color={0,127,255}));
      connect(boundary1.ports[1], pipe1.portB) 
      annotation(Line(origin={25,-2},
points={{15,0},{-14.9778,0}},
color={0,127,255}));
      connect(fixedHeatFlow.port, pipe1.wall[1]) 
      annotation(Line(origin={-2,20},
points={{-10,18},{2,18},{2,-18.1819}},
color={191,0,0}));
      connect(TSensor1.port_a, pipe1.portB) 
      annotation(Line(origin={18,5},
      points={{8,7},{8,-1},{-4.9778,-1},{-4.9778,-6.9999955},{-7.9778,-6.9999955}},
      color={0,178,226}));
      end test_pipe;