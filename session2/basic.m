clear all % Clear all variables stored by Matlab from previous execution 
close all % closes all opened figures
clc % clears the main command window

X1 = 1:1:10; % row vector from 1 to 10 increments of 1
X2 = [1 2 3 4 5]; % create a row vector with elements specified in the vector
Y1 = 20:10:100; % 20 to 100 with increments of 10 
Y2 = X1'; % creates a column vector Y2 from the row vector X1
Y3 = Y1'; % creates a column vector Y3 from the row vector Y1 
Z1 = [1 2 3; 4 5 6; 7 8 9]; % Creates 3 by 3 matrix with elements specified, the ';' creates a new row
Z2 = [X1 Y1]; % appends the two vectors X1 and Y1 in the same row
Z3 = [X1;X1]; % appends the two vectors X1 and X1 with two separate rows 
Z4 = log10(X1); % computes the 10 base logarithm of all the values of X1, Z4 will be a row vector

Z5 = exp(Y2); % compute the exp values of Y2
R1 = rand(2, 5); % creates a matrix of 2 by 5 random values with uniform distribution from 0 to 1
R2 = randn(1,4); % create 4 random values with 0 mean and unit variance Gaussian distribution


U1 = X2(1); % calls the first element of X2 vector
U2 = X2([1 5]); % calls the first and fifth elements of X2 vector
U3 = Z4([1:3]); % calls the first 3 elemetns of Z4
V1 = Z3(2,3); % calls the elemetn from 2nd row and 4d column of matrix Z3
V2 = Z3(1:2,2:3); % calls element from 1st and 2nd rows and 2nd and 3rd columns of matrix Z3
V3 = Z3(2,:); % calls all the elements from second row of matrix Z3