clc
clearvars

syms theta1 d2 theta3 theta4 theta5

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

%Deriving euler parameters

R5=simplify(T5(1:3,1:3));
r11=R5(1,1);
r22=R5(2,2);
r33=R5(3,3);
r12=R5(1,2);
r21=R5(2,1);
r13=R5(1,3);
r31=R5(3,1);
r23=R5(2,3);
r32=R5(3,2);

e4_test= simplify(1/2 * (sqrt((1 + r11 + r22 + r33))));
e4_test= subs(e4_test, {theta1,d2,theta3,theta4,theta5}, {pi/4,0.5,pi/4,pi/4,pi/4});
e4_rounded= round(e4_test)

e1_test= simplify(1/2 * (sqrt((1 + r11 - r22 - r33))));
e1_test= subs(e1_test, {theta1,d2,theta3,theta4,theta5}, {pi/4,0.5,pi/4,pi/4,pi/4});
e1_rounded= round(e1_test)

e2_test= simplify(1/2 * (sqrt((1 - r11 + r22 - r33))));
e2_test= subs(e2_test, {theta1,d2,theta3,theta4,theta5}, {pi/4,0.5,pi/4,pi/4,pi/4});
e2_rounded= round(e2_test)

e3_test= simplify(1/2 * (sqrt((1 - r11 - r22 + r33))));
e3_test= subs(e3_test, {theta1,d2,theta3,theta4,theta5}, {pi/4,0.5,pi/4,pi/4,pi/4});
e3_rounded= round(e3_test)

e4= e4_test;
e1= (r32-r23)/(4*e4); 
e2= (r13-r31)/(4*e4);
e3= (r21-r12)/(4*e4);
