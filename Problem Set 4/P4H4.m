%Homework Assignment #4
%Probelm 2
clear all
clc 
close all
Data = csvread('midterm_data.csv');
xdata=Data(:,1);
ydata1=Data(:,2);
ydata2=Data(:,3);



disp('Part A (Linear Fitting)')
%We can rewrite the equation in the line form
% y   = a  x   + C
%ln(u)= n ln(l)+ ln(k)
%The function reallog returns the natural logarithm of each element of the
%vector.
ax= reallog(xdata);
%Number of points
Nc=numel(ax);
%Since C does not change
M=ones(Nc,1);
%Putting the two columns next to each other
A=[ax, M];
%The function reallog returns the natural logarithm of each element of the
%vector.
b1=reallog(ydata1);
%Solving for x
x1=inv(A'*A)*A'*b1;
%The first term a
a1=x1(1);
% The second term  
c1=exp(x1(2));
%Generate the parameters for the fit
ll1=min(xdata): 0.01: max(xdata);
nl1 = c1*ll1.^a1;
%The function reallog returns the natural logarithm of each element of the
%vector.
b2=reallog(ydata2);
%Solving for x
x2=inv(A'*A)*A'*b2;
%The first term a
a2=x2(1);
% The second term  
c2=exp(x2(2));
%Generate the parameters for the fit
ll2=min(xdata): 0.01: max(xdata);
nl2 = c2*ll2.^a2;
%Plot fit along with data
figure()
loglog(xdata,ydata1,'ro', ll1, nl1,'-r', xdata,ydata2,'bo', ll2, nl2,'-b')
legend('Data 1', 'Fit1', 'Data 2', 'Fit2')
title(' Linear Fit of Viscosity')
disp(' The values of k and n for the first set of data')
disp(' k in Pa is')
disp(c1)
disp(' n is')
disp(a1)
disp(' The values of k and n for the second set of data')
disp(' k in Pa is')
disp(c2)
disp(' n is')
disp(a2)



%Part B:
N=size(xdata,2);
%Define the function to be fit
F=@(x,xdata) x(1) * xdata.^x(2);
%Define the objective functions
Fobj1=@(x) (1/N)*sum((F(x,xdata)-ydata1).^2);
Fobj2=@(x) (1/N)*sum((F(x,xdata)-ydata2).^2);
opts = optimset('Display', 'off');
%intial guess of the paramters
x01 = [90, -0.30];
x02 = [200, -0.5];
%Use unconstrained minimization to optimize the values of the parameters
[xunc1,ressquared,eflag,options] = fminunc(Fobj1,x01,opts);
[xunc2,ressquared,eflag,options] = fminunc(Fobj2,x02,opts);
disp('Part B (Non-Linear Fitting)')
disp('For the first set of data:')
k1=xunc1(1);n1=xunc1(2);k2=xunc2(1);n2=xunc2(2);
str1=sprintf(' The optimized value for k is %0.3g  Pa',k1);
str2=sprintf('The optimized value for n is %g',n1);
disp(str1)
disp(str2)
disp('For the second set of data:')
str3=sprintf('The optimized value for k  is %0.3g  Pa',k2);
str4=sprintf('The optimized value for n is %g',n2);
disp(str3)
disp(str4)
xpred=min(xdata):0.01:max(xdata);
Npred=size(xpred,2);
for i = 1:Npred
 ypred1(i)=F([k1,n1],xpred(i));
end
for i = 1:Npred
 ypred2(i)=F([k2,n2],xpred(i));
end
figure()
loglog(xdata,ydata1,'ro', xpred, ypred1,'-r', xdata,ydata2,'bo', xpred, ypred2,'-b')
legend('Data 1', 'Fit1', 'Data 2', 'Fit2')
title(' Nonlinear Fit of Viscosity')
