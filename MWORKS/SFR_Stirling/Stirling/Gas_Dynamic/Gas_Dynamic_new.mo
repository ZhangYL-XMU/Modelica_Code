within SFR.Stirling.Gas_Dynamic;
model Gas_Dynamic_new
  extends SFR.Stirling.Gas_Dynamic.Gas_Partial;
  // 系统初始参数----------------------------------------------------------------
  // 系统内的起始气压
  parameter Modelica.Units.SI.Pressure Po = 900000;
  // 系统外的大气压
  parameter Modelica.Units.SI.Pressure P_ini = 100000;
  // 系统内的起始温度
  parameter Modelica.Units.SI.ThermodynamicTemperature To = 293.15;

  // 气体热力学参数---------------------------------------------------------------
  // 氦气的摩尔质量
  parameter .Real M = 4;
  // 气体常数（J/(kmol*K)）
  parameter .Real R = 8314.472;
  // 氦气比热容
  parameter .Real cv = 3213.7;
  // 粘性系数
  parameter .Real mu = 1.89e-5;
  // 膨胀活塞直径
  parameter .Real d1 "diameter of first piston";
  // 活塞长度
  parameter .Real l_d;
  // 压缩活塞直径
  parameter .Real d2 "diameter of second piston";
  // 气缸直径
  parameter .Real dc;
  // Π
  constant .Real pi = 3.1415926;
  // 膨胀活塞面积
  parameter .Real A1 = pi*(d1^2)/4;
  // 压缩活塞面积
  parameter .Real A2 = pi*(d2^2)/4;
  // 活塞和气缸间气隙的横截面积
  parameter .Real A_an = pi*(dc^2 - d1^2)/4;
  // 通道体积
  parameter .Real V_1 = A_an * l_d * 10;
  // 膨胀气缸死体积
  parameter .Real Vm1;
  // 压缩气缸死体积
  parameter .Real Vm2;
  // 膨胀气缸内工质的起始体积
  parameter .Real V1o = Vm1 + A1*(1+sin(3.1514/2))/10;
  // 压缩气缸内工质的起始体积
  parameter .Real V2o = Vm2 + A2*(1/10) - A1*(1+sin(3.1514/2))/10;
  // 膨胀气缸内工质的起始的物质的量
  parameter .Real n1_o = (Po*V1o)/(R*To);
  // 压缩气缸内工质的起始的物质的量
  parameter .Real n2_o = (Po*V2o)/(R*To);
  // 发动机内工质的总体积
  parameter Modelica.Units.SI.Volume VT = V1o + V2o + V_1;
  // 发动机内所有工质的起始的物质的量
  parameter .Real nt_o = (Po*VT)/(R*To);
  // 通道面积
  parameter .Real A_l = pi*d1*l_d;
  // 氦气的理想气体常数
  parameter .Real Rp = R/M;
  // 加热端的换热系数
  parameter .Real Uc;
  // 冷却端的换热系数
  parameter .Real Uf;
  // 加热端的换热面积
  parameter .Real Ac = A1;
  // 冷却端的换热面积
  parameter .Real Af = A2;

  // 蓄热器参数------------------------------------------------------------------
  // 蓄热器质量
  parameter .Real m_reg = 0.01;
  // 蓄热器比热容
  parameter .Real cp_reg = 1000;
  // 蓄热器换热能力（W/K）
  parameter .Real U_reg = 200;

  // 功率相关参数----------------------------------------------------------------
  // calculate power
  parameter .Real Z = 1;

  // 热损失相关参数---------------------------------------------------------------
  // 热传导损失的系数
  parameter .Real k_o = 5;

  // 待求解变量------------------------------------------------------------------
  // 气体工质的总物质的量
   .Real nt(start = nt_o);
   // 膨胀气缸内工质的体积
   .Real V1   ;
   // 压缩气缸内工质的体积
   .Real V2   ;
   // 膨胀气缸内工质的气压
   .Real P1(start = Po);
   // 压缩气缸内工质的气压
   .Real P2(start = Po);
   // 膨胀气缸内工质的物质的量
   .Real n1(start = n1_o);
   // 压缩气缸内工质的物质的量
   .Real n2(start = n2_o);
   // 通道内工质的物质的量
   .Real n_l(start = nt_o - n1_o - n2_o);
   // 膨胀气缸内工质的质量
   .Real m1   ;
   // 压缩气缸内工质的质量
   .Real m2   ;
   // 通道内工质的质量
   .Real m_l   ;
   // 发动机系统内工质的总质量
   .Real mt   ;
   // 膨胀气缸内工质的温度
   .Real T1(start = To);
   // 压缩气缸内工质的温度
   .Real T2(start = To);
   // 通道内工质的温度
   .Real T_l(start = To);
   // 压缩活塞的位移
   .Real sp   ;
   // 膨胀活塞的位移
   .Real sd   ;
   // 膨胀气缸内工质的密度
   .Real ro1   ;
   // 压缩气缸内工质的密度
   .Real ro2   ;
   // 通道内工质的气压
   .Real P_l(start = Po);
   // 膨胀活塞的运动速度
   .Real c;
   // 压缩气缸内工质的质量流
   .Real mp2   ;
   // 膨胀气缸内工质的质量流
   .Real mp1   ;
   // 通道内工质的密度
   .Real ro_l   ;
   // 膨胀气缸内工质的热量
   .Real Qc(start = n1_o*M*cv*To);
   // 压缩气缸内工质的热量
   .Real Qf(start = n2_o*M*cv*To);
   // 通道内工质的热量
   .Real Q_l(start = (nt_o-n1_o-n2_o)*M*cv*To);
   // 膨胀气缸内工质从热源的吸热量（系统的总热量流入）
   .Real Qpc;
   // 压缩气缸内工质向冷源的放热量（系统的总热量流出）
   .Real Qpf;

   // 蓄热器温度
   .Real T_reg(start = To);
   // 蓄热器热量
   .Real Q_reg(start = m_reg*cp_reg*To);
   // 蓄热器热流
   .Real Qp_reg;

   // 计算功率用的系数
   .Real B_n;
   // 参与计算的实时功率（不方便记录）
   .Real power_cal;
   // 功率
   .Real power;
   // 热传导损耗
   .Real Qpo;
   // 蓄热器损耗
   .Real Qpr;
