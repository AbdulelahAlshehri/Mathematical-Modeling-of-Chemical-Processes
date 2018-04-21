%Problem 9
clear all
clc
% The span of x 
xspan= 0:0.01:1;
a=0;
alpha=1;
b=1;
beta=0;
% The solution to part A

%IVP1

%The initial conditions 
y10=[0 0];
%The functions 
ydot1= @(x,y1)[ y1(2);
    y1(1)*pi^2- 2*pi^2*sin(pi*x)];

%IVP2

%The initial conditions
y20=[0 1];
%The functions 
ydot2= @(x,y2)[y2(2);
               pi^2 * y2(1)];


 
disp('For part B:')
%The built-in function ode45 is based on RK4 and it can be used to find
%estimate the the values of y1 and y2 at xi
[x,y1] = ode45(ydot1, xspan, y10);   
[x,y2] = ode45(ydot2, xspan, y20);
Xi= [xspan(1);xspan(26); xspan(51); xspan(76); xspan(101)];
y1x= [y1(1,1);y1(26,1); y1(51,1); y1(76,1); y1(101,1)];
y2x= [y2(1,1);y2(26,1); y2(51,1); y2(76,1); y2(101,1)];
%This will tabulate the time required to find the inverse for each case
Vars= {'point 1';'point 2';'point 3'; 'point 4'; 'point 5'};
table(Xi, y1x, y2x,...
    'RowNames',Vars)
disp('No, the solution does NOT satisfy the Dirichlet condition at x=1')

disp('For part C:')
%C = (beta - y1(b))/(y2(a))
C  = (beta -y1(101,1))/(y2(101,1)); 
formatSpec = ' The value of c that will give an approximate solution for y(x) is C = %3.5f. The function can be rewritten as w(x) = y1(x)+ %3.5f y2(x) ';
fprintf(formatSpec, C, C)
disp('.')
disp(' For part D:')
Approximation= [y1(1,1)+C* y2(1,1);y1(26,1)+C*y2(26,1); y1(51,1)+C*y2(51,1); y1(76,1)+C*y2(76,1); y1(101,1)+C*y2(101,1)];
ExactSolution= [sin(pi*0); sin(pi*0.25); sin(pi*0.5); sin(pi*0.75); sin(pi)];
AbsoluteError=[ Approximation(1)-ExactSolution(1);Approximation(2)-ExactSolution(2);Approximation(3)- ExactSolution(3);Approximation(4)- ExactSolution(4);Approximation(5)- ExactSolution(5)];
%This will tabulate the time required to find the inverse for each case
Vars= {'point 1';'point 2';'point 3'; 'point 4'; 'point 5'};
table(Xi, Approximation, ExactSolution,AbsoluteError,...
    'RowNames',Vars)
