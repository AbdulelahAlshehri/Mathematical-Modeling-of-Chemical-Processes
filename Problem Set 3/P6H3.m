%Probelm 6
clear all
clc
B = [7.5, 8, 8.5];
%The range
k= 0.8;
xif= 1;
N= 100;
%step size 
h= (xif-k)/N;
%The value of xi 
for i=1:1:N
xi(i)= k+(xif-k) *(i/N); 
end 
%The values of p(x)= -1/x, q(x)= - Beta^2, r(x)= -1
p= -1./xi;
%for the first rate, Case A
qa= -(B(1))^2 * ones(1,N);
%for the second rate, case B
qb= -(B(2))^2 * ones(1,N);
%for the third rate, Case C
qc= -(B(3))^2 * ones(1,N);
r = -1;
% The values of di, ui, li
% d is constant but to use the built-in function blktridig we need to have
% the same dimesions for d, u, l
% u and l are functions of p(xi) which is not cnstant
for i= 1:1:N
    da(i)= 2+h^2*qa(i);
    db(i)= 2+h^2*qb(i);
    dc(i)= 2+h^2*qc(i);
    u(i) = -1 +h/2 *p(i);
    l(i) = -1 - h/2 * p(i);
end
%It is important to note that for [a=k, b=1]:
%At a or xi=k, we have Neumann BC = alpha
%At b or xi=1, we have Dirichlet BC = beta
alpha = 0 ;
beta  =0;
%The values of (a11), (a12), (aN+1,N), and (aN+1,N+1)
%a11 for cases A,B, C
a11a= da(1); a11b= db(1); a11c= dc(1);
a12 =-2;
an1n=0;
an1n1= 1;
%the values of b1, bN+1, and bi
b1  = - h^2 * r + 2*h * l(1)* alpha;
bi  = -h^2*r;
bn1= beta;
% Now we construct the matrices A and b 


%For Case A
   % diag            % u                      %l 
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
plot(xi, thetaa(2:1:N+1))


%For Case B 
   % diag            % u                      %l 
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
plot(xi, thetab(2:1:N+1))




%For Case C 
% diag            % u                      %l 
A= diag(l) + diag(dc(1:1:N-1),1) + diag(u(1:1:N-2),2);
%Create a row that has a11, a12, and zeros
a= zeros(1, N);
%Insert a11 and a12 in the row 
a(1,1)= a11c;
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
thetac=inv(A)*b;
plot(xi, thetaa(2:1:N+1),'o', xi, thetab(2:1:N+1),'o', xi, thetac(2:1:N+1),'o')
xlabel('xi')
ylabel('theta')
legend('Beta = 7.5', 'Beta= 8', 'Beta= 8.5')
title('Conduction in an annulus with a uniform heat generation form')


