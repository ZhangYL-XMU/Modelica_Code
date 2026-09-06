within SFR.Media.Functions;
function h_T
  "液态钠比焓 h(T) [J/kg]，过冷/饱和钠；基准 h0=(h00)sol=280.995 kJ/kg（固体钠标态参考焓），t 为摄氏温度"
  input Modelica.Units.SI.Temperature T;
  output Modelica.Units.SI.SpecificEnthalpy h;
protected
  Modelica.Units.NonSI.Temperature_degC t = Modelica.Units.Conversions.to_degC(T);
algorithm
  h:=280995+2326*(0.389352*(1.8*t)-0.553995*10^(-4)*(1.8*t)^2+0.113726*10^(-7)*(1.8*t)^3-29.023);
  annotation(Inline=true, derivative=h_T_der);
end h_T;