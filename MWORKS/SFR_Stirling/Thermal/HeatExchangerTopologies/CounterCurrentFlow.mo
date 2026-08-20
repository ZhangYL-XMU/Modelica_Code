within SFR.Thermal.HeatExchangerTopologies;
model CounterCurrentFlow "Counter-current flow"
  extends SFR.Thermal.HeatExchangerTopologyData(
    final correspondingVolumes = Nw:-1:1);
end CounterCurrentFlow;
