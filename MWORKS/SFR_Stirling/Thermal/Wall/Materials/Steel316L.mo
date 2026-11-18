within SFR_Stirling.Thermal.Wall.Materials;
record Steel316L
  "316L 奥氏体不锈钢壁材（默认）：k(T)=8.5+0.015*T W/(m.K)，Kint(T)=8.5*T+0.0075*T^2 W/m，T 用 K，适用 300–1000 K"
  extends PartialWallMaterial(rho=7980, cp=500);

  redeclare function extends k
    "热导率 k(T)=8.5+0.015*T（W/(m.K)，T 用 K）"
  algorithm
    k := 8.5 + 0.015*T;
    annotation(Inline=true, smoothOrder=1);
  end k;

  redeclare function extends Kint
    "积分热导率 Kint(T)=8.5*T+0.0075*T^2（W/m，T 用 K）"
  algorithm
    Kint := 8.5*T + 0.0075*T*T;
    annotation(Inline=true, smoothOrder=2);
  end Kint;

  redeclare function extends lambdaBar
    "积分平均热导率：线性 k(T) 时解析等于 8.5+0.0075*(Ta+Tb)"
  algorithm
    lambdaBar := 8.5 + 0.0075*(Ta + Tb);
    annotation(Inline=true, smoothOrder=2);
  end lambdaBar;

  annotation(Documentation(info="<html>
<p>默认壁材：316L 不锈钢，工程线性关联式（规格书 §2.3）。</p>
<p><code>k(T)=8.5+0.015*T</code>，<code>Kint(T)=8.5*T+0.0075*T^2</code>，T 用 K（300–1000 K）。</p>
<p>校核：k(573 K)=17.1，k(773 K)=20.1，k(1000 K)=23.5 W/(m.K)；IHX 工作温区 430–550 ℃ 内
lambdaBar≈18–20 W/(m.K)。数值为工程近似，正式计算请以厂家/NIST 表替换（接口不变）。</p>
</html>"));
end Steel316L;
