% discretize_space.m

function [x, hx] = discretize_space(L, Nx)
    x = linspace(-L, L, Nx+1);
    hx = x(2) - x(1);
end
