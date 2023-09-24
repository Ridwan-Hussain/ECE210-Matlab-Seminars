# MatLab Seminar Week 2

## Vector Operations

- can do dot product, cross product, linspace, 
- domain: x = 0:0.01:2*pi --> goes from 0 to 2pi in increments of 0.01 intervals
- y = sin(x)
- y = abs(x)
- y = x .^4 == power (x,4)
- Information about vectors
	- length(x), sum(x), mean(x), min(x), diff(x) 
	- diff(x) difference between each adjacent elements

- x(n) --> nth element (index starts at 1)
- x(n:m) --> nth to mth element 
- x(1:length(x)) == x(1:end) == x(:) --> all elemnts in x
	- x(1:2:end) --> odd indexed elements 
	- ind = 1:2:length(x); x(ind) works the same as above
- x([1, 3, 5]) --> 1st, 3rd, and 5th element of x


## Matrix Operation
- reshape(originalMatrix, 1D, 2D, 3D...) <-- turns a vector into a Matrix
	- M = 1:100, 
	- N1 = reshape(M, 2, 2, []) == reshape(M, [2, 2, 25])
	- N2 = (:,:,25) <-- gives you 97, 98, 99, 100
	- N2 = (:,1,25) <-- 97, 98
- Can do A(row, col) or A(#) and counts down from top left and count downwards
- meshgrid returns 2 matrices for x and y coordinate (ie x=A and y=B)
	- useful for graphing for Matrices (3D) or dot product specific points
	- a = 1:3, b = 1:5
	- [A, B] = meshgrid(a,b)
	- OR a1 = -2:0.25:2
	- b1 = a1;
	- [A1, B1] = meshgrind(a1)
	- F = A1.*exp(-A1.^2-B1.^2)
	- surf(A1, B1, F)
	- help meshgrid kinda nice
- Broadcasting
	- if you add a nx1 matrix with a 1xm matrix you end end up adding the matrix such that the sum is a nxm matrix like this 
		[n1+m1 n1+m2 n1+m3 ... ]
		[n2+m1 n2+m2 n2+m3 ... ]
	- so for the previous example you can do this 
	F2 = a1.*exp


- H = magic(4) does  magical matrix <-- some special property
	- all rows and columns sum to the same constant 
- sum(H,1)
- fliplr(H) <-- flip matrix left to right
- flipup(H) <-- flip matrix up and down 
- H(1,:) = fliplr(H(1,:)) <-- flip only one row l to r
- H(1,:) = [] <-- delete first row 

- x = (1:10), x(1:2:9) = 0 <-- odd indices are equal to 0

## Control Sequence For Loops

- tic <-- start timer; toc <-- end timer (can do mutiple tocs, prints last tick taken)
- Better to use vectors than for loops in MatLab
	- for index = start:end
			text text
		end 
	- Threading, parallel for (parfor) to speed things up, multiple for loops


## Numerical Calculus 

- diff <-- dervative 
	- dydx = diff(y)./diff(x)
- cumsum (Cumulative Sum) <-- to find the sum for integration
	- look at cat notes

- . <-- dot is elementwise operation (+, -, *, /)

- cumtrapz >> cumsum for numerical calculus (trapezoid approx. >> rect. approx.)





