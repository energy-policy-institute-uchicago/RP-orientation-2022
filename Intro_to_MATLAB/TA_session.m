%% Loan States Exercise
% Author: Amedeus Akira Dsouza (BFI)
% Adapted from Python notes provided by QuantEcon DataScience
% https://datascience.quantecon.org/scientific/randomness.html

clc
clear
cd("/YourPathHere/Intro_to_MATLAB")

addpath(genpath('depends'));
% Could define functions at the end of a script or in different file,
% addpath lets you tell MATLAB to add folders to its search path


seed = 1960;
stream = RandStream('mlfg6331_64','Seed',seed); % mlfg6331_64 Multiplicative lagged Fibonacci generator
RandStream.setGlobalStream(stream) 

[pay, stat] = simulate_loan_lifetime(100)

% How much was repaid before the 12 months was over?
sum(pay)

% How many payments did they make before going into default?
v = accumarray(stat',1);
v(1)



