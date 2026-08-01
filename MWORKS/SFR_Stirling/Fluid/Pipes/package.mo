within SFR.Fluid;
package Pipes
  package test
    annotation(__MWORKS(version="26.1.3"));
    model test_pipe
      annotation(__MWORKS(version="26.1.3"),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})));
      Modelica.Fluid.Sources.MassFlowSource_h boundary(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, m_flow=10, h=656775) 
        annotation(Placement(transformation(origin={-50,-2},
extent={{-10,-10},{10,10}})));
      Modelica.Fluid.Sources.Boundary_ph boundary1(nPorts=1, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, p=9.999999999999999e5, h=656775) 
        annotation(Placement(transformation(origin={50,-2},
extent={{10,-10},{-10,10}})));
      pipe pipe1(N=5, redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium, n_pipe=5) 
        annotation (Placement(transformation(origin={0,-1.98192},
extent={{-10,-10},{10,10}})));
      Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow(Q_flow=1e6) 
        annotation (Placement(transformation(origin={-22,38},
extent={{-10,-10},{10,10}})));
      TYThermoFluidSys.Sensors.SensorT TSensor1(redeclare package Medium = SFR.Media.Sodium.ConstantPropertyLiquidSodium) 
        annotation (Placement(transformation(origin={26,22},
extent={{-10,-10},{10,10}})));
      equation
      connect(boundary.ports[1], pipe1.portA) 
      annotation(Line(origin={-25,-2},
points={{-15,0},{15.02226,0}},
color={0,127,255}));
      connect(boundary1.ports[1], pipe1.portB) 
      annotation(Line(origin={25,-2},
points={{15,0},{-14.9778,0}},
color={0,127,255}));
      connect(fixedHeatFlow.port, pipe1.wall[1]) 
      annotation(Line(origin={-2,20},
points={{-10,18},{2,18},{2,-18.1819}},
color={191,0,0}));
      connect(TSensor1.port_a, pipe1.portB) 
      annotation(Line(origin={18,5},
      points={{8,7},{8,-1},{-4.9778,-1},{-4.9778,-6.9999955},{-7.9778,-6.9999955}},
      color={0,178,226}));
      end test_pipe;
    model test_pipe_static
      annotation(__MWORKS(version = "2025b"), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}},
        grid = {2, 2})));
      pipe_static pipe_static1(redeclare package Medium = TYMedia.Incompressible.LBE, initFromEnthalpy=true, h_start=4.725e4, wallHeatTransfer=false) if false 
        annotation(Placement(transformation(origin = {1, 64.0180755},
        extent = {{-10, -10}, {10, 10}})));
      TYThermoFluidSys.Boundaries.BoundaryMdot boundaryMdot(redeclare package Medium = TYMedia.Incompressible.LBE, m_flow=10) if false 
        annotation(Placement(transformation(origin = {-36, 64.0180755},
        extent = {{-10, -10}, {10, 10}})));
      TYThermoFluidSys.Boundaries.BoundaryPressure boundaryPressure(redeclare package Medium = TYMedia.Incompressible.LBE) if false 
        annotation(Placement(transformation(origin = {38, 64},
        extent = {{10, -10}, {-10, 10}})));
      Modelica.Fluid.Sources.MassFlowSource_h boundary(nPorts=1, redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, m_flow=10, h=1e5) 
        annotation(Placement(transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Fluid.Sources.Boundary_ph boundary1(nPorts=1, redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, p=100000) 
        annotation(Placement(transformation(origin = {50, -10},
        extent = {{10, -10}, {-10, 10}})));
      pipe_static pipe_static2(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater, N=5) 
        annotation(Placement(transformation(origin = {-4.44089e-16, -9.98192},
        extent = {{-10, -10}, {10, 10}})));
      equation
      connect(pipe_static1.portB, boundaryPressure.fluidPort) 
        annotation(Line(origin = {21, 63.9999755},
        points = {{-9.9778, 2.45e-5}, {9, 2.45e-5}},
        color = {0, 178, 226}));
      connect(boundaryMdot.fluidPort, pipe_static1.portA) 
        annotation(Line(origin = {-18, 63.9999755},
        points = {{-10, 0.0181}, {9.02226, 2.45e-5}},
        color = {0, 178, 226}));
      connect(boundary.ports[1], pipe_static2.portA) 
        annotation(Line(origin = {-25, -10},
        points = {{-15, 0}, {15.02226, -1.77636e-15}},
        color = {0, 127, 255}));
      connect(boundary1.ports[1], pipe_static2.portB) 
        annotation(Line(origin = {25, -10},
        points = {{15, 0}, {-14.9778, -1.77636e-15}},
        color = {0, 127, 255}));
    end test_pipe_static;
    model compare
      annotation(__MWORKS(version="26.1.3"));
      TYThermoFluidSys.Pipelines.DistributePipe_Incompressible distributePipe_Incompressible(n=4, redeclare package Medium = TYMedia.Incompressible.Pb, redeclare model DP = TYThermoFluidSys.Pipelines.Basic.DP_OnePhase.DarcyWeisbach, initOpt=TYThermoFluidSys.Utilities.Types.InitOptions.noInit, from_dp=false) 
        annotation (Placement(transformation(origin={-18,12},
    extent={{-10,-10},{10,10}})));
      TYThermoFluidSys.Boundaries.BoundaryMdot boundaryMdot(m_flow=10, redeclare package Medium = TYMedia.Incompressible.Pb, energyDefinition="h", h=4.725e4) 
        annotation (Placement(transformation(origin={-62,12},
    extent={{-10,-10},{10,10}})));
      TYThermoFluidSys.Boundaries.BoundaryPressure boundaryPressure(redeclare package Medium = TYMedia.Incompressible.Pb, energyDefinition="h", h=4.725e4) 
        annotation (Placement(transformation(origin={18,12},
    extent={{10,-10},{-10,10}})));
      TYThermoFluidSys.Boundaries.BoundaryHeatFlow boundaryHeatFlow(n=4, Q_flow=0) 
        annotation (Placement(transformation(origin={-40,44},
    extent={{-10,-10},{10,10}})));
    equation
      connect(distributePipe_Incompressible.portA, boundaryMdot.fluidPort) 
      annotation(Line(origin={-41,12},
      points={{13,-1.77636e-15},{-13,-1.77636e-15}},
      color={0,178,226}));
      connect(distributePipe_Incompressible.portB, boundaryPressure.fluidPort) 
      annotation(Line(origin={1,12},
      points={{-9,-1.77636e-15},{9,-1.77636e-15}},
      color={0,178,226}));
      connect(boundaryHeatFlow.port, distributePipe_Incompressible.q) 
      annotation(Line(origin={-22,31},
    points={{-8,13},{4,13},{4,-14}},
    color={191,0,0}));

    end compare;

  end test;
  package BaseClasses
    model pipe_Base
      "圆形截面无管壁厚度的专适用于液态金属流质"
      import SFR.Utilities.Functions;
      import Modelica.Constants;
      import SI = Modelica.SIunits;
      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium 
      annotation (choicesAllMatching = true);




      /******************************/
      /*           参数             */
      /******************************/
      //几何参数
      parameter Integer N(min = 2) = 2 "节点数";
      final parameter Integer Nw = N - 1 "控制体数量";
      final parameter Integer[Nw] n_channels(each min = 1.0) = fill(n_pipe, Nw) "平行管数量" annotation(Dialog(group = "几何参数"));
      parameter Integer n_pipe = 1 "平行管数量" annotation(Dialog(group = "几何参数"));
      parameter Modelica.Units.SI.Length L_total = 10 "管道总长" annotation(Dialog(group = "几何参数"));
      parameter SI.Length L_heat = L_total "加热段长度" annotation(Dialog(group = "结构参数"));
      parameter Modelica.Units.SI.Length Dh = 0.05 "单管道水力直径" annotation(Dialog(group = "几何参数"));
      parameter Modelica.Units.SI.Length height_ab = 0 "高度差(a-b)" annotation(Dialog(group = "几何参数"));
      parameter Real roughness = 0.0015 "管壁粗糙度" annotation(Dialog(group = "几何参数"));


      final parameter Modelica.Units.SI.PerUnit e = roughness / Dh "相对粗糙度";    annotation(Dialog(group = "几何参数"));
      final parameter Modelica.Units.SI.Area A_cross = Constants.pi * Dh ^ 2 / 4 "单管道横截面积"     annotation(Dialog(group = "几何参数"));
      final parameter Modelica.Units.SI.Length[Nw] L = ones(Nw) * L_total / Nw "每一段的长度"   annotation(Dialog(group = "几何参数"));
      final parameter Modelica.Units.SI.Length[Nw] Dhyd = ones(Nw) * Dh "每一段的水力直径（单管道）"     annotation(Dialog(group = "几何参数"));
      final parameter Modelica.Units.SI.Height[Nw] height = ones(Nw) * height_ab / Nw "每一段的高度差"    annotation(Dialog(group = "几何参数"));
      final parameter Modelica.Units.SI.Area[Nw] A = ones(Nw) * A_cross "每一段的横截面积 (单管道)"     annotation(Dialog(group = "几何参数"));
      final parameter Modelica.Units.SI.Volume[Nw] V = n_channels .* A .* L "每一段管道的总容积"     annotation(Dialog(group = "几何参数"));
      final parameter Modelica.Units.SI.Volume V_tot = sum(V) "管道总容积";
      final parameter Modelica.Units.SI.Area A_mean = sum(A) / Nw "平均横截面积";

      parameter Boolean wallHeatTransfer = true "是否考虑换热" annotation(Dialog(group = "壁面传热"));
      /******************************/
      /*           初始化            */
      /******************************/
      parameter SI.Pressure p_start = 1e5 "初始压力" annotation(Dialog(tab = "初始化", group = "压力"));
      parameter Boolean initFromEnthalpy = true "true-使用比焓进行初始化，false-使用温度进行初始化" annotation(Dialog(tab = "初始化", group = "比焓"));
      parameter SI.SpecificEnthalpy h_start = 300e3 "初始比焓" annotation(Dialog(enable = initFromEnthalpy, tab = "初始化", group = "比焓"));
      parameter SI.Temperature T_start = 298.15 "流体初始化温度" annotation(Dialog(enable = not initFromEnthalpy, tab = "初始化", group = "温度"));
      parameter SI.Temperature T_wall_start = T_start "壁面初始温度" annotation(Dialog(tab = "初始化", group = "温度"));
      parameter SI.MassFlowRate m_flow_start = 0.1 "初始质量流量" annotation(Dialog(tab = "初始化", group = "质量流量"));
      parameter SI.MassFraction[Medium.nXi] X_start = Medium.reference_X "初始组分" annotation(Dialog(tab = "初始化", group = "组分"));

      /******************************/
      /*          修正系数           */
      /******************************/
      parameter Real CF_PressureLoss = 1.0 "压降修正系数" annotation(Dialog(group = "流阻模型"));
      parameter Real CF_HeatTransfer = 1.0 "传热修正系数" annotation(Dialog(group = "壁面传热"));
      final parameter Real flowFraction0 = 1 "流过流阻的质量流量百分比" annotation(Dialog(tab = "高级", group = "压降相关的修正值"));
      final parameter Real dpFraction0 = 1 annotation(Dialog(tab = "高级", group = "压降相关的修正值"));
      final parameter Real CF_length = 1.0 annotation(Dialog(tab = "高级", group = "压降相关的修正值"));
      // 修正后参数
      final parameter SI.Length L_total_internal = L_total * CF_length "修正后的管道长度";
      final parameter SI.Volume[Nw] V_internal = V * CF_length "修正后的管道容积";
      final parameter SI.Area[Nw] A_heat_internal = A_heat * CF_length "修正后的换热面积";
      final parameter SI.Area A_H = Constants.pi * Dh * L_heat / Nw "每一段管道的换热面积 (单管道) " annotation(Dialog(group = "换热"));
      final parameter SI.Area[Nw] A_heat = ones(Nw) * A_H "每一段管道的换热面积 (单管道)" annotation(Dialog(group = "换热"));





      /******************************/
      /*           点变量            */
      /******************************/
       SI.Temperature[N] T(each start=T_start) "流体温度";
       SI.SpecificEnthalpy[N] h(each start=h_start)  "流体焓流";
       SI.Pressure[N] p(each start=p_start)  "流体压力";
       //SI.EnthalpyFlowRate H_flow[N] "比焓";
       Medium.ThermodynamicState[N] states;
       Medium.MassFlowRate m_flow[N](each start=m_flow_start) "质量流";

       /******************************/
       /*         控制体变量          */
       /******************************/
       SI.Temperature[Nw] T_wall(each start=T_wall_start) "壁面温度";
       SI.Power[Nw] Q "壁面流入热流量";
       SI.ReynoldsNumber[Nw] Re "单控制体雷诺数";
       Medium.DynamicViscosity[Nw] mu "动力粘度";
       Medium.MassFlowRate m_flow_avg[Nw](each start=m_flow_start) "质量流";
       Medium.SpecificInternalEnergy IE[Nw] "流体内能";
       SI.Density[Nw] rho "单控制体平均密度";
       SI.Velocity[Nw] u "液体流速";//√//

    equation


      annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
      grid={2,2})),Icon(coordinateSystem(extent={{-100,-100},{100,100}},
    grid={2,2}),graphics = {Rectangle(origin={0,0},
    lineColor={0,0,128},
    fillColor={255,85,255},
    fillPattern=FillPattern.HorizontalCylinder,
    extent={{-100,38.5},{100,-38.5}},
    radius=4.5), Line(origin={-2,0},
    points={{-40,0},{40,0},{20,10},{40,0},{20,-10}},
    color={0,0,0},
    thickness=1)}));
    end pipe_Base;

    model Flow1DFVbase_dp
                         "圆形截面无管壁厚度的专适用于液态金属流质"
      import SFR.Utilities.Functions;
      import Modelica.Constants;
      replaceable package Medium = Modelica.Media.Water.WaterIF97_ph;




                          /******************************/
                          /*           常参数            */
                          /******************************/
    //几何参数
    parameter Integer N(min = 2)=2 "节点数";
    final parameter Integer Nw = N-1 "控制体数量";
    final parameter Real[Nw] n_channels(each min = 1.0) = fill(n_pipe, Nw) "平行管数量" annotation(Dialog(group = "几何参数"));
    parameter Real n_pipe = 1 "平行管数量" annotation(Dialog(group = "几何参数"));
    parameter Modelica.Units.SI.Length L_total = 10 "管道总长" annotation(Dialog(group = "几何参数"));
    parameter Modelica.Units.SI.Length Dh = 0.05 "单管道水力直径" annotation(Dialog(group = "几何参数"));
    parameter Modelica.Units.SI.Length height_ab = 0 "高度差(a-b)" annotation(Dialog(group = "几何参数"));
    parameter Real roughness=0.0015    "管壁粗糙度";
    final parameter Modelica.Units.SI.PerUnit e = roughness/Dh "相对粗糙度";

    final parameter Modelica.Units.SI.Area A_cross = Constants.pi * Dh ^ 2 / 4 "单管道横截面积" 
        annotation(Dialog(group = "几何参数"));
    final parameter Modelica.Units.SI.Length[Nw] L = ones(Nw) * L_total / Nw "每一段的长度" 
        annotation(Dialog(group = "几何参数"));
    final parameter Modelica.Units.SI.Length[Nw] Dhyd = ones(Nw) * Dh "每一段的水力直径（单管道）" 
        annotation(Dialog(group = "几何参数"));
    final parameter Modelica.Units.SI.Length[Nw] height = ones(Nw) * height_ab / Nw "每一段的高度差" 
        annotation(Dialog(group = "几何参数"));
    final parameter Modelica.Units.SI.Area[Nw] A = ones(Nw) * A_cross "每一段的横截面积 (单管道)" 
        annotation(Dialog(group = "几何参数"));
    final parameter Modelica.Units.SI.Volume[Nw] V = n_channels .* A .* L "每一段管道的总容积" 
        annotation(Dialog(group = "几何参数"));
    final parameter Modelica.Units.SI.Volume V_tot = sum(V) "管道总容积";
    final parameter Modelica.Units.SI.Area A_mean = sum(A) / Nw "平均横截面积";

    //流动参数
      // parameter Medium.MassFlowRate m_flow_nom "标称质量流量 (总)" annotation(Evaluate = true,Dialog(tab = "初始化"));
      // Medium.MassFlowRate m_flow(start = m_flow_nom/Nt) "Mass flow rate (单管质量流)";
    //  Real dwdt(start = 0) "动量因子";
     Medium.MassFlowRate m_flow "质量流";

                          /******************************/
                          /*           点变量            */
                          /******************************/

      Medium.AbsolutePressure[N] p(each start=1e5)
                                             "节点压力";
      Medium.SpecificEnthalpy h(start=1e5) "节点比焓";
    //  Medium.MassFlowRate[N] m_flows=fill(port_a.m_flow,N) "单管节点质量流";


      Medium.Density[N] rho "节点密度";
      Medium.DynamicViscosity[N] mu "动力粘度";
      Medium.ThermodynamicState[N] states;





                          /******************************/
                          /*         控制体变量          */
                          /******************************/
      Real f_W[Nw]
                  "摩擦系数";
      Modelica.Units.SI.PerUnit[Nw] Re   "雷诺数";
      Modelica.Units.SI.Pressure dp[Nw]
                                       "单控制体压降";
      Modelica.Units.SI.Pressure Dpf[Nw]
                                        "段摩擦压降";
    //  Modelica.Units.SI.Pressure Dpad[Nw]"段加速压降";
      Modelica.Units.SI.Pressure Dpele[Nw]
                                          "段提升压降";
      Medium.Density rho_avg[Nw]
                                "段密度";
      Modelica.Units.SI.Velocity[Nw] u "控制体流速";
    //  Modelica.Units.SI.Velocity u_avg[Nw] "段流速";



      Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Medium, m_flow=m_flow, p=p[1])
        "Fluid connector a (positive design flow direction is from port_a to port_b)" 
        annotation (Placement(transformation(origin={-99.7774,-0.180755},
      extent={{-10,-10},{10,10}})));
      Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Medium, m_flow=-m_flow, p=p[N])
        "Fluid connector b (positive design flow direction is from port_a to port_b)" 
        annotation (Placement(transformation(origin={100,0},
      extent={{10,-10},{-10,10}}),
      iconTransformation(origin={100.222,-0.180755},
      extent={{10,-10},{-10,10}})));




    equation


    /************************************节点物性计算********************************************/
    for i in 1:N loop
    //  h[i] = port_a.h_outflow;
      states[i]=Medium.setState_phX(p[i],h);
      rho[i]=Medium.density(states[i]); //g/cm3
      mu[i] = Medium.dynamicViscosity(states[i]);
    end for;

    /*************************************控制体物性计算********************************************/
    for i in 1:Nw loop
      rho_avg[i] = (rho[i] + rho[i + 1]) / 2;
      u[i]=port_a.m_flow/(rho_avg[i] * 1e3 * A[i]);
      Re[i] = noEvent(abs(m_flow * Dh / (A_cross * mu[i])));
    end for;
    /**************************************压降计算*********************************************/
    for i in 1:Nw loop
    //摩擦系数
      f_W[i]=Fluid.Utilities.PressureDrop.Weishach(Re[i],e);

    //摩擦压降
      Dpf[i]=f_W[i] *(L[i] / Dhyd[i])*(rho_avg[i] * 1e3 * u[i] ^2/2);

    //提升压降
      Dpele[i]=Constants.g_n * height[i] * rho_avg[i] * 1e3;

    //控制体压降
      dp[i] = Dpf[i] + Dpele[i];

    //节点压力
      p[i+1] = p[i] + dp[i];
    end for;






    /**************************************瞬态稳态*********************************************/

    /**************************************质量守恒*********************************************/


    /**************************************动量守恒*********************************************/



    /**************************************边界条件*********************************************/
    h = port_a.h_outflow;
      port_a.h_outflow = inStream(port_b.h_outflow);
      port_b.h_outflow = inStream(port_a.h_outflow);

      annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
      grid={2,2})),Icon(coordinateSystem(extent={{-100,-100},{100,100}},
    grid={2,2}),graphics={  Rectangle(origin={0,0},
    lineColor={0,0,128},
    fillColor={255,85,255},
    fillPattern=FillPattern.HorizontalCylinder,
    extent={{-100,38.5},{100,-38.5}},
    radius=4.5)}));
    end Flow1DFVbase_dp;

    package PressureDrop
      model Detail
        import Modelica.Constants;
        import Modelica.Units.SI;
        replaceable package Medium = Modelica.Media.Interfaces.PartialMedium;

      //几何参数
      parameter Integer N(min = 2) =2 "节点数";
      parameter Integer Nw = N-1 "控制体数";
      parameter SI.Length[Nw] L "单控制体长度";
      parameter SI.Length[Nw] Dhyd "单控制体水力直径";
      parameter SI.Area[Nw] A  "每一段的横截面积 (单管道)";
      parameter SI.Length[Nw] height "高度差(b-a)";
      parameter Real roughness "粗糙度";

      //输入变量
      input Medium.ThermodynamicState[N] states;
      input Medium.MassFlowRate m_flow[Nw] "单管质量流";


      //流质性质
      Medium.DynamicViscosity[Nw] mu "动力粘度";
      SI.Density[Nw] rho "单控制体平均密度";
      SI.ReynoldsNumber[Nw] Re "单控制体雷诺数";
      SI.Velocity[Nw] u "液体流速";


      //压降
      Real[Nw] f_W;
      SI.Pressure[Nw] dp "总压降";
      SI.Pressure[Nw] Dpf "摩擦压降";
      SI.Pressure[Nw] Dpele "提升压降";

      equation
      for i in 1:Nw loop
        rho[i] = (Medium.density(states[i]) + Medium.density(states[i+1])) / 2;
        mu[i] = (Medium.dynamicViscosity(states[i]) + Medium.dynamicViscosity(states[i+1])) / 2;
        u[i] = m_flow[i]/(rho[i] * 1e3 * A[i]);
        Re[i] = noEvent(abs(m_flow[i] * Dhyd[i] / (A[i] * mu[i])));

      //摩擦系数
        f_W[i]=Fluid.Utilities.PressureDrop.Weishach(Re[i],roughness / Dhyd[i]);
        //f_W[i]=64/Re[i];

      //摩擦压降
        Dpf[i]=f_W[i] *(L[i] / Dhyd[i])*(rho[i] * 1e3 * u[i] ^2/2);

      //提升压降
        Dpele[i]=Constants.g_n * height[i] * rho[i] * 1e3;

      //控制体压降
      if height[1] >= 0 then
        dp[i] = Dpf[i] + Dpele[i];
       else
        dp[i] = Dpf[i] - Dpele[i];
      end if;
      end for;



      end Detail;

      model Constant
        annotation(__MWORKS(version="2025b"));

      end Constant;

      annotation(__MWORKS(version="2025b"));
      model test_detail
        import SFR.Utilities.Functions;
        import Modelica.Constants;
        replaceable package Medium = TYMedia.Incompressible.LBE;

      //几何参数
      parameter Integer N(min = 2) =5 "节点数";
      parameter Integer Nw = N-1 "控制体数";
      parameter Modelica.Units.SI.Length[Nw] L = ones(Nw) * 0.25 "单控制体长度";
      parameter Modelica.Units.SI.Length[Nw] Dhyd = ones(Nw) * 0.01 "单控制体水力直径";
      parameter Modelica.Units.SI.Area[Nw] A = ones(Nw) * (Constants.pi * Dhyd[1] ^ 2 / 4) "每一段的横截面积 (单管道)";
      parameter Modelica.Units.SI.Length[Nw] height = ones(Nw) * (-0.00) "高度差(b-a)";
      parameter Real roughness "粗糙度";


      //流质性质
      Medium.AbsolutePressure[N] p"节点压力";
      Medium.SpecificEnthalpy[N] h "节点比焓";
      Medium.MassFlowRate m_flow[Nw] "质量流";
      Medium.ThermodynamicState[N] states;



        replaceable model Friction = Fluid.Pipes.BaseClasses.PressureDrop.Detail;
      Friction friction(redeclare package Medium = Medium, states=states, N=N, Nw=Nw, L=L, Dhyd=Dhyd, A=A, height=height, roughness=roughness, m_flow=m_flow);

      equation
      p[5] = 1e5;

      for i in 1:N loop
        h[i] = 4.725e4;
        states[i]=Medium.setState_phX(p[i],h[i]);
      end for;
      for i in 1:Nw loop
        m_flow [i] = 10;
        p[i] = p[i+1] + friction.dp[i];
      end for;




      end test_detail;
      model compair
        annotation(__MWORKS(version="2025b"));
        TYThermoFluidSys.Boundaries.BoundaryMdot boundaryMdot(redeclare package Medium = TYMedia.Incompressible.LBE,m_flow=10,energyDefinition="h",h=4.725e4) 
          annotation (Placement(transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}})));
        TYThermoFluidSys.Boundaries.BoundaryPressure boundaryPressure(redeclare package Medium = TYMedia.Incompressible.LBE,energyDefinition="h",h=4.725e4) 
          annotation (Placement(transformation(origin={84,-5.55112e-16},
      extent={{10,-10},{-10,10}})));
        TYThermoFluidSys.Pipelines.DistributePipe_Incompressible distributePipe_Incompressible(n=4,wallHeatTransfer=false,redeclare package Medium = TYMedia.Incompressible.LBE,from_dp=false,redeclare model DP = TYThermoFluidSys.Pipelines.Basic.DP_OnePhase.DarcyWeisbach,initFromEnthalpy=true,h_start_in=4.725e4,h_start_out=4.725e4) 
          annotation (Placement(transformation(origin={12,-6.66134e-16},
      extent={{-10,-10},{10,10}})));
        equation
        connect(boundaryMdot.fluidPort, distributePipe_Incompressible.portA) 
        annotation(Line(origin={-25,0},
        points={{-27,-3.33067e-17},{27,-6.66134e-16}},
        color={0,178,226}));
        connect(boundaryPressure.fluidPort, distributePipe_Incompressible.portB) 
        annotation(Line(origin={49,0},
        points={{27,-5.57888e-16},{-27,-6.66134e-16}},
        color={0,178,226}));
        end compair;
    end PressureDrop;

    package HeatTransfer
      partial model circle
        import Modelica.Constants;
        replaceable package Medium = Modelica.Media.Water.StandardWater;


      parameter Integer Nf(min = 2) = 2 "Number of nodes on the fluid side";
      parameter Integer Nw = Nf - 1 "Number of volumes on the wall side";
      parameter Integer Nt(min = 1) "Number of tubes in parallel";

        //几何参数
      input Modelica.Units.SI.Length[Nw] L "每一段的长度";
      input Modelica.Units.SI.Length[Nw] Dhyd "水力直径（单管道）";
      input Modelica.Units.SI.Area[Nw] A;

        //输入变量

      input Medium.ThermodynamicState[Nf] states "热力状态(ph)";
      input Medium.MassFlowRate m_flow[Nw] "质量流";

        //热力学参数
        Medium.Temperature Tf[Nw]"液体温度";


        //物性参数 
        Modelica.Units.SI.ReynoldsNumber[Nw] Re;
        Medium.DynamicViscosity[Nw] mu;
        Medium.ThermalConductivity[Nw] k "Thermal conductivity";
        Medium.SpecificHeatCapacity[Nw] cp "Heat capacity at constant pressure";
        Modelica.Units.SI.PrandtlNumber[Nw] Pr;
        Modelica.Units.SI.NusseltNumber[Nw] Nu;

        Modelica.Units.SI.CoefficientOfHeatTransfer gamma[Nw];

        //功率
         Modelica.Units.SI.Power[Nw] Q ;
         Medium.Temperature[Nw] Tw  "壁面温度";

         Modelica.Fluid.Interfaces.HeatPorts_a[Nw] wall annotation (Placement(transformation(extent = {{-40, 20}, {40,
            40}}, rotation = 0)));


      equation
        Q = wall.Q_flow;
        Tw = wall.T;

        for i in 1:Nw loop
          mu[i] = (Medium.dynamicViscosity(states[i]) + Medium.dynamicViscosity(states[i + 1])) / 2;
          Re[i] = noEvent(abs(m_flow[i] * Dhyd[i] / (A[i] * mu[i])));
          Tf[i] = (Medium.temperature(states[i]) + Medium.temperature(states[i+1])) / 2;
          k[i] = (Medium.thermalConductivity(states[i]) + Medium.thermalConductivity(states[i + 1])) / 2;
          cp[i] = (Medium.specificHeatCapacityCp(states[i]) + Medium.specificHeatCapacityCp(states[i+1])) / 2;
          Pr[i] = cp[i] * mu[i] / k[i];
          Nu[i] = 5.5 + 0.0025 * (Re[i] * Pr[i]) ^ 0.8;
          gamma[i] = Nu[i] * k[i] / Dhyd[i];

          Q[i] = gamma[i] * Nt * Constants.pi * Dhyd * L * (Tw[i] - Tf[i]);
        end for;


      end circle;

      annotation(__MWORKS(version="2025b"));
      partial model core
        import Modelica.Constants;
        replaceable package Medium = Modelica.Media.Water.StandardWater;


      parameter Integer Nf(min = 2) = 2 "Number of nodes on the fluid side";
      parameter Integer Nw = Nf - 1 "Number of volumes on the wall side";
      parameter Integer Nt(min = 1) "Number of tubes in parallel";

        //几何参数
      input Modelica.Units.SI.Length[Nw] L "每一段的长度";
      input Modelica.Units.SI.Length[Nw] Dhyd "水力直径（单管道）";
      input Modelica.Units.SI.Area[Nw] A;

        //输入变量

      input Medium.ThermodynamicState[Nf] states "热力状态(ph)";
      input Medium.MassFlowRate m_flow[Nw] "质量流";

        //热力学参数
        Medium.Temperature Tf[Nw]"液体温度";


        //物性参数 
        Modelica.Units.SI.ReynoldsNumber[Nw] Re;
        Medium.DynamicViscosity[Nw] mu;
        Medium.ThermalConductivity[Nw] k "Thermal conductivity";
        Medium.SpecificHeatCapacity[Nw] cp "Heat capacity at constant pressure";
        Modelica.Units.SI.PrandtlNumber[Nw] Pr;
        Modelica.Units.SI.NusseltNumber[Nw] Nu;

        Modelica.Units.SI.CoefficientOfHeatTransfer gamma[Nw];

        //功率
         Modelica.Units.SI.Power[Nw] Q ;
         Medium.Temperature[Nw] Tw  "壁面温度";

         Modelica.Fluid.Interfaces.HeatPorts_a[Nw] wall annotation (Placement(transformation(extent = {{-40, 20}, {40,
            40}}, rotation = 0)));


      equation
        Q = wall.Q_flow;
        Tw = wall.T;

        for i in 1:Nw loop
          mu[i] = (Medium.dynamicViscosity(states[i]) + Medium.dynamicViscosity(states[i + 1])) / 2;
          Re[i] = noEvent(abs(m_flow[i] * Dhyd[i] / (A[i] * mu[i])));
          Tf[i] = (Medium.temperature(states[i]) + Medium.temperature(states[i+1])) / 2;
          k[i] = (Medium.thermalConductivity(states[i]) + Medium.thermalConductivity(states[i + 1])) / 2;
          cp[i] = (Medium.specificHeatCapacityCp(states[i]) + Medium.specificHeatCapacityCp(states[i+1])) / 2;
          Pr[i] = cp[i] * mu[i] / k[i];
          Nu[i] = 5.5 + 0.0025 * (Re[i] * Pr[i]) ^ 0.8;
          gamma[i] = Nu[i] * k[i] / Dhyd[i];

          Q[i] = gamma[i] * Nt * Constants.pi * Dhyd * L * (Tw[i] - Tf[i]);
        end for;


      end core;
      model test_newton
        import SFR.Utilities.Functions;
        import Modelica.Constants;
        replaceable package Medium = TYMedia.Incompressible.LBE;

        //几何参数
        parameter Integer N(min = 2) = 5 "节点数";
        parameter Integer Nw = N - 1 "控制体数";
        parameter Integer Nt(min = 1) = 1 "Number of tubes in parallel";
        parameter Modelica.Units.SI.Length[Nw] L = ones(Nw) * 0.25 "单控制体长度";
        parameter Modelica.Units.SI.Length[Nw] Dhyd = ones(Nw) * 0.1 "单控制体水力直径";
        parameter Modelica.Units.SI.Area[Nw] A = ones(Nw) * (Constants.pi * Dhyd[1] ^ 2 / 4) "每一段的横截面积 (单管道)";
        parameter Modelica.Units.SI.Length[Nw] height = ones(Nw) * 0 "高度差(b-a)";
        final parameter Modelica.Units.SI.Volume[Nw] V = fill(Nt, Nw) .* A .* L;



        //流质性质
        Medium.AbsolutePressure[N] p(each start = 1e5) "节点压力";
        Medium.SpecificEnthalpy[N] h(each start = 4.725e4) "节点比焓";
        Medium.MassFlowRate m_flow[Nw] "质量流";
        Modelica.Units.SI.Density[Nw] rho "单控制体平均密度";
        Medium.ThermodynamicState[N] states;
        Medium.SpecificInternalEnergy IE[Nw];

        //流动


        replaceable model HeatTransfer = Fluid.Pipes.BaseClasses.HeatTransfer.circle;
        HeatTransfer heatTransfer(
        redeclare package Medium = Medium,
          states = states,
          Nf = N,
          Nw = Nw,
          Nt = Nt,
          L = L,
          Dhyd = Dhyd,
          A = A,
          m_flow = m_flow
          );

        Modelica.Fluid.Interfaces.HeatPorts_a[Nw] wall annotation(Placement(transformation(extent = {{-40, 20}, {40,
          40}}, rotation = 0)));
        TYThermoFluidSys.Boundaries.BoundaryHeatFlow boundaryHeatFlow1(n=4,Q_flow=10000) 
          annotation (Placement(transformation(origin={-48,80},
      extent={{-10,-10},{10,10}})));
        annotation(experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,Interval=0.1,StartTime=0,StopTime=100,StoreEventValue=0,Tolerance=0.0001),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
      grid={2,2})));

      equation
      connect(wall,heatTransfer.wall);
        h[1] = 4.725e4;

        for i in 1:N loop
          p[i] = 1e5;
          states[i] = Medium.setState_phX(p[i], h[i]);
        end for;

        for i in 1:Nw loop
          m_flow[i] = 10;
          rho[i] = (Medium.density(states[i]) + Medium.density(states[i + 1])) / 2;
          IE[i] = (Medium.specificInternalEnergy(states[i]) + Medium.specificInternalEnergy(states[i + 1])) / 2;
          der(rho[i] * IE[i]) * V[i] =
            m_flow[1] * (h[i] - h[i + 1]) + heatTransfer.Q[i];
        end for;
        connect(boundaryHeatFlow1.port, wall) 
        annotation(Line(origin={-19,55},
        points={{-19,25},{17,25},{17,-25},{19,-25}},
        color={191,0,0}));




      end test_newton;
      model compair
        annotation(__MWORKS(version="2025b"),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
grid={2,2})));
        TYThermoFluidSys.Pipelines.DistributePipe_Incompressible distributePipe_Incompressible(n=4,Dh=0.1,wallHeatTransfer=true,redeclare model DP = TYThermoFluidSys.Pipelines.Basic.DP_OnePhase.LinearLoss,initFromEnthalpy=true,h_start_in=1e6,h_start_out=1e6,from_dp=false,redeclare package Medium = TYMedia.Incompressible.LBE,initOpt=TYThermoFluidSys.Utilities.Types.InitOptions.noInit,CF_PressureLoss=1,redeclare model HT = TYThermoFluidSys.Pipelines.Basic.HT_OnePhase.DittusBoelter) 
          annotation (Placement(transformation(origin={-4,4},
      extent={{-10,-10},{10,10}})));
        TYThermoFluidSys.Boundaries.BoundaryMdot boundaryMdot(m_flow=10,redeclare package Medium = TYMedia.Incompressible.LBE,energyDefinition="h",h=1e6) 
          annotation (Placement(transformation(origin={-42,4},
      extent={{-10,-10},{10,10}})));
        TYThermoFluidSys.Boundaries.BoundaryPressure boundaryPressure(redeclare package Medium = TYMedia.Incompressible.LBE,energyDefinition="h",h=1e6) 
          annotation (Placement(transformation(origin={34,4},
      extent={{10,-10},{-10,10}})));
        TYThermoFluidSys.Boundaries.BoundaryHeatFlow boundaryHeatFlow1(n=4,Q_flow=10000) 
          annotation (Placement(transformation(origin={-42,38},
extent={{-10,-10},{10,10}})));
      equation
        connect(distributePipe_Incompressible.portA, boundaryMdot.fluidPort) 
        annotation(Line(origin={-24,4},
        points={{10,0},{-10,0}},
        color={0,178,226}));
        connect(distributePipe_Incompressible.portB, boundaryPressure.fluidPort) 
        annotation(Line(origin={16,4},
        points={{-10,0},{10,0}},
        color={0,178,226}));
        connect(boundaryHeatFlow1.port, distributePipe_Incompressible.q) 
        annotation(Line(origin={-18,24},
        points={{-14,14},{14,14},{14,-15}},
        color={191,0,0}));

      end compair;
    end HeatTransfer;
    annotation(__MWORKS(version="2025b"));
    model test_pipe_dp
      Flow1DFVbase_dp flow1DFVbase(redeclare package Medium = Modelica.Media.Water.StandardWater,  N=5,height_ab=-1) 
        annotation (Placement(transformation(origin={14,0.0181},
    extent={{-10,-10},{10,10}})));
      Modelica.Fluid.Sources.Boundary_ph boundary(nPorts=1,redeclare package Medium =
            Modelica.Media.Water.StandardWater,                                                                          p(displayUnit="Pa")=100000,h=4.725e4) 
        annotation (Placement(transformation(origin={60,0},
    extent={{10,-10},{-10,10}})));
      Modelica.Fluid.Sources.MassFlowSource_h boundary1(nPorts=1,m_flow=10,redeclare
          package                                                                            Medium =
            Modelica.Media.Water.StandardWater,                                                                                          use_m_flow_in=true,h=4.725e4) 
        annotation (Placement(transformation(origin={-26,-0.0181},
    extent={{-10,-10},{10,10}})));
      Modelica.Blocks.Sources.Ramp ramp(offset=10,startTime=50,height=0,duration=5) 
        annotation (Placement(transformation(origin={-70,7.9819},
    extent={{-10,-10},{10,10}})));
    equation
      connect(flow1DFVbase.port_a, boundary1.ports[1]) 
      annotation(Line(origin={10,74},
    points={{-5.97774,-74},{-26,-74.0181}},
    color={0,127,255}));
      connect(flow1DFVbase.port_b, boundary.ports[1]) 
      annotation(Line(origin={10,74},
    points={{14.0222,-74},{40,-74}},
    color={0,127,255}));
      connect(boundary1.m_flow_in, ramp.y) 
      annotation(Line(origin={10,74},
    points={{-46,-66.0181},{-69,-66.0181}},
    color={0,0,127}));

      annotation(__MWORKS(version="2025b"),experiment(Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,NumberOfIntervals=500,StartTime=0,StopTime=100,StoreEventValue=0,Tolerance=0.0001));
    end test_pipe_dp;
    end BaseClasses;
  model pipe_static
    extends Fluid.Pipes.BaseClasses.pipe_Base;
    //介质
    //redeclare package Medium = TYMedia.Incompressible.LBE;

    //接口
    TYThermoFluidSys.Interfaces.FluidInterfaces.FluidPort_a portA(
    redeclare package Medium = Medium,
      m_flow = m_flow[1],
      p = p[1],
      h_outflow(start = h_start) = inStream(portA.h_outflow)
      )
      "流体入口" annotation(Placement(transformation(origin = {-99.7774, -0.180755},
      extent = {{-10, -10}, {10, 10}})));
    TYThermoFluidSys.Interfaces.FluidInterfaces.FluidPort_b portB(
    redeclare package Medium = Medium,
      m_flow = -m_flow[N],
      p = p[N],
      h_outflow(start = h_start) = h[N]
      )
      "流体出口" annotation(Placement(transformation(origin = {100, 0},
      extent = {{10, -10}, {-10, 10}}),
      iconTransformation(origin = {100.222, -0.180755},
      extent = {{10, -10}, {-10, 10}})));


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


  equation
  /**************************************边界条件*********************************************/
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

    //H_flow[1] = m_flow[1] * actualStream(portA.h_outflow);
    //H_flow[N] = m_flow[N] * actualStream(portB.h_outflow);
    for i in 2:N loop
      //h[1]=h[i];
      //H_flow[i] = noEvent(if m_flow[i] >= 0 then m_flow[i] * h[i-1] else m_flow[i] * h[i]);
    end for;
  /*************************************控制体物性计算********************************************/
    for i in 1:Nw loop
      m_flow_avg[i] = (m_flow[i] + m_flow[i+1]) / 2;
      rho[i] = (Medium.density(states[i]) + Medium.density(states[i+1])) / 2;
      mu[i] = (Medium.dynamicViscosity(states[i]) + Medium.dynamicViscosity(states[i+1])) / 2;
      u[i] = m_flow_avg[i]/(rho[i] * 1e3 * A[i]);
      Re[i] = noEvent(abs(m_flow_avg[i] * Dhyd[i] / (A[i] * mu[i])));
      IE[i] = (Medium.specificInternalEnergy(states[i]) + Medium.specificInternalEnergy(states[i + 1])) / 2;
    end for;



  /**************************************换热计算*********************************************/
    if wallHeatTransfer then
      for i in 1:Nw loop
        T_wall[i] = (T[i] + T[i+1]) / 2;
        Q[i] = 0;
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
      der(rho[i]) * V[i] = m_flow[i] - m_flow[i + 1];
      /**************************************动量守恒*********************************************/
      der(rho[i] * u[i]) * L[i] = p[i] - p[i + 1] - friction.dp[i];
      /**************************************能量守恒*********************************************/
      //der(rho[i] * IE[i]) * V[i] = H_flow[i] - H_flow[i+1] + Q[i];
      der(rho[i] * IE[i]) * V[i] = m_flow[i]*h[i] - m_flow[i+1]*h[i+1] + Q[i];


  end for;

  end pipe_static;
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
      u[i] = m_flow_avg[i]/(rho[i] * 1e3 * A[i]);
      Re[i] = noEvent(abs(m_flow_avg[i] * Dhyd[i] / (A[i] * mu[i])));
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
      der(rho[i]) * V[i] = m_flow[i] - m_flow[i + 1];
      /**************************************动量守恒*********************************************/
      der(rho[i] * u[i]) * L[i] = p[i] - p[i + 1] - friction.dp[i];
      /**************************************能量守恒*********************************************/
      der(rho[i] * IE[i]) * V[i] = m_flow[i]*h[i] - m_flow[i+1]*h[i+1] + Q[i];
  end for;

  end pipe;
  end Pipes;
