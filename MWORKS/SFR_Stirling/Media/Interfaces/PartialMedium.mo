within SFR.Media.Interfaces;
  partial package PartialMedium
    "Partial medium properties (base package of all media packages)"
    extends Modelica.Media.Interfaces.Types;
    extends Modelica.Icons.MaterialPropertiesPackage;

    // Constants to be set in Medium
    constant Modelica.Media.Interfaces.Choices.IndependentVariables 
      ThermoStates "Enumeration type for independent variables";
    constant String mediumName="unusablePartialMedium" "Name of the medium";
    constant String substanceNames[:]={mediumName}
      "Names of the mixture substances. Set substanceNames={mediumName} if only one substance.";
    constant String extraPropertiesNames[:]=fill("", 0)
      "Names of the additional (extra) transported properties. Set extraPropertiesNames=fill(\"\",0) if unused";
    constant Boolean singleState
      "= true, if u and d are not a function of pressure";
    constant Boolean reducedX=true
      "= true if medium contains the equation sum(X) = 1.0; set reducedX=true if only one substance (see docu for details)";
    constant Boolean fixedX=false
      "= true if medium contains the equation X = reference_X";
    constant Modelica.Media.Interfaces.Types.AbsolutePressure reference_p=101325
      "Reference pressure of Medium: default 1 atmosphere";
    constant Modelica.Media.Interfaces.Types.Temperature reference_T=298.15
      "Reference temperature of Medium: default 25 deg Celsius";
    constant Modelica.Media.Interfaces.Types.MassFraction reference_X[nX]=fill(1/nX, nX)
      "Default mass fractions of medium";
    constant Modelica.Media.Interfaces.Types.AbsolutePressure p_default=101325
      "Default value for pressure of medium (for initialization)";
    constant Modelica.Media.Interfaces.Types.Temperature T_default=Modelica.Units.Conversions.from_degC(20)
      "Default value for temperature of medium (for initialization)";
    constant Modelica.Media.Interfaces.Types.SpecificEnthalpy h_default=specificEnthalpy_pTX(
            p_default,
            T_default,
            X_default)
      "Default value for specific enthalpy of medium (for initialization)";
    constant Modelica.Media.Interfaces.Types.MassFraction X_default[nX]=reference_X
      "Default value for mass fractions of medium (for initialization)";
    constant Modelica.Media.Interfaces.Types.ExtraProperty C_default[nC]=fill(0, nC)
      "Default value for trace substances of medium (for initialization)";

    final constant Integer nS=size(substanceNames, 1) "Number of substances";
    constant Integer nX=nS "Number of mass fractions";
    constant Integer nXi=if fixedX then 0 else if reducedX then nS - 1 else nS
      "Number of structurally independent mass fractions (see docu for details)";

    final constant Integer nC=size(extraPropertiesNames, 1)
      "Number of extra (outside of standard mass-balance) transported properties";
    constant Real C_nominal[nC](min=fill(Modelica.Constants.eps, nC)) = 1.0e-6*
      ones(nC) "Default for the nominal values for the extra properties";
    replaceable record FluidConstants =
        Modelica.Media.Interfaces.Types.Basic.FluidConstants
      "Critical, triple, molecular and other standard data of fluid";

    replaceable record ThermodynamicState
      "Minimal variable set that is available as input argument to every medium function"
      extends Modelica.Icons.Record;
    end ThermodynamicState;

    replaceable partial model BaseProperties
      "Base properties (p, d, T, h, u, R_s, MM and, if applicable, X and Xi) of a medium"
      InputAbsolutePressure p "Absolute pressure of medium";
      InputMassFraction[nXi] Xi(start=reference_X[1:nXi])
        "Structurally independent mass fractions";
      InputSpecificEnthalpy h "Specific enthalpy of medium";
      Modelica.Media.Interfaces.Types.Density d "Density of medium";
      Modelica.Media.Interfaces.Types.Temperature T "Temperature of medium";
      Modelica.Media.Interfaces.Types.MassFraction[nX] X(start=reference_X)
        "Mass fractions (= (component mass)/total mass  m_i/m)";
      Modelica.Media.Interfaces.Types.SpecificInternalEnergy u "Specific internal energy of medium";
      Modelica.Media.Interfaces.Types.SpecificHeatCapacity R_s "Gas constant (of mixture if applicable)";
      Modelica.Media.Interfaces.Types.MolarMass MM "Molar mass (of mixture or single fluid)";
      ThermodynamicState state
        "Thermodynamic state record for optional functions";
      parameter Boolean preferredMediumStates=false
        "= true if StateSelect.prefer shall be used for the independent property variables of the medium" 
        annotation (Evaluate=true, Dialog(tab="Advanced"));
      parameter Boolean standardOrderComponents=true
        "If true, and reducedX = true, the last element of X will be computed from the other ones";
      Modelica.Units.NonSI.Temperature_degC T_degC=
          Modelica.Units.Conversions.to_degC(T)
        "Temperature of medium in [degC]";
      Modelica.Units.NonSI.Pressure_bar p_bar=
          Modelica.Units.Conversions.to_bar(p)
        "Absolute pressure of medium in [bar]";

      // Local connector definition, used for equation balancing check
      connector InputAbsolutePressure = input
          Modelica.Units.SI.AbsolutePressure
        "Pressure as input signal connector";
      connector InputSpecificEnthalpy = input
          Modelica.Units.SI.SpecificEnthalpy
        "Specific enthalpy as input signal connector";
      connector InputMassFraction = input Modelica.Units.SI.MassFraction
        "Mass fraction as input signal connector";

    equation
      if standardOrderComponents then
        Xi = X[1:nXi];

        if fixedX then
          X = reference_X;
        end if;
        if reducedX and not fixedX then
          X[nX] = 1 - sum(Xi);
        end if;
        for i in 1:nX loop
          assert(X[i] >= -1.e-5 and X[i] <= 1 + 1.e-5, "Mass fraction X[" +
            String(i) + "] = " + String(X[i]) + "of substance " +
            substanceNames[i] + "\nof medium " + mediumName +
            " is not in the range 0..1");
        end for;

      end if;

      assert(p >= 0.0, "Pressure (= " + String(p) + " Pa) of medium \"" +
        mediumName + "\" is negative\n(Temperature = " + String(T) + " K)");
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}), Text(
              extent={{-152,164},{152,102}},
              textString="%name",
              textColor={0,0,255})}), Documentation(info="<html>
<p>
Model <strong>BaseProperties</strong> is a model within package <strong>PartialMedium</strong>
and contains the <strong>declarations</strong> of the minimum number of
variables that every medium model is supposed to support.
A specific medium inherits from model <strong>BaseProperties</strong> and provides
the equations for the basic properties.</p>
<p>
The BaseProperties model contains the following <strong>7+nXi variables</strong>
(nXi is the number of independent mass fractions defined in package
PartialMedium):
</p>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
<tr><td><strong>Variable</strong></td>
    <td><strong>Unit</strong></td>
    <td><strong>Description</strong></td></tr>
<tr><td>T</td>
    <td>K</td>
    <td>Temperature</td></tr>
<tr><td>p</td>
    <td>Pa</td>
    <td>Absolute pressure</td></tr>
<tr><td>d</td>
    <td>kg/m3</td>
    <td>Density</td></tr>
<tr><td>h</td>
    <td>J/kg</td>
    <td>Specific enthalpy</td></tr>
<tr><td>u</td>
    <td>J/kg</td>
    <td>Specific internal energy</td></tr>
<tr><td>Xi[nXi]</td>
    <td>kg/kg</td>
    <td>Structurally independent mass fractions</td></tr>
<tr><td>R_s</td>
    <td>J/(kg.K)</td>
    <td>Specific gas constant (of mixture if applicable)</td></tr>
<tr><td>MM</td>
    <td>kg/mol</td>
    <td>Molar mass</td></tr>
</table>
<p>
In order to implement an actual medium model, one can extend from this
base model and add <strong>5 equations</strong> that provide relations among
these variables. Equations will also have to be added in order to
set all the variables within the ThermodynamicState record state.</p>
<p>
If standardOrderComponents=true, the full composition vector X[nX]
is determined by the equations contained in this base class, depending
on the independent mass fraction vector Xi[nXi].</p>
<p>Additional <strong>2 + nXi</strong> equations will have to be provided
when using the BaseProperties model, in order to fully specify the
thermodynamic conditions. The input connector qualifier applied to
p, h, and nXi indirectly declares the number of missing equations,
permitting advanced equation balance checking by Modelica tools.
Please note that this doesn't mean that the additional equations
should be connection equations, nor that exactly those variables
should be supplied, in order to complete the model.
For further information, see the <a href=\"modelica://Modelica.Media.UsersGuide\">Modelica.Media User's guide</a>, and
<a href=\"https://specification.modelica.org/v3.4/Ch4.html#balanced-models\">Section 4.7 (Balanced Models) of the Modelica 3.4 specification</a>.</p>
</html>"));
    end BaseProperties;

    replaceable partial function setState_pTX
      "Return thermodynamic state as function of p, T and composition X or Xi"
      extends Modelica.Icons.Function;
      input Modelica.Media.Interfaces.Types.AbsolutePressure p "Pressure";
      input Modelica.Media.Interfaces.Types.Temperature T "Temperature";
      input Modelica.Media.Interfaces.Types.MassFraction X[:]=reference_X "Mass fractions";
      output ThermodynamicState state "Thermodynamic state record";
    end setState_pTX;

    replaceable partial function setState_phX
      "Return thermodynamic state as function of p, h and composition X or Xi"
      extends Modelica.Icons.Function;
      input Modelica.Media.Interfaces.Types.AbsolutePressure p "Pressure";
      input Modelica.Media.Interfaces.Types.SpecificEnthalpy h "Specific enthalpy";
      input Modelica.Media.Interfaces.Types.MassFraction X[:]=reference_X "Mass fractions";
      output ThermodynamicState state "Thermodynamic state record";
    end setState_phX;

    replaceable partial function setState_psX
      "Return thermodynamic state as function of p, s and composition X or Xi"
      extends Modelica.Icons.Function;
      input Modelica.Media.Interfaces.Types.AbsolutePressure p "Pressure";
      input Modelica.Media.Interfaces.Types.SpecificEntropy s "Specific entropy";
      input Modelica.Media.Interfaces.Types.MassFraction X[:]=reference_X "Mass fractions";
      output ThermodynamicState state "Thermodynamic state record";
    end setState_psX;

    replaceable partial function setState_dTX
      "Return thermodynamic state as function of d, T and composition X or Xi"
      extends Modelica.Icons.Function;
      input Modelica.Media.Interfaces.Types.Density d "Density";
      input Modelica.Media.Interfaces.Types.Temperature T "Temperature";
      input Modelica.Media.Interfaces.Types.MassFraction X[:]=reference_X "Mass fractions";
      output ThermodynamicState state "Thermodynamic state record";
    end setState_dTX;

    replaceable partial function setSmoothState
      "Return thermodynamic state so that it smoothly approximates: if x > 0 then state_a else state_b"
      extends Modelica.Icons.Function;
      input Real x "m_flow or dp";
      input ThermodynamicState state_a "Thermodynamic state if x > 0";
      input ThermodynamicState state_b "Thermodynamic state if x < 0";
      input Real x_small(min=0)
        "Smooth transition in the region -x_small < x < x_small";
      output ThermodynamicState state
        "Smooth thermodynamic state for all x (continuous and differentiable)";
      annotation (Documentation(info="<html>
<p>
This function is used to approximate the equation
</p>
<blockquote><pre>
state = <strong>if</strong> x &gt; 0 <strong>then</strong> state_a <strong>else</strong> state_b;
</pre></blockquote>

<p>
by a smooth characteristic, so that the expression is continuous and differentiable:
</p>

<blockquote><pre>
state := <strong>smooth</strong>(1, <strong>if</strong> x &gt;  x_small <strong>then</strong> state_a <strong>else</strong>
                 <strong>if</strong> x &lt; -x_small <strong>then</strong> state_b <strong>else</strong> f(state_a, state_b));
</pre></blockquote>

<p>
This is performed by applying function <strong>Media.Common.smoothStep</strong>(..)
on every element of the thermodynamic state record.
</p>

<p>
If <strong>mass fractions</strong> X[:] are approximated with this function then this can be performed
for all <strong>nX</strong> mass fractions, instead of applying it for nX-1 mass fractions and computing
the last one by the mass fraction constraint sum(X)=1. The reason is that the approximating function has the
property that sum(state.X) = 1, provided sum(state_a.X) = sum(state_b.X) = 1.
This can be shown by evaluating the approximating function in the abs(x) &lt; x_small
region (otherwise state.X is either state_a.X or state_b.X):
</p>

<blockquote><pre>
X[1]  = smoothStep(x, X_a[1] , X_b[1] , x_small);
X[2]  = smoothStep(x, X_a[2] , X_b[2] , x_small);
 ...
X[nX] = smoothStep(x, X_a[nX], X_b[nX], x_small);
</pre></blockquote>

<p>
or
</p>

<blockquote><pre>
X[1]  = c*(X_a[1]  - X_b[1])  + (X_a[1]  + X_b[1])/2
X[2]  = c*(X_a[2]  - X_b[2])  + (X_a[2]  + X_b[2])/2;
 ...
X[nX] = c*(X_a[nX] - X_b[nX]) + (X_a[nX] + X_b[nX])/2;
c     = (x/x_small)*((x/x_small)^2 - 3)/4
</pre></blockquote>

<p>
Summing all mass fractions together results in
</p>

<blockquote><pre>
sum(X) = c*(sum(X_a) - sum(X_b)) + (sum(X_a) + sum(X_b))/2
     = c*(1 - 1) + (1 + 1)/2
     = 1
</pre></blockquote>

</html>"));
    end setSmoothState;

    replaceable partial function dynamicViscosity "Return dynamic viscosity"
      extends Modelica.Icons.Function;
      input ThermodynamicState state "Thermodynamic state record";
      output Modelica.Media.Interfaces.Types.DynamicViscosity eta "Dynamic viscosity";
    end dynamicViscosity;

    replaceable partial function thermalConductivity
      "Return thermal conductivity"
      extends Modelica.Icons.Function;
      input ThermodynamicState state "Thermodynamic state record";
      output Modelica.Media.Interfaces.Types.ThermalConductivity lambda "Thermal conductivity";
    end thermalConductivity;

    replaceable function prandtlNumber "Return the Prandtl number"
      extends Modelica.Icons.Function;
      input ThermodynamicState state "Thermodynamic state record";
      output Modelica.Media.Interfaces.Types.PrandtlNumber Pr "Prandtl number";
    algorithm
      Pr := dynamicViscosity(state)*specificHeatCapacityCp(state)/
        thermalConductivity(state);
    end prandtlNumber;

    replaceable partial function pressure "Return pressure"
      extends Modelica.Icons.Function;
      input ThermodynamicState state "Thermodynamic state record";
      output Modelica.Media.Interfaces.Types.AbsolutePressure p "Pressure";
    end pressure;

    replaceable partial function temperature "Return temperature"
      extends Modelica.Icons.Function;
      input ThermodynamicState state "Thermodynamic state record";
      output Modelica.Media.Interfaces.Types.Temperature T "Temperature";
    end temperature;

    replaceable partial function density "Return density"
      extends Modelica.Icons.Function;
      input ThermodynamicState state "Thermodynamic state record";
      output Modelica.Media.Interfaces.Types.Density d "Density";
    end density;

    replaceable partial function specificEnthalpy "Return specific enthalpy"
      extends Modelica.Icons.Function;
      input ThermodynamicState state "Thermodynamic state record";
      output Modelica.Media.Interfaces.Types.SpecificEnthalpy h "Specific enthalpy";
    end specificEnthalpy;

    replaceable partial function specificInternalEnergy
      "Return specific internal energy"
      extends Modelica.Icons.Function;
      input ThermodynamicState state "Thermodynamic state record";
      output Modelica.Media.Interfaces.Types.SpecificEnergy u "Specific internal energy";
    end specificInternalEnergy;

    replaceable partial function specificEntropy "Return specific entropy"
      extends Modelica.Icons.Function;
      input ThermodynamicState state "Thermodynamic state record";
      output Modelica.Media.Interfaces.Types.SpecificEntropy s "Specific entropy";
    end specificEntropy;

    replaceable partial function specificGibbsEnergy
      "Return specific Gibbs energy"
      extends Modelica.Icons.Function;
      input ThermodynamicState state "Thermodynamic state record";
      output Modelica.Media.Interfaces.Types.SpecificEnergy g "Specific Gibbs energy";
    end specificGibbsEnergy;

    replaceable partial function specificHelmholtzEnergy
      "Return specific Helmholtz energy"
      extends Modelica.Icons.Function;
      input ThermodynamicState state "Thermodynamic state record";
      output Modelica.Media.Interfaces.Types.SpecificEnergy f "Specific Helmholtz energy";
    end specificHelmholtzEnergy;

    replaceable partial function specificHeatCapacityCp
      "Return specific heat capacity at constant pressure"
      extends Modelica.Icons.Function;
      input ThermodynamicState state "Thermodynamic state record";
      output Modelica.Media.Interfaces.Types.SpecificHeatCapacity cp
        "Specific heat capacity at constant pressure";
    end specificHeatCapacityCp;

    function heatCapacity_cp = specificHeatCapacityCp
      "Alias for deprecated name";

    replaceable partial function specificHeatCapacityCv
      "Return specific heat capacity at constant volume"
      extends Modelica.Icons.Function;
      input ThermodynamicState state "Thermodynamic state record";
      output Modelica.Media.Interfaces.Types.SpecificHeatCapacity cv
        "Specific heat capacity at constant volume";
    end specificHeatCapacityCv;

    function heatCapacity_cv = specificHeatCapacityCv
      "Alias for deprecated name";

    replaceable partial function isentropicExponent
      "Return isentropic exponent"
      extends Modelica.Icons.Function;
      input ThermodynamicState state "Thermodynamic state record";
      output Modelica.Media.Interfaces.Types.IsentropicExponent gamma "Isentropic exponent";
    end isentropicExponent;

    replaceable partial function isentropicEnthalpy
      "Return isentropic enthalpy"
      extends Modelica.Icons.Function;
      input Modelica.Media.Interfaces.Types.AbsolutePressure p_downstream "Downstream pressure";
      input ThermodynamicState refState "Reference state for entropy";
      output Modelica.Media.Interfaces.Types.SpecificEnthalpy h_is "Isentropic enthalpy";
      annotation (Documentation(info="<html>
<p>
This function computes an isentropic state transformation:
</p>
<ol>
<li> A medium is in a particular state, refState.</li>
<li> The enthalpy at another state (h_is) shall be computed
   under the assumption that the state transformation from refState to h_is
   is performed with a change of specific entropy ds = 0 and the pressure of state h_is
   is p_downstream and the composition X upstream and downstream is assumed to be the same.</li>
</ol>

</html>"));
    end isentropicEnthalpy;

    replaceable partial function velocityOfSound "Return velocity of sound"
      extends Modelica.Icons.Function;
      input ThermodynamicState state "Thermodynamic state record";
      output Modelica.Media.Interfaces.Types.VelocityOfSound a "Velocity of sound";
    end velocityOfSound;

    replaceable partial function isobaricExpansionCoefficient
      "Return overall the isobaric expansion coefficient beta"
      extends Modelica.Icons.Function;
      input ThermodynamicState state "Thermodynamic state record";
      output Modelica.Media.Interfaces.Types.IsobaricExpansionCoefficient beta "Isobaric expansion coefficient";
      annotation (Documentation(info="<html>
<blockquote><pre>
beta is defined as  1/v * der(v,T), with v = 1/d, at constant pressure p.
</pre></blockquote>
</html>"));
    end isobaricExpansionCoefficient;

    function beta = isobaricExpansionCoefficient
      "Alias for isobaricExpansionCoefficient for user convenience";

    replaceable partial function isothermalCompressibility
      "Return overall the isothermal compressibility factor"
      extends Modelica.Icons.Function;
      input ThermodynamicState state "Thermodynamic state record";
      output Modelica.Units.SI.IsothermalCompressibility kappa "Isothermal compressibility";
      annotation (Documentation(info="<html>
<blockquote><pre>

kappa is defined as - 1/v * der(v,p), with v = 1/d at constant temperature T.

</pre></blockquote>
</html>"));
    end isothermalCompressibility;

    function kappa = isothermalCompressibility
      "Alias of isothermalCompressibility for user convenience";

    // explicit derivative functions for finite element models
    replaceable partial function density_derp_h
      "Return density derivative w.r.t. pressure at const specific enthalpy"
      extends Modelica.Icons.Function;
      input ThermodynamicState state "Thermodynamic state record";
      output Modelica.Media.Interfaces.Types.DerDensityByPressure ddph "Density derivative w.r.t. pressure";
    end density_derp_h;

    replaceable partial function density_derh_p
      "Return density derivative w.r.t. specific enthalpy at constant pressure"
      extends Modelica.Icons.Function;
      input ThermodynamicState state "Thermodynamic state record";
      output Modelica.Media.Interfaces.Types.DerDensityByEnthalpy ddhp
        "Density derivative w.r.t. specific enthalpy";
    end density_derh_p;

    replaceable partial function density_derp_T
      "Return density derivative w.r.t. pressure at const temperature"
      extends Modelica.Icons.Function;
      input ThermodynamicState state "Thermodynamic state record";
      output Modelica.Media.Interfaces.Types.DerDensityByPressure ddpT "Density derivative w.r.t. pressure";
    end density_derp_T;

    replaceable partial function density_derT_p
      "Return density derivative w.r.t. temperature at constant pressure"
      extends Modelica.Icons.Function;
      input ThermodynamicState state "Thermodynamic state record";
      output Modelica.Media.Interfaces.Types.DerDensityByTemperature ddTp
        "Density derivative w.r.t. temperature";
    end density_derT_p;

    replaceable partial function density_derX
      "Return density derivative w.r.t. mass fraction"
      extends Modelica.Icons.Function;
      input ThermodynamicState state "Thermodynamic state record";
      output Modelica.Media.Interfaces.Types.Density[nX] dddX "Derivative of density w.r.t. mass fraction";
    end density_derX;

    replaceable partial function molarMass
      "Return the molar mass of the medium"
      extends Modelica.Icons.Function;
      input ThermodynamicState state "Thermodynamic state record";
      output Modelica.Media.Interfaces.Types.MolarMass MM "Mixture molar mass";
    end molarMass;

    replaceable function specificEnthalpy_pTX
      "Return specific enthalpy from p, T, and X or Xi"
      extends Modelica.Icons.Function;
      input Modelica.Media.Interfaces.Types.AbsolutePressure p "Pressure";
      input Modelica.Media.Interfaces.Types.Temperature T "Temperature";
      input Modelica.Media.Interfaces.Types.MassFraction X[:]=reference_X "Mass fractions";
      output Modelica.Media.Interfaces.Types.SpecificEnthalpy h "Specific enthalpy";
    algorithm
      h := specificEnthalpy(setState_pTX(
              p,
              T,
              X));
      annotation (inverse(T=temperature_phX(
                    p,
                    h,
                    X)));
    end specificEnthalpy_pTX;

    replaceable function specificEntropy_pTX
      "Return specific enthalpy from p, T, and X or Xi"
      extends Modelica.Icons.Function;
      input Modelica.Media.Interfaces.Types.AbsolutePressure p "Pressure";
      input Modelica.Media.Interfaces.Types.Temperature T "Temperature";
      input Modelica.Media.Interfaces.Types.MassFraction X[:]=reference_X "Mass fractions";
      output Modelica.Media.Interfaces.Types.SpecificEntropy s "Specific entropy";
    algorithm
      s := specificEntropy(setState_pTX(
              p,
              T,
              X));

      annotation (inverse(T=temperature_psX(
                    p,
                    s,
                    X)));
    end specificEntropy_pTX;

    replaceable function density_pTX "Return density from p, T, and X or Xi"
      extends Modelica.Icons.Function;
      input Modelica.Media.Interfaces.Types.AbsolutePressure p "Pressure";
      input Modelica.Media.Interfaces.Types.Temperature T "Temperature";
      input Modelica.Media.Interfaces.Types.MassFraction X[:] "Mass fractions";
      output Modelica.Media.Interfaces.Types.Density d "Density";
    algorithm
      d := density(setState_pTX(
              p,
              T,
              X));
    end density_pTX;

    replaceable function temperature_phX
      "Return temperature from p, h, and X or Xi"
      extends Modelica.Icons.Function;
      input Modelica.Media.Interfaces.Types.AbsolutePressure p "Pressure";
      input Modelica.Media.Interfaces.Types.SpecificEnthalpy h "Specific enthalpy";
      input Modelica.Media.Interfaces.Types.MassFraction X[:]=reference_X "Mass fractions";
      output Modelica.Media.Interfaces.Types.Temperature T "Temperature";
    algorithm
      T := temperature(setState_phX(
              p,
              h,
              X));
    end temperature_phX;

    replaceable function density_phX "Return density from p, h, and X or Xi"
      extends Modelica.Icons.Function;
      input Modelica.Media.Interfaces.Types.AbsolutePressure p "Pressure";
      input Modelica.Media.Interfaces.Types.SpecificEnthalpy h "Specific enthalpy";
      input Modelica.Media.Interfaces.Types.MassFraction X[:]=reference_X "Mass fractions";
      output Modelica.Media.Interfaces.Types.Density d "Density";
    algorithm
      d := density(setState_phX(
              p,
              h,
              X));
    end density_phX;

    replaceable function temperature_psX
      "Return temperature from p,s, and X or Xi"
      extends Modelica.Icons.Function;
      input Modelica.Media.Interfaces.Types.AbsolutePressure p "Pressure";
      input Modelica.Media.Interfaces.Types.SpecificEntropy s "Specific entropy";
      input Modelica.Media.Interfaces.Types.MassFraction X[:]=reference_X "Mass fractions";
      output Modelica.Media.Interfaces.Types.Temperature T "Temperature";
    algorithm
      T := temperature(setState_psX(
              p,
              s,
              X));
      annotation (inverse(s=specificEntropy_pTX(
                    p,
                    T,
                    X)));
    end temperature_psX;

    replaceable function density_psX "Return density from p, s, and X or Xi"
      extends Modelica.Icons.Function;
      input Modelica.Media.Interfaces.Types.AbsolutePressure p "Pressure";
      input Modelica.Media.Interfaces.Types.SpecificEntropy s "Specific entropy";
      input Modelica.Media.Interfaces.Types.MassFraction X[:]=reference_X "Mass fractions";
      output Modelica.Media.Interfaces.Types.Density d "Density";
    algorithm
      d := density(setState_psX(
              p,
              s,
              X));
    end density_psX;

    replaceable function specificEnthalpy_psX
      "Return specific enthalpy from p, s, and X or Xi"
      extends Modelica.Icons.Function;
      input Modelica.Media.Interfaces.Types.AbsolutePressure p "Pressure";
      input Modelica.Media.Interfaces.Types.SpecificEntropy s "Specific entropy";
      input Modelica.Media.Interfaces.Types.MassFraction X[:]=reference_X "Mass fractions";
      output Modelica.Media.Interfaces.Types.SpecificEnthalpy h "Specific enthalpy";
    algorithm
      h := specificEnthalpy(setState_psX(
              p,
              s,
              X));
    end specificEnthalpy_psX;

    type MassFlowRate = Modelica.Units.SI.MassFlowRate (
        quantity="MassFlowRate." + mediumName,
        min=-1.0e5,
        max=1.e5) "Type for mass flow rate with medium specific attributes";

    annotation (Documentation(info="<html>
<p>
<strong>PartialMedium</strong> is a package and contains all <strong>declarations</strong> for
a medium. This means that constants, models, and functions
are defined that every medium is supposed to support
(some of them are optional). A medium package
inherits from <strong>PartialMedium</strong> and provides the
equations for the medium. The details of this package
are described in
<a href=\"modelica://Modelica.Media.UsersGuide\">Modelica.Media.UsersGuide</a>.
</p>
</html>",       revisions="<html>

</html>"));
  end PartialMedium;
