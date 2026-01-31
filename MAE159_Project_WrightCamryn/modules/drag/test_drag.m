% =========================================================================
% MAE 159 - WINTER 2026
% MODULE 1: TEST SCRIPT
% =========================================================================
clear; clc; close all;

fprintf('MAE 159: DRAG MODULE VERIFICATION\n');

% --- TEST CASE 1: STANDARD CRUISE ---
CL_1 = 0.5; AR_1 = 8.0; CD0_1 = 0.015;
res1 = calculate_drag(CL_1, AR_1, CD0_1);
fprintf('Test 1 (Cruise): CD = %.4f\n', res1.CD);

% --- TEST CASE 2: HIGH AR ---
res2 = calculate_drag(0.3, 10.0, 0.020);
fprintf('Test 2 (High AR): CD = %.4f\n', res2.CD);

% --- TEST CASE 3: LOW AR ---
res3 = calculate_drag(0.7, 6.0, 0.012);
fprintf('Test 3 (Low AR): CD = %.4f\n', res3.CD);

% --- TEST CASE 4: PLOTTING ---
fprintf('\nGenerating Drag Polar Plot...\n');

% UPDATED: Start from 0 to avoid the "Negative CL" error we just added
CL_vec = 0:0.05:1.5;

results_vec = calculate_drag(CL_vec, AR_1, CD0_1);
CD_vec = results_vec.CD;

figure('Name', 'MAE 159 Drag Polar');
plot(CD_vec, CL_vec, 'b-', 'LineWidth', 2);
grid on;
xlabel('Drag Coefficient (C_D)');
ylabel('Lift Coefficient (C_L)');
title('Drag Polar (Positive Lift Only)');
legend('Calculated Polar');
