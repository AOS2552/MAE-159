% =========================================================================
% MAE 159 - WINTER 2026
% MODULE 1: TEST SCRIPT (DRAG POLAR)
% =========================================================================
% SCRIPT: test_drag
% PURPOSE: 
%   Validates the calculate_drag function against hand-calculated 
%   expectations and generates the Drag Polar plot.
%
% REFERENCE:
%   MAE159_classnotes.pdf, Page 33 (Formulas)
% =========================================================================

clear; clc; close all;

fprintf('============================================================\n');
fprintf('MAE 159: DRAG MODULE VERIFICATION\n');
fprintf('============================================================\n\n');

%% ------------------------------------------------------------------------
% TEST CASE 1: STANDARD CRUISE (Typical Transport)
% -------------------------------------------------------------------------
% Inputs
CL_1  = 0.5;
AR_1  = 8.0;
CD0_1 = 0.015;

% Function Call
result1 = calculate_drag(CL_1, AR_1, CD0_1);

% Verification Calculation (Page 33 Formula check)
% We re-calculate here to ensure the function matches the math exactly
e_exp1  = 1.0 / (1.035 + 0.38 * CD0_1 * pi * AR_1);
CD_exp1 = CD0_1 + (CL_1^2) / (pi * AR_1 * e_exp1);

fprintf('Test Case 1 (Cruise Config):\n');
fprintf('  Inputs:   CL=%.2f, AR=%.1f, CD0=%.3f\n', CL_1, AR_1, CD0_1);
fprintf('  Output:   CD = %.4f\n', result1.CD);
fprintf('  Expected: CD = %.4f\n', CD_exp1);
fprintf('  Delta:    %.6f\n', abs(result1.CD - CD_exp1));
fprintf('------------------------------------------------------------\n');


%% ------------------------------------------------------------------------
% TEST CASE 2: HIGH ASPECT RATIO (Efficiency Check)
% -------------------------------------------------------------------------
% Inputs
CL_2  = 0.3;
AR_2  = 10.0;
CD0_2 = 0.020;

% Function Call
result2 = calculate_drag(CL_2, AR_2, CD0_2);

% Verification
e_exp2  = 1.0 / (1.035 + 0.38 * CD0_2 * pi * AR_2);
CD_exp2 = CD0_2 + (CL_2^2) / (pi * AR_2 * e_exp2);

fprintf('Test Case 2 (High Aspect Ratio):\n');
fprintf('  Inputs:   CL=%.2f, AR=%.1f, CD0=%.3f\n', CL_2, AR_2, CD0_2);
fprintf('  Output:   CD = %.4f\n', result2.CD);
fprintf('  Expected: CD = %.4f\n', CD_exp2);
fprintf('------------------------------------------------------------\n');


%% ------------------------------------------------------------------------
% TEST CASE 3: LOW ASPECT RATIO (Drag Penalty Check)
% -------------------------------------------------------------------------
% Inputs
CL_3  = 0.7;
AR_3  = 6.0;
CD0_3 = 0.012;

% Function Call
result3 = calculate_drag(CL_3, AR_3, CD0_3);

% Verification
e_exp3  = 1.0 / (1.035 + 0.38 * CD0_3 * pi * AR_3);
CD_exp3 = CD0_3 + (CL_3^2) / (pi * AR_3 * e_exp3);

fprintf('Test Case 3 (Low Aspect Ratio):\n');
fprintf('  Inputs:   CL=%.2f, AR=%.1f, CD0=%.3f\n', CL_3, AR_3, CD0_3);
fprintf('  Output:   CD = %.4f\n', result3.CD);
fprintf('  Expected: CD = %.4f\n', CD_exp3);
fprintf('------------------------------------------------------------\n');


%% ------------------------------------------------------------------------
% TEST CASE 4: DRAG POLAR PLOT (Visualization)
% -------------------------------------------------------------------------
% Reference: MAE159 Week 3 Problem Statement (Visualization requirement)

fprintf('\nGenerating Drag Polar Plot...\n');

% Create vector of Lift Coefficients (Vectorization check)
CL_vec = -0.5:0.05:1.5;

% Use Test Case 1 geometry
results_vec = calculate_drag(CL_vec, AR_1, CD0_1);

% Extract CD vector from the result structure
% Note: Depending on implementation, result.CD might be a vector 
% or we need to access it differently. 
% Since calculate_drag supports vector inputs, result.CD should be a vector.
CD_vec = results_vec.CD;

figure('Name', 'MAE 159 Drag Polar');
plot(CD_vec, CL_vec, 'b-', 'LineWidth', 2);
grid on;
xlabel('Drag Coefficient (C_D)');
ylabel('Lift Coefficient (C_L)');
title(['Drag Polar (AR = ', num2str(AR_1), ', C_{D0} = ', num2str(CD0_1), ')']);
legend('Calculated Polar');
axis tight;

fprintf('Plot generated successfully.\n');
fprintf('============================================================\n');