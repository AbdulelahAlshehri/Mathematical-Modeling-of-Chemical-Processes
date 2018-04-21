%Homework#1 
%Probelm#1
clc 
clear 
% Please note that x ranges from 1 to 28 since it is not possible to create
% a vector that starts from 1 and ends at 30 while maintaining an increment
% of 3
x=[1:3:30];
%Identifying the interval 
i1=1; i2=10;
%Then, rand is used to draw values from a uniform distribution in the open interval (1,10) 
a=(i2-i1)*rand(1,10)+i1;
Z=[a', (a').^2, (a').^0.5];
% This plots the first column of Z vs. x
plot(x',Z(:,2));
xlabel('X')
ylabel('Y')
title(' The 2nd column of Z vs x')





