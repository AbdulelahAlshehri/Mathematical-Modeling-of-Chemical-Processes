%Homework#2 
%Problem#9
clear all
clc
%Initial Concentrations Co at t=0
Ca=10;
Cb=0;
Cc=0;
Cd=0;
%The rate constant
k = [1 1 0.5 1];
%Defining a time range and the length of it
t=1:1:400000;
n=numel(t);
% Step size
h = 0.0001;
%Using Euler method using one slope
for i= 1:1:n
    Ca= Ca+ h*(-k(1)* Ca);
    Cb= Cb + h*((k(1)*Ca) + (k(3)*Cc) - k(2) *Cb - k(4)*Cb);
    Cc = Cc + h *(k(2)*Cb -k(3)* Cc);
    Cd = Cd +h *(k(4)*Cb);
     P1(i)= [Ca];
     P2(i)= [Cb];
     P3(i)= [Cc];
     P4(i)= [Cd];
end

%reducing the time using the step size
t= h*t;

%Plotting the results
subplot(2,2,1);
plot(t,P1)
title('Subplot 1: (Ca vs time)')
xlabel(' Time (min) ')
ylabel(' Ca (mol)')
subplot(2,2,2);
plot(t,P2)
xlabel(' Time (min) ')
ylabel(' Cb (mol)')
title('Subplot 2: (Cb vs time)')
subplot(2,2,3);
plot(t,P3)
xlabel(' Time (min) ')
ylabel(' Cc (mol)')
title('Subplot 3: (Cc vs time)')
subplot(2,2,4);
plot(t,P4)
xlabel(' Time (min) ')
ylabel(' Cd (mol)')
title('Subplot 4: (Cd vs time)')