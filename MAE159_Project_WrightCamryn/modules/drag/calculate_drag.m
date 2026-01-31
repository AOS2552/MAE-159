% =========================================================================
% MAE 159 - WINTER 2026
% MODULE 1: DRAG POLAR
% =========================================================================
% FUNCTION: calculate_drag
% PURPOSE: Calculates total drag coefficient (CD) using parabolic drag polar.
% REFERENCE: MAE159_classnotes.pdf, Page 33
% =========================================================================
function CD = calculate_drag(CL, AR, e, CD0)
    % 1. Handle Default CD0 (Clean configuration)
    if nargin < 4
        CD0 = 0.015;
    end

    % 2. Calculate Induced Drag (Vectorized)
    % Equation: CDi = CL^2 / (pi * AR * e)
    K = 1 ./ (pi * AR * e);
    CD_induced = K .* (CL .^ 2);

    % 3. Total Drag
    CD = CD0 + CD_induced;
end
