within SFR_Stirling.Thermal.Wall.Materials;
record Tabulated
  "表格壁材模板：以 T–Kint 表（T 用 K，Kint=∫_0^T k dT，W/m）定义，线性插值、表外夹持并给出警告"
  extends PartialWallMaterial(rho=7980, cp=500);

  constant Real T_table[:] = {300, 400, 500, 600, 700, 800, 900, 1000}
    "温度节点（K，单调递增）。默认取 316L 线性关联式在 300–1000 K 的采样；换材料时整体替换";
  constant Real Kint_table[:] = {3225, 4600, 6125, 7800, 9625, 11600, 13725, 16000}
    "对应积分热导率 Kint(T)（W/m）。默认值 = 8.5*T+0.0075*T^2 在 T_table 处的值";

  redeclare function extends k
    "热导率：取 Kint 表在所在区间的斜率 k≈ΔKint/ΔT；表外夹持并警告"
  protected
    Integer n;
    Integer i;
  algorithm
    n := size(T_table, 1);
    assert(n >= 2, "Tabulated.k: T_table 至少需要 2 个节点");
    if T <= T_table[1] then
      Modelica.Utilities.Streams.print("Warning: Tabulated.k: T=" + String(T) + " K 低于表下限 " + String(T_table[1]) + " K，按夹持值计算");
      k := (Kint_table[2] - Kint_table[1])/(T_table[2] - T_table[1]);
    elseif T >= T_table[n] then
      Modelica.Utilities.Streams.print("Warning: Tabulated.k: T=" + String(T) + " K 高于表上限 " + String(T_table[n]) + " K，按夹持值计算");
      k := (Kint_table[n] - Kint_table[n-1])/(T_table[n] - T_table[n-1]);
    else
      i := 1;
      while i < n - 1 and T > T_table[i+1] loop
        i := i + 1;
      end while;
      k := (Kint_table[i+1] - Kint_table[i])/(T_table[i+1] - T_table[i]);
    end if;
    annotation(Inline=true, smoothOrder=1);
  end k;

  redeclare function extends Kint
    "积分热导率：T–Kint 表线性插值，表外夹持并警告"
  protected
    Integer n;
    Integer i;
  algorithm
    n := size(T_table, 1);
    assert(n >= 2, "Tabulated.Kint: T_table 至少需要 2 个节点");
    assert(size(Kint_table, 1) == n, "Tabulated.Kint: Kint_table 与 T_table 长度不一致");
    if T <= T_table[1] then
      Modelica.Utilities.Streams.print("Warning: Tabulated.Kint: T=" + String(T) + " K 低于表下限 " + String(T_table[1]) + " K，按夹持值计算");
      Kint := Kint_table[1];
    elseif T >= T_table[n] then
      Modelica.Utilities.Streams.print("Warning: Tabulated.Kint: T=" + String(T) + " K 高于表上限 " + String(T_table[n]) + " K，按夹持值计算");
      Kint := Kint_table[n];
    else
      i := 1;
      while i < n - 1 and T > T_table[i+1] loop
        i := i + 1;
      end while;
      Kint := Kint_table[i] + (Kint_table[i+1] - Kint_table[i])*(T - T_table[i])/(T_table[i+1] - T_table[i]);
    end if;
    annotation(Inline=true, smoothOrder=1);
  end Kint;

  redeclare function extends lambdaBar
    "积分平均热导率 = (Kint(Ta)-Kint(Tb))/(Ta-Tb)；|Ta-Tb| 很小时取中点 k"
  protected
    Integer n;
    Integer i;
    Real Ka;
    Real Kb;
    Real dT;
  algorithm
    n := size(T_table, 1);
    dT := Ta - Tb;
    if abs(dT) < 1e-6 then
      // 数值极限：k((Ta+Tb)/2)
      lambdaBar := k(0.5*(Ta + Tb));
    else
      // Kint(Ta)
      if Ta <= T_table[1] then
        Ka := Kint_table[1];
      elseif Ta >= T_table[n] then
        Ka := Kint_table[n];
      else
        i := 1;
        while i < n - 1 and Ta > T_table[i+1] loop
          i := i + 1;
        end while;
        Ka := Kint_table[i] + (Kint_table[i+1] - Kint_table[i])*(Ta - T_table[i])/(T_table[i+1] - T_table[i]);
      end if;
      // Kint(Tb)
      if Tb <= T_table[1] then
        Kb := Kint_table[1];
      elseif Tb >= T_table[n] then
        Kb := Kint_table[n];
      else
        i := 1;
        while i < n - 1 and Tb > T_table[i+1] loop
          i := i + 1;
        end while;
        Kb := Kint_table[i] + (Kint_table[i+1] - Kint_table[i])*(Tb - T_table[i])/(T_table[i+1] - T_table[i]);
      end if;
      lambdaBar := (Ka - Kb)/dT;
    end if;
    annotation(Inline=true, smoothOrder=1);
  end lambdaBar;

  annotation(Documentation(info="<html>
<p>表格材料模板：只给 T–Kint 表（T 用 K，Kint 单位 W/m），由表差分得到 k 与 lambdaBar。
表外按端点夹持（不外推）并打印警告。</p>
<p><b>换表方法</b>：新建 record 继承并整体替换两张常量表，例如：</p>
<pre>
record MyWallMaterial
  extends SFR_Stirling.Thermal.Wall.Materials.Tabulated(
    T_table = {300, 500, 700, 900},
    Kint_table = {3225, 6125, 9625, 13725});
end MyWallMaterial;
</pre>
<p>注意：T 用 K（不是 ℃）；Kint 必须是 ∫_0^T k dT' 的一致积分值（相差一个常数不影响 lambdaBar，但影响 Kint 的绝对读数）。</p>
</html>"));
end Tabulated;
