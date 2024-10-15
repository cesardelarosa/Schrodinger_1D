% potential_double_well.m

function U = potential_double_well(x, depth, separation)
    U = zeros(size(x));
    U(abs(x - separation/2) < 1) = -depth;
    U(abs(x + separation/2) < 1) = -depth;
    U(abs(x - separation/2) >= 1) = depth;
    U(abs(x + separation/2) >= 1) = depth;
end
