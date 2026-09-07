within SFR_Striling.Thermal.HeatExchangerTopologies;
model CounterCurrentFlow "Counter-current flow"
  extends SFR_Striling.Thermal.HeatExchangerTopologyData(
    final correspondingVolumes = Nw:-1:1);
end CounterCurrentFlow;