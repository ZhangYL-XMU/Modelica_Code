within SFR.Fluid.Pipes;
model pipe
          extends Fluid.Pipes.BaseClasses.pipe_Base;
  //介质
  //redeclare package Medium = TYMedia.Incompressible.LBE;

  //接口
  Modelica.Fluid.Interfaces.FluidPort_a portA(
     redeclare package Medium = Medium,
     m_flow = m_flow[1] * n_pipe,
     p = p[1],
     h_outflow(start = h_start) = inStream(portA.h_outflow)
    )
    "流体入口" annotation(Placement(transformation(origin = {-99.7774, -0.180755},
    extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Interfaces.FluidPort_b portB(
    redeclare package Medium = Medium,
    m_flow = -m_flow[N] * n_pipe,
    p = p[N],
    h_outflow(start = h_start) = h[N]
    )
    "流体出口" annotation(Placement(transformation(origin = {100, 0},
    extent = {{10, -10}, {-10, 10}}),
    iconTransformation(origin = {100.222, -0.180755},
    extent = {{10, -10}, {-10, 10}})));
  Modelica.Fluid.Interfaces.HeatPorts_a[Nw] wall(
     // T(start = T_start) = T_wall,
     // Q_flow = Q
    ) 
    if wallHeatTransfer   "热流接口" annotation(Placement(transformation(origin = {0, 38},
    extent = {{-40, -10}, {40, 10}})));

//流阻模型    
  replaceable model Friction = Fluid.Pipes.BaseClasses.PressureDrop.Detail;
  Friction friction(
    redeclare package Medium = Medium,
    states = states,
    N = N,
    Nw = Nw,
    L = L,
    Dhyd = Dhyd,
    A = A,
    height = height,
    roughness = roughness,
    m_flow = m_flow_avg);

//传热模型    
  replaceable model HeatTransfer = Fluid.Pipes.BaseClasses.HeatTransfer.circle
     "换热模型" annotation(choicesAllMatching, Dialog(group = "壁面传热", enable = wallHeatTransfer), Protection(access = Access.packageDuplicate));
  HeatTransfer heatTransfer(
  redeclare package Medium = Medium,
    states = states,
    Nf = N,
    Nw = Nw,
    Nt = n_pipe,
    L = L,
    Dhyd = Dhyd,
    A = A,
    m_flow = m_flow_avg
    );
  annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})));

initial equation
    for i in 2:N loop
        h[i] = h_start;
    end for;

equation
/**************************************边界条件*********************************************/
connect(wall,heatTransfer.wall);
  h[1] = inStream(portA.h_outflow);


  portA.Xi_outflow = inStream(portB.Xi_outflow);
  portB.Xi_outflow = inStream(portA.Xi_outflow);
  portA.C_outflow = inStream(portB.C_outflow);
  portB.C_outflow = inStream(portA.C_outflow);


/************************************节点物性计算********************************************/
  for i in 1:N loop
    states[i] = Medium.setState_phX(p[i], h[i]);
    T[i] = Medium.temperature(states[i]);
  end for;

  // H_flow[1] = m_flow[1] * actualStream(portA.h_outflow);
  // H_flow[N] = m_flow[N] * actualStream(portB.h_outflow);
  for i in 2:N-1 loop
   // H_flow[i] = noEvent(if m_flow[i] >= 0 then m_flow[i] * h[i-1] else m_flow[i] * h[i]);
  end for;
/*************************************控制体物性计算********************************************/
  for i in 1:Nw loop
    m_flow_avg[i] = (m_flow[i] + m_flow[i+1]) / 2;
    rho[i] = (Medium.density(states[i]) + Medium.density(states[i+1])) / 2;
    mu[i] = (Medium.dynamicViscosity(states[i]) + Medium.dynamicViscosity(states[i+1])) / 2;
    u[i] = m_flow_avg[i]/(rho[i] * A[i]);
    Re[i] = SFR.Utilities.Functions.reynoldsNumberSmooth(m_flow_avg[i], Dhyd[i], A[i], mu[i]);
    IE[i] = (Medium.specificInternalEnergy(states[i]) + Medium.specificInternalEnergy(states[i + 1])) / 2;
  end for;



/**************************************换热计算*********************************************/
  if wallHeatTransfer then
    for i in 1:Nw loop
      Q[i] = heatTransfer.Q[i];
      T_wall[i] = heatTransfer.Tw[i];
    end for;
  else
    for i in 1:Nw loop
      T_wall[i] = (T[i] + T[i+1]) / 2;
      Q[i] = 0;
    end for;
  end if;


                              /******************************/
                              /*           守恒方程          */
                              /******************************/
for i in 1:Nw loop
    /**************************************质量守恒*********************************************/
    der(rho[i]) * V[i] = m_flow[i] * n_pipe - m_flow[i + 1] * n_pipe;
    /**************************************动量守恒*********************************************/
    der(rho[i] * u[i]) * L[i] = p[i] - p[i + 1] - friction.dp[i];
    /**************************************能量守恒*********************************************/
    der(rho[i] * IE[i]) * V[i] = m_flow[i] * h[i]* n_pipe - m_flow[i+1] * h[i+1] * n_pipe + Q[i] ;
end for;

end pipe;