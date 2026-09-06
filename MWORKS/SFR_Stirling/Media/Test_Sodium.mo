within SFR.Media;
model Test_Sodium "校验 SFR.Media.Sodium.Sodium：与 Test_Na 完全同构的验证载体（仅 Medium 换为 Sodium）"
import Modelica.Units.SI;
  replaceable package Medium = Media.Sodium.Sodium;

  Medium.ThermodynamicState state;
  SI.Temperature T;
  SI.Pressure p;
  SI.SpecificEnthalpy h;
  SI.MassFraction X[1];
  Medium.SpecificInternalEnergy IE ;
  SI.Density rho;
  SI.ThermalConductivity k;
  SI.SpecificHeatCapacity cp;
//  SI.SpecificHeatCapacity cv;
  SI.DynamicViscosity lamda;
//  SI.SpecificHeatCapacity R;
  SI.Temperature T2 "反演自检：由 h 反求 T";

  annotation(
  experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,NumberOfIntervals=500,StartTime=0,StopTime=450,StoreEventValue=0,Tolerance=0.0001),__MWORKS(ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=0.9,ContinueTimeVector)));
equation
  h = Medium.specificEnthalpy_pTX(p,T,X);
  p = 1e5;
  T = 500 + 273.15;
  X = {1.0};
  state = Medium.setState_phX(p,h,X);
  IE = Medium.specificInternalEnergy(state);
  rho = Medium.density(state);
  k = Medium.thermalConductivity(state);
  cp = Medium.specificHeatCapacityCp(state);
  lamda = Medium.dynamicViscosity(state);
  T2 = Medium.temperature_phX(p,h,X);
  // 自检：由 h 反演的温度应回到 T=773.15 K（Cardano 反演闭合）
  assert(abs(T2 - T) < 1e-6, "Sodium temperature_phX 反演失败");

end Test_Sodium;
