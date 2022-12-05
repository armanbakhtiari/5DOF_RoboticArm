clc
clearvars

% syms theta1 d2 theta3 theta4 theta5

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
% 
% % creating transfer matrices
% A1= TransMat(a1,alpha1,d1,theta1);
% A2= TransMat(a2,alpha2,d2,theta2);
% A3= TransMat(a3,alpha3,d3,theta3);
% A4= TransMat(a4,alpha4,d4,theta4);
% A5= TransMat(a5,alpha5,d5,theta5);
% 
% T1=A1;
% T2=A1*A2;
% T3=A1*A2*A3;
% T4=A1*A2*A3*A4;
% T5=A1*A2*A3*A4*A5;

% %origins of the links
% o1x= T1(1,4);
% o1y= T1(2,4);
% o1z= T1(3,4);
% 
% o2x= T2(1,4);
% o2y= T2(2,4);
% o2z= T2(3,4);
% 
% o3x= T3(1,4);
% o3y= T3(2,4);
% o3z= T3(3,4);
% 
% o4x= T4(1,4);
% o4y= T4(2,4);
% o4z= T4(3,4);
% 
% o5x= T5(1,4);
% o5y= T5(2,4);
% o5z= T5(3,4);

t=0;
dt=0.1;

xlim([-2,2])
ylim([-2,2])

for i = 1:100
    d = 0.5 + abs(1 * sin(t));
    theta = pi/2 * sin(8*t);
    x2 = 0.8 +0.5 * (cos(theta));
    y2 = d + 0.5 * (sin(theta));
    t = t + dt;
    Link1= line([0,0], [0,1.5])
    Link2= line([0,0.8], [d,d])
    Link3= line([0.8,x2], [d,y2])
    
    
    pause(0.1)
%     delete(Link1)
%     delete(Link2)
%     delete(Link3)

end
