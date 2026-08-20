within SFR.Media.Utilities;
function eta_dT
  input Modelica.Units.SI.Density d;
  input Modelica.Units.SI.Temperature T;
  output Modelica.Units.SI.DynamicViscosity eta;
algorithm
  if T<773 then eta:= 0.1235*(d*10^3)^(1/3)*exp(697*(d*10^3)/T);
  else eta:= 0.0851*(d*10^3)^(1/3)*exp(1040*(d*10^3)/T);
  end if;
end eta_dT;
