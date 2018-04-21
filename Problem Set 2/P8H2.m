

clc
clear all
%Provide an intial guess for fsolve
q0 =[.1, .1, .1, .1, .1, .1,.1];
% The pipe lengths vector
l= [100, 100, 200, 75, 100, 75, 50];
%Fsolve is used to solve the seven equations
[q,fval,exitflag]=fsolve(@(v)eqnsP8H2(v,l), q0 ,optimset('Display','off'));
%Printing the results 
disp('The flow rates are: ')
qq = ['q1 = ',num2str(q(1)),'  m^3/s'];
disp(qq)
qq = ['q2 = ',num2str(q(2)),'  m^3/s'];
disp(qq)
qq = ['q3 = ',num2str(q(3)),'  m^3/s'];
disp(qq)
qq = ['q4 = ',num2str(q(4)),'  m^3/s'];
disp(qq)
qq = ['q5 = ',num2str(q(5)),'  m^3/s'];
disp(qq)
qq = ['q6 = ',num2str(q(6)),'  m^3/s'];
disp(qq)
qq = ['q7 = ',num2str(q(7)),'  m^3/s'];
disp(qq)