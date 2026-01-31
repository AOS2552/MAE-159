function test_drag()
    % Test script for calculate_drag function

    % Test Case 1: Known values
    CL = 0.5;
    AR = 9;
    e = 0.85;
    expected_CD = 0.015 + 0.5^2 / (pi * 9 * 0.85); % approx 0.025402

    calculated_CD = calculate_drag(CL, AR, e);

    if abs(calculated_CD - expected_CD) < 1e-6
        fprintf('Test Case 1 Passed: CD = %.6f\n', calculated_CD);
    else
        error('Test Case 1 Failed: Expected %.6f, got %.6f', expected_CD, calculated_CD);
    end

    % Test Case 2: Zero Lift
    CL_zero = 0;
    expected_CD_zero = 0.015;
    calculated_CD_zero = calculate_drag(CL_zero, AR, e);

    if abs(calculated_CD_zero - expected_CD_zero) < 1e-6
        fprintf('Test Case 2 Passed: Zero Lift CD = %.6f\n', calculated_CD_zero);
    else
        error('Test Case 2 Failed: Expected %.6f, got %.6f', expected_CD_zero, calculated_CD_zero);
    end

    disp('All tests passed for calculate_drag.');
end
