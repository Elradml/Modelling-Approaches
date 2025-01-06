clear; 
close all;
clc;
% Calculating the Errors for each Turbulence Model
%% Section 1
exp1 = readmatrix('section1_data.csv');
exp1_x = exp1(:, 1);
exp1_cp = exp1(:, 3);
exp1_area = trapz(exp1_x, exp1_cp);

sst_lo = load('lo1Cpsst.dat');
sst_up = load('up1Cpsst.dat');
xsst_lo = sst_lo(:, 1); 
cplo_sst = sst_lo(:, 2);
xsst_up = sst_up(:, 1); 
cpup_sst = sst_up(:, 2);
sst = str2double([num2str(sst_lo), num2str(sst_up)]);
disp(sst);
sst_area = trapz(xsst_lo, sst);