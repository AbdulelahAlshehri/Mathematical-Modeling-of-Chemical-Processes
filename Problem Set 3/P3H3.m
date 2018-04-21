%Problem 3
clc
clear all 
%  Define the given parameters
Ai= 0.4;          %ft^2
Ao= 0.5;          %ft^2
h = 8.8;          %Btu/hr/ft^3/F
rho=[62 139];     %lbm/ft^3
cp =[1 0.2];      %Btu/lbm/F
V  =[0.03 0.003]; %ft^3
%The intial conditions
%    L0   C0
y0 =[32   150];

t1=0.5;

ydot= @(t,y)[ (Ai*h)/(rho(1)*cp(1)*V(1)) * (y(2)-y(1))
              (Ao*h)/(rho(2)*cp(2)*V(2)) * (32-y(2)) + (Ai*h)/(rho(2)*cp(2)*V(2)) * (y(1)-y(2)) ];
   
[t,y] = ode45(ydot, [0 t1], y0);

plot(t, y(:,1),'b--', t, y(:,2),'r--')
legend('TL', 'TC')
title(' Temperature of Liquid, TL(t) and Immersed Container,TC, vs Time ')
ylabel('Temperature (F)')
xlabel('Time(hr)')
axis([0 t1 30 155])
disp('It is worth noting that the final temperatures are not shown in the plot. The temperature of liquid is decreasing further. Temeperatures reach their final values at about 2.5 hours')
