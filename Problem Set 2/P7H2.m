%Problem 7
clc
clear all
%Provide an intial guess for fsolve
xo =[.1, .1, .1, .1, .1, .1,.1];

%part a
%The feed in moles for part a
no = [1/3, 0, 1/3, 1/3, 0];
%Fsolve is used to solve the seven equations
[x,fval,exitflag]=fsolve(@(u)eqnsP7H2(u,no), xo ,optimset('Display','iter'));
fprintf(' Part A : The first extent Xi_1 is')
x(6)
fprintf(' Part A : The second extent Xi_2 is')
x(7)
%part b:
%The feed in moles for part a
xo =[1, 1, 1, 1, 1, 1,1];
no = [2, 0, 1/3, 1/3, 0];
%Fsolve is used to solve the seven equations
[x,fval,exitflag]=fsolve(@(u)eqnsP7H2(u,no), xo ,optimset('Display','iter'));
fprintf(' Part B : The first extent Xi_1 is')
x(6)
fprintf(' Part B : The second extent Xi_2 is')
x(7)

