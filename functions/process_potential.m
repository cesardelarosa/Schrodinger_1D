% process_potential.m

function process_potential(potential_name, potential_func, L, Nx, m, num_states, x, hx)
    disp(['Resolviendo para ', potential_name, '...']);
    U = potential_func(x);  
    D2 = second_derivative_matrix(Nx, hx);
    H = hamiltonian(D2, U, m);
    [E, V] = solve_eigen(H);
    [EK, EV, E_total] = calculate_energies(D2, U, V, m, hx, num_states);
    plot_wavefunctions(x, V, U, num_states, potential_name, E(1:num_states));
end
