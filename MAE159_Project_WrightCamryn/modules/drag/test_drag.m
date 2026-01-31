% =========================================================================
% TEST SCRIPT: DRAG MODULE VALIDATION
% =========================================================================
clc; clear;

% --- TEST CASE 1: HAND CALCULATION CHECK ---
% Input Values from Problem Statement
CL_check = 0.5;
AR_check = 9;
e_check = 0.8;
CD0_check = 0.015;

% Expected Output Calculation:
% CD = 0.015 + (0.5^2) / (pi * 9 * 0.8) = 0.02605...

fprintf('--------------------------------------------------\n');
fprintf('MAE 159 DRAG MODULE VERIFICATION\n');
fprintf('--------------------------------------------------\n');
fprintf('Test Inputs:\n');
fprintf('  CL:  %.2f\n  AR:  %.1f\n  e:   %.1f\n', CL_check, AR_check, e_check);

% RUN FUNCTION
CD_actual = calculate_drag(CL_check, AR_check, e_check, CD0_check);

% VALIDATION LOGIC
CD_target = 0.02605;
error_margin = abs(CD_actual - CD_target);

fprintf('\nResults:\n');
fprintf('  Target CD: %.5f\n', CD_target);
fprintf('  Actual CD: %.5f\n', CD_actual);

if error_margin < 1e-4
    fprintf('  STATUS:  [PASSED] Match within tolerance.\n');
else
    fprintf('  STATUS:  [FAILED] Check logic.\n');
    error('Validation failed.');
end

% --- TEST CASE 2: PLOTTING (Visual Check) ---
fprintf('\nGenerating Drag Polar Plot...\n');
CL_range = -0.5:0.05:1.5;
CD_range = calculate_drag(CL_range, AR_check, e_check, CD0_check);

figure(1);
plot(CD_range, CL_range, 'b-', 'LineWidth', 2);
grid on;
xlabel('Drag Coefficient (C_D)');
ylabel('Lift Coefficient (C_L)');
title('Drag Polar: C_D vs C_L (MAE 159)');
legend('Parabolic Drag Polar');
fprintf('Plot generated successfully.\n');
fprintf('--------------------------------------------------\n');
