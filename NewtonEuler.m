clc
clearvars

syms theta1 d2 theta3 theta4 theta5
syms dtheta1 dd2 dtheta3 dtheta4 dtheta5
syms d2theta1 d2d2 d2theta3 d2theta4 d2theta5

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

% creating Pi
P0=[0;0;0];
P1=T1(1:3,4);
P2=T2(1:3,4);
P3=T3(1:3,4);
P4=T4(1:3,4);
P5=T5(1:3,4);

% Moment of Inertia Matrices
I1=[4 0 0;0 5 0;0 0 0.5];
I2=[0.34 0 0;0 0.5 0;0 0 0.2];
I3=[0.75 0 0;0 0.32 0;0 0 0.1];
I4=[0.19 0 0;0 0.56 0;0 0 0.12];
I5=[0.3 0 0;0 0.6 0;0 0 0.22];
I=[0 0 0;0 0 0;0 0 0;I1;I2;I3;I4;I5];

% Newton-Euler Dynamic equations
w{1}=[0;0;0];
dw{1}=[0;0;0];
dv{1}=[0;9.8;0];
dvc{1}=[0;0;0];
dtheta = [0;dtheta1;0;dtheta3;dtheta4;dtheta5];
dd = [0;0;dd2;0;0;0];
d2theta = [0;d2theta1;0;d2theta3;d2theta4;d2theta5];
d2d = [0;0;d2d2;0;0;0];
R0=[0 0 0;0 0 0;0 0 0];
R1=inv(T1(1:3,1:3));
R2=inv(T2(1:3,1:3));
R3=inv(T3(1:3,1:3));
R4=inv(T4(1:3,1:3));
R5=inv(T5(1:3,1:3));
R=[R0;R1;R2;R3;R4;R5];
P=[P0;P1;P2;P3;P4;P5];
Pc=[0;0;0;0;0;0.75;0.4;0;0;0;0;0;0;0;0.04;0;0.08;0];
m=[3 2 0.3 0.3 0.3];

for i=1:5
    w{i+1} = R(3*i+1:3*i+3,1:3)*w{i} + dtheta(i+1) * [0;0;1];
    dw{i+1} = R(3*i+1:3*i+3,1:3)*dw{i} + R(3*i+1:3*i+3,1:3)*(cross(w{i},dtheta(i+1) * [0;0;1])) + d2theta(i+1) * [0;0;1];
    dv{i+1} = R(3*i+1:3*i+3,1:3)*(cross(dw{i},P(3*i+1:3*i+3,1))+cross(w{i},cross(w{i},P(3*i+1:3*i+3,1)))+dv{i}) + 2*cross(w{i},dd(i+1) * [0;0;1]) + d2d(i+1) * [0;0;1];
    dvc{i+1} = cross(w{i+1},Pc(3*i+1:3*i+3,1)) + cross(w{i+1},cross(w{i+1},Pc(3*i+1:3*i+3,1))) + dv{i+1};
    
    F{i+1} = m(1,i) * dvc{i+1};
    N{i+1} = I(3*i+1:3*i+3,1:3)*dw{i+1} + cross(w{i+1},(I(3*i+1:3*i+3,1:3)*w{i+1}));
end


r0=[0 0 0;0 0 0;0 0 0];
r1=T1(1:3,1:3);
r2=T2(1:3,1:3);
r3=T3(1:3,1:3);
r4=T4(1:3,1:3);
r5=T5(1:3,1:3);
r=[r0;r1;r2;r3;r4;r5];

% p0=[0;0;0];
% p1=inv(T1(1:3,4));
% p2=inv(T2(1:3,4));
% p3=inv(T3(1:3,4));
% p4=inv(T4(1:3,4));
% p5=inv(T5(1:3,4));
% p=[p0;p1;p2;p3;p4;p5];
% 
% f{6}=[0;0;0];
% n{6}=[0;0;0];
% 
% for i=1:5
%  k=6-i;  
%  f{k}= r(3*(k)+1:3*(k)+3,1:3)*f{k+1} + F{k};
%  n{k}= N{k} + r(3*(k)+1:3*(k)+3,1:3)*n{k+1} + cross(Pc(3*(k)+1:3*(k)+3,1),F{k}) + cross(P(3*(k)+1:3*(k)+3,1),(r(3*(k)+1:3*(k)+3,1:3)*f{k+1}));
%     
% end
