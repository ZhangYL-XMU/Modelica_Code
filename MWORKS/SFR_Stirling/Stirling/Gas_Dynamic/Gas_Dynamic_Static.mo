within SFR.Stirling.Gas_Dynamic;
model Gas_Dynamic_Static
  extends SFR.Stirling.Gas_Dynamic.Gas_Partial;
  parameter Modelica.Units.SI.Pressure Po = 900000;
  parameter Modelica.Units.SI.Pressure P_ini = 100000;
  parameter Modelica.Units.SI.ThermodynamicTemperature To = 273.15;

  parameter .Real M = 4;
  parameter .Real R = 8314.472;
  parameter .Real cv = 3213.7;
  parameter .Real mu = 1.89e-5;

  parameter .Real d1 "diameter of first piston";
  parameter .Real l_d;
  parameter .Real d2 "diameter of second piston";
  parameter .Real dc;
  constant .Real pi = 3.1415926;
  parameter .Real A1 = pi*(d1^2)/4;
  parameter .Real A2 = pi*(d2^2)/4;
  parameter .Real A_an = pi*(dc^2 - d1^2)/4;
  parameter .Real V_1 = A_an * l_d * 10;
  parameter .Real Vm1;
  parameter .Real Vm2;
  parameter .Real V1o = Vm1 + A1*(1+sin(3.1514/2))/10;
  parameter .Real V2o = Vm2 + A2*(1/10) - A1*(1+sin(3.1514/2))/10;
  parameter .Real n1_o = (Po*V1o)/(R*To);
  parameter .Real n2_o = (Po*V2o)/(R*To);
  parameter Modelica.Units.SI.Volume VT = V1o + V2o + V_1;
  parameter .Real nt_o = (Po*VT)/(R*To);
  parameter .Real A_l = pi*d1*l_d;
  parameter .Real Rp = R/M;
  parameter .Real Uc;
  parameter .Real Uf;
  parameter .Real Ac = A1;
  parameter .Real Af = A2;

  parameter .Real m_reg = 0.01;
  parameter .Real cp_reg = 1000;
  parameter .Real U_reg = 200;

  // calculate power
  parameter .Real Z = 1;

  // others Q_loss
  parameter .Real k_o = 5;

   .Real power_cal;
   .Real nt(start = nt_o);
   .Real V1   ;
   .Real V2   ;
   .Real P1(start = Po);
   .Real P2(start = Po);
   .Real n1(start = n1_o);
   .Real n2(start = n2_o);
   .Real n_l(start = nt_o - n1_o - n2_o);
   .Real m1   ;
   .Real m2   ;
   .Real m_l   ;
   .Real mt   ;
   .Real T1(start = To);
   .Real T2(start = To);
   .Real T_l(start = To);
   .Real sp   ;
   .Real sd   ;
   .Real ro1   ;
   .Real ro2   ;
   .Real P_l(start = Po);
   .Real c;
   .Real mp2   ;
   .Real mp1   ;
   .Real ro_l   ;
   .Real Qc(start = n1_o*M*cv*To);
   .Real Qf(start = n2_o*M*cv*To);
   .Real Q_l(start = (nt_o-n1_o-n2_o)*M*cv*To);
   .Real Qpc;
   .Real Qpf;

   .Real T_reg(start = To);
   .Real Q_reg(start = m_reg*cp_reg*To);
   .Real Qp_reg;

   .Real B_n;
   //.Real power_one_cycle;
   .Real power;
   // conduction loss
   .Real Qpo;
   .Real Qpr;
equation
  sd = -u;
  sp = -u1;

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

  if noEvent(c<0) then
    mp1 = c*A_an*ro_l*1;
    mp2 = c*A_an*ro2*1;
  else
    mp1 = c*A_an*ro1*1;
    mp2 = c*A_an*ro_l*1;
  end if;

  der(m1) = -mp1;
  der(m_l) = mp1 - mp2;
  der(m2) = mp2;

  B_n = 0.33*(u2-u3)/(u2+u3);

  if noEvent(c<0) then
    power_cal = -(B_n*Z*pi/8*P_l*d1*d1*c);
  else
    power_cal = (B_n*Z*pi/8*P_l*d1*d1*c);
  end if;

  (P1-P2)*A_an - A_l*mu*(der(sd)/((dc-d1)/2)) = c*der(m_l)/5000 + m_l*der(c)/5000;


  Qp_reg =  U_reg*(T_reg - T_l);


  Q_reg = m_reg*cp_reg*(T_reg);


  der(Q_reg) = -Qp_reg;

  if noEvent(c<0) then
    der(Q_l) = -mp2*cv*T2 + mp1*cv*T_l + Qp_reg;
  else
    der(Q_l) = -mp2*cv*T_l + mp1*cv*T1 + Qp_reg;
  end if;

  if noEvent(c<0) then
    der(Qc) = Qpc - mp1*cv*T_l - power_cal - Qpo - Qpr;
  else
    der(Qc) = Qpc - mp1*cv*T1;
  end if;

  if noEvent(c<0) then
    der(Qf) = Qpf + mp2*cv*T2;
  else
    der(Qf) = Qpf + mp2*cv*T_l;
  end if;

  power = Qpc + Qpf - Qpo - Qpr;

  f = (P2-P_ini)*A2;
  f1 = (P1-P_ini)*A1*16/25;

end Gas_Dynamic_Static;
