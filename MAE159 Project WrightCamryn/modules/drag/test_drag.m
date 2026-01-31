% Unit Test Logic
CL_test = 0.5;
AR_test = 9;
e_test = 0.8;
CD0_test = 0.015;

CD_calculated = calculate_drag(CL_test, AR_test, e_test, CD0_test);
CD_expected = 0.015 + (0.5^2) / (pi * 9 * 0.8);

assert(abs(CD_calculated - CD_expected) < 1e-4, 'Unit Test Failed: Calculation mismatch.');
disp('Unit Test Passed: CD matches expected value.');

% Visualization Logic (The Drag Polar)
CL_vec = -0.5:0.05:1.5;
CD_vec = calculate_drag(CL_vec, AR_test, e_test, CD0_test);

figure;
plot(CD_vec, CL_vec, 'LineWidth', 2); % X-axis: CD, Y-axis: CL
title('Drag Polar (MAE 159 Project)');
xlabel('Drag Coefficient (CD)');
ylabel('Lift Coefficient (CL)');
grid on;
