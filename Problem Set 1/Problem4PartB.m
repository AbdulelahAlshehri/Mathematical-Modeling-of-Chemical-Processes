%Homework 2
%Problem 4
clc
clear all
%Assumptions: 1) Constant Density  2)Isothermal Conditions 3)Steady State
%4)Irreversible reactions 5) Well-mixed

%Rate law equations 
% r1=k1 * CA
% r2=k2 * CB

%Mass Balance equations 
%    Acc       =   In    -    out    +    gen    -    cons
%A        : d(V CA)/dt = v CAo   -   v * CA    +     0     -    k1 * CA * V
%A reduced: (v/V)CAo   = (v/V)*CA + k1 *CA

%B        : d(V CB)/dt = v CBo   -   v * CB     +k1 * CA * V  -    k2 * CB * V
%B reduced : (v/V)CBo   = (v/V) * CB - k1 *CA + k2 *CB

%C        : d(V CC)/dt = v CCo   -   v * CC     +k2 * CB * V
%C reduced : (v/V)CCo   = (v/V) * CC - k2 *CB

%C=[CA CB CC]'
%tau=V/v
for i=1:1:150
    tau=30/60;%min
    k1=0.5; %min
%To cover the the values between 0 and 1, k1 is written as i-1
    k2(i)=(i-1); %min
% To solve for the concentrations C, the equation A*C=CF is expressed as
A=[(1+k1*tau), 0, 0; -k1*tau, (1+k2(i)*tau), 0; 0, -k2(i)*tau, 1];
CF=[5 0 0];
% The equation A*C=CF is written as 
C= inv(A)*CF';
CA(i)= C(1);
CB(i)=C(2);
CC(i)=C(3);
kratio(i)=(k2(i)/k1);
end
plot(kratio, CC)
xlabel(' k2/k1 (dimensionless)')
ylabel('Cc (mol/L)')
title(' The Concentration of C (Cc) vs. the ratio of k2 to k1')
