% potential_morse.m

function U = potential_morse(x, D, a, re)
    U = D * (1 - exp(-a * (x - re))).^2 - D;
end
