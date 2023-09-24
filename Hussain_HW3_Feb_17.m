%Ridwan Hussain - CatLab Assignment #3
%This homework was far more reasonable but I struggled uncessarily on
%question number 3 (mostly due to my lack of how MatLab works), but
%question #2 was a lot of fun and most people agree with that. 

clear; clc; close all;

%% Space Between
Aold = reshape(exp(0:63), 8, []).';
Aold(3:6, 3:6) = zeros(4,4);
geMean = geomean(Aold(Aold>0));

bigSin = sin(linspace(0, 5, 100).*linspace(-5, 0, 100).');
bestMid = min(abs(bigSin(:) - 0.5));
[xvar, yvar] = find(abs (bigSin - 0.5) == bestMid );

fun = @(x,y) exp(-(1-x.*y).^2) - 0.25*sqrt(x.^2+y.^2);
dommy = -10:0.05:10;
fullvol = fun(dommy, dommy.');
positivity = sum(fullvol(fullvol>0))*0.05^2;

%% I Need a Vacation
domain = 1:256;
a_entry = @(a, b) sqrt( (a-99).^2 + (b-99).^2 );
A = (a_entry(domain, domain.')) < 29;
figure;
imshow(A);
title("Ayy");
b_entry = @(a, b) sqrt( (a-62).^2 + (b-62).^2 );
B = (b_entry(domain, domain.')) < 58;
figure;
imshow(B);
title("Bee");
c_entry = @(a,b) a - 4 * sin(b/10);
C = (c_entry(domain, domain.')) > 200;
figure;
imshow(C);
title("See");
S = rand(256, 256, 3);
S(:, :, [2,3]) = [];
figure;
imshow(S);
title("Ess");
M = A & ~B;
figure;
imshow(M);
title("Emm");
Z = C.*S + M;
figure;
imshow(Z)
title("Zee");

%% My Sinc is Broken
y = @(x) sinc(x);
x = -2*pi:0.05*pi:2*pi;
derivative = deriv(y(x), x);
antiderivative = antideriv(y(x), x);
[y_extrema, x_extrema] = extrema(y(x), x);
[y_inflections, x_inflections] = inflections(y(x), x);
figure;
plot(x, y(x), x, antiderivative, x, derivative, ... 
    x_extrema, y_extrema, 'r*', x_inflections, y_inflections, 'bo');
title("Plotting the Fun Sinc");

%% Functions
function answer = deriv(y, x)
    answer = [0 diff(y)./diff(x)];
end
function answer = antideriv(y, x)
    answer = cumtrapz(x, y);
end
function answer = switchsign(x) 
    %One if current index is a different sign from previous index, 0
    %otherwise
    signx = sign(x);
    intermediate = [0 signx(1:end-1)];
    answer = (abs(sign(x) - intermediate) == 2);
end
function [answer, x] = extrema(y, x) 
    %Find these values using 1st and 2nd derivative test
    %Return y and x values as vectors
    ssi = switchsign(y);
    answer = deriv(y, x) .* ssi;
    x = x .* ssi;
end
function [answer, x] = inflections(y,x)
    %Find these values using 1st and 2nd derivative test
    %Return y and x values as vectors
    ssi = switchsign(deriv(deriv(y, x), x));
    answer = deriv(deriv(y,x), x) .* ssi;
    x = x .* ssi;
end