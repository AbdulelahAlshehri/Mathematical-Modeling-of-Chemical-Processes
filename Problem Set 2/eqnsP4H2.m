%The functions file
function func=eqnsP4H2(v)
x=v(1);
y=v(2);
z=v(3);
u=v(4);
func(1)= 4*x - y+ z - u*x;
func(2)= -x + 3*y - 2*z -u*y;
func(3)= x  - 2*y + 3*z -u*z;
func(4)= x^2 + y^2 + z^2 -1;
end
