%Homework Assignment #4
%Probelm 5
clear all
clc 
close all
%The objective function
syms x1 x2
f= 5*x1^2+4*x2^2;
%The equality constraints
g= x1+4*x2-5;
%We use the equality constaints to solve for x2 
%x2 = (5/4 - x1/4)
% Then, we plug it into the objective function 
f1= 5*x1^2+4*(5/4 - x1/4)^2;
%Use matlab to obtain the first derivative
A= jacobian(f1, [x1]);
% Solve for x1 in f'=0
fprime=@(x1) (21*x1)/2 - 5/2;
x0=1;
[x,fval,exitflag]=fsolve(@(x)fprime(x), x0 ,optimset('Display','off'));
%The value of x1
x_1=x;
%Use the value of x1 to compute x2
x_2=(5/4 - x_1/4);
%Then we evalute the second derivative of the ovective function
disp('Since the second derivative f"(x1) =21/2 >0, it shows that the critical point is a relative minimum of the lagrangian function subject to the constraint given')
str=sprintf('The value of x1 is %0.5f',x_1);
disp(str)
str=sprintf('The value of x2 is %0.5f',x_2);
disp(str)
str=sprintf('The function has a minimum of %0.5f',5*x_1^2+4*x_2^2);
disp(str)
