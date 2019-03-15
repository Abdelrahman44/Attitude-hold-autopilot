global reference uo vo wo po qo ro phio thetao epsaio deo dTo dao dro de dT da dr
 reference = 0.5;
 uo =256;
 vo =0;
 wo =0;
 po =0;
 qo =0;
 ro =0;
 phio =0;
 thetao=2.6*(pi/180);
 epsaio=0;
 deo=0;
 dTo=0;
 dao=0;
 dro=0;
 de=0;
 dT=0;
 da=0;
 dr=0;
 [t,X] = ode45(@state_dot_fn2,[0 20],[uo;vo;wo;po;qo;ro;phio;thetao;epsaio]);
x1 = [1 0 0 0 0 0 0 0 0]*X';
x2 = [0 0 1 0 0 0 0 0 0]*X';
x3 = [0 0 0 0 1 0 0 0 0]*X';
x4 = [0 0 0 0 0 0 0 1 0]*X';
figure;
subplot(2,2,1);
plot(t,x1)
title('u');
subplot(2,2,2);
plot(t,x2)
title('w');
subplot(2,2,3);
plot(t,x3)
title('q');
subplot(2,2,4);
plot(t,x4)
title('theta');

 
