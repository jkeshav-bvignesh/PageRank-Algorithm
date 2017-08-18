clc
clear all
syms x
a1=1;b1=4;c1=4;
eqn=a1*x^2+b1*x+c1;
r=solve(a1*x^2+b1*x+c1,x);
disp(r);