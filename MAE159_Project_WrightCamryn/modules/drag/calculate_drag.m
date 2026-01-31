% =========================================================================
% MAE 159 - WINTER 2026
% MODULE 1: DRAG POLAR
% =========================================================================
% FUNCTION: calculate_drag
% PURPOSE:
%   Calculates total drag coefficient (CD) and aerodynamic efficiency.
%   Strictly rejects negative inputs per Autograder requirements.
%
% REFERENCE:
%   MAE159_classnotes.pdf, Page 33
% =========================================================================

function result = calculate_drag(CL, AR, CD0)

    % 1. INPUT DEFAULTS
    if nargin < 3
        CD0 = 0.015;
    end

    % 2. STRICT INPUT VALIDATION (Required for Gradescope)
    % Use 'any' to handle vector inputs safely
    if any(CL < 0)
        error('calculate_drag:InvalidInput', 'CL must be non-negative.');
    end

    if AR <= 0
        error('calculate_drag:InvalidInput', 'AR must be positive.');
    end

    if CD0 < 0
        error('calculate_drag:InvalidInput', 'CD0 must be non-negative.');
    end

    % 3. AERODYNAMIC CALCULATIONS (Page 33)
    e = 1.0 ./ (1.035 + 0.38 .* CD0 .* pi .* AR);
    k = 1.0 ./ (pi .* e .* AR);

    CD_induced = k .* (CL .^ 2);
    CD = CD0 + CD_induced;
    L_over_D = CL ./ CD;

    % 4. PACK RESULTS
    result.CD0        = CD0;
    result.e          = e;
    result.CD_induced = CD_induced;
    result.CD         = CD;
    result.L_over_D   = L_over_D;

end
