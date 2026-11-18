within SFR_Stirling.Thermal.Wall.Materials;
partial record PartialWallMaterial
  "壁材物性接口（可替换记录）：密度、比热、热导率 k(T)、积分热导率 Kint(T) 与积分平均热导率 lambdaBar(Ta,Tb)"
  import SI = Modelica.Units.SI;

  parameter SI.Density rho "壁材密度（kg/m3）";
  parameter SI.SpecificHeatCapacity cp "壁材比热容（J/(kg.K)）";

  replaceable partial function k
    "热导率 k(T)，T 用 K，返回 W/(m.K)"
    input SI.Temperature T;
    output SI.ThermalConductivity k;
  end k;

  replaceable partial function Kint
    "积分热导率 Kint(T) = ∫_0^T k(T')dT'，T 用 K，返回 W/m"
    input SI.Temperature T;
    output Real Kint(unit="W/m");
  end Kint;

  replaceable partial function lambdaBar
    "积分平均热导率 lambdaBar(Ta,Tb) = (Kint(Ta)-Kint(Tb))/(Ta-Tb)，返回 W/(m.K)"
    input SI.Temperature Ta;
    input SI.Temperature Tb;
    output SI.ThermalConductivity lambdaBar;
  end lambdaBar;

  annotation(Documentation(info="<html>
<p>壁材记录接口契约（供 <b>WallConduction</b> 的 replaceable record Material 使用）。</p>
<p>约定：温度一律 K；<code>Kint(T)=∫_0^T k(T')dT'</code>（W/m）；
<code>lambdaBar(Ta,Tb)=(Kint(Ta)-Kint(Tb))/(Ta-Tb)</code>（W/(m.K)）。</p>
<p>注意：Modelica 函数体不能引用所在 record 的 <b>parameter</b> 分量（仅能引用 constant），
因此具体材料（如 Steel316L）将关联式系数硬编码在函数体内；Tabulated 用 constant 表实现，
可在 <code>extends Tabulated(T_table=..., Kint_table=...)</code> 中整体替换表数据。</p>
</html>"));
end PartialWallMaterial;
