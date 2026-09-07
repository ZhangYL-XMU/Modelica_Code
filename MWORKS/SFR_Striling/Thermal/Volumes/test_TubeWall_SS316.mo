within SFR_Striling.Thermal.Volumes;
model test_TubeWall_SS316
  "TubeWall 材料对照测试：SS316（λ更高/ρ与cp不同）替代 UO2，验证热导率是否影响结果"
  extends test_TubeWall(
    redeclare TubeWall w1(
      redeclare package Material = TRANSFORM.Media.Solids.SS316));
end test_TubeWall_SS316;