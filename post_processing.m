clear;
close all;
clc;
%% Experimental
experimental = readmatrix('experimental_data.csv');
x = experimental(:, 2);
y = experimental(:, 4);

plot(x, y)
xlabel('Position')
ylabel('C_p')
grid on