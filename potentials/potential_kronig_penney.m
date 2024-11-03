% potential_kronig_penney.m

function U = potential_kronig_penney(x, V0, a, b)
    U = zeros(size(x));
    n_max = floor(max(x) / a);
    for n = -n_max:n_max
        pozo_centro = n * a;
        indices = abs(x - pozo_centro) <= (b / 2);
        U(indices) = -V0;
    end
end
