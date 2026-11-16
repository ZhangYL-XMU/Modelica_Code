within SFR_Stirling.Thermal.HeatExchangerTopologies;
model CounterCurrentFlow "Counter-current flow"
  extends SFR_Stirling.Thermal.HeatExchangerTopologyData(
    final correspondingVolumes = Nw:-1:1);
end CounterCurrentFlow;