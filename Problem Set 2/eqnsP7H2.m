%The functions file
function func=eqnsP7H2(u,no)
na=u(1);
nb=u(2);
nc=u(3);
nd=u(4);
ne=u(5);
xif= u(6);
xis =u(7);
%Mw =[44.01, 28.01, 16, 28.01, 30.01];

%(A = CO2) is consumed in the first reaction
func(1)= no(1)- 2 * xif -na;
%(B = CO) is produced in the first reaction
func(2)= no(2) + 2 * xif -nb;
%(C = O2) is produced in the first reaction and consumed in the second
func(3)= no(3) + xif - xis -nc;
% (D = N2)  is consumed in the second reaction
func(4)= no(4) - xis -nd;
% (E = NO) is produced in the second reaction
func(5)= no(5) + 2* xis -ne;
%The first equilibrium limitation 
func(6)= 0.1071 - ( (nb / (na+nb+nc+nd+ne))^2 * (nc / (na+nb+nc+nd+ne))) / ((na / (na+nb+nc+nd+ne))^2);
%The second equilibrium limitation 
func(7)= 0.01493 -( (ne / (na+nb+nc+nd+ne))^2) / ( (nc / (na+nb+nc+nd+ne)) * ( (nd / (na+nb+nc+nd+ne))));

end
