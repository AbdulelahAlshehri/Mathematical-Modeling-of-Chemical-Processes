%Problem 4
clc
clear all 
%0.272533;
%  Define the given parameters
h = 0.001;  %cal/cm^2
A = 15;     %cm^-2
R = 1.3;    %cm 
ep=0.36;    %no units
k = 0.0034; %cal/(cm * s * C)
% Since we only have one intitial condition, and a boundary value, this
% problem can be solved as an IVP by guesssing the initial condition of 
guess =0;
%The intial conditions:
%    theta     gradient of theta 
y0 =[guess           0];

%This problem can be written as system of ODE's where y(1) = theta and
%y(2)= dtheta/dr 
ydot= @(r,y)[ y(1)
              -1/r *y(2)+ 1/k *(h*A)/(1-ep) * y(1) ];
   
[r,y] = ode45(ydot, [0 R], y0);
plot(r, y(:,1),'ro')
title(' Normalized Temperature vs Radius of reactor ')
ylabel('theta (dimensionless)')
xlabel('r (cm)')
axis([0 R 0 1])
%formatSpec = ' The intial condition theta(r) was guessed to be theta(0)= %3.5e   and the boundary value of theta(R) for that guessed intial value is theta(1.3) = %3.5e  ';
%fprintf(formatSpec, guess, y(end,1))