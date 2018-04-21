%Problem 2
clear all
clc
A = [3 2 2 1; 2 3 1 2; 2 1 2 0; 1 2 0 5];

%part a
fprintf('Part A: The norm of each eignvector') 
[V,D] =eig(A);
%The first eigenvector
v1 = V(:,1);
%Its Norm
nv1= norm(v1)
%The 2nd eignvector
v2 = V(:,2);
%Its norm and so on 
nv2= norm(v2)
v3 = V(:,3);
nv3= norm(v3)
v4 = V(:,4);
nv4= norm(v4)
disp(' MATLAB Normlizes the eignvectors so they all have norm of one.The Matlab function norm finds the Frobenius norm (L^2) or the Euclidean norm, which is the square root pf he absolute squares of the element')
%Question how does matlab finds normalize eigenvector v/norm?

%part b 

disp('The symbolic version of A  using the function sym is')

A1= sym(A)

fprintf('Part B:  ')
%a = sym('a', [3 3])

[Vs, Ds] = eig(A1);
%The first eigenvector
vs1 = Vs(:,1);
%The 2nd eignvector
 vs2 = Vs(:,2);
%The 3rd eignvector
 vs3 = Vs(:,3);
%The 4th eignvector
 vs4 = Vs(:,4);
 fprintf('Printing the basis of the eignspace for the given matrix using the sym function will take 14 extra pages. I am not sure if that what is asked. The exact solution to the basis of the eignspace is (It is normalized)')
V
%part C
fprintf('Part C   ')
%initial eignvector value
x0= [1; 0; 0; 0];
%The function calculates the eignvector that corresponds to the largest
%eignvalue of A
[lampda,xf]=PM(A,x0);
fprintf('The largest eignvalue is =')
lampda
display('The eignvector that corresponds to that eignvalue is =');
xf


