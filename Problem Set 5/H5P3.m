%Homework Assignment #5
%Problem 3
clear all
clc 
close all
x= [0.001,0.002,0.005,0.01,0.02,0.05,0.1]; %M =x
f=[-91.92666667,-184.2533333,-466.64,-967.2,-2121.266667,-6982,-21040.66667]; %u =f
th=0.63348;
mu=1e-3;
rho=1000;

disp(' Part C')
%nonlinear fit 
N=size(x,2);
%Define the function to be fit
F=@(p,x) mu./p(1).*x+p(2).*1000./(th.*(p(1)).^0.5).*x.^2;
%Define the objective functions
Fobj1=@(p) (1/N)*sum((F(p,x)-f).^2);
opts = optimset('Display', 'off');
%intial guess of the paramters
x01 = [2, 1];
%Use unconstrained minimization to optimize the values of the parameters
[xunc,ressquared,eflag,options] = fminunc(Fobj1,x01,opts);

str2=sprintf('The value of the parameters are u0= %0.5f cm^2/k V s  and alpha= %0.5f kb', xunc(1), xunc(2));
disp(str2)

% %Nonlinear fit 
% unlin= xunc(1).*xfit./(xfit+xunc(2));
% % plotting the results 
% plot(x,f,'ro',xfit,yy,'b-',xfit,ulin,'r--', xfit,unlin,'k')
% legend('Data','Spline','Linear fit', 'Nonlinear fit', 'location','best')
% disp('As seen on the plot, linear and nonlinear regression fail to accurately predict the value of u(1.25). This is a result of the gap in the data between 1 and 2. Using spline provides better interapolation in the range of the molecular weight data than the other two methods')
% 

