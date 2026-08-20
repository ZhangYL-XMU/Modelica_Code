within SFR.Utilities.Choices;
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
