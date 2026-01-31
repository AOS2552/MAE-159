function CD = calculate_drag(CL, AR, e, CD0)
    if nargin < 4
        CD0 = 0.015;
    end
    CD = CD0 + (CL.^2) ./ (pi * AR * e);
end
