function state_dot=state_dot_fn2(t, vector)
%This program calculates the states derivative for the a/c nonlinear model
%It requires the Operating Conditions, Initial Conditions (global variables) & Controllers
global uo vo wo po qo ro phio thetao epsaio deo dTo dao dro de dT da dr reference

    %----------FOXTROT - A twin engined, jet fighter/bomber aircraft
    %----------Opertating Conditions--------

         Uo=265; %m/s
         alphao=2.6; %deg
         gammao=0; %deg
        %----------A/C Characteristics------
        Ix=33900; Iy=16600; Iz=190000; Ixz=3000; %kg.m^2
        %----------Stability Derivatives-------
        Xu=-0.009; Xw=0.016; Xde=0.69; XdT=0.00006;
        Zu=-0.088; Zw=-0.547; Zwd=0; Zq=-0.88; Zde=-15.12; ZdT=-0.00005;
        Mu=-0.008; Mw=-0.03; Mwd=-0.001; Mq=-0.487; Mde=-11.4; MdT=-0.000003;
        Yv=-80.6/Uo; Yp=0; Yr=0; Lbetad=-18.3; Lpd=-1.24; Lrd=0.395; Nbetad=4.97; Npd=-0.0504; Nrd=-0.238;
        Ydast=-0.0007; Ydrst=0.0043; Ldad=9; Ldrd=1.95; Ndad=0.2; Ndrd=2.6;

        
g=9.801;
Lbeta=-(Nbetad*Ixz-Ix*Lbetad)/Ix; Nbeta=(Iz*Nbetad-Ixz*Lbetad)/Iz;
Lp=-(Npd*Ixz-Ix*Lpd)/Ix; Np=(Iz*Npd-Ixz*Lpd)/Iz;
Lr=-(Nrd*Ixz-Ix*Lrd)/Ix; Nr=(Iz*Nrd-Ixz*Lrd)/Iz;
Lda=-(Ndad*Ixz-Ix*Ldad)/Ix; Nda=(Iz*Ndad-Ixz*Ldad)/Iz;
Ldr=-(Ndrd*Ixz-Ix*Ldrd)/Ix; Ndr=(Iz*Ndrd-Ixz*Ldrd)/Iz;
u=vector(1); v=vector(2); w=vector(3); p=vector(4); q=vector(5); r=vector(6); phi=vector(7); theta=vector(8); epsai=vector(9);

%-------------controller-------------

de= -(-0.0012)*u - (0.0638)*w - (-0.6903)*q + (-19.4472)*(reference - theta); 
if de>.5
    de=.5;
end
if de<-.5
    de=-.5;
end

%-----------------States Dots---------------
J=Ix*Iz-Ixz^2; c1=((Iy-Iz)*Iz-Ixz^2)/J; c2=(Ix-Iy+Iz)*Ixz/J; c3=Iz/J; c4=Ixz/J; c5=(Iz-Ix)/Iy; c6=Ixz/Iy; c7=1/Iy; c8=(Ix*(Ix-Iy)+Ixz^2)/J; c9=Ix/J;
Fx_m=g*(sin(thetao)-sin(theta))+Xu*(u-uo)+Xw*(w-wo)+Xde*(de-deo)+XdT*(dT-dTo);
udot=Fx_m-q*w+r*v;
Fy_m=g*(sin(phi)*cos(theta)-sin(phio)*cos(thetao))+Yv*(v-vo)+Yp*(p-po)+Yr*(r-ro)+Ydast*uo*(da-dao)+Ydrst*uo*(dr-dro);
vdot=Fy_m-r*u+p*w;
Fz_m=g*(cos(theta)*cos(phi)-cos(thetao)*cos(phio))+Zu*(u-uo)+Zw*(w-wo)+Zq*(q-qo)+Zde*(de-deo)+ZdT*(dT-dTo);
wdot=Fz_m+q*u-p*v;
L=Ix*(Lbeta*(atan(v/u)-atan(vo/uo))+Lp*(p-po)+Lr*(r-ro)+Lda*(da-dao)+Ldr*(dr-dro));
M=Iy*(Mu*(u-uo)+Mw*(w-wo)+Mq*(q-qo)+Mde*(de-deo)+MdT*(dT-dTo));
N=Iz*(Nbetad*(atan(v/u)-atan(vo/uo))+Np*(p-po)+Nr*(r-ro)+Nda*(da-dao)+Ndr*(dr-dro));
pdot=(c1*r+c2*p)*q+c3*L+c4*N;
qdot=c5*p*r-c6*(p^2-r^2)+c7*M;
rdot=(c8*p-c2*r)*q+c4*L+c9*N;
phidot=p+tan(theta)*(q*sin(phi)+r*cos(phi));
thetadot=q*cos(phi)-r*sin(phi);
epsaidot=(q*sin(phi)+r*cos(phi))/cos(theta);
xdot=u*cos(theta)*cos(epsai)+v*(sin(phi)*sin(theta)*cos(epsai)-cos(phi)*sin(epsai))+w*(sin(phi)*sin (epsai)+cos(phi)*sin(theta)*cos(epsai));
ydot=u*cos(theta)*sin(epsai)+v*(sin(phi)*sin(theta)*sin(epsai)+cos(phi)*cos(epsai))+w*(cos(phi)*sin(theta)*sin (epsai)-sin(phi)*cos(epsai));
zdot=-u*sin(theta)+v*sin(phi)*cos(theta)+w*cos(phi)*cos(theta);
state_dot=[udot vdot wdot pdot qdot rdot phidot thetadot epsaidot ]';