%Homework Assignment #4
%Probelm 8
clear all
clc 
close all
%we can express the overall cost as
%Overall cost = installation cost + Operation cost
%             = 200 * d           + 20*10^6/d
%To minimze the cost, fmincon can be used 
%intial guess
d0= 5;
%No equality/inequality constraints 
A=[];b=[];Aeq=[];beq=[]; ub=[];
%The only constraint here is d>0
lb=0;
%The overall cost function
fun = @(d) 200 *d +20*10^6/d;
%Fmincon
[x,fval,exitflag,output] = fmincon(fun, d0, A, b, Aeq, beq, lb, ub);
str=sprintf('The diameter of the pipe that minimizes the overall cost is %0.5f inches',x);
disp(str)