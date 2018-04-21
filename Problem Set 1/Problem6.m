clc
clear all
%We can rewrite the Arrhenius equation in the line form
%ln(k)= -EA (1/RT) + ln(ko)
%Where
T= [430; 450; 470; 480; 490];%Temperature in K
k= [0.0026; 0.0118; 0.0460; 0.0873; 0.1800]; %rate constant in s^-1
%Since T changes, we need to calaculate 1/(T*R)
R= 8.314; %J/K
%The reciprocal of T*R is taken as the coefficient 
L=1./(T*R);
%Since the pre-exponential factor,ko, does not change, we can experss its column as
M=[1; 1; 1; 1; 1];
%Putting the two columns next to each other
A=[L, M];
%The function reallog returns the natural logarithm of each element of the
%vector k, which is the left hand side of the linear equation
b=reallog(k);
%Solving for x
x=inv(A'*A)*A'*b;
%The activation energy is the first term of x
EA=-x(1);
%Th natural logarithm of pre-exponential factor,ko, is the second 
ko=exp(x(2));
%Generate the parameters for the fit
Tl=420:.01:500;
kl=ko*exp(-EA./(Tl*R));
%Plot fit along with data
plot(T, k,'ro', Tl, kl, '-b')
legend('Data', 'Fit')
formatSpec = 'The pre-exponential factor ,ko, and the activation energy, Ea, are found to be ko = %3.5e s^-1   and  Ea = %3.5e. Joules ';
fprintf(formatSpec, ko, EA)

