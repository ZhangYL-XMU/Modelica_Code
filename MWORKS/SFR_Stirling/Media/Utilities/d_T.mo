within SFR.Media.Utilities;
function d_T
  input Modelica.Units.SI.Temperature T;
  output Modelica.Units.SI.Density d;
algorithm
  d := 16.0185*(59.566-7.9504*10^(-3)*(1.8*T+32)-0.2872*10^(-6)*(1.8*T+32)^2+0.603*10^(-9)*(1.8*T+32)^3);
end d_T;
