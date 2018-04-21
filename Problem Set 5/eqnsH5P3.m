
function func=eqnsH5P3(v,E,x)
fp0=v(1);
fp1=v(2);
fp2=v(3);
fp3=v(4);
fp4=v(5);
fp5=v(6);
fp6=v(7);
fp7=v(8);
%Set the second derivative at the first point equal to zero 
func(1)=fp0;
func(2)=fp0*(x(2)-x(1))+2*fp1*(x(3)-x(1))+ fp2*(x(3)-x(2))-E(1);
func(3)=fp1*(x(3)-x(2))+2*fp2*(x(4)-x(2))+ fp3*(x(4)-x(3))-E(2);
func(4)=fp2*(x(4)-x(3))+2*fp3*(x(5)-x(3))+ fp4*(x(5)-x(4))-E(3);
func(5)=fp3*(x(5)-x(4))+2*fp4*(x(6)-x(4))+ fp5*(x(6)-x(5))-E(4);
func(6)=fp4*(x(6)-x(5))+2*fp5*(x(7)-x(5))+ fp6*(x(7)-x(6))-E(5);
func(7)=fp5*(x(7)-x(6))+2*fp6*(x(8)-x(6))+ fp7*(x(8)-x(7))-E(6);
%Set the second derivative at the end equal to zero 
func(8)= fp7;
end 