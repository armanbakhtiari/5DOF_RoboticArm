clc
syms theta1 d2 theta3 theta4 theta5

m=[3 2 0.3 0.3 0.3];
I1=[4 0 0;0 5 0;0 0 0.5];
I2=[0.34 0 0;0 0.5 0;0 0 0.2];
I3=[0.75 0 0;0 0.32 0;0 0 0.1];
I4=[0.19 0 0;0 0.56 0;0 0 0.12];
I5=[0.3 0 0;0 0.6 0;0 0 0.22];
I=[0 0 0;0 0 0;0 0 0;I1;I2;I3;I4;I5];


for i=1:5
    
    A = J_ef(1:3,1:i);
    K = zeros([3 5-i]);
     J_ef_v = [A K];
    L = J_ef(4:6,1:i);
    D = zeros([3 5-i]);
    J_ef_w = [L D];
    
   M = simplify(m(1,i)*transpose(J_ef_v)*J_ef_v + transpose(J_ef_w)*I(3*i+1:3*i+3,1:3)*J_ef_w);
  
    
end

Q=[theta1;d2;theta3;theta4;theta5];

for i=1:5
   for j=1:5
      
       c(i,j)= simplify((1/2)*(diff(M(i,j),Q(j))+diff(M(i,j),Q(j))-diff(M(j,j),Q(i))));
       
   end
end


G=[0;0;0];
for i=1:5
    
    G = G + J_ef(1:3,i)+m(1,i)*9.8;
    
end
