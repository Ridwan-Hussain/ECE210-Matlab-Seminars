%Ridwan Hussain - CatLab Assignment #7
clear; clc; close all;

%% Cheating at Calculus Q1
syms y(x) x
eqn = diff(y, x) == y^2 * x^3;
cond1 = y(0) == 1;
sol1 = dsolve(eqn, cond1);
figure(1);
fplot(sol1);
title("Initial Condition, y(0) = 1");
xlabel("X")
ylabel("Y")

cond10 = y(0) == 10;         %As the initial value for y increases
sol10 = dsolve(eqn, cond10); %The graph becomes more steep
figure(2);
fplot(sol10);
title("Initial Condition, y(0) = 10");
xlabel("X")
ylabel("Y")

cond05 = y(0) == 0.5;        %As the initial value for y decreases
sol05 = dsolve(eqn, cond05); %The graph becomes widers
figure(3);                   %Not sure what else I was expecting tbh
fplot(sol05);
title("Initial Condition, y(0) = 0.5");
xlabel("X")
ylabel("Y")

%% Cheating at Calculus Q2
syms t;
h = 5*dirac(t) + heaviside(t) + exp(-t/2)*sin(3*t)
H = laplace(h) %Output: 1/s + 3/((s + 1/2)^2 + 9) + 5
               %My Ans: 5 + 1/s + 3 / ((s + 1/2)^2 + 3^2)
               %So we both got the same answer
invl = ilaplace(H) %Output: 5*dirac(t) + sin(3*t)*exp(-t/2) + 1
                   %I'm guessing they used "+ 1" instead of "heaviside(t)"
                   %because the domain of the function ended up being real
                   %numbers

%% It Ain't Magic Q1 + Q2
syms x y;
f = 1 - x^2 - y^2;
numf = matlabFunction(f);


tic;
integral = int(int(f, -sqrt(1-y^2), sqrt(1-y^2)), -1, 1);
toc; %let's call this t1
ans1 = double(integral);

ymin = @(x) -sqrt(1-x.^2);
ymax = @(x) sqrt(1-x.^2);
tic;
ans2 = integral2(numf, -1, 1, ymin, ymax);
toc; %let's call this t2

%From the trial times measured below, it is clear that using symbolic
%toolbox for integration is far slower than normal numerical integration
%using integral2 (and probably trapz as well).

%Trial 1
%t1 = 0.007970s
%t2 = 0.001818s
%time diff = 0.006152s or 6.152ms, 2nd method > 4x faster

%Trial 2
%t1 = 0.007937s
%t2 = 0.001693s
%time diff = 0.006244 or 6.244ms, 2nd method is > 4x faster

%Trial 3
%t1 = 0.008173s
%t2 - 0.001736s
%time diff = 0.006437 or 6.437ms, 2nd method is > 4x faster

%Trial 4
%t1 = 0.007501s
%t2 - 0.001741s
%time diff = 0.005760 or 5.760ms, 2nd method is > 4x faster