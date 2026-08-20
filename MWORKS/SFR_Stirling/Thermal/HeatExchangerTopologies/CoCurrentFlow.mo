within SFR.Thermal.HeatExchangerTopologies;
model CoCurrentFlow "Co-current flow"
  extends SCO2_LOOP.Conponent.HeatExchangerTopologyData(
    final correspondingVolumes = 1:Nw);
end CoCurrentFlow;
