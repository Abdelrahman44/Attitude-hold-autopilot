function state_dot=state_dot_fn2(vector)
%This program calculates the states derivative for the a/c nonlinear model
%It requires the Operating Conditions, Initial Conditions (global variables) & Controllers
global choice OC_ch uo vo wo po qo ro phio thetao epsaio deo dTo dao dro de dT da dr
if choice==1
    %----------ALPHA - A four engined, executive jet aircraft
    %----------Opertating Conditions--------
    if OC_ch==1
        Uo=67.7; %m/s
        alphao=6.5; %deg
        gammao=0; %deg
        %----------A/C Characteristics------
        Ix=57000; Iy=171500; Iz=218500; Ixz=7500; %kg.m^2
        %----------Stability Derivatives-------
        Xu=-0.0166; Xw=0.108; Xde=0.6; XdT=0.92*10^-4;
        Zu=-0.175; Zw=-1.01; Zwd=0; Zq=-0.76; Zde=-5.24; ZdT=0;
        Mu=0.0043; Mw=-0.033; Mwd=-0.003; Mq=-0.546; Mde=-2.26; MdT=-0.65*10^-5;    
        Yv=-0.014; Yp=0; Yr=0; Ydast=0; Ydrst=0.034;
        Lbetad=-4.05; Lpd=-1.85; Lrd=0.52; Ldad=2.21; Ldrd=1.11;
        Nbetad=1.34; Npd=-0.25; Nrd=-0.19; Ndad=-0.006; Ndrd=-0.64;
    elseif OC_ch==2
         Uo=110.6; %m/s
         alphao=9.9; %deg
         gammao=0; %deg
         %----------A/C Characteristics------
         Ix=162000; Iy=185000; Iz=330000; Ixz=6900; %kg.m^2
        %----------Stability Derivatives-------
        Xu=-0.00324; Xw=0.00102; Xde=0.8; XdT=5.73*10^-5;
        Zu=-0.08; Zw=-0.565; Zwd=0; Zq=-0.88; Zde=-4.57; ZdT=0;
        Mu=0.0033; Mw=-0.022; Mwd=-0.0015; Mq=-0.439; Mde=-2.95; MdT=-0.6*10^-5;
        Yv=-0.076; Yp=0; Yr=0; Ydast=0; Ydrst=0.018;
        Lbetad=-3.23; Lpd=-0.58; Lrd=0.17; Ldad=1.1; Ldrd=0.57;
        Nbetad=1.21; Npd=-0.12; Nrd=-0.125; Ndad=-0.08; Ndrd=-0.62;
    elseif OC_ch==3
        Uo=237.1; %m/s
        alphao=2.6; %deg
        gammao=0; %deg
         %----------A/C Characteristics------
         Ix=162000; Iy=185000; Iz=330000; Ixz=6900; %kg.m^2
        %----------Stability Derivatives-------
        Xu=-0.0157; Xw=-0.0005; Xde=1.02; XdT=5.73*10^-5;
        Zu=-0.02; Zw=-1.33; Zwd=0; Zq=-1.25; Zde=-22.4; ZdT=0;
        Mu=-0.0015; Mw=-0.051; Mwd=-0.002; Mq=-1.09; Mde=-14.5; MdT=-0.6*10^-5;
        Yv=-0.167; Yp=0; Yr=0; Ydast=0; Ydrst=0.037;
        Lbetad=-4.93; Lpd=-1.34; Lrd=0.09; Ldad=5.83; Ldrd=2.43;
        Nbetad=5.63; Npd=-0.14; Nrd=-0.25; Ndad=-0.06; Ndrd=-2.66;
    elseif OC_ch==4
        Uo=236; %m/s
        alphao=4.2; %deg
        gammao=0; %deg
         %----------A/C Characteristics------
         Ix=162000; Iy=185000; Iz=330000; Ixz=6900; %kg.m^2
        %----------Stability Derivatives-------
        Xu=-0.211*10^-5; Xw=-0.0043; Xde=0.774; XdT=5.73*10^-5;
        Zu=-0.035; Zw=-0.665; Zwd=0; Zq=-0.39; Zde=-10.55; ZdT=0;
        Mu=-0.014; Mw=-0.025; Mwd=-0.001; Mq=-0.506; Mde=-6.78; MdT=-0.6*10^-5;
        Yv=-0.078; Yp=0; Yr=0; Ydast=0; Ydrst=0.016;
        Lbetad=-2.27; Lpd=-0.64; Lrd=0.06; Ldad=2.64; Ldrd=1.21;
        Nbetad=2.66; Npd=-0.07; Nrd=-0.12; Ndad=-0.072; Ndrd=-1.16;
    end
    elseif choice==2
    %----------CHARLIE - A very large, four engined, passenger jet aircraft
    %----------Opertating Conditions--------
    if OC_ch==1
        Uo=67; %m/s
        alphao=8.5; %deg
        gammao=0; %deg
        %----------A/C Characteristics------
        Ix=18.8*10^6; Iy=41.35*10^6; Iz=58*10^6; Ixz=1.2*10^6; %kg.m^2
        %----------Stability Derivatives-------
        Xu=-0.021; Xw=0.122; Xde=0.292; XdT=3.88*10^-6;
        Zu=-0.2; Zw=-0.512; Zwd=0; Zq=-1.9; Zde=-1.96; ZdT=-1.69*10^-7;
        Mu=0.000036; Mw=-0.006; Mwd=-0.0008; Mq=-0.357; Mde=-0.378; MdT=0.7*10^-7;
        Yv=-0.089; Yp=0; Yr=0; Ydast=0; Ydrst=0.015;
        Lbetad=-1.33; Lpd=-0.98; Lrd=0.33; Ldad=0.33; Ldrd=0.06;
        Nbetad=0.17; Npd=-0.17; Nrd=-0.217; Ndad=0.026; Ndrd=-0.15;
    elseif OC_ch==2
         Uo=158; %m/s
         alphao=6.8; %deg
         gammao=0; %deg
         %----------A/C Characteristics------
         Ix=24.6*10^6; Iy=45*10^6; Iz=67.5*10^6; Ixz=1.32*10^6; %kg.m^2
        %----------Stability Derivatives-------
        Xu=0.003; Xw=0.078; Xde=0.616; XdT=3.434*10^-6;
        Zu=-0.07; Zw=-0.433; Zwd=0; Zq=-1.95; Zde=-5.15; ZdT=-1.5*10^-7;
        Mu=0.00008; Mw=-0.006; Mwd=-0.0004; Mq=-0.421; Mde=-1.09; MdT=0.67*10^-7;
        Yv=-0.082; Yp=0; Yr=0; Ydast=0; Ydrst=0.014;
        Lbetad=-2.05; Lpd=-0.65; Lrd=0.38; Ldad=0.13; Ldrd=0.15;
        Nbetad=0.42; Npd=-0.07; Nrd=-0.14; Ndad=0.018; Ndrd=-0.39;
    elseif OC_ch==3
        Uo=250; %m/s
        alphao=0; %deg
        gammao=0; %deg
        %----------A/C Characteristics------
        Ix=24.6*10^6; Iy=45*10^6; Iz=67.5*10^6; Ixz=1.32*10^6; %kg.m^2
        %----------Stability Derivatives-------
        Xu=-0.0002; Xw=0.026; Xde=0; XdT=3.434*10^-6;
        Zu=-0.09; Zw=-0.624; Zwd=0; Zq=-3.04; Zde=-8.05; ZdT=-1.5*10^-7;
        Mu=-0.00007; Mw=-0.005; Mwd=-0.0007; Mq=-0.668; Mde=-2.08; MdT=0.67*10^-7;
        Yv=-0.12; Yp=0; Yr=0; Ydast=0; Ydrst=0.014;
        Lbetad=-4.12; Lpd=-0.98; Lrd=0.29; Ldad=0.31; Ldrd=0.18;
        Nbetad=1.62; Npd=-0.016; Nrd=-0.232; Ndad=0.013; Ndrd=-0.92;
    elseif OC_ch==4
        Uo=250; %m/s
        alphao=4.6; %deg
        gammao=0; %deg
        %----------A/C Characteristics------
        Ix=24.6*10^6; Iy=45*10^6; Iz=67.5*10^6; Ixz=1.32*10^6; %kg.m^2
        %----------Stability Derivatives-------
        Xu=0.0002; Xw=0.0002; Xde=0.44; XdT=3.434*10^-6;
        Zu=-0.07; Zw=-0.317; Zwd=0; Zq=-1.57; Zde=-5.46; ZdT=-1.5*10^-7;
        Mu=0.00006; Mw=-0.003; Mwd=-0.0004; Mq=-0.339; Mde=-1.16; MdT=0.67*10^-7;
        Yv=-0.056; Yp=0; Yr=0; Ydast=0; Ydrst=0.012;
        Lbetad=-1.05; Lpd=-0.47; Lrd=0.39; Ldad=0.14; Ldrd=0.15;
        Nbetad=0.6; Npd=-0.032; Nrd=-0.115; Ndad=0.008; Ndrd=-0.48;
    end
    elseif choice==3
    %----------DELTA - A very large, four engined, cargo jet aircraft
    %----------Opertating Conditions--------
    if OC_ch==1
        Uo=75; %m/s
        alphao=2.7; %deg
        gammao=0; %deg
        %----------A/C Characteristics------
        Ix=2.6*10^7; Iy=4.25*10^7; Iz=6.37*10^7; Ixz=3.4*10^6; %kg.m^2
        %----------Stability Derivatives-------
        Xu=-0.02; Xw=0.1; Xde=0.14; XdT=0.17*10^-4;
        Zu=-0.23; Zw=-0.634; Zwd=0; Zq=-0.76; Zde=-2.9; ZdT=0.06*10^-5;
        Mu=-2.55*10^-5; Mw=-0.005; Mwd=-0.003; Mq=-0.61; Mde=-0.64; MdT=1.44*10^-5;
        Yv=-0.078; Yp=0; Yr=0; Ydast=-0.0001; Ydrst=0.0065;
        Lbetad=-0.635; Lpd=-1.09; Lrd=0.613; Ldad=0.46; Ldrd=0.1;
        Nbetad=0.11; Npd=-0.16; Nrd=-0.23; Ndad=0.05; Ndrd=-0.21;
    elseif OC_ch==2
         Uo=190; %m/s
         alphao=2.2; %deg
         gammao=0; %deg
        %----------A/C Characteristics------
        Ix=3.77*10^7; Iy=4.31*10^7; Iz=7.62*10^7; Ixz=3.35*10^6; %kg.m^2
        %----------Stability Derivatives-------
        Xu=-0.003; Xw=0.04; Xde=0.26; XdT=0.15*10^-4;
        Zu=-0.08; Zw=-0.618; Zwd=0; Zq=-0.88; Zde=-6.83; ZdT=0.05*10^-5;
        Mu=3.28*10^-4; Mw=-0.007; Mwd=-0.001; Mq=-0.77; Mde=-1.25; MdT=1.42*10^-5;
        Yv=-0.11; Yp=0; Yr=0; Ydast=-0.29*10^-4; Ydrst=0.0055;
        Lbetad=-1.33; Lpd=-1; Lrd=0.28; Ldad=0.43; Ldrd=0.187;
        Nbetad=0.432; Npd=-0.09; Nrd=-0.2; Ndad=0.03; Ndrd=-0.52;
    elseif OC_ch==3
        Uo=253; %m/s
        alphao=0.1; %deg
        gammao=0; %deg
        %----------A/C Characteristics------
        Ix=3.77*10^7; Iy=4.31*10^7; Iz=7.62*10^7; Ixz=3.35*10^6; %kg.m^2
        %----------Stability Derivatives-------
        Xu=-0.02; Xw=0.02; Xde=0.32; XdT=0.15*10^-4;
        Zu=-0.01; Zw=-0.925; Zwd=0; Zq=-1.25; Zde=-9.51; ZdT=0.05*10^-5;
        Mu=14.21*10^-4; Mw=-0.0011; Mwd=-0.001; Mq=-1.02; Mde=-1.51; MdT=1.42*10^-5;
        Yv=-0.15; Yp=0; Yr=0; Ydast=-0.38*10^-4; Ydrst=0.006;
        Lbetad=-2.38; Lpd=-1.42; Lrd=0.3; Ldad=0.37; Ldrd=0.29;
        Nbetad=0.885; Npd=-0.09; Nrd=-0.25; Ndad=0.09; Ndrd=-0.83;
    elseif OC_ch==4
        Uo=260; %m/s
        alphao=4.9; %deg
        gammao=0; %deg
        %----------A/C Characteristics------
        Ix=3.77*10^7; Iy=4.31*10^7; Iz=7.62*10^7; Ixz=3.35*10^6; %kg.m^2
        %----------Stability Derivatives-------
        Xu=-0.03; Xw=0; Xde=0.45; XdT=0.15*10^-4;
        Zu=0.17; Zw=-0.387; Zwd=0; Zq=-0.39; Zde=-5.18; ZdT=0.05*10^-5;
        Mu=54.79*10^-4; Mw=-0.006; Mwd=-0.0005; Mq=-0.55; Mde=-0.92; MdT=1.42*10^-5;
        Yv=-0.07; Yp=0; Yr=0; Ydast=-0.18*10^-4; Ydrst=0.002;
        Lbetad=0.333; Lpd=-0.63; Lrd=0.26; Ldad=0.36; Ldrd=0.107;
        Nbetad=0.386; Npd=-0.07; Nrd=-0.009; Ndad=0.04; Ndrd=-0.34;
    end
    elseif choice==4
    %----------FOXTROT - A twin engined, jet fighter/bomber aircraft
    %----------Opertating Conditions--------
    if OC_ch==1
        Uo=70; %m/s
        alphao=11.7; %deg
        gammao=0; %deg
        %----------A/C Characteristics------
        Ix=32100; Iy=16000; Iz=181400; Ixz=2100; %kg.m^2
        %----------Stability Derivatives-------
        Xu=-0.042; Xw=0.14; Xde=1.83; XdT=0.00007;
        Zu=-0.177; Zw=-0.452; Zwd=0; Zq=-0.76; Zde=-2.03; ZdT=-0.0006;
        Mu=0.0024; Mw=-0.006; Mwd=-0.002; Mq=-0.317; Mde=-1.46; MdT=-0.00005;
        Yv=-21.1/Uo; Yp=0; Yr=0; Lbetad=-10.4; Lpd=-1.43; Lrd=0.929; Nbetad=1.44; Npd=-0.026; Nrd=-0.215;
        Ydast=-0.004; Ydrst=0.0053; Ldad=2.74; Ldrd=0.7; Ndad=0.42; Ndrd=0.67; 
    elseif OC_ch==2
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
    elseif OC_ch==3
        Uo=350; %m/s
        alphao=1.6; %deg
        gammao=0; %deg
        %----------A/C Characteristics------
        Ix=33900; Iy=16600; Iz=190000; Ixz=3000; %kg.m^2
        %----------Stability Derivatives-------
        Xu=-0.0135; Xw=0.006; Xde=0.77; XdT=0.00006;
        Zu=0.0125; Zw=-0.727; Zwd=0; Zq=-1.25; Zde=-20.7; ZdT=-0.00005;
        Mu=0.009; Mw=-0.08; Mwd=-0.001; Mq=-0.745; Mde=-23.5; MdT=-0.000003;
        Yv=-176/Uo; Yp=0; Yr=0; Lbetad=-14.1; Lpd=-1.38; Lrd=0.318; Nbetad=12.3; Npd=-0.038; Nrd=-0.4;
        Ydast=-0.0009; Ydrst=0.004; Ldad=10.9; Ldrd=3; Ndad=0.67; Ndrd=3.2;
    elseif OC_ch==4
        Uo=650; %m/s
        alphao=1.4; %deg
        gammao=0; %deg
        %----------A/C Characteristics------
        Ix=33900; Iy=16600; Iz=190000; Ixz=3000; %kg.m^2
        %----------Stability Derivatives-------
        Xu=0.016; Xw=0.004; Xde=0.62; XdT=0.00006;
        Zu=-0.001; Zw=-0.494; Zwd=0; Zq=-0.39; Zde=-25.45; ZdT=-0.00005;
        Mu=0.07; Mw=-0.07; Mwd=-0.001; Mq=-0.41; Mde=-16.1; MdT=-0.000003;
        Yv=-277/Uo; Yp=0; Yr=0; Lbetad=-8.67; Lpd=-1.08; Lrd=0.22; Nbetad=8.37; Npd=0.015; Nrd=-0.275;
        Ydast=-0.0005; Ydrst=0.0026; Ldad=5.35; Ldrd=2.6; Ndad=0.36; Ndrd=-1.86;
    end
    elseif choice==5
    %----------GOLF - A twin piston engined, general aviation aircraft
    %----------Opertating Conditions--------
    if OC_ch==1
        Uo=50; %m/s
        alphao=0; %deg
        gammao=0; %deg
        %----------A/C Characteristics------
        Ix=13470; Iy=20450; Iz=27200; Ixz=2150; %kg.m^2
        %----------Stability Derivatives-------
        Xu=-0.053; Xa=21.01; Xde=-0.046; XdT=-0.017;
        Zu=-0.002; Za=-1.05; Zad=0; Zq=-0.024; Zde=-1.04; ZdT=-0.96;
        Mu=0.016; Ma=-12.3; Mad=0; Mq=-6.22; Mde=-13.55; MdT=1;
        Yv=-0.145; Yp=-2.18; Yr=0; Lbetad=-2.01; Lpd=0.303; Lrd=0; Nbetad=2.182; Npd=-0.222; Nrd=-0.27;
        Ydast=0; Ydrst=0.038; Ldad=1.541; Ldrd=0.6; Ndad=-0.036; Ndrd=-1.25;
    elseif OC_ch==2
         Uo=65; %m/s
         alphao=0; %deg
         gammao=0; %deg
        %----------A/C Characteristics------
        Ix=20420; Iy=27560; Iz=46000; Ixz=5870; %kg.m^2
        %----------Stability Derivatives-------
        Xu=-0.023; Xa=12.8; Xde=-0.061; XdT=-0.08;
        Zu=-0.001; Za=-1.333; Zad=0; Zq=-0.025; Zde=-2.24; ZdT=-1.811;
        Mu=0.0076; Ma=-21.26; Mad=0; Mq=-8.15; Mde=-23.4; MdT=1.414;
        Yv=-0.188; Yp=-3.71; Yr=0; Lbetad=-2.63; Lpd=0.39; Lrd=0; Nbetad=3.71; Npd=-0.29; Nrd=-0.35;
        Ydast=0; Ydrst=0.049; Ldad=2.63; Ldrd=1.02; Ndad=-0.036; Ndrd=-1.25;
    elseif OC_ch==3
        Uo=70; %m/s
        alphao=0; %deg
        gammao=0; %deg
        %----------A/C Characteristics------
        Ix=20420; Iy=27560; Iz=46000; Ixz=5870; %kg.m^2
        %----------Stability Derivatives-------
        Xu=-0.021; Xa=12.57; Xde=-0.055; XdT=-0.074;
        Zu=-0.001; Za=-1.241; Zad=0; Zq=-0.021; Zde=-2.2; ZdT=-1.811;
        Mu=0.005; Ma=-23.46; Mad=0; Mq=-7.58; Mde=-23.5; MdT=1.29;
        Yv=-0.174; Yp=-3.71; Yr=0; Lbetad=-2.43; Lpd=0.36; Lrd=0; Nbetad=3.71; Npd=-0.27; Nrd=-0.325;
        Ydast=0; Ydrst=0.049; Ldad=2.62; Ldrd=1.02; Ndad=-0.061; Ndrd=-2.1;
    elseif OC_ch==4
        Uo=105; %m/s
        alphao=0; %deg
        gammao=0; %deg
        %----------A/C Characteristics------
        Ix=20420; Iy=27560; Iz=46000; Ixz=5870; %kg.m^2
        %----------Stability Derivatives-------
        Xu=-0.018; Xa=18.34; Xde=-0.052; XdT=-0.074;
        Zu=-0.005; Za=-1.234; Zad=0; Zq=-0.012; Zde=-3.1; ZdT=-2.83;
        Mu=0.003; Ma=-38.43; Mad=0; Mq=-7.2; Mde=-34.85; MdT=1.55;
        Yv=-0.184; Yp=-5.33; Yr=0; Lbetad=-2.33; Lpd=0.31; Lrd=0; Nbetad=6.33; Npd=-0.17; Nrd=-0.314;
        Ydast=0; Ydrst=0.045; Ldad=4.16; Ldrd=1.6; Ndad=-0.044; Ndrd=-3.33;
    end
    Xw=Xa/Uo; Zw=Za/Uo; Zwd=Zad/Uo; Mw=Ma/Uo; Mwd=Mad/Uo;
end
g=9.801;
Lbeta=-(Nbetad*Ixz-Ix*Lbetad)/Ix; Nbeta=(Iz*Nbetad-Ixz*Lbetad)/Iz;
Lp=-(Npd*Ixz-Ix*Lpd)/Ix; Np=(Iz*Npd-Ixz*Lpd)/Iz;
Lr=-(Nrd*Ixz-Ix*Lrd)/Ix; Nr=(Iz*Nrd-Ixz*Lrd)/Iz;
Lda=-(Ndad*Ixz-Ix*Ldad)/Ix; Nda=(Iz*Ndad-Ixz*Ldad)/Iz;
Ldr=-(Ndrd*Ixz-Ix*Ldrd)/Ix; Ndr=(Iz*Ndrd-Ixz*Ldrd)/Iz;
u=vector(1); v=vector(2); w=vector(3); p=vector(4); q=vector(5); r=vector(6); phi=vector(7); theta=vector(8); epsai=vector(9);
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
state_dot=[udot vdot wdot pdot qdot rdot phidot thetadot epsaidot xdot ydot zdot];