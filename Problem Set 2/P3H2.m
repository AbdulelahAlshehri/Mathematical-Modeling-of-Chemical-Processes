% Problem 3 Homeowrk 2
clear all

% The height of water in the tank at given velocity is determined using the Secant Method

g = 9.81; %m/s^2
V = 5  ;  %velocity in m/s
L = 5  ;  %length of the pipe in m
t = 3  ;  %time in s

%Defining the equation with h as the only variable 
f=@(h) sqrt(2*9.81*h)*tanh((t/(2*L))*sqrt(2*g*h))- 5;

% xm = x-1  (It was set to zero since h cannot be negative)
xm = 0;

%xn  is the upper limit 
xn = 1000;


%The secant method formula
xp= (xm*f(xn) - xn*f(xm))/(f(xn) - f(xm));


%This loop will update the Xn-1, Xn, and Xn+1 values for each iteration
%until the height is reached

while abs(f(xp)) > 0;
    xn = xm;
    xm = xp;
    xp= (xm*f(xn) - xn*f(xm))/(f(xn) - f(xm));
end

display(['The height of water, in meters, needed to have a velocity of 5 m/s is h =' num2str(xp)]);

