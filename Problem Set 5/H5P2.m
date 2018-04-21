%Homework Assignment #5
%Problem 2
clear all
clc 
close all
t = linspace(0,pi,10);
g = 5*sin(2*t)+2;
tt=linspace(0,pi,1000);
gg=spline(t,g,tt);
gq=interp1(t,g,tt, 'spline');
plot(t,g,'ro', tt, gg,'yx', tt, gq,'b--')
legend('Data','spline','interp1- spline method')
xlabel('x')
ylabel('y')
title('Y = 5*sin(2*t)+2')
disp(' As shown on the graph, there is no noticeable difference between using spline and the spline method in interp1 ')


