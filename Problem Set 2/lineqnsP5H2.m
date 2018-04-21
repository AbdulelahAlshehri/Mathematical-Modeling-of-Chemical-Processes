function func=lineqnsP5H2(z, Tf)
C=z(1);
T=z(2);
V= 0.018; %m^3
rho= 1000; %kg/m^3
Q=60*10^-6; %m^3/s
Cf=3; %kmol/m^3
delH=-8*10^7; %J/kmol
cp=4000; %J/(kg *K)
ko=4.5*10^6; %s^-1
E= 7550; %K
func(1)= (1+( (ko*exp(-E./Tf)) * V)/ (Q)) .*C-1 ;
func(2)= ((ko*exp(-E./Tf)) * delH * V *Cf)/( rho * cp * Q * Tf) .* C + T -1 ;
end