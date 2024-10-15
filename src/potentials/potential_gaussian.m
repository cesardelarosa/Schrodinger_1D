% potential_gaussian.m

function U = potential_gaussian(x, U0, sigma)
    U = U0 * exp(-(x.^2) / (2 * sigma^2));
end
