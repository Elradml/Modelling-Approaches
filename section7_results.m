clear;
close all;
clc;
% This code extracts results from experimental and simulation results from
% a single section. The file names being loading in can be changed to
% create and save graphs for different sections

% Extracting and sorting results for section 1 of the airfoil
% Experimental section 1 data
exp = readmatrix('section7_data.csv');
x = exp(:, 1);
y = exp(:, 3);

%% k-w sst data
sst_lo = load('lo7Cpsst.dat');
sst_up = load('up7Cpsst.dat');
xsst_lo = sst_lo(:, 1);
cplo_sst = sst_lo(:, 2);
xsst_up = sst_up(:, 1);
cpup_sst = sst_up(:, 2);

% sort lo sst
[sst_lo_sorted, sID] = sort(xsst_lo);
cplo_sst_sort = cplo_sst(sID);
% sort up sst
[sst_up_sort, sID] = sort(xsst_up);
cpup_sst_sort = cpup_sst(sID);
% linear mapping to match experimental data and spread data between 0 and 1
% below airfoil
lo_min_old = min(sst_lo_sorted);
lo_max_old = max(sst_lo_sorted);
new_min = 0;
new_max = 0.45643; % local chord length based on section
sst_new_lo = ((sst_lo_sorted - lo_min_old) / (lo_max_old - lo_min_old) * (new_max - new_min) + new_min) / 0.45643; % divide by the max chord to normalize
% above airfoil
up_min_old = min(sst_up_sort);
up_max_old = max(sst_up_sort);
sst_new_up = ((sst_up_sort - up_min_old) / (up_max_old - up_min_old) * (new_max - new_min) + new_min) / 0.45643;

%% k-e rng data
rng_lo = load('lo7Cprng.dat');
rng_up = load('up7Cprng.dat');
xrng_lo = rng_lo(:, 1);
cplo_rng = rng_lo(:, 2);
xrng_up = rng_up(:, 1);
cpup_rng = rng_up(:, 2);

% sort lo rng
[rng_lo_sort, rID] = sort(xrng_lo);
 cplo_rng_sort = cplo_rng(rID);
% sort up rng
[rng_up_sort, rID] = sort(xrng_up);
cpup_rng_sort = cpup_rng(rID);

% linear mapping to match experimental data and spread data between 0 and 1
% below airfoil
lo_min_oldrng = min(rng_lo_sort);
lo_max_oldrng = max(rng_lo_sort);
rng_new_lo = ((rng_lo_sort - lo_min_oldrng) / (lo_max_oldrng - lo_min_oldrng) * (new_max - new_min) + new_min) / 0.45643; % divide by the max chord to normalize
% above airfoil
up_min_oldrng = min(rng_up_sort);
up_max_oldrng = max(rng_up_sort);
rng_new_up = ((rng_up_sort - up_min_oldrng) / (up_max_oldrng - up_min_oldrng) * (new_max - new_min) + new_min) / 0.45643;
%% Spalart-Allmaras data
sp_lo = load('lo7Cpsp.dat');
sp_up = load('up7Cpsp.dat');
xsp_lo = sp_lo(:, 1);
cplo_sp = sp_lo(:, 2);
xsp_up = sp_up(:, 1);
cpup_sp = sp_up(:, 2);

% sort lo rng
[sp_lo_sort, spID] = sort(xsp_lo);
 cplo_sp_sort = cplo_sp(spID);
% sort up rng
[sp_up_sort, spID] = sort(xsp_up);
cpup_sp_sort = cpup_sp(spID);

