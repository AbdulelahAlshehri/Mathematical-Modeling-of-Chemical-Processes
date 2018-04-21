%Homework Assignment #4
%Probelm 9
clear all
clc 
close all
%The similar triangles principle can be used to create a function for the length of the ladder
%The ladder triangle is has a width of x, height of y and the ladder L
%L = sqrt(x^2+y^2)
%Using similar triangles, the samller trangle is made by the room with the
%ladder and ground. 
%y/x = 10/(x-10)
%Then y= 10x/(x-10), and the function we want to minimize is:
fun = @(x) sqrt(x^2+ (10*x/(x-10))^2);
%To minimze the length of the ladder, fmincon can be used 
%intial guess
x0= 5;
%No linear equality/inequality constraints 
A=[];b=[];Aeq=[];beq=[]; ub=[];
%The only constraint here is x>10 (the room width)
lb=10;
%The overall cost function
%Fmincon
[x,fval,exitflag,output] = fmincon(fun, x0, A, b, Aeq, beq, lb, ub);
L=sqrt(x^2+ (10*x/(x-10))^2);
str=sprintf('The length of shortest ladder is %0.5f feet',L);
disp(str)