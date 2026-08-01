within SFR.Test;
model volume_test
  TYThermoFluidSys.Volumes.OnephaseVolume volume(V=10,T_start=303.15,positiveFlow=false,initOpt=TYThermoFluidSys.Utilities.Types.InitOptions.steadyStateNoP) 
    annotation (Placement(transformation(origin={-1.14092,0.760608},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Boundaries.BoundaryMdot boundaryMdot(m_flow=100,T=363.15) 
    annotation (Placement(transformation(origin={-87.4703,22.8184}, extent=
            {{-10,-10},{10,10}})));
  TYThermoFluidSys.Boundaries.BoundaryMdot boundaryMdot1(m_flow=50,T=343.15) 
    annotation (Placement(transformation(origin={-84.8082,-19.7759}, extent=
            {{-10,-10},{10,10}})));
  TYThermoFluidSys.Boundaries.BoundaryPressure boundaryPressure 
    annotation (Placement(transformation(origin={52.8624,3.39728e-6},
extent={{10,-10},{-10,10}})));
  TYThermoFluidSys.Boundaries.BoundaryTemperature boundaryTemperature(T=323.15) 
    annotation (Placement(transformation(origin={-16.3531,43.3548},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Sensors.SensorT sensorT 
    annotation (Placement(transformation(origin={25.4804,11.4092},
extent={{-10,-10},{10,10}})));
  TYThermoFluidSys.Sensors.SensorT sensorT1 
    annotation (Placement(transformation(origin={-60.4685,33.8472}, extent=
            {{-10,-10},{10,10}})));
  TYThermoFluidSys.Sensors.SensorT sensorT2 
    annotation (Placement(transformation(origin={-59.3277,-34.2276}, extent=
            {{-10,10},{10,-10}})));
  TYThermoFluidSys.Junctions.Tjunction tjunction 
    annotation (Placement(transformation(origin={-31.7612,0.56412},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  TYThermals.HeatTransfers.HeatConductions.HeatConduction heatConduction 
    annotation (Placement(transformation(origin={13.8979,45.3722}, extent={
            {-10,-10},{10,10}})));
equation
  connect(volume.port_b, sensorT.port_a) 
  annotation(Line(origin={17,1},
  points={{-8.14092,-0.239392},{8.48044,-0.239392},{8.48044,0.409173}},
  color={0,127,255}));
  connect(boundaryPressure.fluidPort, sensorT.port_a) 
  annotation(Line(origin={35,1},
  points={{9.8624,-0.999997},{-9.51956,-0.999997},{-9.51956,0.409173}},
  color={0,127,255}));
  connect(boundaryMdot.fluidPort, sensorT1.port_a) 
  annotation(Line(origin={-45,23},
      points={{-34.4703,-0.181589},{-15.4685,-0.181589},{-15.4685,0.847228}},

      color={0,127,255}));
  connect(boundaryMdot1.fluidPort, sensorT2.port_a) 
  annotation(Line(origin={-42,-21},
      points={{-34.8082,1.22409},{-17.3277,1.22409},{-17.3277,-3.22757}},
      color={0,127,255}));
  connect(sensorT1.port_a, tjunction.port_2) 
  annotation(Line(origin={-48,17},
  points={{-12.4685,6.84723},{-12.4685,5.43803},{13.2388,5.43803},{13.2388,-6.43588}},
  color={0,127,255}));
  connect(sensorT2.port_a, tjunction.port_1) 
  annotation(Line(origin={-47,-17},
  points={{-12.3277,-7.22757},{12.2388,-7.22757},{12.2388,7.36412}},
  color={0,127,255}));
  connect(tjunction.port_3, volume.port_a) 
  annotation(Line(origin={-17,1},
  points={{-4.76117,-0.43588},{5.45908,-0.43588},{5.45908,-0.239392}},
  color={0,127,255}));
  connect(boundaryTemperature.port[1], heatConduction.port_a) 
  annotation(Line(origin={-1,44},
  points={{-5.3531,-0.6452},{5.89786,-0.6452},{5.89786,1.37223}},
  color={191,0,0}));
  connect(heatConduction.port_b, volume.q) 
  annotation(Line(origin={13,28},
  points={{9.89786,17.3722},{14.8979,17.3722},{14.8979,3.37223},{-14.14092,3.37223},{-14.14092,-17.2394}},
  color={191,0,0}));
end volume_test;