% linear mapping to match experimental data and spread data between 0 and 1
% below airfoil
lo_min_oldsp = min(sp_lo_sort);
lo_max_oldsp = max(sp_lo_sort);
sp_new_lo = ((sp_lo_sort - lo_min_oldsp) / (lo_max_oldsp - lo_min_oldsp) * (new_max - new_min) + new_min) / 0.45643; % divide by the max chord to normalize
% above airfoil
up_min_oldsp = min(sp_up_sort);
up_max_oldsp = max(sp_up_sort);
sp_new_up = ((sp_up_sort - up_min_oldsp) / (up_max_oldsp - up_min_oldsp) * (new_max - new_min) + new_min) / 0.45643;
%% ke standard data 
ke_lo = load('lo7Cpke.dat');
ke_up = load('up7Cpke.dat');
xke_lo = ke_lo(:, 1);
cplo_ke = ke_lo(:, 2);
xke_up = ke_up(:, 1);
cpup_ke = ke_up(:, 2);

% sort lo rng
[ke_lo_sort, keID] = sort(xke_lo);
cplo_ke_sort = cplo_ke(keID);
% sort up rng
[ke_up_sort, keID] = sort(xke_up);
cpup_ke_sort = cpup_ke(keID);

% linear mapping to match experimental data and spread data between 0 and 1
% below airfoil
lo_min_oldke = min(ke_lo_sort);
lo_max_oldke = max(ke_lo_sort);
ke_new_lo = ((ke_lo_sort - lo_min_oldke) / (lo_max_oldke - lo_min_oldke) * (new_max - new_min) + new_min) / 0.45643; % divide by the max chord to normalize
% above airfoil
up_min_oldke = min(ke_up_sort);
up_max_oldke = max(ke_up_sort);
ke_new_up = ((ke_up_sort - up_min_oldke) / (up_max_oldke - up_min_oldke) * (new_max - new_min) + new_min) / 0.45643;
%% kw standard data
kw_lo = load('lo7Cpbsl.dat');
kw_up = load('up7Cpbsl.dat');
xkw_lo = kw_lo(:, 1);
cplo_kw = kw_lo(:, 2);
xkw_up = kw_up(:, 1);
cpup_kw = kw_up(:, 2);

% sort lo rng
[kw_lo_sort, kwID] = sort(xkw_lo);
cplo_kw_sort = cplo_kw(kwID);
% sort up rng
[kw_up_sort, kwID] = sort(xkw_up);
cpup_kw_sort = cpup_kw(kwID);

% linear mapping to match experimental data and spread data between 0 and 1
% below airfoil
lo_min_oldkw = min(kw_lo_sort);
lo_max_oldkw = max(kw_lo_sort);
kw_new_lo = ((kw_lo_sort - lo_min_oldkw) / (lo_max_oldkw - lo_min_oldkw) * (new_max - new_min) + new_min) / 0.45643; % divide by the max chord to normalize
% above airfoil
up_min_oldkw = min(kw_up_sort);
up_max_oldkw = max(kw_up_sort);
kw_new_up = ((kw_up_sort - up_min_oldkw) / (up_max_oldkw - up_min_oldkw) * (new_max - new_min) + new_min) / 0.45643;
%% Plot data onto stacked figures
fig1 = figure;
set(gcf, 'Units', 'pixels', 'Position', [40, 80, 1000, 600]);
tile = tiledlayout(2, 3, 'Padding', 'compact', 'TileSpacing', 'compact');

% k-w SST graph
a1 = nexttile(1);
hold on
plot(x, y, 'LineWidth', 1)
plot(sst_new_lo, cplo_sst_sort, 'k-', 'LineWidth', 1)
plot(sst_new_up, cpup_sst_sort, 'k-', 'Linewidth', 1)
legend(a1, {'Experimental', 'k-\omega SST'}, 'Location','north')
xlabel('x/C')
ylabel('C_p')
title('k-\omega SST Turbulence Model')
grid on

% k-e RNG graph
a2 = nexttile(2);
hold on
plot(x, y, 'LineWidth', 1)
plot(rng_new_lo, cplo_rng_sort, 'k-', 'LineWidth', 1)
plot(rng_new_up, cpup_rng_sort, 'k-', 'LineWidth', 1)
legend(a2, {'Experimental', 'k-\epsilon RNG'}, 'Location','north')
xlabel('x/C')
ylabel('C_p')
title('k-\epsilon RNG Turbulence Model')
grid on

