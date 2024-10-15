% potential_lennard_jones.m

function U = potential_lennard_jones(x, epsilon, sigma)
    U = zeros(size(x));
    U(abs(x) < 1e-5) = 1e6;
    valid_indices = abs(x) >= 1e-5;
    U(valid_indices) = 4 * epsilon * ((sigma ./ x(valid_indices)).^12 - (sigma ./ x(valid_indices)).^6);
end
