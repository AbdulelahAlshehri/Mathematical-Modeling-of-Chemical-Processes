%Homework Assignment #4
%Probelm 2
clear all
clc 
close all
%Data given:
xvals=[5*10^-5, 10^-4, 4*10^-4, 5*10^-4, 10^-3, 0.002, 0.003];
yvals=[36.42, 33.72, 30.63, 27.45, 24.76, 22.30, 19.71];
N=size(xvals,2);
y0= 52.2;
%Define the function to be fit
F=@(x,xdata) y0 + x(1) *log(1-xdata/(xdata+x(2)));
%Define the objective or cost function
Fobj=@(x) (1/N)*sum((F(x,xvals)-yvals).^2);
opts = optimset('Display', 'off');

%part A: 
%intial guess of the paramters
x0 = [4.243, 10^-8];
%Use unconstrained minimization to optimize the values of the parameters
[xunc,ressquared,eflag,options] = fminunc(Fobj,x0,opts);
disp('for part A:')
str1=sprintf('\nThe optimized value for R*T*Gamma_inf is %0.3g  mN/m',xunc(1));
str2=sprintf('The optimized value for alpha is %g g/L',xunc(2));
disp(str1)
disp(str2)
a = xunc(1);
b = xunc(2);
%Range of xvalues
range=max(xvals)-min(xvals);
xpred=min(xvals):0.01*range:max(xvals);
Npred=size(xpred,2);
for i = 1:Npred
 ypred(i)=F([a,b],xpred(i));
end

%Part B:
%change the intial guess by 10% to see if it is sensitive
x0 = [2*4.243, 2*10^-8];
%Use unconstrained minimization to optimize the values of the parameters
[xunc,ressquared,eflag,options] = fminunc(Fobj,x0,opts);
disp('for part B (the initial guess is changed by 100%):')
str1=sprintf('\nThe optimized value for R*T*Gamma_inf is %0.3g  mN/m',xunc(1));
str2=sprintf('The optimized value for alpha is %g g/L',xunc(2));
disp(str1)
disp(str2)
a= xunc(1);
b = xunc(2);
for i = 1:Npred
 ypred1(i)=F([a,b],xpred(i));
end

figure (1)
plot(xvals,yvals,'ro',xpred,ypred,'b-', xpred, ypred1,'g-')
title('Nonlinear Fit of Interfacial Tension ')
legend('Data','Part A: Model Fit 1 (fminunc)','Part B: intial guess changed by 100%','location','best')
xlabel('\gamma (mN/m)')
ylabel('C_{bulk} (g/L)')
disp('As shown on the figure, optimizing the function is very sensitive to the intial guess.  The fit for part A looks reasonable. The confidence intervals are computed using python. The optimized values for part A fall within the 51% confidence intervals')