% spalart-allmaras graph
a3 = nexttile(3);
hold on
plot(x, y, 'LineWidth', 1)
plot(sp_new_lo, cplo_sp_sort, 'k-', 'LineWidth', 1)
plot(sp_new_up, cpup_sp_sort, 'k-', 'LineWidth', 1)
legend(a3, {'Experimental', 'Spalart-Allmaras'}, 'Location','best')
xlabel('x/C')
ylabel('C_p')
title('Spalart-Allmaras Turbulence Model')
grid on

a4 = nexttile(4);
hold on
plot(x, y, 'LineWidth', 1)
plot(ke_new_lo, cplo_ke_sort, 'k-', 'LineWidth', 1)
plot(ke_new_up, cpup_ke_sort, 'k-', 'LineWidth', 1)
legend(a4, {'Experimental', 'K-\epsilon Standard'}, 'Location','northwest')
xlabel('x/C')
ylabel('C_p')
title('Standard k-\epsilon Turbulence Model')
grid on

a5 = nexttile(5);
hold on
plot(x, y, 'LineWidth', 1)
plot(kw_new_lo, cplo_kw_sort, 'k-', 'LineWidth', 1)
plot(kw_new_up, cpup_kw_sort, 'k-', 'LineWidth', 1)
legend(a5, {'Experimental', 'K-\omega BSL'}, 'Location','north')
xlabel('x/C')
ylabel('C_p')
title('k-\omega Baseline Turbulence Model')
grid on

annotation('textbox', [0.08, 0.85, 0.05, 0.05], 'String', '(a)', ...
           'FontSize', 12, 'EdgeColor', 'none');
annotation('textbox', [0.40, 0.85, 0.05, 0.05], 'String', '(b)', ...
           'FontSize', 12, 'EdgeColor', 'none');
annotation('textbox', [0.70, 0.85, 0.05, 0.05], 'String', '(c)', ...
           'FontSize', 12, 'EdgeColor', 'none');
annotation('textbox', [0.25, 0.38, 0.05, 0.05], 'String', '(d)', ...
           'FontSize', 12, 'EdgeColor', 'none');
annotation('textbox', [0.40, 0.38, 0.05, 0.05], 'String', '(e)', ...
           'FontSize', 12, 'EdgeColor', 'none');


set(fig1, 'PaperUnits', 'centimeters');
set(fig1, 'PaperSize', [21 8]);
saveas(fig1,'sec7vexp.png')


fig2 = figure;
hold on 
plot(sst_new_lo, cplo_sst_sort, 'k-', 'LineWidth', 1)
plot(sst_new_up, cpup_sst_sort, 'k-', 'Linewidth', 1)
plot(rng_new_lo, cplo_rng_sort, 'b-.', 'LineWidth', 1)
plot(rng_new_up, cpup_rng_sort, 'b-.', 'LineWidth', 1)
plot(sp_new_lo, cplo_sp_sort, 'r-', 'LineWidth', 1)
plot(sp_new_up, cpup_sp_sort, 'r-', 'LineWidth', 1)
plot(ke_new_lo, cplo_ke_sort, 'c-', 'LineWidth', 1)
plot(ke_new_up, cpup_ke_sort, 'c-', 'LineWidth', 1)
plot(kw_new_lo, cplo_kw_sort, 'm--', 'LineWidth', 1)
plot(kw_new_up, cpup_kw_sort, 'm--', 'LineWidth', 1)
plot(x, y, 'ko', 'LineWidth', 1)
legend({'k-\omega SST', '', 'k-\epsilon RNG', '', 'Spalart-Allmaras', '', 'k-\epsilon', '', 'k-\omega BSL', '', 'Experimental'}, 'Location','northwest')
xlabel('x/C')
ylabel('C_p')
grid on
saveas(fig2, 'sec7_comparison.png')