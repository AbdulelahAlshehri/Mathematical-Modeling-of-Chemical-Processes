%The functions file
function func=eqnsP8H2(v,l)
q1=v(1);
q2=v(2);
q3=v(3);
q4=v(4);
q5=v(5);
q6=v(6);
q7=v(7);

C = 5.2*10^5 *((pi)^2*(0.2)^5)/(8*0.02*998);
% The first three equations are given
func(1)= l(3)*q3^2 - l(4)* q4^2;
func(2)= l(2)*q2^2 + l(4)* q4^2 + l(5)*q5^2 -l(6)*q6^2;
func(3)= l(1)*q1^2 + l(6)*q6^2+ l(7)*q7^2 - C;
%The junctions equations
func(4)= q1 - q2 - q6;
func(5)= q2 - q3 - q4;
func(6)= q3 + q4 - q5;
func(7)= q5 +q6  - q7 ;
end
