%Ridwan Hussain - CatLab Assignment #5
%It is saddening that I am unable to submit a complete 100% working
%assignment. :(
clear; clc; close all;
load handel.mat;

%% Be Discrete
num = [0 3/7 2/3 1/2];
den = [1/2 0 1/3 2];
figure;
zplane(num, den);
zeroes = roots(num);
poles = roots(den);
%ROCs are from
%|z| < 1.4478 BIBO stable
%1.4478 < |z| < 1.6622 no BIBO stable 
%1.6622 < |z| <= inf
%Yes the ROCs match the ROCS from the Pole-Zero PLot

figure;

[coeff, time] = impz(num, den, 66);
stem(coeff);
xlim([0 66]);
title("Evil Impz");

figure;
n = 1:56;
sinful = sin(n/10);
subplot(1, 2, 1);
holy = filter(num, den, sinful);
stem(holy);
title("Holy Sin (Filtered Sin)");
subplot(1, 2, 2);
conv = conv(sinful, coeff);
stem(conv);
title("Convolved Sin?");


%% Pole-y Moley
k = 0.1;
soundsc(y)
numr = [exp(2.06j) exp(-2.06j) exp(1.43j) exp(-1.43j)];
nummy = poly(numr)*0.1;
denr = [0.74*exp(0.76j) 0.74*exp(-0.76j) 0.96*exp(1.24j) 0.96*exp(-1.24j)];
denny = poly(denr);
fs = 20000;
n = 1024;
[H, f] = freqz(num, den, n, fs);
Hdb = 20*log10(abs(H));
Hph = rad2deg(unwrap(angle(H)));
figure;
subplot(2, 1, 1);
plot(f, Hdb);
xlabel("Frequency (Hz)");
ylabel("|H| (dB)");
xlim([0 fs/2]);
title("Magnitude Response")

subplot(2, 1, 2);
plot(f, Hph);
xlabel("Frequency (Hz)");
ylabel("Phase (deg)");
xlim([0 fs/2]);
title("Phase Response");
% soundsc(H) %Don't work, not sure what or why