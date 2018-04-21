%Homework Assignment #5
%Problem 4
clear all
clc 
close all
Data = csvread('hmwk5_p4.csv');
x= Data(:,1); %T =x
f= Data(:,2); %P =f


disp(' Part A')
%Linear Interapolation 
%f(xt)= a0 + a1 *(xt-x0)
%For the first point , T =150C
%150 is  between points: 3 and 4
xt1=150;
a0=f(3);
a1=(f(4)- f(3))/(x(4)-x(3));
ft1=a0+a1*(xt1-x(3));
str2=sprintf('For a temperature value of 150 C, the interapolated value of pressure using linear inerapolation is P(150)= %0.5f bar', ft1);
disp(str2)
%For the second point, T= 232 C
%232 is  between points: 9 and 10
xt2=232;
a0=f(9);
a1=(f(10)- f(9))/(x(10)-x(9));
ft2=a0+a1*(xt2-x(9));
str2=sprintf('For a temperature value of 232 C, the interapolated value of pressure using linear interapolation is P(232)= %0.5f bar', ft2);
disp(str2)



disp(' Part B')
%spline
xt=[xt1 xt2];
yy=spline(x,f, xt);
str2=sprintf('For a temperature value of 150 C, the interapolated value of pressure using cubic spline is P(150)= %0.5f bar', yy(1));
disp(str2)
str2=sprintf('For a temperature value of 232 C, the interapolated value of pressure using cubic spline is P(232)= %0.5f bar', yy(2));
disp(str2)



disp(' Part C')
%nonlinear fit 
N=size(x,2);
%Define the function to be fit
F=@(p,x) p(1)+p(2)./(x+p(3));
%Define the objective functions
Fobj1=@(p) (1/N)*sum((F(p,x)-log(f)).^2);
opts = optimset('Display', 'off');
%intial guess of the paramters
x01 = [100, 100, 100];
%Use unconstrained minimization to optimize the values of the parameters
[xunc,ressquared,eflag,options] = fminunc(Fobj1,x01,opts);

utn1= exp(xunc(1)+ xunc(2)/(xunc(3)+xt1));
utn2= exp(xunc(1)+ xunc(2)/(xunc(3)+xt2));

str2=sprintf('For a temperature value of 150 C, the interapolated value of pressure using nonlinear fit is P(150)= %0.5f bar', utn1);
disp(str2)
str2=sprintf('For a temperature value of 232 C, the interapolated value of pressure using nonlinear fit is P(232)= %0.5f bar', utn2);
disp(str2)



disp('Part D')
%How they compare
disp('For the first point (T= 150 C) , the value of pressure found by linear interpolation is the greatest, followed by that of cubic spline and the smallest was that determined by performing nonlinear regression ')
disp('For T =150,  Linear inerapolation > cubic spline > non-linear fitting ')
disp('For the second point (T= 232 C) , the value of pressure found by nonlinear regression is the greatest, followed by that of linear interapolation and the smallest was that found by performing cubic spline ')
disp('For T =232, non-linear fitting >  Linear inerapolation > cubic spline ')
disp('Based on the numbers stated above and the fact that the cubic spline provides the most accurate interapolation, it can be said that : the accuracy of cubic spline > the accuracy of nonlinear regression > the accuracy of linear interapolation')


