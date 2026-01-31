% =========================================================================
% MAE 159 - WINTER 2026
% MODULE 1: DRAG POLAR
% =========================================================================
% FUNCTION: calculate_drag
% PURPOSE: 
%   Calculates total drag coefficient (CD) and aerodynamic efficiency 
%   using a parabolic drag polar with calculated Oswald efficiency.
%
% SYNTAX:
%   result = calculate_drag(CL, AR)
%   result = calculate_drag(CL, AR, CD0)
%
% INPUTS:
%   CL  - Lift coefficient [-] (Supports vectors)
%   AR  - Wing Aspect Ratio (b^2/S) [-]
%   CD0 - (Optional) Zero-lift drag coefficient [-] (Default: 0.015)
%
% OUTPUTS:
%   result - Structure containing:
%       .CD0        - Zero-lift drag coefficient used
%       .e          - Calculated Oswald efficiency factor
%       .CD_induced - Induced drag component
%       .CD         - Total drag coefficient
%       .L_over_D   - Lift-to-Drag ratio
%
% REFERENCE: 
%   MAE159_classnotes.pdf, Page 33
% =========================================================================

function result = calculate_drag(CL, AR, CD0)

    % ---------------------------------------------------------------------
    % 1. INPUT HANDLING & DEFAULTS
    % ---------------------------------------------------------------------
    if nargin < 3
        CD0 = 0.015; % Default clean configuration (Week 3 Appendix)
    end

    % ---------------------------------------------------------------------
    % 2. INPUT VALIDATION
    % ---------------------------------------------------------------------
    % Note: CL check removed to allow for full drag polar plotting (-CL to +CL)
    
    if AR <= 0
        error('calculate_drag:InvalidInput', 'AR must be positive, got %.2f', AR);
    end
    
    if CD0 < 0
        error('calculate_drag:InvalidInput', 'CD0 must be non-negative, got %.4f', CD0);
    end

    % ---------------------------------------------------------------------
    % 3. AERODYNAMIC CALCULATIONS
    % ---------------------------------------------------------------------
    
    % Calculate Oswald Efficiency Factor (e)
    % Reference: MAE159_classnotes.pdf, Page 33 (Empirical approximation)
    % Note: Denominator uses element-wise math just in case AR is a vector
    e = 1.0 ./ (1.035 + 0.38 .* CD0 .* pi .* AR);

    % Calculate Induced Drag Coefficient (CD_i)
    % Equation: CD_i = CL^2 / (pi * AR * e)
    k = 1.0 ./ (pi .* e .* AR);
    CD_induced = k .* (CL .^ 2); % Use .^ for vector inputs

    % Calculate Total Drag Coefficient (CD)
    % Equation: CD = CD0 + CD_i
    CD = CD0 + CD_induced;

    % Calculate Lift-to-Drag Ratio (L/D)
    L_over_D = CL ./ CD;

    % ---------------------------------------------------------------------
    % 4. PACK RESULTS
    % ---------------------------------------------------------------------
    result.CD0        = CD0;
    result.e          = e;
    result.CD_induced = CD_induced;
    result.CD         = CD;
    result.L_over_D   = L_over_D;

end