% potential_infinite_well.m

function U = potential_infinite_well(x, L)
    U = ones(size(x)) * 1e6;
    U(abs(x) < L) = 0;
end
