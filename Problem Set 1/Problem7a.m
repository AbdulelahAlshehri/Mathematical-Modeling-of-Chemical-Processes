%Problem 7 Part A 
clc
clear all
%Print given parameters 
V= 0.018; %m^3
rho= 1000; %kg/m^3
Q=60*10^-6; %m^3/s
Cf=3; %kmol/m^3
delH=-8*10^8; %J/kmol
cp=4000; %J/(kg *K)
ko=4.5*10^6; %s^-1
E= 7550; %K
Tf=[298.15:0.01:450];%K

%Identify the length of the feed temperature Tf
M=numel(Tf);
for i=1:1:M
k(i)=ko*exp(-E/Tf(i));
%The First differential eqution is
%V (dC/dt) = Q (Cf - C) - k C V
%for steady-state 
%0 = Q (Cf - C) - k C V
% Remove the units from the equation by multiplying terms by (1/(Q * Cf))
%0 = (Cf - C)/Cf - ( (k * V)/ (Q * Cf)) * C
%Factor the coefficient of C
% 1 = ( (1/Cf) +( (k V)/(Q *Cf) )*C
%The Second differential eqution is
% dT/dt= ( Q / V)*( Tf - T) - ( ( delH * k )/(rho * cp))* C
%for steady-state 
% 0 = ( Q / V)*( Tf - T) - ( ( delH * k )/(rho * cp))* C
% Remove the units from the equation by multiplying terms by (V /(Q * Tf))
% 0 = (( Tf - T)/ Tf) - ((k * delH * V)/( rho * cp * Q * Tf) * C
%Factor the coefficient of T and C
% 1 = (1/Tf)T - ( (k * delH * V)/( rho cp Q Tf ) )*C

%Write the A matrix 
A= [((1/Cf)+((k(i)*V)/(Q*Cf))), 0; ((k(i)*delH*V)/(rho*cp*Q*Tf(i))), 1/Tf(i)];
%Print the right hand side of the equations as b
b= [1; 1];
%Calculate the concentration and Temperature in the reactor
x=inv(A)*b; 
C(i)=x(1);
T(i)=x(2);
end
%Plot concentration and Temperature
figure
plot(Tf, C)
xlabel('Tf (K)')
ylabel(' C (kmol/m^3)')
title(' Concentration, C vs. Temperature of the feed, Tf')
figure
plot(Tf, T)
xlabel('Tf  (K)')
ylabel(' T (K)')
title('Temperature in the reactor, T, vs. Temperature of the feed Tf')
