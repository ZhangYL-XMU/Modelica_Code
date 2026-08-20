within SFR.Media.Utilities;
function lambda_T
  input Modelica.Units.SI.Temperature T;
  output Modelica.Units.SI.ThermalConductivity lambda;
algorithm
  lambda:=1.72958*(54.306-1.878*10^(-2)*(1.8*Modelica.Units.Conversions.to_degC(T)+32)+2.0914*10^(-6)*(1.8*Modelica.Units.Conversions.to_degC(T)+32)^2);
end lambda_T;
