%Some parts of this code has been adapted from
%http://stackoverflow.com/questions/29198277/power-method-in-matlab
function [lampda,xf]=PM(A,x0)
%Define an intial value for lampda
lampda=0;
% Set the eignvector correspoding to the largest eignvalue to the initial
% value
xf=x0;
% Define tolerence to ensure convergence
toler=1e-10; 
while(1)
% Update the eignvector value
     EV = lampda;
% update the eignvector
     xi=xf;
% Start the power method: update xf by multiplying it by A
     xf=A*xf;
%Update the eignvalue and the eignvector
     lampda=max(xf);
     xf=xf/lampda;
% Check for the tolerence in both the eignvector and eignvalue
     if abs(lampda-EV) < toler && norm(xf-xi) < toler 
         break;
     end
end
end