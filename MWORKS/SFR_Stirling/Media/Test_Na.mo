within SFR.Media;
model Test_Na
import Modelica.Units.SI;
  replaceable package Medium = Media.Sodium.ConstantPropertyLiquidSodium;

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

  annotation(
  experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,NumberOfIntervals=500,StartTime=0,StopTime=450,StoreEventValue=0,Tolerance=0.0001),__MWORKS(ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=0.9,ContinueTimeVector)));
equation
  //h = 4.725e4;
  h = Medium.specificEnthalpy_pTX(p,T,X);
  p = 1e5;
  //T = Medium.temperature_phX(p,h,X);//基础库和同元查询温度的方程不同,同元有X
  T = 560 + 273.15;
  X = {1.0};
  state = Medium.setState_phX(p,h,X);
  IE = Medium.specificInternalEnergy(state);
  rho = Medium.density(state);
  k = Medium.thermalConductivity(state);
  cp = Medium.specificHeatCapacityCp(state);
//  cv = Medium.specificHeatCapacityCv(state);
  lamda = Medium.dynamicViscosity(state);
//  R = Medium.data.R_s * Medium.data.MM;

end Test_Na;
