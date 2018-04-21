%Homework Assignment #4
%Probelm 7
clear all
clc 
close all
%The objective function:
%The volume =  Volume of the spherical shell + Volume of the sphere
%V=4/3 *pi*(x(1)^3-x(2)^3) + 4/3 *pi*x(1)^3;

%Constraints: 
%1) Nonlinear constraint:
%Sy/n =< 30,000/2 psi
% S = p *ri/2t
%where p =m R T/V, t=ro-ri, V= 4/3 *pi*(ro^3-ri^3)
%Sy can be rewritten as:  Sy = (m R T/(4/3 *pi*(ro^3-ri^3)))* ri * (1/(2*(ro-ri)))
% Since Sy/n is constant for this probelm, the inequality becomes
% (m R T/(4/3 *pi*(ro^3-ri^3)))* ri * (1/(2*(ro-ri)))=< 15,000 psi or 1.03421e+8 Pascal

%2) Linear constraint:
% The outer radius is greater than the inner radius 
%ro-ri>=0

%3)Lower bounds:
% ro>0, ri>0

%No linear equality/inequality constraints 
A=[-1 1];b=[0.0];Aeq=[];beq=[]; ub=[];
%The only constraint here is x>10 (the room width)
lb=[0 0];

disp('Part A')
%Initial guess
x0 = [0.5,0.4];
options = optimoptions(@fmincon,'Algorithm','sqp');
T= 308.2; %K 
m= 10; %kg
R=286.9;	%J/kg/K for dry air 
%Source: http://www.engineeringtoolbox.com/individual-universal-gas-constant-d_588.html
[soln,fval] = fmincon(@objfun,x0,A,b,Aeq,beq,lb,ub,... 
   @(x)confuneq(x,T),options);

%Display the results for part A
V= objfun(soln);
T= 308.2; %K
m= 10; %kg
R=286.9; 
Con=(m*R*T/(4/3 *pi*(soln(2)^3)))* soln(2) * (1/(2*(soln(1)-soln(2))));
str=sprintf('The volume is %0.5f m^3',V);
disp(str)
L=Con*0.000145037;
str=sprintf('The stress is %0.5f psi',L);
disp(str)
str=sprintf('The outer diamter is %0.5f m',soln(1));
disp(str)
str=sprintf('The inner diamter is %0.5f m',soln(2));
disp(str)

disp('Part B')
T= 408.2; %K 
[soln,fval] = fmincon(@objfun,x0,A,b,Aeq,beq,lb,ub,... 
   @(x)confuneq(x,T),options);

%Display the results for part B
V=objfun(soln);
T= 408.2; %K
R=286.9;	%J/kg/K for dry air 
%Source: http://www.engineeringtoolbox.com/individual-universal-gas-constant-d_588.html
Con=(m*R*T/(4/3 *pi*(soln(2)^3)))* soln(2) * (1/(2*(soln(1)-soln(2))));
str=sprintf('The volume is %0.5f m^3',V);
disp(str)
L=Con*0.000145037;
str=sprintf('The stress is %0.5f psi',L);
disp(str)
str=sprintf('The outer diamter is %0.5f m',soln(1));
disp(str)
str=sprintf('The inner diamter is %0.5f m',soln(2));
disp(str)
