%Problem 5
clc
clear all
Tf = 298.15:1:450;
n= numel(Tf);

%Identify the length of the feed temperature Tf
%M=numel(Tf);
%for i=1:1:M
%The First differential eqution is
%V (dC/dt) = Q (Cf - C) - k C V
%for steady-state 
%0 = Q (Cf - C) - k C V
% Remove the units from the equation by multiplying terms by (1/(Q * Cf))
%0 = (Cf - C)/Cf - ( (k * V)/ (Q * Cf)) * C
% Write the equation in terms of the dimensionless concentration C'
%((1+( (ko*exp(-E/T)) * V)/ (Q))*C =1


%The Second differential eqution is
% dT/dt= ( Q / V)*( Tf - T) - ( ( delH * k )/(rho * cp))* C
%for steady-state 
% 0 = ( Q / V)*( Tf - T) - ( ( delH * k )/(rho * cp))* C
% Remove the units from the equation by multiplying terms by (V /(Q * Tf))
% 0 = (( Tf - T)/ Tf) - ((k * delH * V)/( rho * cp * Q * Tf) * C
% Write the equation in terms of the dimensionless concentration T'
%((ko*exp(-E/T)) * delH * V *Cf)/( rho * cp * Q * Tf)* C + T =1


% For the linear equation k =(ko*exp(-E/Tf)
for i= 1:1:n
xg = [1 1];
[soln, fval, exitflag]=fsolve(@(z)lineqnsP5H2(z,Tf(i)), xg,optimset('Display','off'));
CTl(i,:)= [soln];
end
Conl= CTl(:,1);
Templ= CTl(:,2);

%For the nonlinear equation k = (ko*exp(-E/T)
for i= 1:1:n
xg = [.1 .1];
[soln, fval, exitflag]=fsolve(@(z)nonlineqnsP5H2(z,Tf(i)), xg,optimset('Display','off'));
CTnl(i,:)= [soln];
end
Connl= CTnl(:,1);
Tempnl= CTnl(:,2);

plot( Tf, Conl,'bo', Tf, Templ,'ro', Tf, Connl,'bo', Tf, Tempnl,'ro')
xlabel(' Feed Temperature')
ylabel('C* or T* ')
title('Steady State Reactor C and T')
legend('C* for k(Tf)', 'T* for k(Tf)', 'C* for k(T)', 'T* for k(T)','location','southwest')


