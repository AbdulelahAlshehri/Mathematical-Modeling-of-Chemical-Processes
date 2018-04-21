%Probelm#5
clc 
clear all
%Define the parameters of the problem 
D = 10 ;%um^2/sec
L = 1000; %um
v = 0.1  ;%um/s
k = 5*10^-3; %s
% The Dirichelt BC's given are:
C0= 1;
Cf= 0.1*C0;
%The number of points 
N= 100;
%The range of the distance z
z=linspace(0,1,N);
%The step size
h= (C0-Cf)/N;
% From table 8.1, p,q,r can be used to find the values of d, u ,l
p=-v/D;
q=k/D;
r=0;
d= 2+h^2*q;
u= -1 + h/2 * p;
l= -1 - h/2*p ;
%Constrauct the matrix A
A= diag(d*ones(N,1))+ diag(u*ones(N-1,1),1)+diag(l*ones(N-1,1),-1);
%Construct the b matrix, where A *C = b
b= zeros(N,1);
b(1,1)= C0;
b(N,1)=Cf;
%Calculate the concentration profile
C=inv(A)*b;
%plotting the results 
plot(z, C,'x')
axis([0 1 0 1])
ylabel('Concentration (M)')
xlabel('Distance (dimensionless)')
title (' Concentration vs Dimensionless distance')
