within SFR.Thermal.HeatExchange;
model CounterFlowPair
  "逆流配对器：交换两侧温度/热流向量顺序（移植自 TRANSFORM.HeatAndMassTransfer.BoundaryConditions.Heat.CounterFlow，纯 MSL 端口）"
  "注：Sysplorer 简单类名全局注册，与 TRANSFORM 同名类冲突，故类名取 CounterFlowPair"
  parameter Integer n=0 "连接的元件数";
  parameter Boolean counterCurrent=false "逆流时交换温度与热流向量顺序";
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a[n] "一次侧壁面（热端）" annotation(Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b[n] "二次侧壁面（冷端）" annotation(Placement(transformation(extent={{90,-10},{110,10}})));
equation
  if not counterCurrent then
    for i in 1:n loop
      port_a[i].Q_flow + port_b[i].Q_flow = 0;
      port_a[i].T = port_b[i].T;
    end for;
  else
    for i in 1:n loop
      port_a[n - (i - 1)].Q_flow + port_b[i].Q_flow = 0;
      port_a[n - (i - 1)].T = port_b[i].T;
    end for;
  end if;
  annotation (defaultComponentName="counterFlow",
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,60},{100,-60}}, lineColor={191,0,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid)}));
end CounterFlowPair;