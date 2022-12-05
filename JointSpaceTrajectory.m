clc
clearvars

%% theta1 
t0=0;
tf=3;
theta1i=0;
theta1f=2*pi;
dtheta1i=0;
dtheta1f=0;
d2theta1i=0;
d2theta1f=0;

A = [1 t0 t0.^2 t0.^3 t0.^4 t0.^5;
     0 1 2*t0 3*t0.^2 4*t0.^3 5*t0.^4;
     0 0 2 6*t0 12*t0.^2 20*t0.^3;
     1 tf tf.^2 tf.^3 tf.^4 tf.^5;
     0 1 2*tf 3*tf.^2 4*tf.^3 5*tf.^4;
     0 0 2 6*tf 12*tf.^2 20*tf.^3;];
 
 Q1 = [theta1i;dtheta1i;d2theta1i;theta1f;dtheta1f;d2theta1f];
 
 coeffs1 = inv(A)*Q1;
 
 t=linspace(t0,tf,100);
 theta1=coeffs1(1) + coeffs1(2)*t + coeffs1(3)*t.^2 + coeffs1(4)*t.^3 + coeffs1(5)*t.^4 + coeffs1(6)*t.^5;
 dtheta1= coeffs1(2) + 2*coeffs1(3)*t + 3*coeffs1(4)*t.^2 + 4*coeffs1(5)*t.^3 + 5*coeffs1(6)*t.^4;
 d2theta1= 2*coeffs1(3) + 6*coeffs1(4)*t + 12*coeffs1(5)*t.^2 + 20*coeffs1(6)*t.^3;
 
 figure(1)
 subplot(3,1,1);
 plot(t,theta1);
 xlabel('t');
 ylabel('theta1');
 subplot(3,1,2);
 plot(t,dtheta1);
 xlabel('t');
 ylabel('dtheta1');
 subplot(3,1,3);
 plot(t,d2theta1);
 xlabel('t');
 ylabel('d2theta1');
 
 %% d2
d2i=0.4;
d2f=1.5;
dd2i=0;
dd2f=0;
d2d2i=0;
d2d2f=0;

 Q2 = [d2i;dd2i;d2d2i;d2f;dd2f;d2d2f];
 
 coeffs2 = inv(A)*Q2;
 
 t=linspace(t0,tf,100);
 d2=coeffs2(1) + coeffs2(2)*t + coeffs2(3)*t.^2 + coeffs2(4)*t.^3 + coeffs2(5)*t.^4 + coeffs2(6)*t.^5;
 dd2= coeffs2(2) + 2*coeffs2(3)*t + 3*coeffs2(4)*t.^2 + 4*coeffs2(5)*t.^3 + 5*coeffs2(6)*t.^4;
 d2d2= 2*coeffs2(3) + 6*coeffs2(4)*t + 12*coeffs2(5)*t.^2 + 20*coeffs2(6)*t.^3;
 
 figure(2)
 subplot(3,1,1);
 plot(t,d2);
 xlabel('t');
 ylabel('d2');
 subplot(3,1,2);
 plot(t,dd2);
 xlabel('t');
 ylabel('dd2');
 subplot(3,1,3);
 plot(t,d2d2);
 xlabel('t');
 ylabel('d2d2');
 
 %% theta3 
theta3i=-3*pi/2;
theta3f=3*pi/2;
dtheta3i=0;
dtheta3f=0;
d2theta3i=0;
d2theta3f=0;

 Q3 = [theta3i;dtheta3i;d2theta3i;theta3f;dtheta3f;d2theta3f];
 
 coeffs3 = inv(A)*Q3;
 
 t=linspace(t0,tf,100);
 theta3=coeffs3(1) + coeffs3(2)*t + coeffs3(3)*t.^2 + coeffs3(4)*t.^3 + coeffs3(5)*t.^4 + coeffs3(6)*t.^5;
 dtheta3= coeffs3(2) + 2*coeffs3(3)*t + 3*coeffs3(4)*t.^2 + 4*coeffs3(5)*t.^3 + 5*coeffs3(6)*t.^4;
 d2theta3= 2*coeffs3(3) + 6*coeffs3(4)*t + 12*coeffs3(5)*t.^2 + 20*coeffs3(6)*t.^3;
 
 figure(3)
 subplot(3,1,1);
 plot(t,theta3);
 xlabel('t');
 ylabel('theta3');
 subplot(3,1,2);
 plot(t,dtheta3);
 xlabel('t');
 ylabel('dtheta3');
 subplot(3,1,3);
 plot(t,d2theta3);
 xlabel('t');
 ylabel('d2theta3');
 
%% theta4
theta4i=0;
theta4f=2*pi;
dtheta4i=0;
dtheta4f=4;
d2theta4i=0;
d2theta4f=3;

 Q4 = [theta4i;dtheta4i;d2theta4i;theta4f;dtheta4f;d2theta4f];
 
 coeffs4 = inv(A)*Q4;
 
 t=linspace(t0,tf,100);
 theta4=coeffs4(1) + coeffs4(2)*t + coeffs4(3)*t.^2 + coeffs4(4)*t.^3 + coeffs4(5)*t.^4 + coeffs4(6)*t.^5;
 dtheta4= coeffs4(2) + 2*coeffs4(3)*t + 3*coeffs4(4)*t.^2 + 4*coeffs4(5)*t.^3 + 5*coeffs4(6)*t.^4;
 d2theta4= 2*coeffs4(3) + 6*coeffs4(4)*t + 12*coeffs4(5)*t.^2 + 20*coeffs4(6)*t.^3;
 
 figure(4)
 subplot(3,1,1);
 plot(t,theta4);
 xlabel('t');
 ylabel('theta4');
 subplot(3,1,2);
 plot(t,dtheta4);
 xlabel('t');
 ylabel('dtheta4');
 subplot(3,1,3);
 plot(t,d2theta4);
 xlabel('t');
 ylabel('d2theta4');
 
 %% theta5
theta5i=-pi/2;
theta5f=pi/2;
dtheta5i=0;
dtheta5f=0;
d2theta5i=0;
d2theta5f=0;

 Q5 = [theta5i;dtheta5i;d2theta5i;theta5f;dtheta5f;d2theta5f];
 
 coeffs5 = inv(A)*Q5;
 
 t=linspace(t0,tf,100);
 theta5=coeffs5(1) + coeffs5(2)*t + coeffs5(3)*t.^2 + coeffs5(4)*t.^3 + coeffs5(5)*t.^4 + coeffs5(6)*t.^5;
 dtheta5= coeffs5(2) + 2*coeffs5(3)*t + 3*coeffs5(4)*t.^2 + 4*coeffs5(5)*t.^3 + 5*coeffs5(6)*t.^4;
 d2theta5= 2*coeffs5(3) + 6*coeffs5(4)*t + 12*coeffs5(5)*t.^2 + 20*coeffs5(6)*t.^3;
 
 figure(5)
 subplot(3,1,1);
 plot(t,theta5);
 xlabel('t');
 ylabel('theta5');
 subplot(3,1,2);
 plot(t,dtheta5);
 xlabel('t');
 ylabel('dtheta5');
 subplot(3,1,3);
 plot(t,d2theta5);
 xlabel('t');
 ylabel('d2theta5');
 