within SFR.Fluid;
package Utilities
  package HeatTransfer
    annotation(__MWORKS(version="2025b"));
  end HeatTransfer;

  package PressureDrop
    function Weishach "达西公式摩擦系数"
      extends Modelica.Icons.Function;

      input Real Re;
      input Real e;
      output Real f;

    algorithm
      if noEvent(Re <= 2300) then
        f := 64 / Re;
      else
        f := 0.0055 * (1 + (20000 * e + 10^6 / Re) ^ (1/3));
      end if;
      annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}},
        preserveAspectRatio = false,
        grid = {2.0, 2.0})),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}},
          preserveAspectRatio = false,
          grid = {2.0, 2.0})));
    end Weishach;

    annotation(__MWORKS(version="2025b"));
  end PressureDrop;

  annotation(__MWORKS(version="2025b"));
end Utilities;
