function func=eqnsP8H3(w)
%Problem 8 
%Number of points 
N = 10; 
% define given parameters 
phi = 0.25;
B=0.6;
h   = 0.6/N; %step size
g= 30; %gamma
c= -phi^2 *B;
%The derivative of the function is derived to be:
%af/ay = c*(1-w/B)*exp((g*w)/(g+w)) *( g/(g+w) - g*w/(g+w)^2)-c/B*exp((g*w)/(g+w))
%where c is defined above, w is the approximated value of y
%According to Bradie, the diagonal term is d= 2 + h^2 *f
%                     the lower diagonal   l=-1
%                     the upper diagonal   u=-1

%We will have (N+1) system of equations:
%The term J1,1 for the jacobian is determined by the Neumann BC
% For the Nuemann condition: J1,1 = 2 + h^2 *af/y 
%For the first function we know from Neumann that the jacobian here is
%zero, therefore, we can solve for the J1,1 with the w0 in it 
func(1)=(2*w(1)+ h^2 *(-B*phi^2*(1-w(1)/B)*exp(g*w(1)/(g+w(1)))))-0.019;
%After the first function, the functions are written in the following format :
%f(n) =   l *w(n-1)+  d(n) * w(n) + u* w(n+1)
func(2)=-w(1)+(2*w(2)+ h^2*(-B*phi^2*(1-w(2)/B)*exp(g*w(2)/(g+w(2)))) )-w(3);
func(3)=-w(2)+(2*w(3)+ h^2 *(-B*phi^2*(1-w(3)/B)*exp(g*w(3)/(g+w(3)))))-w(4);
func(4)=-w(3)+(2*w(4)+ h^2 *(-B*phi^2*(1-w(4)/B)*exp(g*w(4)/(g+w(4)))))-w(5);
func(5)=-w(4)+(2*w(5)+ h^2 *(-B*phi^2*(1-w(5)/B)*exp(g*w(5)/(g+w(5)))))-w(6);
func(6)=-w(5)+(2*w(6)+ h^2 *(-B*phi^2*(1-w(6)/B)*exp(g*w(6)/(g+w(6)))))-w(7);
func(7)=-w(6)+(2*w(7)+ h^2 *(-B*phi^2*(1-w(7)/B)*exp(g*w(7)/(g+w(7)))))-w(8);
func(8)=-w(7)+(2*w(8)+ h^2 *(-B*phi^2*(1-w(8)/B)*exp(g*w(8)/(g+w(8)))))-w(9);
func(9)=-w(8)+(2*w(9)+ h^2 *(-B*phi^2*(1-w(9)/B)*exp(g*w(9)/(g+w(9)))))-w(10);
func(10)=-w(9)+(2*w(10)+ h^2*(-B*phi^2*(1-w(10)/B)*exp(g*w(10)/(g+w(10)))))-w(11);
%The term JN+1, N+1 = 1 because of the Dirichlet condition theta(z=1)=0 .
func(11)=w(11);
end