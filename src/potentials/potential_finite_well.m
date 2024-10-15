% potential_finite_well.m

function U = potential_finite_well(x, depth, width)
    U = zeros(size(x));
    U(abs(x) <= width/2) = -depth;
    U(abs(x) > width/2) = depth;
end
