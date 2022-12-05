clc
clearvars

syms theta1 d2 theta3 theta4 theta5
syms dtheta1 dd2 dtheta3 dtheta4 dtheta5

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

% creating Zi
Z0= [0;0;1];
Z1= T1(1:3,3);
Z2= T2(1:3,3);
Z3= T3(1:3,3);
Z4= T4(1:3,3);
Z5= T5(1:3,3);

% creating Pi
P0=[0;0;0];
P1=T1(1:3,4);
P2=T2(1:3,4);
P3=T3(1:3,4);
P4=T4(1:3,4);
P5=T5(1:3,4);


% Jacobian Matrix via explicit form
J_ef = simplify( [cross(Z1,P5-P1),Z2,cross(Z3,P5-P3),cross(Z4,P5-P4),cross(Z5,P5-P5);
              Z1,0,Z3,Z4,Z5])
          
          
% Jacobian Matrix via Velocity Propagation method
dtheta=[0;dtheta1;0;dtheta3;dtheta4;dtheta5];
dd=[0;0;d2;0;0;0];
R0=[0 0 0;0 0 0;0 0 0];
R1=inv(A1(1:3,1:3));
R2=inv(A2(1:3,1:3));
R3=inv(A3(1:3,1:3));
R4=inv(A4(1:3,1:3));
R5=inv(A5(1:3,1:3));
R=[R0;R1;R2;R3;R4;R5];
v{1}=[0;0;0];
w{1}=[0;0;0];
p0=[0;0;0];
p1=A1(1:3,4);
p2=A2(1:3,4);
p3=A3(1:3,4);
p4=A4(1:3,4);
p5=A5(1:3,4);
p=[p0;p1;p2;p3;p4;p5];


for i=1:5
   
    v{i+1} = R(3i+1:3i+3,1:3)*(v{i}+cross(w{i},p(3i+1:3i+3,1))) + dd(i+1)*[0;0;1];
    w{i+1} = R(3i+1:3i+3,1:3)*w{i} + dtheta(i+1) * [0;0;1];
    
end

R_WtoB = T5(1:3,1:3);
V = R_WtoB * v{6};
W = R_WtoB * w{6};

J_vp = jacobian([V;W],[dtheta1,dd2,dtheta3,dtheta4,dtheta5])


% 
% R0=[0 0 0;0 0 0;0 0 0];
% R1=T1(1:3,1:3);
% R2=T2(1:3,1:3);
% R3=T3(1:3,1:3);
% R4=T4(1:3,1:3);
% R5=T5(1:3,1:3);
% R=[R0;R1;R2;R3;R4;R5];
% v{1}=[0;0;0];
% w{1}=[0;0;0];
% O1=P1-P0;
% O2=P2-P1;
% O3=P3-P2;
% O4=P4-P3;
% O5=P5-P4;
% P=[P0;O1;O2;O3;O4;O5];
% 
% 
% for i=1:5
%    
%     v{i+1} = v{i}+cross(w{i},P(3i+1:3i+3,1)) + dd(i+1)* (R(3i+1:3i+3,1:3)*[0;0;1]);
%     w{i+1} = w{i} + dtheta(i+1) * [0;0;1];
%     
% end
% 
% J_vp = jacobian([v{6};w{6}],[dtheta1,dd2,dtheta3,dtheta4,dtheta5])