%Ridwan Hussain - CatLab Assignment #1

%% Scale-'ers
syms n
a = abs(sin(pi/3) + 1j/ (sec(-5*pi/3)));
l = power(8, 1/3);
u = sqrt(2* symsum(n/factorial(6), n, 1, 80));
m = power( imag( floor( log( power( 66, 3.5j) ) ) ) , 2);

%% Mother...?
A = [a; l; u; m];
F = [A(1,1) A(2, 1); A(3, 1) A(4, 1)];
T = F.';
B = inv(T*F);
C = [T F; F T];

%% Cruelty 
mean_B = mean(B, 'all');
row_Mean_C = mean(C, 2);

%% Odd Types
T + F; %adds the corresponding elements from matrix T and F
T + 1; %increments each element in matrix T

%adds the row element of A to each element in the corresponding row of A 
%(ie element in 3rd row of A is added to each element in the 3rd row of C)
%I don't like this since it feels ambigious to me how the program would 
%respond, I'd rather make a new variable called A4 and do 
%A4 = repmat(A, 1, 4).
C + A; 
       
%% Not What It Seems...
vect3 = linspace(0, 10, 3);
mean_Sum_Squared(vect3);
vect5 = linspace(0, 10, 5);
mean_Sum_Squared(vect5);
vect10 = linspace(0, 10, 10);
mean_Sum_Squared(vect10);
vect300 = linspace(0, 10, 300);
mean_Sum_Squared(vect300);
vect1000000 = linspace(0, 10, 1000000);
mean_Sum_Squared(vect1000000);

%the values for each of the function becomes smaller; the fastest way to 
%run the program is comment out the parts that doesn't need to be printed
%out, and that's good practice in general as well

function num = mean_Sum_Squared(vect) 
    sum = 0;
    for l = 1:length(vect)
        sum = sum + power(vect(l), 2);
    end
    num = sum / length(vect);
end