within SFR.Utilities;
package Choices
  extends Modelica.Icons.TypesPackage;
package Flow1D
  type FFtypes = enumeration(
    Colebrook  "Colebrook's equation",
    Colebrook_W  "Colebrook and White",
    Filonenko  "Filonenko",
    Petrov_Popov  "Petrov_Popov",
    Fang_and_Xu  "Fang_and_Xu",
    Waterside  "水侧修正",
    NoFriction  "No friction")
  "Type, constants and menu choices to select the friction factor";



  type HCtypes = enumeration(
    Middle  "Middle of the pipe",
    Upstream  "At the inlet",
    Downstream  "At the outlet")
  "Type, constants and menu choices to select the location of the hydraulic capacitance";
end Flow1D;

package Init "Options for initialisation"
  type Options = enumeration(
    noInit  "No initial equations",
    fixedState  "Fixed initial state variables",
    steadyState  "Steady-state initialization",
    steadyStateNoP
    "Steady-state initialization except pressures (deprecated)",
    steadyStateNoT
    "Steady-state initialization except temperatures (deprecated)",
    steadyStateNoPT
    "Steady-state initialization except pressures and temperatures (deprecated)")
  "Type, constants and menu choices to select the initialisation options";
end Init;

package FluidPhase
  type FluidPhases = enumeration(
    Liquid  "Liquid",
    Steam  "Steam",
    TwoPhases  "Two Phases")
  "Type, constants and menu choices to select the fluid phase";
end FluidPhase;
end Choices;
