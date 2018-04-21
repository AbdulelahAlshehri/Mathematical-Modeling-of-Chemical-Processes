%Homework 2
%Problem 1
clc
clear all
%Assumptions: 1) Constant Density  2)Isothermal Conditions 3)Steady State
%4)Irreversible reactions 5) Perfect mixing

%Rate law equations 
% r1 = k1  * CA
% r2 = k2  * CB
% r3 = k3  * CD
% r4 = k4  * CB

%Mass Balance equations written in the final form for steady satate system:
%Species  :    In      =   Out   -   Generation   +   Consumption    

%A        :    CAI     =   CA    -      0         +  k1 tau CA

%First Row A           = [ 1+k(1) * tau, 0 , 0 , 0]

%B        :    CBI     =   CB    -     k1 tau CA  +  k2 tau CB
%                                -     k3 tau CD  +  k4 tau CB

%Second row            = [ -k(1) *tau,(1 + ((k(2)+k(4))* tau), 0, -k(3) tau]

%C        :    CCI     =  CC     -     k4 tau CB

%Third row             = [0, -k(4)*tau, 1, 0]

%D        :    CDI     =  CD     -     k2 tau CB  + k3 tau CD

%Fourth row            =[ 0, -k(2) tau, 0, 1 + k(3)*tau]

format short

%Defining the parameters
V = 10;    %L
v = 1;     %L/s
tau = V/v; %s
k = [ 0.1, 0.2, 0.1, 0.8]; %1/s

%Arbitrary feed vector
CIn= [0, 9, 0,0];

A= [1+k(1)*tau, 0,0,0;
    -k(1)*tau, k(2)*tau+k(4)*tau+1, 0 ,-k(3)*tau;
    0, -k(4)*tau, 1, 0;
    0, -k(2)*tau, 0, 1+k(3)*tau];
%The lu decompositon 
[L, U] = lu(A);

disp('Problem 1 part A (For Arbitrary feed:  CB,in= 9). ')

disp('The first Step is')
CSSf =L\CIn'
disp('The second step is')
CSSs =U\CSSf


disp('Problem 1 part B (For feed: Ca,in = 5, CD, in= 1)')
CI= [5, 0, 0,1];
disp('The first Step is')
CSSF   = L\CI'
disp('The second step is')
CSSS    = U\CSSF