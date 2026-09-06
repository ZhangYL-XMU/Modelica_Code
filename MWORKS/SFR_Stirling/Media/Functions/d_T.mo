within SFR.Media.Functions;
function d_T
  "Liquid sodium density rho(T) [kg/m3]; ANL Golden&Tokar correlation (t in degree C)"
  input Modelica.Units.SI.Temperature T;
  output Modelica.Units.SI.Density d;
protected
  Modelica.Units.NonSI.Temperature_degC t = Modelica.Units.Conversions.to_degC(T);
algorithm
  d := 16.0185*(59.566-7.9504*10^(-3)*(1.8*t+32)-0.2872*10^(-6)*(1.8*t+32)^2+0.603*10^(-9)*(1.8*t+32)^3);
  annotation(Inline=true, derivative=d_T_der);
end d_T;