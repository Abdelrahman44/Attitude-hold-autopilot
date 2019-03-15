function state_dot=state_dot_fn3(t, vector)

global theta0 phi0 p10 p20
theta=vector(1); phi=vector(2); p1=vector(3); p2=vector(4);



%-----------------States Dots---------------
thetadot = p1/(m*r^2);
phidot = 2*p2/(2*j+m*r^2-m*r^2*cos(2*theta));
p2dot = 0;
p1dot = m*r*(-g*sin(theta)+2*r*sin(2*theta)*(p2)^2 /(2*j+m*r^2 - m*(r^2)*cos(2*theta))^2);
state_dot=[thetadot phidot xdot p1dot p2dot p3dot]';