within SFR.Media.Functions;
function h_T_der "h_T 对时间的导数（解析）"
  input Modelica.Units.SI.Temperature T;
  input Real T_der "dT/dt";
  output Real h_der "dh/dt";
protected
  Real u;
algorithm
  u := 1.8*T - 491.67;
  h_der := 2326*1.8*(0.389352 - 2*0.553995e-4*u + 3*0.113726e-7*u^2)*T_der;
  annotation(Inline=true);
end h_T_der;
