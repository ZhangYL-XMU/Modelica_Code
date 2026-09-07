within SFR_Striling.Media.Sodium;
package Sodium "液态钠介质（物性随温度变化，忽略压力影响；关联式见 SFR.Media.Functions）"
  extends Modelica.Media.Interfaces.PartialPureSubstance(
    final ThermoStates=Modelica.Media.Interfaces.Choices.IndependentVariables.ph,
    final singleState=true,
    mediumName="LiquidSodium");

  //-------------------------------------------------------------------------
  // 钠的基本物理常数（来源：题给数据 / ANL Golden & Tokar 钠物性关联式）
  //-------------------------------------------------------------------------
  constant Modelica.Units.SI.MolarMass MM_const=0.0229897693 "钠摩尔质量 [kg/mol]";
  constant Integer atomicNumber=11 "原子序数";
  constant Real neutronAbsorptionCrossSection_barn=0.53 "热中子吸收截面 [b]";
  constant Modelica.Units.SI.Temperature meltingPoint=370.97 "熔点（97.82 ℃）";
  constant Modelica.Units.SI.Temperature normalBoilingPoint=1154.55 "常压沸点（881.4 ℃）";
  constant Modelica.Units.SI.SpecificEnthalpy heatOfFusion=113.0436e3 "溶解热 [J/kg]";
  constant Modelica.Units.SI.SpecificEnthalpy h0_sol=280.995e3
    "(h00)sol：固体钠标态参考焓（相关性基准焓）[J/kg]";
  constant Modelica.Units.SI.VelocityOfSound a_const=2400
    "声速近似值 [m/s]（题给关联式未给出，按钠液声速量级取常值）";
  constant Modelica.Units.SI.Temperature T_min=371.15 "介质有效下限（高于熔点）";
  constant Modelica.Units.SI.Temperature T_max=1400 "介质有效上限 [K]";
  constant Modelica.Units.SI.Temperature T0=298.15 "熵参考温度（s(T0)=0）";

  constant Modelica.Media.Interfaces.Types.Basic.FluidConstants[nS] fluidConstants={
    FluidConstants(
      chemicalFormula="Na",
      structureFormula="Na",
      casRegistryNumber="7440-23-5",
      iupacName="sodium",
      molarMass=0.0229897693)};

  //-------------------------------------------------------------------------
  // 热力学状态记录（p, T 独立）
  //-------------------------------------------------------------------------
  redeclare record extends ThermodynamicState "Thermodynamic state"
    AbsolutePressure p "Absolute pressure of medium";
    Temperature T "Temperature of medium";
  end ThermodynamicState;

  //-------------------------------------------------------------------------
  // BaseProperties
  //-------------------------------------------------------------------------
  redeclare replaceable model extends BaseProperties(
    T(stateSelect=if preferredMediumStates then StateSelect.prefer else StateSelect.default),
    p(stateSelect=if preferredMediumStates then StateSelect.prefer else StateSelect.default))
    "Base properties of liquid sodium"
  equation
    assert(T >= T_min and T <= T_max, "
Temperature T (= " + String(T) + " K) is not
in the allowed range (" + String(T_min) + " K <= T <= " + String(T_max) + " K)
required from medium model \"" + mediumName + "\".
");
    T = temperature_phX(p, h, X);
    d = density_pTX(p, T, X);
    u = specificInternalEnergy(state);
    R_s = 0;
    MM = MM_const;
    state.T = T;
    state.p = p;
  end BaseProperties;

  //-------------------------------------------------------------------------
  // setState 函数族
  //-------------------------------------------------------------------------
  redeclare function setState_pTX
    "Return thermodynamic state from p, T, and X or Xi"
    extends Modelica.Icons.Function;
    input AbsolutePressure p "Pressure";
    input Temperature T "Temperature";
    input MassFraction X[:]=reference_X "Mass fractions";
    output ThermodynamicState state "Thermodynamic state record";
  algorithm
    state := ThermodynamicState(p=p, T=T);
    annotation(Inline=true);
  end setState_pTX;

  redeclare function setState_phX
    "Return thermodynamic state from p, h, and X or Xi"
    extends Modelica.Icons.Function;
    input AbsolutePressure p "Pressure";
    input SpecificEnthalpy h "Specific enthalpy";
    input MassFraction X[:]=reference_X "Mass fractions";
    output ThermodynamicState state "Thermodynamic state record";
  algorithm
    state := ThermodynamicState(p=p, T=temperature_phX(p, h, X));
    annotation(Inline=true);
  end setState_phX;

  redeclare function setState_psX
    "Return thermodynamic state from p, s, and X or Xi"
    extends Modelica.Icons.Function;
    input AbsolutePressure p "Pressure";
    input SpecificEntropy s "Specific entropy";
    input MassFraction X[:]=reference_X "Mass fractions";
    output ThermodynamicState state "Thermodynamic state record";
  algorithm
    state := ThermodynamicState(p=p, T=T_ps(s));
    annotation(Inline=true);
  end setState_psX;

  redeclare function setState_dTX
    "Return thermodynamic state from d, T, and X or Xi"
    extends Modelica.Icons.Function;
    input Density d "Density";
    input Temperature T "Temperature";
    input MassFraction X[:]=reference_X "Mass fractions";
    output ThermodynamicState state "Thermodynamic state record";
  algorithm
    assert(false,
      "Pressure can not be computed from temperature and density for an incompressible fluid!");
  end setState_dTX;

  redeclare function extends setSmoothState
    "Return thermodynamic state so that it smoothly approximates: if x > 0 then state_a else state_b"
  algorithm
    state := ThermodynamicState(p=Modelica.Media.Common.smoothStep(
        x,
        state_a.p,
        state_b.p,
        x_small), T=Modelica.Media.Common.smoothStep(
        x,
        state_a.T,
        state_b.T,
        x_small));
  end setSmoothState;

  //-------------------------------------------------------------------------
  // 属性函数
  //-------------------------------------------------------------------------
  redeclare function extends dynamicViscosity "Return dynamic viscosity"
  algorithm
    eta := Functions.eta_dT(Functions.d_T(state.T), state.T);
    annotation(Inline=true);
  end dynamicViscosity;

  redeclare function extends thermalConductivity "Return thermal conductivity"
  algorithm
    lambda := Functions.lambda_T(state.T);
    annotation(Inline=true);
  end thermalConductivity;

  redeclare function extends pressure "Return pressure"
  algorithm
    p := state.p;
    annotation(Inline=true);
  end pressure;

  redeclare function extends temperature "Return temperature"
  algorithm
    T := state.T;
    annotation(Inline=true);
  end temperature;

  redeclare function extends density "Return density"
  algorithm
    d := Functions.d_T(state.T);
    annotation(Inline=true);
  end density;

  redeclare function extends specificEnthalpy "Return specific enthalpy"
  algorithm
    h := Functions.h_T(state.T);
    annotation(Inline=true);
  end specificEnthalpy;

  redeclare function extends specificInternalEnergy
    "Return specific internal energy (incompressible limit: u = h - p_ref/d)"
  algorithm
    u := Functions.h_T(state.T) - reference_p/Functions.d_T(state.T);
    annotation(Inline=true);
  end specificInternalEnergy;

  redeclare function extends specificHeatCapacityCp
    "Return specific heat capacity at constant pressure"
  algorithm
    cp := Functions.cp_T(state.T);
    annotation(Inline=true);
  end specificHeatCapacityCp;

  redeclare function extends specificHeatCapacityCv
    "Return specific heat capacity at constant volume (incompressible limit: cv = cp)"
  algorithm
    cv := Functions.cp_T(state.T);
    annotation(Inline=true);
  end specificHeatCapacityCv;

  redeclare function extends isentropicExponent "Return isentropic exponent"
  algorithm
    gamma := 1.0;
  end isentropicExponent;

  redeclare function extends velocityOfSound "Return velocity of sound"
  algorithm
    a := a_const;
  end velocityOfSound;

  redeclare function extends specificEntropy
    "Return specific entropy (exact integral of cp(T)/T, s(T0)=0)"
  algorithm
    s := s_T(state.T);
    annotation(Inline=true);
  end specificEntropy;

  redeclare function extends specificGibbsEnergy
    "Return specific Gibbs energy"
  algorithm
    g := specificEnthalpy(state) - state.T*specificEntropy(state);
  end specificGibbsEnergy;

  redeclare function extends specificHelmholtzEnergy
    "Return specific Helmholtz energy"
  algorithm
    f := specificInternalEnergy(state) - state.T*specificEntropy(state);
  end specificHelmholtzEnergy;

  redeclare function extends isentropicEnthalpy "Return isentropic enthalpy"
  algorithm
    h_is := specificEnthalpy(refState);
  end isentropicEnthalpy;

  redeclare function extends isobaricExpansionCoefficient
    "Returns overall the isobaric expansion coefficient beta"
  algorithm
    beta := Functions.beta_T(state.T);
    annotation(Inline=true);
  end isobaricExpansionCoefficient;

  redeclare function extends isothermalCompressibility
    "Returns overall the isothermal compressibility factor"
  algorithm
    kappa := 0;
  end isothermalCompressibility;

  redeclare function extends density_derp_T
    "Returns the partial derivative of density with respect to pressure at constant temperature"
  algorithm
    ddpT := 0;
  end density_derp_T;

  redeclare function extends density_derT_p
    "Returns the partial derivative of density with respect to temperature at constant pressure"
  protected
    Real tC;
    Real u;
  algorithm
    tC := Modelica.Units.Conversions.to_degC(state.T);
    u := 1.8*tC + 32;
    ddTp := 16.0185*1.8*(-7.9504e-3 - 2*0.2872e-6*u + 3*0.603e-9*u^2);
    annotation(Inline=true);
  end density_derT_p;

  redeclare function extends density_derp_h
    "Return density derivative w.r.t. pressure at const specific enthalpy"
  algorithm
    ddph := 0;
  end density_derp_h;

  redeclare function extends density_derh_p
    "Return density derivative w.r.t. specific enthalpy at constant pressure"
  algorithm
    ddhp := density_derT_p(state)/max(Functions.cp_T(state.T), 1.0);
    annotation(Inline=true);
  end density_derh_p;

  redeclare function extends density_derX
    "Returns the partial derivative of density with respect to mass fractions at constant pressure and temperature"
  algorithm
    dddX := fill(0, nX);
  end density_derX;

  redeclare function extends molarMass "Return the molar mass of the medium"
  algorithm
    MM := MM_const;
  end molarMass;

  function specificInternalEnergy_derT_p
    "Return specific internalEnergy derivative w.r.t. temperature at const pressure"
    extends Modelica.Icons.Function;
    input ThermodynamicState state "Thermodynamic state record";
    output Real duTp "specific internalEnergy derivative w.r.t. temperature";
  algorithm
    duTp := Functions.cp_T(state.T);
    annotation(__MWORKS(version="2025a"));
  end specificInternalEnergy_derT_p;

  function specificInternalEnergy_derp_T
    "Return specific internalEnergy derivative w.r.t. pressure at const temperature"
    extends Modelica.Icons.Function;
    input ThermodynamicState state "Thermodynamic state record";
    output Real dupT "specific internalEnergy derivative w.r.t. pressure";
  algorithm
    dupT := 0;
    annotation(__MWORKS(version="2025a"));
  end specificInternalEnergy_derp_T;

  redeclare function specificEnthalpy_pTX
    "Return specific enthalpy from p, T, and X or Xi"
    extends Modelica.Icons.Function;
    input AbsolutePressure p "Pressure";
    input Temperature T "Temperature";
    input MassFraction X[nX] "Mass fractions";
    output SpecificEnthalpy h "Specific enthalpy";
  algorithm
    h := Functions.h_T(T);
    annotation(Inline=true, inverse(T=temperature_phX(p, h, X)));
  end specificEnthalpy_pTX;

  redeclare function temperature_phX
    "Return temperature from p, h, and X or Xi (analytic Cardano root of monotonic cubic)"
    extends Modelica.Icons.Function;
    input AbsolutePressure p "Pressure";
    input SpecificEnthalpy h "Specific enthalpy";
    input MassFraction X[nX] "Mass fractions";
    output Temperature T "Temperature";
  protected
    constant Real a=0.389352;
    constant Real b=0.553995e-4;
    constant Real c=0.113726e-7;
    constant Real H0=280995.0;
    constant Real K=2326.0;
    constant Real d0=29.023;
    Real p1;
    Real q1;
    Real r1;
    Real P1;
    Real Q1;
    Real D1;
    Real t1;
    Real t2;
    Real y1;
    Real y2;
    Real u;
  algorithm
    // c*u^3 - b*u^2 + a*u - (d0 + (h-H0)/K) = 0, u = 1.8*(T-273.15) (monotonic -> unique real root)
    p1 := -b/c;
    q1 :=  a/c;
    r1 := -(d0 + (h - H0)/K)/c;
    P1 := q1 - p1*p1/3;
    Q1 := 2*p1*p1*p1/27 - p1*q1/3 + r1;
    D1 := (Q1/2)*(Q1/2) + (P1/3)*(P1/3)*(P1/3);
    t1 := -Q1/2 + sqrt(D1);
    t2 := -Q1/2 - sqrt(D1);
    if t1 >= 0 then
      y1 := t1^(1/3);
    else
      y1 := -(-t1)^(1/3);
    end if;
    if t2 >= 0 then
      y2 := t2^(1/3);
    else
      y2 := -(-t2)^(1/3);
    end if;
    u := y1 + y2 - p1/3;
    T := max(T_min, min(T_max, 273.15 + u/1.8));
    annotation(derivative=temperature_phX_der);
  end temperature_phX;

  function temperature_phX_der "temperature_phX 的解析导数（黑盒函数导数标注）"
    extends Modelica.Icons.Function;
    input AbsolutePressure p "Pressure";
    input SpecificEnthalpy h "Specific enthalpy";
    input MassFraction X[nX] "Mass fractions";
    input Real p_der "dp/dt";
    input Real h_der "dh/dt";
    input Real X_der[nX] "dX/dt";
    output Real T_der "dT/dt";
  protected
    Temperature T;
  algorithm
    T := temperature_phX(p, h, X);
    T_der := h_der/max(Functions.cp_T(T), 1.0);
    annotation(Inline=true);
  end temperature_phX_der;

  redeclare function density_phX "Return density from p, h, and X or Xi"
    extends Modelica.Icons.Function;
    input AbsolutePressure p "Pressure";
    input SpecificEnthalpy h "Specific enthalpy";
    input MassFraction X[nX] "Mass fractions";
    output Density d "Density";
  algorithm
    d := Functions.d_T(temperature_phX(p, h, X));
    annotation(Inline=true);
  end density_phX;

  //-------------------------------------------------------------------------
  // 内部辅助函数：熵（对 cp/T 精确积分）与反演
  //-------------------------------------------------------------------------
  function s_T "液态钠比熵 s(T) [J/(kg.K)]，s(T0)=0，cp/T 精确积分"
    extends Modelica.Icons.Function;
    input Temperature T;
    output SpecificEntropy s;
  protected
    constant Real A=0.389352 "cp 多项式的常数项（对应 0.389352）";
    constant Real B=1.10599e-4*1.8 "cp 一次项系数 [1/K]";
    constant Real C=3.41178e-8*3.24 "cp 二次项系数 [1/K^2]";
    constant Real t0=273.15 "摄氏度零位";
    Real th;
  algorithm
    th := T - t0;
    s := 4186.8*(C*(th^2 - (T0 - t0)^2)/2
         - (B + C*t0)*(T - T0)
         + (A + B*t0 + C*t0^2)*Modelica.Math.log(T/T0));
    annotation(Inline=true);
  end s_T;

  function T_ps "由熵 s 反求温度 T（单调方程 Newton 迭代）"
    extends Modelica.Icons.Function;
    input SpecificEntropy s;
    output Temperature T;
  protected
    Real ds;
  algorithm
    T := max(T_min, T_min + (s - s_T(T_min))*T_min/max(Functions.cp_T(T_min), 1.0));
    T := min(T_max, T);
    for i in 1:30 loop
      ds := (s_T(T) - s)*T/max(Functions.cp_T(T), 1.0);
      T := T - ds;
      if T < T_min then
        T := T_min;
      elseif T > T_max then
        T := T_max;
      end if;
    end for;
  end T_ps;

  annotation (
    Documentation(info="<html>
<p><b>SFR.Media.Sodium.Sodium</b>：液态钠介质（单相液相、不可压缩，<b>物性仅随温度变化</b>），
基于 MSL <code>Modelica.Media.Interfaces.PartialPureSubstance</code>，
物性关联式全部来自 <code>SFR.Media.Functions</code>（ANL Golden&Tokar 钠物性关联式，t 为摄氏度）：</p>
<ol>
<li>密度（过冷/饱和）：&rho; = 16.0185(59.566 - 7.9504e-3(1.8t+32) - 0.2872e-6(1.8t+32)<sup>2</sup> + 0.603e-9(1.8t+32)<sup>3</sup>) [kg/m<sup>3</sup>]</li>
<li>比焓（过冷/饱和）：h = (h<sub>0</sub><sup>0</sup>)<sub>sol</sub> + 2326(0.389352(1.8t) - 0.553995e-4(1.8t)<sup>2</sup> + 0.113726e-7(1.8t)<sup>3</sup> - 29.023) [J/kg]，(h<sub>0</sub><sup>0</sup>)<sub>sol</sub> = 280.995 kJ/kg</li>
<li>热导率（过冷/饱和）：&lambda; = 1.72958(54.306 - 1.878e-2(1.8t+32) + 2.0914e-6(1.8t+32)<sup>2</sup>) [W/(m.K)]</li>
<li>定压比热：cp = 4186.8(0.389352 - 1.10599e-4(1.8t) + 3.41178e-8(1.8t)<sup>2</sup>) [J/(kg.K)]</li>
<li>动力粘度：&mu; = 0.1235&rho;<sup>1/3</sup>e<sup>697&rho;/T</sup> (T&lt;773K)；&mu; = 0.0851&rho;<sup>1/3</sup>e<sup>1040&rho;/T</sup> (T&ge;773K) [cP，&rho; 为 g/cm<sup>3</sup>，T 为 K]</li>
<li>体膨胀系数：&beta; = 2.418e-4 + 7.385e-8 + 15.64e-12 t<sup>2</sup> [1/K]（按题给形式）</li>
</ol>
<p><b>说明</b>：</p>
<ul>
<li>密度/焓/热导率/比热各式中 t 为<b>摄氏温度</b>；函数输入输出均为 SI，内部完成换算。</li>
<li>粘度关联式的 &rho; 为 <b>g/cm<sup>3</sup></b>、结果为 <b>cP</b>，函数内换算为 kg/m<sup>3</sup> 与 Pa.s。</li>
<li>介质取 <code>singleState=true</code>（u、d 与压力无关），按 MSL Incompressible.TableBased 约定
u = h - p_ref/d；等温压缩率取 0；声速取近似常值 2400 m/s（题给关联式未给出）。</li>
<li>熵由 cp(T)/T 解析积分（s(T0)=0），T 由 h、s 的 Newton 迭代反演（单调解，收敛可靠）。</li>
<li>适用范围：T_min=371.15 K（98℃，高于熔点）至 T_max=1400 K；应用范围需欠热液态。</li>
</ul>
</html>"));
end Sodium;