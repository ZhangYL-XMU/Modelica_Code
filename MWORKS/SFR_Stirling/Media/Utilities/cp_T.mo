within SFR.Media.Utilities;
function cp_T
  input Modelica.Units.SI.Temperature T;
  output Modelica.Units.SI.SpecificHeatCapacity cp;
algorithm
  cp:=4186.8*(0.389352-1.10599*10^(-4)*1.8*T+3.41178*10^(-8)*(1.8*T)^2);
end cp_T;
