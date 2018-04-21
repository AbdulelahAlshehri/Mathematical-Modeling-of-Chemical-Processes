function P7H3shootingphi10()
%Rewritting the problem in the dimesionless form:
% y''  + 2/x y' - phi^2 * y = 0 
%where y = theta(zeta) 
phi =[0.01, 10];
%The first BC is Neumann BC  y'(r=0)=0
yp=0;
%The second BC is Dirichlet BC y(r=R)=CR/CR= 1
yf=1 ;
% This probelm can be written as a system of equations
% _  _ 
%| u1 | 
%| u2 |
% _  _ 
 % where u1 = y  and u2 =y'
 
clear all %clear stored variables

clear all %clear stored variables
clc %clear the screen
close all %close all previously created plots

%% Shooting method example
%Loop around through guesses for final value of slope

%set up a way to vary the final value of slope, Q_o
for i=1:30
    Qo=random('normal',9,0.000001);  %Choose a final slope of 9
                              

%Solve an ODE
u_init=[1  Qo]; %set final value of theta and final slope (guess)
xspan=[1 0.01]; %set the range of the x variable backward (scaled problem) % 0.01 was used to avoid dividing by zero in myfun
options = odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4]);
[x,theta] = ode45(@myfun,xspan,u_init,options);

%Pull out the value of \theta(\xi=1)
[xmax,c]=size(x);
result(i,1)=Qo; %initial flux values
result(i,2)=theta(xmax); %values at \xi = 1

% Add to the figure
hold on;
plot(x,theta(:,1),'bx')
xlabel('\xi','fontsize',14,'fontname','times new roman')
ylabel('\theta','fontsize',14,'fontname','times new roman')
title('Plot different "shots"','fontsize',16,'fontname','times new roman')
end

figure
hold on;
plot(result(:,1), result(:,2),'bx')
xlabel('Input final slope','fontsize',14,'fontname','times new roman')
ylabel('Value of \theta (\xi = 0)','fontsize',14,'fontname','times new roman')
title('Plot of final slope versus result','fontsize',16,'fontname','times new roman')
end

    function rodtemp=myfun(x,U)
    phi= 10; %hL^2 dimensionless 
    rodtemp=zeros(2,1);
    rodtemp(1)=U(2);
    rodtemp(2)=-2/x * U(2) + phi^2 * U(1);
    end
