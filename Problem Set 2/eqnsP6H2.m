%The functions file
function func=eqnsP6H2(m,T)
xa=m(1);
ya=m(2);
pa=m(3);
pb=m(4);
xb=m(5);
yb=m(6);

%Assuming the pressure is 1 atm 
P =101.325; %kPa
%Antoine's equation constants: 
%Source: http://www1.diccism.unipi.it/Nicolella_Cristiano/chimica_applicata/materiale/dati/dati_pdf/Costanti_Antoine.pdf
%For (A) benzene :
Aa= 13.7819; Ba = 2726.81; Ca = 217.572;
%For (B) Toluene
Ab= 13.9320; Bb = 3056.96; Cb = 217.625;

% Antoine's equation for benzene 
func(1)= exp(Aa - Ba./(T + Ca))- pa;
% Antoine's equation for toluene 
func(2)= exp(Ab - Bb./(T + Cb))- pb;
% The liquid mole fraction equation.
func(3)= xa * (pa/P) + (1-xa) * (pb/P) - 1;
% The vapor mole fraction equation.
func(4)= ya * (P/pa) + (1-ya) * (P/pb) -  1;
%Functions 5 and 6 are redundant but they could be useful in an exam
func(5)= 1-xa-xb;
func(6)= 1-ya-yb;
end
