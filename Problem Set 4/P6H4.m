%Homework Assignment #4
%Probelm 6
clear all
clc 
close all
%To find the extrema of a function, we need to find the critical points
%where the Jacobian J =0, and then classify the critical points by checking
%the determinant of the Hessian.

disp('Part A')
%For the first function: x1=x , x2=y
%f(x,y)= 4*x^3-2*x^2*y+y^2+2
syms x1 x2
f= 4*x1^3-2*x1^2*x2+x2^2+2;
A=jacobian(f, [x1,x2]);
B=hessian(f, [x1,x2]);


%Step 1:
%Use the jacobian to find the critical points

for j=1:100
 %Generate a random guess vector
 xg=random('normal',-100,100,1,2);
 %Solve the function for the guess vector using the coupled function eqns
 [x,fval,exitflag]=fsolve(@(x)eqnsP6H4A(x), xg ,optimset('Display','off'));
 %Store the solution
 P(j,:)= [x];
 % Since fsovle will give slightly different solutions, the solutions are
 % rounded to eliminate same solutions later. 
 k=round(x);
 %Store the rounded solutions
 rond=[k];
 L(j,:)=rond;
end

%Find the number of  critical points using the function unique
nsolns=size((unique(L, 'rows')),1);
%Find the index vectors to extract the solutions.
[R, ia,ic] = unique(L, 'rows');

%Extarct and store all the critical points 
for i= 1:nsolns
solns(i,:) = P(ia(i),:);
end
fprintf(' The critical points are are (each row represents a critical point) ')
display(solns)

%Step2:
%Claculate the determinant of the hessian to determine if the functions has
%an extrema. For this case the solution is rounded since the critical point
%is actually (0,0) but matlab gives very small numbers
x1= round(solns(1,1));
x2= round(solns(1,2));
H=[24*x1 - 4*x2, -4*x1;
   -4*x1       ,  2];
disp('For the first critical point:')
%Find the determinant of the hessian
detH1= det((H)); 
if (detH1 >0)
    disp('The determinant of the hessian is positive. The hessian is negative and the function has a local maxima at this point')
elseif (detH1<0)
    disp('The determinant of the hessian is negative.H is indefinite and the function has a saddle at this critical point') 
else
    disp('The determinant of the hessian is zero. The second partial derivative test is indeterminant. The function should be visually inspected.')
end
disp('By visual inspection of the contour plot, for the first critical point, the function does not have an exterma')
%For the second critical point 
x1= solns(2,1);
x2= solns(2,2);
H=[24*x1 - 4*x2, -4*x1;
   -4*x1       ,  2];
disp('For the second critical point:')
%Find the determinant of the hessian
detH1= det((H)); 
if (detH1 >0)
    disp('The determinant of the hessian is positive. The hessian is negative and the function has a local maxima at this point.')
elseif (detH1<0)
    disp('The determinant of the hessian is negative.H is indefinite and the function has a saddle at this critical point.') 
else
    disp('The determinant of the hessian is zero. The second partial derivative test is indeterminant. The function should be visually inspected.')
end

disp('Therefore, there are no extrema for this function')

%Generating a contour plot
x1_min=-10;x1_max=10;
x2_min=-10;x2_max=10;
x1=linspace(x1_min,x1_max);
x2=linspace(x2_min,x2_max);
[x1,x2]=meshgrid(x1,x2); %set up grid for contour plot
Z= 4*x1.^3-2*x1.^2.*x2+x2.^2+2;
v=linspace(0,100,50);
figure
hold on
contour(x1,x2,Z,v)
axis([-10 10 -10 10])
xlabel('x1')
ylabel('x2')
leg = legend('z','location','northeast');
title('Part A contour plot','fontsize',16,'fontname','times new roman')



clear all

disp('Part B:')
%For the first function: x1=x , x2=y
%f(x,y)= 4*x^3-2*x^2*y+y^2+2
syms x1 x2
f= x1^2*x2+x2^3-4*x1^2+1;
A=jacobian(f, [x1,x2]);
B=hessian(f, [x1,x2]);

%Step 1:
%Use the jacobian to find the critical points

for j=1:100
 %Generate a random guess vector
 xg=random('normal',-100,100,1,2);
 %Solve the function for the guess vector using the coupled function eqns
 [x,fval,exitflag]=fsolve(@(x)eqnsP6H4B(x), xg ,optimset('Display','off'));
 %Store the solution
 P(j,:)= [x];
 % Since fsovle will give slightly different solutions, the solutions are
 % rounded to eliminate same solutions later. 
 k=round(x);
 %Store the rounded solutions
 rond=[k];
 L(j,:)=rond;
end

%Find the number of  critical points using the function unique
nsolns=size((unique(L, 'rows')),1);
%Find the index vectors to extract the solutions.
[R, ia,ic] = unique(L, 'rows');

%Extarct and store all the critical points 
for i= 1:nsolns
solns(i,:) = P(ia(i),:);
end
fprintf('The critical points are are (each row represents a critical point) ')
display(solns)

x1= round(solns(1,1));
x2= round(solns(1,2));
H=[2*x2 - 8, 2*x1 ;
   2*x1    , 6*x2 ];
disp('For the first critical point:')
%Find the determinant of the hessian
detH1= det((H)); 
if (detH1 >0)
    disp('The determinant of the hessian is positive. The hessian is negative and the function has a local maxima at this point')
elseif (detH1<0)
    disp('The determinant of the hessian is negative.H is indefinite and the function has a saddle at this critical point') 
else
    disp('The determinant of the hessian is zero. The second partial derivative test is indeterminant. The function should be visually inspected.')
end
disp('By visual inspection of the contour plot, the critical point is a saddle point. Therfore, there are no extrema for this function')
%Generating a contour plot
x1_min=-20;x1_max=20;
x2_min=-20;x2_max=20;
x1=linspace(x1_min,x1_max);
x2=linspace(x2_min,x2_max);
[x1,x2]=meshgrid(x1,x2); %set up grid for contour plot
Z= x1.^2.*x2+x2.^3-4*x1.^2+1;
v=linspace(0,1000,50);
figure
hold on
contour(x1,x2,Z,v)
axis([-10 10 -10 20])
xlabel('x1')
ylabel('x2')
leg = legend('z','location','northeast');
title('Part B contour plot','fontsize',16,'fontname','times new roman')
