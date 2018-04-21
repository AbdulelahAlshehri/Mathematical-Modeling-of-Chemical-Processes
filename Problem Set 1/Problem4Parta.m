%Homework 2
%Problem 4
clc
clear all
%Assumptions: 1) Constant Density  2)Isothermal Conditions 3)Steady State
%4)Irreversible reactions 5) Well-mixed

%Rate law equations 
% r1=k1 * CA
% r2=k2 * CB
k1=3/60; %1/min
k2=0.1; %1/min

%Mass Balance equations 
%    Acc       =   In    -    out    +    gen    -    cons
%A        : d(V CA)/dt = v CAo   -   v * CA    +     0     -    k1 * CA * V
%A reduced: CAo   = CA + k1 *CA*tau

%B        : d(V CB)/dt = v CBo   -   v * CB     +k1 * CA * V  -    k2 * CB * V
%B reduced : CBo   = CB - k1 *CA *tau + k2 *CB*tau

%C        : d(V CC)/dt = v CCo   -   v * CC     +k2 * CB * V
%C reduced : CCo   = CC - k2 *CB*tau

%C=[CA CB CC]'
%tau=V/v
for i=1:1:600
    tau(i)=i; %min
%The material balance equations are expressed as A
A=[(1+k1*tau(i)), 0, 0;
    -k1*tau(i), (1+k2*tau(i)), 0;
    0, -k2*tau(i), 1];

CF=[5 0 0];
% To solve for the concentrations C, the equation A*C=CF is expressed as
C= inv(A)*CF';
CA(i)= C(1);
CB(i)=C(2);
CC(i)=C(3); 
end
plot( tau, CC)
xlabel('Tau (min)')
ylabel('Cc (mol/L)')
title('Concentration of c (Cc) vs  Residence Time (Tau)')

