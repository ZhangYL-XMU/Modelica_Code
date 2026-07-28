within SFR.Battary;
model ChargePack "电池包充放电"
  extends TABattery.Icons.Demos;
  Modelica.Electrical.Analog.Sources.ConstantCurrent constantCurrent(I = 2000) 
    annotation (Placement(transformation(origin={-2,-28},
extent={{14,-14},{-14,14}})));
  Modelica.Electrical.Analog.Basic.Ground ground 
    annotation (Placement(transformation(origin={70,-50},
extent={{-10,-10},{10,10}})));
  TABattery.PackModel.LiPack Pack(SOC0 = 0.8,
    Module_N_parall = 1, Module_N_series = 1,ChargeMax=1e5 * 3600) 
    annotation (Placement(transformation(origin={-6,22},
extent={{-10,-10},{10,10}})));
  annotation (Documentation(link="modelica://TABattery/Resource/Doc/Example/ChargePack.html"),
    Protection(access = Access.nonPackageDuplicate),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),
    experiment(Algorithm = Dassl, NumberOfIntervals = 500, StartTime = 0, StopTime = 100, Tolerance = 0.0001),
    __MWorks(ResultViewerManager(resultViewers = {
      ResultViewer(name = "res", executeTrigger = executeTrigger.SimulationFinished, commands = {
      CreatePlot(id = 2, position = [36, 6, 974, 774], y = ["Pack.v", "Pack1.v"], x_display_unit = "s", y_display_units = ["V", "V"], y_axis = [1, 1], legend_layout = 1, legend_frame = True, left_title = "[V]", fix_time_range = True, fix_time_range_value = 6.95243e-310),
      CreatePlot(id = 2, position = [36, 6, 974, 774], y = ["Pack.module[1, 1].meanT", "Pack1.module[1, 1].meanT", "Pack1.module[1, 2].meanT", "Pack1.module[2, 1].meanT"], x_display_unit = "s", y_display_units = ["degC", "degC", "degC", "degC"], y_axis = [1, 1, 1, 1], legend_layout = 1, legend_frame = True, left_title = "[degC]", fix_time_range = True, fix_time_range_value = 6.95243e-310, sub_plot = [2, 2]),
      CreatePlot(id = 2, position = [36, 6, 974, 774], y = ["Pack.SOC[1]", "Pack1.SOC[1]"], x_display_unit = "s", y_axis = [1, 1], legend_layout = 1, legend_frame = True, fix_time_range = True, fix_time_range_value = 6.95243e-310, sub_plot = [2, 1]),
      CreatePlot(id = 2, position = [36, 6, 974, 774], y = ["Pack.i", "Pack1.i"], x_display_unit = "s", y_display_units = ["A", "A"], y_axis = [1, 1], legend_layout = 1, legend_frame = True, left_title = "[A]", right_title = "[A]", fix_time_range = True, fix_time_range_value = 6.95243e-310, sub_plot = [1, 2])})})));
  equation
  connect(constantCurrent.p, ground.p) 
    annotation (Line(origin={34,-31},
points={{-22,3},{36,3},{36,-9}},
color={0,0,255}));
  connect(constantCurrent.n, Pack.pin_p) 
    annotation (Line(origin={-19,-3},
points={{3,-25},{-47,-25},{-47,24.8},{2,24.8}},
color={0,0,255}));
  connect(Pack.pin_n, constantCurrent.p) 
    annotation (Line(origin={16,-3},
points={{-11,25},{54,25},{54,-25},{-4,-25}},
color={0,0,255}));
  end ChargePack;
