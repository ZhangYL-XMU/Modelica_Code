within SFR.Utilities.Choices;
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
