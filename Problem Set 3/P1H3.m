%Problem 1
clear all
clc
kcat=[ 0.5, 0.08]; %s^-1
km = [0.3,50/1000]; %mM
S0= 1; %mM
E0= 0.1 *S0;
%     E  S   Ep  P
y0=  [E0 S0  0   0]';
t1=70;
t2=t1;

%part A
ydot= @(t,y)[ - kcat(1)* y(1)* y(2)/(km(1)+y(2))
              - kcat(1)* y(1)* y(2)/(km(1)+y(2))
                kcat(1)* y(1)* y(2)/(km(1)+y(2))
                kcat(1)* y(1)* y(2)/(km(1)+y(2))];
[t,y] = ode45(ydot, [0 t1], y0);

figure();
subplot(2,2,1);plot(t,y(:,1),'b-');title('Pepsin catalyzed: Ereactnat');ylabel('concentration(mM)');xlabel('time(s)');axis([0 t1 0 S0]);
subplot(2,2,2);plot(t,y(:,2),'g-');title('Pepsin catalyzed:S');axis([0 t1 0 S0]);ylabel('concentration (mM)'); xlabel('time(s)');axis([0 t1 0 S0]);
subplot(2,2,3);plot(t,y(:,3),'r-');title('Pepsin catalyzed:Eproduct');xlabel('time(s)');ylabel('concentration (mM)');axis([0 t1 0 S0]);
subplot(2,2,4);plot(t,y(:,4),'m-');title('Pepsin catalyzed:Product');xlabel('time(s)');axis([0 t1 0 S0]);

%part B
ydot= @(t,y)[ - kcat(2)* y(1)* y(2)/(km(2)+y(2))
              - kcat(2)* y(1)* y(2)/(km(2)+y(2))
                kcat(2)* y(1)* y(2)/(km(2)+y(2))
                kcat(2)* y(1)* y(2)/(km(2)+y(2))];
[t,y] = ode45(ydot, [0 t2], y0);

figure();
subplot(2,2,1);plot(t,y(:,1),'b-');title('Fumarase catalyzed: Ereactnat');ylabel('concentration(mM)');xlabel('time(s)');axis([0 t2 0 S0]);
subplot(2,2,2);plot(t,y(:,2),'g-');title('Fumarase catalyzed: S');axis([0 t2 0 S0]);ylabel('concentration (mM)'); xlabel('time(s)');axis([0 t2 0 S0]);
subplot(2,2,3);plot(t,y(:,3),'r-');title('Fumarase catalyzed: Eproduct');xlabel('time(s)');ylabel('concentration (mM)');axis([0 t2 0 S0]);
subplot(2,2,4);plot(t,y(:,4),'m-');title('Fumarase catalyzed: Product');xlabel('time(s)');axis([0 t2 0 S0]);

disp('As shown in figures 1 and 2, the species reach their final concentrations faster for the Pepsin catalyzed reaction than the Furmarse catalyzed one.')