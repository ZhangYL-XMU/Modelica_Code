within SFR.Media.Utilities;
function h_T
  input Modelica.Units.SI.Temperature T;
  output Modelica.Units.SI.SpecificEnthalpy h;
algorithm
  h:=280995+2326*(0.389352*(1.8*T)-0.553995*10^(-4)*(1.8*T)^2+0.113726*10^(-7)*(1.8*T)^3-29.023);
end h_T;
