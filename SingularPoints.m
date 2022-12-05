clc
syms la
% s = svd(J_ef)

J = transpose(J_ef)*J_ef;
S=simplify(sqrt(det(J-la*eye(5))))

solve(S,la)
