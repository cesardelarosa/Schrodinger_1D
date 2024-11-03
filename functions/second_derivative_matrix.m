% second_derivative_matrix.m

function D2 = second_derivative_matrix(Nx, hx)
    D2 = (diag(ones(Nx, 1), 1) - 2 * eye(Nx+1) + diag(ones(Nx, 1), -1)) / hx^2;
end
