%Homework Assignment #4
%Probelm 2
clear all
clc 
close all
%For this problem we are trying to maximize the profit function 
% Assuming no operating cost, Profit = Product value - raw materials 
% Here, we have only two variables: the number of barrels of light crude oil x1
% and heavy crude oil x2

% We can convert the price of each product from per gallon to per barrels and  find the the
% profit/ barrel of each raw material

%The profit of light crude oil/barrel is
         %value of products/barrel           %value of raw materials/barrel 
a1 = (42  * 4.25 * 0.5 + 42 * 4.85 * 0.4) - 135;

%The profit of heavy crude oil/barrel is
         %value of products/barrel          %value of raw materials/barrel 
a2 = (42  * 4.25 * 0.4 + 42 * 4.85 * 0.2) - 95;

%Then we can write the objective function as:
% Z = a1 *x1 + a2 * x2 
f = [a1;a2];
%Constraints
% Upper bound: Light crude oil is limited to 500,000, and for the heavy
% crude oil based on constraints 2 and 3, we can set it to 10^8
% (1) x1 =< 500,000  ; x2 >= 10^8 
ub= [500000; 10^8];
%lower bound is zeros 
lb= zeros(2,1);
% Maximum production rate: 
%2M for gasoline 
% (2) 0.5 *x1 + 0.4*x2 =<2,000,000
%3M for Diesel
% (3) 0.4 *x1 + 0.2*x2 =<3,000,000
A= [0.5 0.4
    0.4 0.2];
b= [2000000 3000000];
%No linear equality constraints, hence 
Aeq=[];
beq=[];
% Call linprog obtaining the lagrange multiplier
[x,fval, exitflag, output,lambda]= linprog(-f, A, b, Aeq, beq, lb,ub);
if (exitflag==1) 
str1=sprintf('The maximum profit in $/day is %0.6e, the amount of raw materials used are:  %0.3e barrels of light crude oil and %0.3e barrels of heavy crude oil \n',-fval,x(1),x(2));
    disp(str1)
else
   disp('Something is wrong, exitflag not 1')
end

