clc
clear all
for j=1:200
 %Generate a random guess vector
 xg=random('normal',0,100,1,4);
 %Find the norm of the guess vector
 normg=norm(xg,2);
 % Store the norm of the guess vector
 guessN(j,:)=normg;
 %Solve the function for the guess vector using the coupled function eqns
 [x,fval,exitflag]=fsolve(@eqnsP4H2,xg,optimset('Display','off'));
 %Find the norm of the solution
 normx=norm(x,2);
 %Store the values of the norm of the solution
 solnN(j,:)=normx;
 %Store the solution
 P(j,:)= [x];
 % Since fsovle will give slightly different solutions, the solutions are
 % rounded to eliminate same solutions later. 
 k=round(x);
 %Store the rounded solutions
 rond=[k];
 L(j,:)=rond;
end

%Find the number of unique solutions using the function unique
nsolns=size((unique(L, 'rows')),1);
%Find the index vectors to extract the solutions.
[R, ia,ic] = unique(L, 'rows');

%Extarct and store all the unqiue solutions
for i= 1:nsolns
solns(i,:) = P(ia(i),:);
end

%part A: plot the norm of the solution as function of the norm of the guess
plot(guessN,solnN,'bo')
xlabel('The norm of the guess vector Xg')
ylabel('The norm of the solution vector X')
title(' Norm of the solution vs Norm of the guess vector')
fprintf('part b')
fprintf(' The number of solutions found is')
display(nsolns)
fprintf(' The unique solutions are (each row represents a unique solution) ')
display(solns)

