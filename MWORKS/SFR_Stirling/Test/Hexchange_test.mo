within SFR.Test;
model Hexchange_test
  TYThermoFluidSys.Blocks.Step step1(height=-50,offset=363.15,startTime=100) 
    annotation (Placement(transformation(origin={92.8123,42.9944}, extent={
            {10,-10},{-10,10}})));
  Thermal.HeatExchange.HeatExchanger heatExchanger(L=10,D=0.1,rhow=1000,cmw=1000,k=100000,width=0.01,hight=0.01) 
    annotation (Placement(transformation(origin={7.26846e-6,0.525202}, extent=
            {{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium =
        Modelica.Media.Water.StandardWater,                                                                      nPorts=1,T=363.15,m_flow=1000) 
    annotation (Placement(transformation(origin={-47.2684,-48.5815}, extent=
            {{-10,-10},{10,10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium =
        Modelica.Media.Water.StandardWater,                                                                  nPorts=1) 
    annotation (Placement(transformation(origin={51.4701,-40.966}, extent={
            {10,-10},{-10,10}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary2(redeclare package Medium =
        Modelica.Media.Water.StandardWater,                                                                       nPorts=1,T=313.15,use_m_flow_in=true) 
    annotation (Placement(transformation(origin={49.6318,34.6635}, extent={
            {10,-10},{-10,10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary3(nPorts=1,redeclare package Medium =
        Modelica.Media.Water.StandardWater) 
    annotation (Placement(transformation(origin={-49.8734,32.8464}, extent=
            {{-10,-10},{10,10}})));
equation
  connect(boundary.ports[1], heatExchanger.coldIn) 
  annotation(Line(origin={-21,-8},
      points={{-16.2684,-40.5815},{-0.0293011,-40.5815},{-0.0293011,3.5252},
          {11,3.5252}},
      color={0,127,255}));
  connect(heatExchanger.coldOut, boundary1.ports[1]) 
  annotation(Line(origin={27,-6},
      points={{-17,1.5252},{14.4701,1.5252},{14.4701,-34.966}},
      color={0,127,255}));
  connect(heatExchanger.hotIn, boundary2.ports[1]) 
  annotation(Line(origin={18,7},
      points={{-7.99999,-1.6748},{21.6318,-1.6748},{21.6318,27.6635}},
      color={0,127,255}));
  connect(boundary3.ports[1], heatExchanger.hotOut) 
  annotation(Line(origin={-25,19},
  points={{-14.8734,13.8464},{6.09261,13.8464},{6.09261,-13.6748},{15,-13.6748}},
  color={0,127,255}));
  connect(boundary2.m_flow_in, step1.y) 
  annotation(Line(origin={67,43},
      points={{-7.3682,-0.3365},{14.8123,-0.3365},{14.8123,-0.0056129}},
      color={0,0,127}));
  annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, grid={
            2,2})),
    experiment(
      Algorithm=Dassl,
      InlineIntegrator=false,
      InlineStepSize=false,
      NumberOfIntervals=1000,
      StartTime=0,
      StopTime=1000,
      Tolerance=0.0001),
    __MWORKS(ContinueSimConfig(
        SaveContinueFile="false",
        SaveBeforeStop="false",
        NumberBeforeStop=1,
        FixedContinueInterval="false",
        ContinueIntervalLength=1000,
        ContinueTimeVector)));
end Hexchange_test;
