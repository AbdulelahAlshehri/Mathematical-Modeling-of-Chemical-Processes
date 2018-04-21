clear 
clc
for i=1:201;
%Generate for alpha.  
alpha=-100:1:100;
A=[-3 -2 1; 2 alpha(i) 1; 3 1 -2];
%Singularity test: A square matrix is singular if and only if the
%determinant is equal to 0
C(i)=det(A);
%Ill-Conditioned test: A matrix is ill-conditioned if the condition number
%is too large and singular if it is infinite
Con(i)=cond(A);
end
%Then, the value at which A is singular is determined
%The determinant is very small at that point (6e-16). MATLAB does not write it as zero
%since it uses floating point arithmetic.
L=find(C>0 & C<0.00000000001);
C(L);
M=alpha(L);
%Similarly, MATLAB does not write the condition number of a singular matrix
%as inf. It prints it out as 1e+16 instead. 
P=find (Con>10^6);
F=Con(P);
figure 
plot(alpha,C)
xlabel('alpha')
ylabel('det(A)')
title(' Determinant of A vs alpha')
figure 
plot(alpha, Con)
xlabel('alpha')
ylabel('cond(A)')
title(' Condition Number of A vs alpha')
formatSpec = 'For the determinant test, A is singular when alpha is %3.2f since the determinant is %3.2f. ';
fprintf(formatSpec, alpha(L), C(L))
formatSpec1 =' For the condition number test, A is singular when alpha is %3.2f since the condition number is %3.0f (infinity). Please read the comments for explanation. Also, no too large numbers are found, therefore, no other integer numbers of alpha leave the system ill-conditioned.';
fprintf(formatSpec1, alpha(P), Con(P))
fprintf(' It can be seen that the determinant is linear and crosses the x-axis only once at 3.')
