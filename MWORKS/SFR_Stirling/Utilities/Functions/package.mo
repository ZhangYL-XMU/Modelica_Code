within SFR.Utilities;
package Functions
  extends Modelica.Icons.Package;
model Property_ph
  replaceable package Medium = TYMedia.Incompressible.LBE;
//输入
Medium.AbsolutePressure[N] p"节点压力";
Medium.SpecificEnthalpy[N] h "节点比焓";
//输出
Medium.ThermodynamicState[N] states;

equation
  for i in 1:Nf loop
    states[i] = Medium.setState_phX(p[i], h[i]);
    T[i] = Medium.temperature(states[i]);
    mu[i] = Medium.dynamicViscosity(states[i]);
    k[i] = Medium.thermalConductivity(states[i]);
    cp[i] = Medium.specificHeatCapacityCp(states[i]);
    Re[i] = noEvent(abs(m_flow * Dh / (A_cross * mu[i])));
    Pr[i] = cp[i] * mu[i] / k[i];
    Nu[i] = 5.5 + 0.0025 * (Re[i] * Pr[i]) ^ 0.8;
    gamma[i] = Nu[i] * k[i] / Dh;
  end for;

end Property_ph;
end Functions;
