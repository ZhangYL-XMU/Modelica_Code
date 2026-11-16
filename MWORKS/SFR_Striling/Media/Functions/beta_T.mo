within SFR_Striling.Media.Functions;
function beta_T
  input Modelica.Units.SI.Temperature T;
  output Modelica.Units.SI.LinearExpansionCoefficient beta;
algorithm
  beta:=2.418*10^(-4)+7.385*10^(-8)+15.64*10^(-12)*Modelica.Units.Conversions.to_degC(T)^2;
end beta_T;