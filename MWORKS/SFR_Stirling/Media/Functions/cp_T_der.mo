within SFR.Media.Functions;
function cp_T_der "cp_T 对时间的导数（解析）"
  input Modelica.Units.SI.Temperature T;
  input Real T_der "dT/dt";
  output Real cp_der "dcp/dt";
protected
  Real u;
algorithm
  u := 1.8*T - 491.67;
  cp_der := 4186.8*(-1.10599e-4 + 2*3.41178e-8*u)*1.8*T_der;
  annotation(Inline=true);
end cp_T_der;