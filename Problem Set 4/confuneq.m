function [c,ceq] = confuneq(x,T)
% Nonlinear inequality constraints
m= 10; %kg
R=286.9;	%J/kg/K for dry air 
%http://www.engineeringtoolbox.com/individual-universal-gas-constant-d_588.html

c =(m*R*T/(4/3 *pi*(x(2)^3)))* x(2) * (1/(2*(x(1)-x(2)))) - 15000/0.000145037;
% Nonlinear equality constraints
ceq=[];
end