within SFR.Thermal;
package HeatExchangerTopologies
  model CoCurrentFlow "Co-current flow"
    extends SCO2_LOOP.Conponent.HeatExchangerTopologyData(
      final correspondingVolumes = 1:Nw);
  end CoCurrentFlow;

model CounterCurrentFlow "Counter-current flow"
  extends SFR.Thermal.HeatExchangerTopologyData(
    final correspondingVolumes = Nw:-1:1);
end CounterCurrentFlow;
end HeatExchangerTopologies;
