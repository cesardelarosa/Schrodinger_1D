% solve_eigen.m

function [E, V] = solve_eigen(H)
    [V, E_matrix] = eig(H);
    E = diag(E_matrix);
end
