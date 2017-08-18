clc
clear all
syms A1 B1 C1 D1 A2 B2 C2 D2 r b si a b c U b t me1 me2 K1 p2 p1 I1
%% defining constants
F1='U*b*(A1*(r/b)+B1*(r/b)^3+C1*(r/b)+D1*(r/b)*log(r/b))*sin(t)';
F2='U*b*(A2*(r/b)+B2*(b/r)+C2*I1*(si*(b/r))+D2*K1*(si*(b/r)))*sin(t)';
%% differentiating (vr1)
vr1=(1/r)*diff(F1,t);
vr2=(1/r)*diff(F2,t);
%% vt
vt1=-diff(F1,r);
vt2=-diff(F2,r);
vr2a=subs(vr2,r,a);
eqn5='vr2a=0';
% vr2a=0;
% solve(vr2a)
vt2a=subs(vt2,r,a);
eqn6='vt2a=0';
% vt2a=0;
% solve(vt2a);
%% vrc eqn19
vr1c=subs(vr1,r,c);
eqn7='vr1c=U*cos(t)';
% vr1c=U*cos(t);
% solve(vrc1);
%% eqn 20
Trt1=me1*((1/r)^2*diff(diff(F1,t),t)+(1/r)*(diff(F1,r))-diff(diff(F1,r),r));
Trt1c=subs(Trt1,r,c);
eqn8='Trt1c=0';
% Trt1c=0;
% solve(Trt1c);
%% eqn 17(1)
vr2b=subs(vr2,r,b);
vr1b=subs(vr1,r,b);
eqn1='vr2b-vr1b=0';
%% eqn 17(2)
vt2b=subs(vt2,t,b);
vt1b=subs(vr1,t,b);
eqn2='vt2b-vt1b=0';
%% defining ttt2 & trt2
ttt2=-p2+2*me2*(diff(diff(F2,t),r)-diff(F2,t)/r)/r;
ttt1=-p1+2*me1*(diff(diff(F1,t),r)-diff(F1,t)/r)/r;
trt2=me2*((1/r)^2*diff(diff(F2,t),t)+(1/r)*(diff(F2,r))-diff(diff(F2,r),r));
trt1=me1*((1/r)^2*diff(diff(F1,t),t)+(1/r)*(diff(F1,r))-diff(diff(F1,r),r));
%% eqn 18(1)
ttt2b=subs(ttt2,r,b);
ttt1b=subs(ttt1,r,b);
eqn3='ttt2b-ttt1b=0';
%% eqn 18(2)
trt2b=subs(trt2,r,b);
trt1b=subs(trt1,r,b);
eqn4='trt2b-trt1b=0';
solve(eqn1,eqn2,eqn3,eqn4,eqn5,eqn6,eqn7,eqn8,A1,B1,C1,D1,A2,B2,C2,D2);





















