clear all 
clc
close
%guess 
xg=[1;1;1;1;1;1;1;1;1;1;1];
%Fsolve to solve N nonlinear equations 
[x,fval,exitflag]=fsolve(@(w)eqnsP8H3(w), xg ,optimset('Display','off'));
%The points of distance on the grid 
z=linspace(0,1,11);
plot(z,x,'rx')
ylabel('T  (Dimensionless)')
xlabel('Z (Dimensionless)')
title (' Temperature vs  distance')