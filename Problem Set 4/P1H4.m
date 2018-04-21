%Homework Assignment #4
%Probelm 1
clear all
clc 
close all
% f(x) = x(1) + x(2)
f=[1;1]; 
% Given constraints are:
% -3 x(1) +  x(2) =< -3
%    x(1) +2 x(2) =< 5
%    x(1) +  x(2) =< 4
%The linear inequality constraints can be expressed as vectors A and b 
A= [ -3  1
      1  2
      1  1];
b= [-3;5;4];
%    x(1)>=0; x(1)>=0
%The varaiables can be constrained to be positive by
lb = zeros(2,1);
%No linear equality constraints, hence 
Aeq=[];
beq=[];
% Call linprog obtaining the lagrange multiplier
[x,fval, exitflag, output,lambda]= linprog(f, A, b, Aeq, beq, lb);
if (exitflag==1) 
str1=sprintf('The minimum of the function f(x) is %0.0f for x1,x2 = (%0.0f,%0.0f) \n',fval,x(1),x(2));
    disp(str1)
else
   disp('Something is wrong, exitflag not 1')
end