# MatLab Seminar Week 1 

## Class Overview
- 9 Programming Assignments
  - 0-1 points 
  - 2/3 is for correctness 
  - 1/3 for style
- Half of your HW of signals is done in MatLab, smart Math stuff
- MATrix LABoratory 
- GNU-Opto (check Arch installation)
  - online also works 
		
## Matlab Overview
- Files + Folders on the left side
- Center side is editor, to edit script 
- command prompt on next slide
- rightmost side is workspace
  - Can see all the variables, matrices, and stuff on this side
- who to list all the variables you have
- Basic operations include: 4 operations, print previous ans, exponents, logs, trig functions, inverse trig function, (answers are automatically sets answers as floats when doing division)
  - 1e5 (scientific notation) = 1 * 10^5
- Live scrpit: file --> run live script
- Complex Numbers (numbers are by default complex)
- inf is a number
- e is not predefined but exp(1) = e = 2.72
- conjugate, real, imaginary, abs, angle (radians)
- terminating lines with semi-colons doesn't print the variable in the line, no semi-colon you print out the variable
- length is good for vector


### Allows Matrix operations:
- var = [elm1 elm2 elm3] <-- 1x3 Matrix
- var = [elm1, elm2, elm3] <-- 1x3 Matrix
- var = [elm1; elm2; elm3] <--3x1 Matrix
- Transposition 
  - transpose(matrix) OR x.' <-- just normal transposition
  - x' <-- complex transpose/information transpose
- use size for matrices
- v1 = linspace(-5,5,10); <-- start, end, number of points (10 points)
- v2 = -5:1:5; <-- start, increments, end point (11 points)
- A = [1 2 3; 4 5 6; 7 8 9] <-- 3x3 Matrix
- B = repmat(A,2,1) <-- repeat matrix, # of times in row, # of times in cols
- C = [A; A] = B
- C1 = transpose(C);
- size(C1) --> returns a vector 
- size(C1, 1); --> get first vector element
- eye, speye for identity matrices
- **FIRST INDENTICES ARE 1, NOT 0**
- ones or zeroes <-- matrices of all ones or zeroes
- A + ones(size(A)) <-- add one to all elements of matrix A
- A.*B <-- mutliply each element with each corr. elements from each matrix
- Ctrl + C is valid
- inv to inverse the matrix (attempts to do this, but inverse might not be valid)

### Other MatLab stuff
- works only to machine precision
- help clc <-- quick help, inline text documentation
- doc size <-- gives the entire documentation for size (online help page) 
- clc or clear to clear the terminal space
- use elipses to break long lines of code into multiline text


