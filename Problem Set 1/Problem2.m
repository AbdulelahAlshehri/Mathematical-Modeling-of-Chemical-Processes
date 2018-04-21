%Homework#1 
%Probelm#2
clc 
clear 
%Case 1 
c1 = rand(10,10);
tic
inv(c1);
tt1=toc;

%Case 2 
c2=rand(100,100);
tic
inv(c2);
tt2=toc;

%Case 3
c3=rand(1000,1000);
tic
inv(c3);
tt3=toc;

%Case 4
c4=rand(10000,10000);
tic
inv(c4);
tt4=toc;

%This will tabulate the time required to find the inverse for each case
Cases= {'Case 1 (10) ';'Case 2 (100) ';'Case 3 (1000) ';'Case 4 (10,000)'};
TimeRequired=[tt1;tt2;tt3;tt4];
table(TimeRequired,...
    'RowNames',Cases)