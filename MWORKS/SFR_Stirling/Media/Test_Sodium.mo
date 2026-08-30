within SFR.Media;
model Test_Sodium "校验 SFR.Media.Sodium.Sodium 介质：物性数值 + 焓/温度反演自检"
  import Modelica.Units.SI;
  replaceable package Medium = Media.Sodium.Sodium;

  parameter SI.Temperature T_par = 673.15 "校验温度（400 ℃）";
  parameter SI.Pressure p_par = 0.5e6 "校验压力";
  Medium.ThermodynamicState state_pT;
  Medium.ThermodynamicState state_ph;
  SI.SpecificEnthalpy h;
  SI.Density rho;
  SI.Density rho_ph;
  SI.Temperature T_ph;
  SI.SpecificHeatCapacity cp;
  SI.ThermalConductivity k;
  SI.DynamicViscosity mu;
  SI.SpecificEntropy s;
  SI.SpecificInternalEnergy u;
  Medium.IsobaricExpansionCoefficient beta;
  SI.VelocityOfSound a;
  SI.MolarMass MM;
equation
  state_pT = Medium.setState_pTX(p_par, T_par, {1.0});
  h = Medium.specificEnthalpy_pTX(p_par, T_par, {1.0});
  state_ph = Medium.setState_phX(p_par, h, {1.0});
  T_ph = Medium.temperature(state_ph);
  rho = Medium.density(state_pT);
  rho_ph = Medium.density(state_ph);
  cp = Medium.specificHeatCapacityCp(state_pT);
  k = Medium.thermalConductivity(state_pT);
  mu = Medium.dynamicViscosity(state_pT);
  s = Medium.specificEntropy(state_pT);
  u = Medium.specificInternalEnergy(state_pT);
  beta = Medium.isobaricExpansionCoefficient(state_pT);
  a = Medium.velocityOfSound(state_pT);
  MM = Medium.molarMass(state_pT);

  // 反演自检：由 h 反求 T 应回到 T_par
  assert(abs(T_ph - T_par) < 1e-6, "temperature_phX 反演失败");
  assert(abs(rho_ph - rho) < 1e-3, "density_phX 不一致");

  annotation(
    experiment(StartTime=0, StopTime=1, Tolerance=1e-6),
    Documentation(info="<html>
<p>校验模型：在 400 ℃/0.5 MPa 下求液态钠物性；并验证 setState_phX / temperature_phX 与
specificEnthalpy_pTX 的互逆性（T_ph 应回复 T_par）。</p>
</html>"));
end Test_Sodium;
