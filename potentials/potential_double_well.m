% potential_double_well.m

function U = potential_double_well(x, a, b)
    U = a * x.^4 - b * x.^2;
end
