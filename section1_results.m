clear;
close all;
clc;
% Extracting and sorting results for section 1 of the airfoil
% Experimental section 1 data
exp = readmatrix('section1_data.csv');
x = exp(:, 1);
y = exp(:, 3);

%% k-w sst data
sim_lo = load('lo1Cpsst.dat');
sim_up = load('up1Cpsst.dat');
xlo = sim_lo(:, 1) / 0.8059; % divide by max chord
cplo = sim_lo(:, 2);
xup = sim_up(:, 1) / 0.8059; % divide by max chord
cpup = sim_up(:, 2);

% sort lo sst
[xlo_sorted, sID] = sort(xlo);
cplo_sorted = cplo(sID);
% sort up sst
[xup_sort, sID] = sort(xup);
cpup_sort = cpup(sID);

%% k-e rng data
rng_lo = load('lo1Cprng.dat');
rng_up = load('up1Cprng.dat');
xrng_lo = rng_lo(:, 1) / 0.8059;
cplo_rng = rng_lo(:, 2);
xrng_up = rng_up(:, 1) / 0.8059;
cpup_rng = rng_up(:, 2);

% sort lo rng
[rng_lo_sort, rID] = sort(xrng_lo);
 cplo_rng_sort = cplo_rng(rID);
% sort up rng
[rng_up_sort, rID] = sort(xrng_up);
cpup_rng_sort = cpup_rng(rID);

%% Spalart-Allmaras data
sp_lo = load('lo1Cpsp.dat');
sp_up = load('up1Cpsp.dat');
xsp_lo = sp_lo(:, 1) / 0.8059;
cplo_sp = sp_lo(:, 2);
xsp_up = sp_up(:, 1) / 0.8059;
cpup_sp = sp_up(:, 2);

% sort lo rng
[sp_lo_sort, spID] = sort(xsp_lo);
 cplo_sp_sort = cplo_sp(spID);
% sort up rng
[sp_up_sort, spID] = sort(xsp_up);
cpup_sp_sort = cpup_sp(spID);

%% ke standard data 
ke_lo = load('lo1Cpke.dat');
ke_up = load('up1Cpke.dat');
xke_lo = ke_lo(:, 1) / 0.8059;
cplo_ke = ke_lo(:, 2);
xke_up = ke_up(:, 1) / 0.8059;
cpup_ke = ke_up(:, 2);

% sort lo rng
[ke_lo_sort, keID] = sort(xke_lo);
cplo_ke_sort = cplo_ke(keID);
% sort up rng
[ke_up_sort, keID] = sort(xke_up);
cpup_ke_sort = cpup_ke(keID);

%% kw standard data
kw_lo = load('lo1Cpkw.dat');
kw_up = load('up1Cpkw.dat');
xkw_lo = kw_lo(:, 1) / 0.8059;
cplo_kw = kw_lo(:, 2);
xkw_up = kw_up(:, 1) / 0.8059;
cpup_kw = kw_up(:, 2);

% sort lo rng
[kw_lo_sort, kwID] = sort(xkw_lo);
cplo_kw_sort = cplo_kw(kwID);
% sort up rng
[kw_up_sort, kwID] = sort(xkw_up);
cpup_kw_sort = cpup_kw(kwID);

%% Plot data onto stacked figures
fig1 = figure;
set(gcf, 'Units', 'pixels', 'Position', [40, 80, 1000, 600]);
tile = tiledlayout(2, 3, 'Padding', 'compact', 'TileSpacing', 'compact');

% k-w SST graph
a1 = nexttile(1);
hold on
plot(x, y, 'LineWidth', 1)
plot(xlo_sorted, cplo_sorted, 'k-', 'LineWidth', 1)
plot(xup_sort, cpup_sort, 'k-', 'Linewidth', 1)
legend(a1, {'Experimental', 'k-\omega SST'}, 'Location','best')
xlabel('x/C')
ylabel('C_p')
title('k-\omega SST Turbulence Model')
grid on

% k-e RNG graph
a2 = nexttile(2);
hold on
plot(x, y, 'LineWidth', 1)
plot(rng_lo_sort, cplo_rng_sort, 'k-', 'LineWidth', 1)
plot(rng_up_sort, cpup_rng_sort, 'k-', 'LineWidth', 1)
legend(a2, {'Experimental', 'k-\epsilon RNG'}, 'Location','best')
xlabel('x/C')
ylabel('C_p')
title('k-\epsilon RNG Turbulence Model')
grid on

% spalart-allmaras graph
a3 = nexttile(3);
hold on
plot(x, y, 'LineWidth', 1)
plot(sp_lo_sort, cplo_sp_sort, 'k-', 'LineWidth', 1)
plot(sp_up_sort, cpup_sp_sort, 'k-', 'LineWidth', 1)
legend(a3, {'Experimental', 'Spalart-Allmaras'}, 'Location','best')
xlabel('x/C')
ylabel('C_p')
title('Spalart-Allmaras Turbulence Model')
grid on

a4 = nexttile(4);
hold on
plot(x, y, 'LineWidth', 1)
plot(ke_lo_sort, cplo_ke_sort, 'k-', 'LineWidth', 1)
plot(ke_up_sort, cpup_ke_sort, 'k-', 'LineWidth', 1)
legend(a4, {'Experimental', 'K-\epsilon Standard'}, 'Location','best')
xlabel('x/C')
ylabel('C_p')
title('Standard k-\epsilon Turbulence Model')
grid on

a5 = nexttile(5);
hold on
plot(x, y, 'LineWidth', 1)
plot(kw_lo_sort, cplo_kw_sort, 'k-', 'LineWidth', 1)
plot(kw_up_sort, cpup_kw_sort, 'k-', 'LineWidth', 1)
legend(a4, {'Experimental', 'K-\omega Standard'}, 'Location','best')
xlabel('x/C')
ylabel('C_p')
title('Standard k-\omega Turbulence Model')
grid on


fig2 = figure;
hold on 
plot(xlo_sorted, cplo_sorted, 'k-', 'LineWidth', 1)
plot(xup_sort, cpup_sort, 'k-', 'Linewidth', 1)
plot(rng_lo_sort, cplo_rng_sort, 'b-.', 'LineWidth', 1)
plot(rng_up_sort, cpup_rng_sort, 'b-.', 'LineWidth', 1)
plot(sp_lo_sort, cplo_sp_sort, 'r-', 'LineWidth', 1)
plot(sp_up_sort, cpup_sp_sort, 'r-', 'LineWidth', 1)
plot(ke_lo_sort, cplo_ke_sort, 'c-', 'LineWidth', 1)
plot(ke_up_sort, cpup_ke_sort, 'c-', 'LineWidth', 1)
plot(kw_lo_sort, cplo_kw_sort, 'm--', 'LineWidth', 1)
plot(kw_up_sort, cpup_kw_sort, 'm--', 'LineWidth', 1)
legend({'k-\omega SST', '', 'k-\epsilon RNG', '', 'Spalart-Allmaras', '', 'k-\epsilon', '', 'k-\omega'}, 'Location','north')
xlabel('x/C')
ylabel('C_p')
grid on