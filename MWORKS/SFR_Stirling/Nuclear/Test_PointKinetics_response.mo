within SFR.Nuclear;
model Test_PointKinetics_response
  "PointKinetics 组件特性测试：恒温(无反馈) + 控制棒反应性阶跃，观察功率响应（验证点堆动力学延迟中子行为）"
  annotation(__MWORKS(version="26.6.0"),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.1,StartTime=0,StopTime=500,StoreEventValue=0,Tolerance=0.0001));
  PointKinetics kinetics(Teffref_fuel(displayUnit="K")=823.15, Teffref_coolant(displayUnit="K")=773.15) 
    annotation (Placement(transformation(origin={50,20},
    extent={{-18,-20.5},{18,20.5}})));
  Modelica.Blocks.Sources.Constant const_fuel(k=823.15) 
    annotation (Placement(transformation(origin={-30,74},
    extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant const_cool(k=773.15) 
    annotation (Placement(transformation(origin={-30,34},
    extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant const_other(k=0) 
    annotation (Placement(transformation(origin={-30,-6},
    extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant const_qin(k=0) 
    annotation (Placement(transformation(origin={-30,-46},
    extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.TimeTable cr_table(table=[0,0; 49.9,0; 50,0.001; 199.9,0.001; 200,0; 299.9,0; 300,-0.001; 500,-0.001]) 
    annotation (Placement(transformation(origin={-30,110},
    extent={{-10,-10},{10,10}})));
equation
  connect(const_fuel.y, kinetics.Teff_fuel) 
    annotation(Line(points={{-20,74},{20,74},{20,27.5},{26,27.5}},
    color={0,0,127}));
  connect(const_cool.y, kinetics.Teff_coolant) 
    annotation(Line(points={{-20,34},{26,34}},
    color={0,0,127}));
  connect(const_other.y, kinetics.Reactivity_Other) 
    annotation(Line(points={{-20,-6},{32.979,-6},{32.979,12.5}},
    color={0,0,127}));
  connect(const_qin.y, kinetics.Q_in) 
    annotation(Line(points={{-20,-46},{50,-46},{50,-15.5}},
    color={0,0,127}));
  connect(cr_table.y, kinetics.Reactivity_CR) 
    annotation(Line(points={{-20,110},{32.979,110},{32.979,26.5}},
    color={0,0,127}));
end Test_PointKinetics_response;
