clear, clc
% Aircraft: FOXTROT - A twin engined, jet fighter/bomber aircraft

%----------Opertating Conditions--------
 Uo=265; %m/s
 alphao=2.6; %deg
 gammao=0; %deg
 g=9.801;
 
%----------Aircraft Characteristics------
Ix=33900; Iy=16600; Iz=190000; Ixz=3000; %kg.m^2
J=Ix*Iz-Ixz^2; c1=((Iy-Iz)*Iz-Ixz^2)/J; c2=(Ix-Iy+Iz)*Ixz/J; c3=Iz/J; c4=Ixz/J; c5=(Iz-Ix)/Iy; c6=Ixz/Iy; c7=1/Iy; c8=(Ix*(Ix-Iy)+Ixz^2)/J; c9=Ix/J;

%----------Stability Derivatives-------
Xu=-0.009; Xw=0.016; Xde=0.69; XdT=0.00006;
Zu=-0.088; Zw=-0.547; Zwd=0; Zq=-0.88; Zde=-15.12; ZdT=-0.00005;
Mu=-0.008; Mw=-0.03; Mwd=-0.001; Mq=-0.487; Mde=-11.4; MdT=-0.000003;
Yv=-80.6/Uo; Yp=0; Yr=0; Lbetad=-18.3; Lpd=-1.24; Lrd=0.395; Nbetad=4.97; Npd=-0.0504; Nrd=-0.238;
Ydast=-0.0007; Ydrst=0.0043; Ldad=9; Ldrd=1.95; Ndad=0.2; Ndrd=2.6;
Lbeta=-(Nbetad*Ixz-Ix*Lbetad)/Ix; Nbeta=(Iz*Nbetad-Ixz*Lbetad)/Iz;
Lp=-(Npd*Ixz-Ix*Lpd)/Ix; Np=(Iz*Npd-Ixz*Lpd)/Iz;
Lr=-(Nrd*Ixz-Ix*Lrd)/Ix; Nr=(Iz*Nrd-Ixz*Lrd)/Iz;
Lda=-(Ndad*Ixz-Ix*Ldad)/Ix; Nda=(Iz*Ndad-Ixz*Ldad)/Iz;
Ldr=-(Ndrd*Ixz-Ix*Ldrd)/Ix; Ndr=(Iz*Ndrd-Ixz*Ldrd)/Iz;

%---------Full longitudinal dynamics-------------
%X_full = [u,w,q,theta,h]';
A_full = [Xu Xw 0 -g 0;
    Zu Zw Uo 0 0;
    Mu Mw Mq 0 0;
    0 0 1 0 0;
    0 -1 0 Uo 0];
B_full= [Xde;Zde;Mde;0;0];
C_full = [0 0 0 0 1];
D_full = 0;

co_full = rank(ctrb(A_full,B_full));               % check controllability
obs_full = rank(obsv(A_full,C_full));              % check observability

%LQR technique:
K_full = lqr(A_full,B_full,[0 0 0 0 0;0 0 0 0 0;0 0 0 0 0;0 0 0 0 0;0 0 0 0 0.5],50);
A_clfull = A_full-B_full*K_full;
sys4 = ss(A_clfull,B_full,eye(5),D_full);
t=0:0.01:10;
X=initial(sys4,[0;0;0;0;15],t);
x1 = [1 0 0 0 0]*X';
x2 = [0 1 0 0 0]*X';
x3 = [0 0 1 0 0]*X';
x4 = [0 0 0 1 0]*X';
x5 = [0 0 0 0 1]*X';
figure;
subplot(3,2,1);
plot(t,x1)
title('u');
subplot(3,2,2);
plot(t,x2)
title('w');
subplot(3,2,3);
plot(t,x3)
title('q');
subplot(3,2,4);
plot(t,x4)
title('theta');
subplot(3,2,5);
plot(t,x5)
title('h');
sys3 = ss(A_clfull,B_full*K_full(1),[0 0 0 0 1],D_full);
% subplot(3,2,6);
% step(sys3)

%-------------Short period approximation----------
%X_short = [w,q]';
A_short = [Zw Uo;
            Mw Mq];
        
B_short= [Zde;Mde];
A_cl_sp = A_short-B_short*K_full(1,2:3);
sys1 = ss(A_cl_sp,B_short,eye(2),0);
damp(sys1) % 0.3<Zeta_sp<1.3

%-------------long period approximation----------
%X_short = [u,theta]';
A_long = [Xu -g;-Zu/Uo 0];
B_long= [Xde;-Zde/Uo];
A_cl_sp = A_long-B_long(1)*K_full(1)-B_long(2)*K_full(2);
sys2 = ss(A_cl_sp,B_short,eye(2),0);
damp(sys2) % zeta_lp > 0.4
%so it became: level1 catC class4