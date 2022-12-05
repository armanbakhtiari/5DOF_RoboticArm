clc
clearvars

syms theta1 d2 theta3 theta4 theta5
syms x y z

% D-H parameters
%Link1
a1=0; alpha1=0; d1=0;
%Link2
a2=0; alpha2=0; theta2=pi;
%Link3
a3=0.8; alpha3=pi/2; d3=0;
%Link4
a4=0; alpha4=-pi/2; d4=0;
%Link5
a5=0; alpha5=pi/2; d5=0;

% creating transfer matrices
A1= TransMat(a1,alpha1,d1,theta1);
A2= TransMat(a2,alpha2,d2,theta2);
A3= TransMat(a3,alpha3,d3,theta3);
A4= TransMat(a4,alpha4,d4,theta4);
A5= TransMat(a5,alpha5,d5,theta5);

T1=A1;
T2=A1*A2;
T3=A1*A2*A3;
T4=A1*A2*A3*A4;
T5=A1*A2*A3*A4*A5;

% solving theta1 and d2
Tprime3= T2*TransMat(a3,alpha3,d3,0);
P= Tprime3(1:3,4);
eqns = [P(1)==x;P(2)==y;P(3)==z];
s = solve(eqns,theta1,d2);
eqns
subs(eqns, [x y z], [-0.7021 -0.3835 0.5])
% solving theta3-5 employing Pieper's Method

R1=A1(1:3,1:3);
R2=A2(1:3,1:3);
R3=A3(1:3,1:3);
R4=A4(1:3,1:3);
R5=A5(1:3,1:3);

T3prime= TransMat(a3,alpha3,d3,0);
R30=R1*R2*T3prime(1:3,1:3);
R50=T5(1:3,1:3);
R0= inv(R30)*R50;

theta4= simplify(atan2(-R0(3,1),sqrt(R0(1,1).^2 + R0(2,1).^2)))
theta5= atan2(R0(3,2)/cos(theta4),R0(3,3)/cos(theta4))
theta3= atan2(R0(2,1)/cos(theta4),R0(1,1)/cos(theta4))