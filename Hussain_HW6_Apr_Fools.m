%Ridwan Hussain - CatLab Assignment #6
%Note: I am sorry if the audio is horrible, I actually can't hear anything
%with MatLab online, saying it can't find my audio output. Some forums said
%to add certain calls to my code, didn't work, other are saying MatLab
%online doesn't support audio? Idk. Either way, sorry if the audio is
%blaringly loud or just wrong, just hoping it works (but for your safety, I
%commented the lines out).
clear; clc; close all;
load handel;
fs = 44.1e3;
N = 2^15;
F = linspace(-fs/2, fs/2, N);

%Code for generating white noise came from this YouTube Link:
%https://www.youtube.com/watch?v=xODEvWfERfo
mu = 0; sigma = 2;
whitenoise = sigma + randn(fs, 1) + mu;
figure(1);
plot(whitenoise);
xlabel("Samples");
ylabel("Sample Values");
grid on;

%% Bandpass ButterLORD
BFstop1 = 6300;
BFpass1 = 7350;
BFpass2 = 14700;
BFstop2 = 17640;
BApass = 1;
BAstop = 50;
BWp = [BFpass1 BFpass2]/ (fs / 2); 
BWs = [BFstop1 BFstop2]/ (fs / 2);
[Bn, Wn] = buttord(BWp, BWs, BApass, BAstop);
[Bb, Ba] = butter(Bn, BWp, "bandpass");
[BH, BW] = freqz(Bb, Ba);
Bflt = filter(Bb, Ba, whitenoise);
%sound(Bflt, fs);
BS = fft(Bflt, N);
BS = fftshift(abs(BS)) / N;
figure(2);
plot(F,BS);
title("Fourier Transform for bandpass Butterworth Filter");
xlabel("Frequency (Hz)");
ylabel("Magnitude");


%% Elliptic Filter
flt = EllipticFilter;
Eflt = filter(flt, whitenoise);
%sound(Eflt, fs);
ES = fft(Eflt, N);
ES = fftshift(abs(ES)) / N;
figure(3);
plot(F, ES); %weird peak at 0 Hz, but if you zoom in close enough, looks right
title("Fourier Transform for bandstop Elliptic Filter");
xlabel("Frequency (Hz)");
ylabel("Magnitude");

%% Lowpass Chebyshev Type I
C1Fstop = 5513 / (fs / 2);
C1Fpass = 4900 / (fs / 2);
C1Rpass = 5;
C1Rstop = 40;
[C1n, C1Wn] = cheb1ord(C1Fpass, C1Fstop, C1Rpass, C1Rstop);
[C1b, C1a] = cheby1(C1n, C1Rpass, C1Fpass, "low");
[C1H, C1W] = freqz(C1b, C1a);
C1flt = filter(C1b, C1a, whitenoise);
%sound(C1flt, fs);
C1S = fft(C1flt, N);
C1S = fftshift(abs(C1S)) / N;
figure(4);
plot(F,C1S); %weird peak at 0 Hz, same idea as above
title("Fourier Transform for lowpass Chebychev Type I Filter");
xlabel("Frequency (Hz)");
ylabel("Magnitude");

%% Highpass Chebyshev Type II
C2Fpass = 14700 / (fs / 2);
C2Fstop = 11025 / (fs / 2);
C2Rpass = 5;
C2Rstop = 40;
[C2n, C2Wn] = cheb2ord(C2Fpass, C2Fstop, C2Rpass, C2Rstop);
[C2b, C2a] = cheby2(C2n, C2Rpass, C2Fpass, "high");
[C2H, C2W] = freqz(C2b, C2a);
C2flt = filter(C2b, C2a, whitenoise);
%sound(C2flt, fs);
C2S = fft(C2flt, N);
C2S = fftshift(abs(C2S)) / N;
figure(5);
plot(F,C2S); 
title("Fourier Transform for highpass Chebychev Type II Filter");
xlabel("Frequency (Hz)");
ylabel("Magnitude");

