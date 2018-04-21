clc
clear all
%Provide an intial guess for fsolve
xg =[1, 1, 1, 1, 1, 1];

%The normal boiling point of A (benzne)
Tna = 80.0; %C
%The normal boiling point of B (Toluene)
Tnb = 110.6; %C
%The tmperature vector will be 
T = linspace(Tna,Tnb, 1000);
n =numel(T);
%Fsolve is used to solve the seven equations
for i= 1:1:n
[soln,fval,exitflag]=fsolve(@(m)eqnsP6H2(m,T(i)), xg ,optimset('Display','off'));
R(i,:)= [soln];
end
Xbenzene = R(:,1);
Ybenzene = R(:,2);
plot(Xbenzene, T, Ybenzene, T, Xbenzene(393), T(393),'bo', Ybenzene(612), T(612),'ro')
legend(' Satd liquid Tx', 'Satd vapor Yx', 'Bubble pt for equimolar liq. mixture','Dew pt for equimolar vap. mixture' )
xlabel(' Liquid/vapor Mole Fraction Benzne')
ylabel(' Temperature (C) ')
axis([0 1 80 110.6])
title(' Txy for Benzne / Toluene ')

