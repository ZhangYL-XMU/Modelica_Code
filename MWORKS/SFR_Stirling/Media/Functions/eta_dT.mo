within SFR.Media.Functions;
function eta_dT
  "液态钠动力粘度 eta(ρ,T) [Pa.s]；关联式以 rho[g/cm3]、mu[cP] 书写（eta[cP]=0.1235*rho^(1/3)*exp(697*rho/T)，T[K]），此处换算为 SI"
  input Modelica.Units.SI.Density d;
  input Modelica.Units.SI.Temperature T;
  output Modelica.Units.SI.DynamicViscosity eta;
protected
  Real rho_gcm3;
algorithm
  rho_gcm3 := d*1e-3;
  if T<773 then eta := 1e-3*0.1235*(rho_gcm3)^(1/3)*exp(697*rho_gcm3/T);
  else eta := 1e-3*0.0851*(rho_gcm3)^(1/3)*exp(1040*rho_gcm3/T);
  end if;
  annotation(Inline=true);
end eta_dT;