%Ridwan Hussain - CatLab Assignment #2
%Assignment took around 4-5 hours.
%Main issues was that I had more trouble using/understanding the
%math behind the questions instead of how to use Matlab instead.
%For example, the 3rd part, I had no idea how to work with the 
%functions and was just generally confused on what to do. The 
%first two parts were fine though.

clear; clc; close all;

%% Space
A = reshape(logspace(0, log10(exp(63)), 64), 8, []).';

B = A(3:6, 3:6);
A(3:6, 3:6) = A(3:6, 3:6) - B;

geometicMeanB = power(prod(B, 'all'), 1/numel(B));

A(:, 1) = flipud(A(:,1));

A(4:5, :) = [];

%% Speed
x = linspace(0, 1000*pi, 10000);
y = x;
interval = 1000*pi/10000;
tic

% Time Taken: 384.49 seconds
for a = 0:9999
    for b = 0:9999
        C1(a+1,b+1) = sin(abs(interval*a + 1j*interval*b)) / ... 
            abs(interval*a + 1j*interval * b);
    end
end
fprintf('Time for new matrix w/ for loops\n');
toc
fprintf('\n');

%Time Taken: 20.42 seconds
C2 = zeros([10000, 10000]);
for a = 0:9999
    for b = 0:9999
        C2(a+1,b+1) = sin(abs(interval*a + 1j*interval*b)) / ... 
            abs(interval*a + 1j*interval * b);
    end
end
fprintf('Time for pre-allocated matrix w/ for loops\n');
toc
fprintf('\n');

%Time Taken: 0.97 seconds
[X, Y] = meshgrid(x, y);
C3 = sin(abs(X.*1 + Y.*1j)) ./ abs(X.*1 + Y.*1j);
fprintf('Time w/ meshgrid\n');
toc
fprintf('\n');

%Time Taken: 0.67 seconds
C4 = sin(abs(x.*1 + (y.').*1j)) ./ abs(x.*1 + (y.').*1j);
fprintf('Time w/ broadcasting\n');
toc
fprintf('\n')

figure();
surf(C4(1:50, 1:50))
title('Weird Graph');
xlabel('0 to 1000pi');
ylabel('Values');

%% The Long Sssss
low = 0;
high = 6.66;
N100 = 1e2;
N10k = 1e4;

x100 = linspace(low, high, N100-1);
x10k = linspace(low, high, N10k-1);

vect100 = exp(-x100.^2);
vect10k = exp(-x10k.^2);

dy100 = diff(x100);
dy10k = diff(x10k);
dx100 = 6.66 / (N100 - 1);
dx10k = 6.66 / (N10k - 1);

dydx100 = dy100./dx100;
dydx10k = dy100./dx10k;

sumR100 = cumsum(vect100) .* dx100 * 2/sqrt(pi);
sumR10k = cumsum(vect10k) .* dx10k * 2/sqrt(pi);
trapz100 = cumtrapz(vect100) .* dx100 * 2/sqrt(pi);
trapz10k = cumtrapz(vect10k) .* dx10k * 2/sqrt(pi);

errorS100 = mean((erf(6.66) - sumR100) .^ 2);
errorS10k = mean((erf(6.66) - sumR10k) .^ 2);
errorT100 = mean((erf(6.66) - trapz100) .^ 2);
errorT10k = mean((erf(6.66) - trapz10k) .^ 2);

figure();
plot(x10k(1:end), trapz10k);
title('Trapzodial Approximation for 10k');

%I'm sure the trapezoidal approximation with 10,000 points was 
%the best approximation based on my Calculus knowledge. Not sure 
%how to show that nor to graph that correctly. It seems to show 
%that the rectangular approximation w/ the 100 points is the best
%approximation, which can't be right.
