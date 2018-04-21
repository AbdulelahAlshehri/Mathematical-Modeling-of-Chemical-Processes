%Problem 7 
clc
clear all 
%Rewritting the problem in the dimesionless form:
% y''  + 2/x y' - phi^2 * y = 0 
%where y = theta(zeta) 
phi =[0.01, 10];
%The first BC is Neumann BC  y'(r=0)=0
yp=0;
%The second BC is Dirichlet BC y(r=R)=CR/CR= 1
yf=1 ;

% Part A: shooting method

%For case 1  where phi = 0.01 

%For case 2  where phi = 10 

%%%%%%%%%%%%%%%%%% Part B: Finite difference method%%%%%%%%%%%%%
N =100;
% Since the at r = 0, zeta =0 and at r=R zeta =1
% The step size is (b-a)/N
h= (1)/N;
%The value of zeta z0 is set to 0.000001 to avoid dividing by zero 
z=linspace(0.000001,1,N);
%The values of p(x)= -2/z, q(x)= phi^2, r(x)=0
p= -2./z;
%for the first rate, Case A, phi= 0.01
qa= phi(1)^2 * ones(1,N);
%for the second rate, case B, phi = 10
qb= phi(2)^2 * ones(1,N);
r = 0;
% The values of di, ui, li
% d is constant but it's easier to write it with the same dimensions for d, u, l
% u and l are functions of p(xi) which is not cnstant
for i= 1:1:N
    da(i)= 2+h^2*qa(i);
    db(i)= 2+h^2*qb(i);
    u(i) = -1 +h/2 *p(i);
    l(i) = -1 - h/2 * p(i);
end
%It is important to note that for [a=k, b=1]:
%At a or z=0, we have Neumann BC = alpha
%At b or z=1, we have Dirichlet BC = beta
alpha = 0 ;
beta  = 1;
%The values of (a11), (a12), (aN+1,N), and (aN+1,N+1)
%a11 for cases A,B 
a11a= da(1); a11b= db(1);
a12 =-2;
an1n=0;
an1n1= 1;
%the values of b1, bN+1, and bi
b1  = - h^2 * r + 2*h * l(1)* alpha;
bi  = -h^2*r;
bn1= beta;


% Now we construct the matrices A and b 
%For case 1  where phi = 0.01 
A= diag(l) + diag(da(1:1:N-1),1) + diag(u(1:1:N-2),2);
%Create a row that has a11, a12, and zeros
a= zeros(1, N);
%Insert a11 and a12 in the row 
a(1,1)= a11a;
a(1,2)= a12;
%Insert  row 1
A = [a;A];
%Create  column N+1
zer= zeros(N+1, 1);
A = [A zer];
% Replace the values in the last row 
A(N+1, N+1) =an1n1;
A(N+1, N) = an1n;
A(N,N+1)=u(N-1);
%Now we have A as (N+1)*(N+1) 
b=bi*ones(N+1, 1);
b(1,1)= b1;
b(N+1,1)= bn1;
thetaa=inv(A)*b;


%For case 2  where phi = 10 
%For case 1  where phi = 0.01 
A= diag(l) + diag(db(1:1:N-1),1) + diag(u(1:1:N-2),2);
%Create a row that has a11, a12, and zeros
a= zeros(1, N);
%Insert a11 and a12 in the row 
a(1,1)= a11b;
a(1,2)= a12;
%Insert  row 1
A = [a;A];
%Create  column N+1
zer= zeros(N+1, 1);
A = [A zer];
% Replace the values in the last row 
A(N+1, N+1) =an1n1;
A(N+1, N) = an1n;
A(N,N+1)=u(N-1);
%Now we have A as (N+1)*(N+1) 
b=bi*ones(N+1, 1);
b(1,1)= b1;
b(N+1,1)= bn1;
thetab=inv(A)*b;
plot(z, thetab(2:1:N+1), 'bx')
plot(z, thetaa(2:1:N+1),'x', z, thetab(2:1:N+1),'x')
xlabel('z')
ylabel('theta')
legend('phi = 0.01', 'phi= 10')
title('Finite Difference Method: Theta vs z')

disp('For part B, Decreasing the step size or increasing the number points decreases the accuracy of the solution.')
% Part C: based on results from A and B, find y'(r=R)
disp('For part C, based on the results of a: the gradients at the outer edge of the pallet (the slopes at r=R) are found to approximately be: (A) 0 for phi=0.01, (B) 9 for phi=10') 