equation
  // 两个活塞的位移轨迹
  sd = (1+sin(u1*time+3.1514/2))/10;
  sp = (1+sin(u*time))/10;

  V1 = Vm1 + A1*sd;
  V2 = Vm2 + A2*sp - A1*sd + 2*l_d*A1;

  P_l = (P1+P2)/2;

  // 初始化“质量”
  M*n1 = m1;
  M*n2 = m2;
  M*n_l = m_l;

  mt = m1 + m2 + m_l;
  nt = mt/M;

  //
  V1*P1 = n1*R*T1;
  V2*P2 = n2*R*T2;

  // 初始化“密度”
  ro1 = P1/(Rp*T1);
  ro2 = P2/(Rp*T2);
  ro_l = P_l/(Rp*T_l);

  Qpc = Uc*(u2-T1);
  Qpf = (-Uf)*(T2-u3);
  Qpo = k_o * (u2 - u3);
  Qpr = nt * 15000 * (T1 - T2);
  Qc = m1*cv*T1;
  Qf = m2*cv*T2;

  Q_l = m_l*cv*T_l;

  // 根据活塞的运动方向判断热流走向
  if c<0 then
    mp1 = c*A_an*ro_l*1;
    mp2 = c*A_an*ro2*1;
  else
    mp1 = c*A_an*ro1*1;
    mp2 = c*A_an*ro_l*1;
  end if;

  // 各部分的质量流
  der(m1) = -mp1;
  der(m_l) = mp1 - mp2;
  der(m2) = mp2;

  B_n = 0.33*(u2-u3)/(u2+u3);

  // 计算实时功率
  if c<0 then
    power_cal = -(B_n*Z*pi/8*P_l*d1*d1*c);
  else
    power_cal = (B_n*Z*pi/8*P_l*d1*d1*c);
  end if;


  (P1-P2)*A_an - A_l*mu*(der(sd)/((dc-d1)/2)) = c*der(m_l)/(u*20) + m_l*der(c)/(u*20);


  Qp_reg =  U_reg*(T_reg - T_l);


  Q_reg = m_reg*cp_reg*(T_reg);


  der(Q_reg) = -Qp_reg;

  // 根据活塞运动方向判断通道内热量的改变情况
  if c<0 then
    der(Q_l) = -mp2*cv*T2 + mp1*cv*T_l + Qp_reg;
  else
    der(Q_l) = -mp2*cv*T_l + mp1*cv*T1 + Qp_reg;
  end if;

  // 根据活塞运动方向判断高温气缸内工质的热量改变情况
  if c<0 then
    der(Qc) = Qpc - mp1*cv*T_l - power_cal - Qpo - Qpr;
  else
    der(Qc) = Qpc - mp1*cv*T1;
  end if;

  // 根据活塞运动方向判断高温气缸内工质的热量改变情况
  if c<0 then
    der(Qf) = Qpf + mp2*cv*T2;
  else
    der(Qf) = Qpf + mp2*cv*T_l;
  end if;

  // 能量守恒，计算功率
  power = Qpc + Qpf - Qpo - Qpr;

  // 压缩活塞的驱动力
  f = (P2-P_ini)*A2;
  // 膨胀活塞的驱动力
  f1 = (P1-P_ini)*A1*16/25;
end Gas_Dynamic_new;