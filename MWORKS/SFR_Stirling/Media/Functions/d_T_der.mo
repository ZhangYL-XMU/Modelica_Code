within SFR.Media.Functions;
function d_T_der "d_T 对时间的导数（解析）"
  input Modelica.Units.SI.Temperature T;
  input Real T_der "dT/dt";
  output Real d_der "dd/dt";
protected
  Real u;
algorithm
  u := 1.8*T - 459.67;
  d_der := 16.0185*1.8*(-7.9504e-3 - 2*0.2872e-6*u + 3*0.603e-9*u^2)*T_der;
  annotation(Inline=true);
end d_T_der;