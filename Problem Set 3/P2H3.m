%Problem 2
clear all
clc
%To write the function in a dimesionless form, we need use the constants
%given to have a units of (s/K) to cancel that of the original equation
%dT/dt
% That can be achieved by multiplying the right hand side of the equation
% by (rho * d/(2*sigma)) * (cp(T)/ Tf^4)
% Therefor, the dimesionless function will not have sigma, d, or rho
sigma = 5.676*10^-8; %W/m^2/K^4
Tf    = 1200;        %K
rho   = 8933;        %kg/m^3
d     = 0.002;       %m
alpha = 355.2;       %cp constant
beta  =0.1004;       %cp constant
theta0= 300/Tf;      %dimensionless
tau1  = 10;
%where tau = t/ ((rho * d/(2*sigma)) * (cp(T)/ Tf^3))

thetadot=@(tau, theta)[((Tf^4 *(1-theta))/ (alpha +2 *beta *theta *Tf)) *(alpha + beta* theta *Tf)/Tf^4];

[tau,theta] = ode45(thetadot, [0 tau1], theta0);

%Part A
disp('part A')
plot(tau, theta,'r--'), title('Dimensionless Temperature vs Dimesionless Time');ylabel('Theta');xlabel('Tau');axis([0 tau1 0 1]);

%Part B
disp('Part B')
%Let's assume that the density function can be modeled as p(T) = a* T + b 
% We can use two data points from the problem statement and the literature:
rhol =[8933; 8930.03];
Tl   =[300; 1153]; 
A   =[Tl, ones(2,1)];
b   = rhol;
% We can use linear regression to find the the parameters of the proposed
% model 
p=inv(A)*rhol;
Tfit=[300:1:1300]; %K
a=p(1);
b=p(2);
rhofit = a*Tfit+b;
figure()
plot(Tl, rhol,'ro', Tfit, rhofit,'-b')
title(' Density of Copper as function of temperature')
xlabel(' rho (kg/m^3')
ylabel(' T (K)')
legend('Data', 'Fit')
axis([300 1300 8920 8940])
disp('The density of copper varies from 8900 to 8950 kg/m^3, depending on the thermomechanical history. The effect of heating on the metal is not as significant as that of cold work as cold work generates more vacancies and dislocations.  In the literature, the densities of copper at 303K, 1153K, and 1308K are: 89.3E2, 8930.03, and 8927.6 kg/m^3. Hence, it can be argued that it is safe to assume that the density of copper for our operating range (300K-1200K) is constant. Reference: [Copper and Copper Alloys , ISBN-10: 0871707268]')
disp('Also, as shown in the plot above, there is a very slight change in the desnity over our entire range, therefore, it can be assumed that the density is independant of temperature')
