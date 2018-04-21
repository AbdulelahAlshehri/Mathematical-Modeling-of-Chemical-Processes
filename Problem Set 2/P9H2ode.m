%Homework#2 
%Problem#9
clear all
clc
k = [1 1 0.5 1];

ydot=@(t,y) [-k(1)*y(1)
 k(1)*y(1)-k(2)*y(2)+k(3)*y(3)-k(4)*y(2)
 k(2)*y(2)-k(3)*y(3)
 k(4)*y(2)];

y0 = [10; 0; 0; 0];
[t,y] = ode45(ydot, [0 40], y0);

%Plotting the results
subplot(2,2,1);
plot(t,y(:,1))
title('Subplot 1: (Ca vs time)')
xlabel(' Time (min) ')
ylabel(' Ca (mol)')
axis([0 20 0 10]);
subplot(2,2,2);
plot(t,y(:,2))
xlabel(' Time (min) ')
ylabel(' Cb (mol)')
title('Subplot 2: (Cb vs time)')
axis([0 20 0 10]);
subplot(2,2,3);
plot(t,y(:,3))
xlabel(' Time (min) ')
ylabel(' Cc (mol)')
title('Subplot 3: (Cc vs time)')
axis([0 20 0 10]);
subplot(2,2,4);
plot(t,y(:,4))
xlabel(' Time (min) ')
ylabel(' Cd (mol)')
title('Subplot 4: (Cd vs time)')
axis([0 20 0 10]);