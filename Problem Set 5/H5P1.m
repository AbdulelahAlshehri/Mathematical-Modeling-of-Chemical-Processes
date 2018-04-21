%Homework Assignment #5
%Problem 1
clear all
clc 
close all
xi = [0.9, 1.6, 2.3, 3];
yi = [xi(1)* sin(xi(1)),
    xi(2)* sin(xi(2)),
    xi(3)* sin(xi(3)),
    xi(4)* sin(xi(4))];

% Collocation 
disp('Part A')
x =[1 xi(1) xi(1)^2 xi(1)^3;
    1 xi(2) xi(2)^2 xi(2)^3;
    1 xi(3) xi(3)^2 xi(3)^3;
    1 xi(4) xi(4)^2 xi(4)^3];
f = yi;
acol = inv(x)*f;
ycol=acol(1)+ acol(2)*2.5+acol(3)*2.5^2+acol(4)*2.5^3;
disp('The coefficients of the polynomial obtained by performing collocation are:')
str=sprintf('a0 = %0.5f, a1= %0.5f, a2= %0.5f, a3= %0.5f',acol(1), acol(2), acol(3), acol(4));
disp(str)
str1=sprintf('The actual value of the function is y(2.5) = %0.5f  while the value obtained by collocation is Pn(x=2.5)= %0.5f ', 2.5*sin(2.5), ycol);
disp(str1)

% Lagrange 
disp('Part B')
a0= yi(1)/( (xi(1)- xi(2)) * (xi(1) - xi(3)) * (xi(1)-xi(4)));
a1= yi(2)/( (xi(2)- xi(1)) * (xi(2) - xi(3)) * (xi(2)-xi(4)));
a2= yi(3)/( (xi(3)- xi(1)) * (xi(3) - xi(2)) * (xi(3)-xi(4)));
a3= yi(4)/( (xi(4)- xi(1)) * (xi(4) - xi(2)) * (xi(4)-xi(3)));
ylag=a0 * (2.5- xi(2)) *( 2.5-xi(3))*(2.5-xi(4))+ a1 * (2.5- xi(1)) *( 2.5-xi(3))*(2.5-xi(4))+ a2 * (2.5- xi(1)) *( 2.5-xi(2))*(2.5-xi(4))+ a3 * (2.5- xi(1)) *( 2.5-xi(2))*(2.5-xi(3));

disp('The coefficients of the largrange polynomial(ai *(x-x(i+1))*(x-x(i+2))*(x-x(i+3)):')
str=sprintf('a0 = %0.5f, a1= %0.5f, a2= %0.5f, a3= %0.5f',a0, a1, a2, a3);
disp(str)
str1=sprintf('The actual value of the function is y(2.5) = %0.5f  while the value obtained by lagrange interpolation is Pn(x=2.5)= %0.5f ', 2.5*sin(2.5), ylag);
disp(str1)

%Newton's Divided Difference method
disp('Part C')
gx0=yi(1);
gx1x0= (yi(2)-yi(1))/(xi(2)-xi(1));
gx2x1= (yi(3)-yi(2))/(xi(3)-xi(2));
gx3x2= (yi(4)-yi(3))/(xi(4)-xi(3));
gx2x1x0 = (gx2x1 - gx1x0)/(xi(3)-xi(1));
gx3x2x1 = (gx3x2 - gx2x1)/(xi(4)-xi(2));
gx3x2x1x0= (gx3x2x1 - gx2x1x0)/(xi(4)-xi(1));

yN= gx0 + (2.5- xi(1)) *gx1x0 + (2.5-xi(1))*(2.5-xi(2))*gx2x1x0 + (2.5-xi(1))*(2.5-xi(2))*(2.5-xi(3))*gx3x2x1x0;

disp('The coefficients of the Newton polynomial yN= g(x0) + (x- x0) *g(x1,x0) + (x-x2)*(x-x3)*g(x2,x1,x0) + (x-x0)*(x-x1)*(x-x2)*g(x3,x2,x1,x0)')
str=sprintf(' g(x0)= %0.5f, g(x1,x0)= %0.5f, g(x2,x1,x0)= %0.5f, g(x3,x2,x1,x0)= %0.5f',gx0,gx1x0,gx2x1x0,gx3x2x1x0);
disp(str)
str2=sprintf('The actual value of the function is y(2.5) = %0.5f  while the value obtained by Newtons method is Pn(x=2.5)= %0.5f ', 2.5*sin(2.5), yN);
disp(str2)

disp('Part D')
%plotting the results
x=0.9:0.01:3;
%Collocation
ycol=acol(1)+ acol(2).*x+acol(3).*x.^2+acol(4).*x.^3;
%Lagrange
ylag=a0 .* (x- xi(2)) .*( x-xi(3)).*(x-xi(4))+ a1 .* (x- xi(1)) .*( x-xi(3)).*(x-xi(4))+ a2 .* (x- xi(1)) .*( x-xi(2)).*(x-xi(4))+ a3 .* (x- xi(1)) .*( x-xi(2)).*(x-xi(3));
% Newton
yN= gx0 + (x- xi(1)) .*gx1x0 + (x-xi(1)).*(x-xi(2)).*gx2x1x0 + (x-xi(1)).*(x-xi(2)).*(x-xi(3)).*gx3x2x1x0;
plot(xi,yi,'ro', x, ycol,'r', x, ylag,'yx', x, yN,'b--')
legend('Data','Collocation','Lagrange', 'Newton')
xlabel('x')
ylabel('y')
title('Y = x sin(x)')
disp(' As shown on the graph, there is no noticeable difference between the three polynomials when interapolating in the range chosen (0.9 - 3). The interapolated values of x=2.5 also refelct that there is no difference between the three methods')