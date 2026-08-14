within SFR.Stirling.Gas_Dynamic;
model Gas_Static_test
  Modelica.Blocks.Sources.Ramp ramp(height=600,
    duration=3,                                 offset=273.15)
                  annotation (Placement(transformation(origin={-74,-6},
extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant const(k=273.15+20)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={52,-32})));
  Modelica.Blocks.Sources.Constant const1(k=120)
                                               annotation (Placement(transformation(origin={-60,42},
extent={{-10,-10},{10,10}},
rotation=360)));
  Gas_Static gas_static(
  d1 = 0.15,
  l_d = 0.1,
  d2 = 0.12,
  dc = 0.18,
  P1(fixed = true),
  n1(fixed = true),
  n2(fixed = true),
  nt(fixed = true),
  Vm1 = 0.00583,
  Vm2 = 0.00816,
  Uc = 800,
  Uf = 800,To=293.15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={6,0})));
  //Vm1 = 0.00583,
  //Vm2 = 0.00816,
equation
  connect(const1.y, gas_static.u)
    annotation (Line(origin={0,0},
points={{-49,42},{-12.2,42},{-12.2,6},{-8.2,6}},
color={0,0,127}));
  connect(const1.y, gas_static.u1) annotation (Line(origin={0,0},
points={{-49,42},{24,42},{24,6},{20,6}},
color={0,0,127}));
  connect(ramp.y, gas_static.u2)
    annotation (Line(origin={0,0},
points={{-63,-6},{-8,-6}},
color={0,0,127}));
  connect(const.y, gas_static.u3)
    annotation (Line(points={{52,-21},{52,-6},{20,-6}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.0001,StartTime=0,StopTime=10,StoreEventValue=0,Tolerance=0.0001),__MWORKS(ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=5,ContinueTimeVector)));
end Gas_Static_test;
