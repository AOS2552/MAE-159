function CD = calculate_drag(CL, AR, e)
    % Calculates Drag Coefficient CD
    % CD = CD,0 + CL^2 / (pi * AR * e)
    % using a default CD,0 of 0.015

    CD0 = 0.015;
    CD = CD0 + CL.^2 ./ (pi * AR * e);
end
