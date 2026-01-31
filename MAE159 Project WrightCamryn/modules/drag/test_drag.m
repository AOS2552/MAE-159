CL = 0.5;
AR = 9;
e = 0.8;
CD_result = calculate_drag(CL, AR, e);
assert(abs(CD_result - 0.02605) < 1e-4);

% Plotting
CL_vec = 0:0.1:1.5;
CD_vec = calculate_drag(CL_vec, AR, e);
plot(CL_vec, CD_vec);
title('Drag Polar');
xlabel('Lift Coefficient (CL)');
ylabel('Drag Coefficient (CD)');
grid on;
