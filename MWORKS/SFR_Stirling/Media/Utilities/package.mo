within SFR.Media;
package Utilities
 extends Modelica.Icons.UtilitiesPackage;

//密度，单位kg/m3
  function d_T
    input Modelica.Units.SI.Temperature T;
    output Modelica.Units.SI.Density d;
  algorithm
    d := 16.0185*(59.566-7.9504*10^(-3)*(1.8*T+32)-0.2872*10^(-6)*(1.8*T+32)^2+0.603*10^(-9)*(1.8*T+32)^3);
  end d_T;

//动力粘度，
  function eta_dT
    input Modelica.Units.SI.Density d;
    input Modelica.Units.SI.Temperature T;
    output Modelica.Units.SI.DynamicViscosity eta;
  algorithm
    if T<773 then eta:= 0.1235*(d*10^3)^(1/3)*exp(697*(d*10^3)/T);
    else eta:= 0.0851*(d*10^3)^(1/3)*exp(1040*(d*10^3)/T);
    end if;
  end eta_dT;

//热导率,W/(m*°C)
  function lambda_T
    input Modelica.Units.SI.Temperature T;
    output Modelica.Units.SI.ThermalConductivity lambda;
  algorithm
    lambda:=1.72958*(54.306-1.878*10^(-2)*(1.8*Modelica.Units.Conversions.to_degC(T)+32)+2.0914*10^(-6)*(1.8*Modelica.Units.Conversions.to_degC(T)+32)^2);
  end lambda_T;

//定压热容
  function cp_T
    input Modelica.Units.SI.Temperature T;
    output Modelica.Units.SI.SpecificHeatCapacity cp;
  algorithm
    cp:=4186.8*(0.389352-1.10599*10^(-4)*1.8*T+3.41178*10^(-8)*(1.8*T)^2);
  end cp_T;

  //焓,J/kg
  function h_T
    input Modelica.Units.SI.Temperature T;
    output Modelica.Units.SI.SpecificEnthalpy h;
  algorithm
    h:=280995+2326*(0.389352*(1.8*T)-0.553995*10^(-4)*(1.8*T)^2+0.113726*10^(-7)*(1.8*T)^3-29.023);
  end h_T;
  //体积膨胀系数
  function beta_T
    input Modelica.Units.SI.Temperature T;
    output Modelica.Units.SI.LinearExpansionCoefficient beta;
  algorithm
    beta:=2.418*10^(-4)+7.385*10^(-8)+15.64*10^(-12)*T^2;
  end beta_T;
end Utilities;
