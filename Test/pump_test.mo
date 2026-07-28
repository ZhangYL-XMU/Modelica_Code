within SFR.Test;
model pump_test
  TYThermoFluidSys.Machines.SuterPump suterPump(qvr=1,rho_r=968) 
    annotation (Placement(transformation(origin={0.380303,4.82173e-6},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Boundaries.BoundaryPressure boundaryPressure 
    annotation (Placement(transformation(origin={-61.9898,0.380285},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Boundaries.BoundaryPressure boundaryPressure1 
    annotation (Placement(transformation(origin={59.3276,-4.87267e-5},
extent={{10,-10},{-10,10}})));
  TYThermoFluidSys.Blocks.Ramp ramp(height=300,startTime=0,duration=200) 
    annotation (Placement(transformation(origin={-55.1442,53.6231},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Boundaries.BoundarySpeed boundarySpeed(use_w_in=true) 
    annotation (Placement(transformation(origin={-9.88794,54.3837},
extent={{-10,-10},{10,10}})));
equation
  connect(boundaryPressure.fluidPort, suterPump.port_a) 
  annotation(Line(origin={-21,0},
points={{-32.9898,0.380285},{12.1803,0.380285},{12.1803,4.82173e-6}},
color={0,127,255}));
  connect(suterPump.port_b, boundaryPressure1.fluidPort) 
  annotation(Line(origin={32,0},
points={{-21.2197,4.82173e-6},{19.3276,4.82173e-6},{19.3276,-4.87267e-5}},
color={0,127,255}));
  connect(boundarySpeed.flange, suterPump.flange_a) 
  annotation(Line(origin={11,41},
points={{-10.8879,13.3837},{-10.8879,-32},{-10.8197,-32}},
color={0,0,0}));
  connect(boundarySpeed.w_in, ramp.y) 
  annotation(Line(origin={-33,54},
  points={{11.11206,0.3837},{-11.1442,0.3837},{-11.1442,-0.37691}},
  color={0,0,127}));

end pump_test;

