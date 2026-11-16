within SFR_Striling.Media.Functions;
function beta_T
  "液态钠体积膨胀系数 beta(T) [1/K]，t 为摄氏温度"
  input Modelica.Units.SI.Temperature T;
  output Modelica.Units.SI.LinearExpansionCoefficient beta;
protected
  Modelica.Units.NonSI.Temperature_degC t = Modelica.Units.Conversions.to_degC(T);
algorithm
  beta:=2.418*10^(-4)+7.385*10^(-8)*t+15.64*10^(-12)*t^2;
  annotation(Inline=true);
end beta_T;