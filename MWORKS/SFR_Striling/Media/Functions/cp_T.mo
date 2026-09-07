within SFR_Striling.Media.Functions;
function cp_T
  "液态钠定压比热 cp(T) [J/(kg.K)]，t 为摄氏温度"
  input Modelica.Units.SI.Temperature T;
  output Modelica.Units.SI.SpecificHeatCapacity cp;
protected
  Modelica.Units.NonSI.Temperature_degC t = Modelica.Units.Conversions.to_degC(T);
algorithm
  cp:=4186.8*(0.389352-1.10599*10^(-4)*1.8*t+3.41178*10^(-8)*(1.8*t)^2);
  annotation(Inline=true, derivative=cp_T_der);
end cp_T;