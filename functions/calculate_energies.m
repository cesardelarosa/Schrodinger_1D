% calculate_energies.m

function [EK, EV, E_total] = calculate_energies(D2, U, V, m, hx, num_states)

	EK = zeros(num_states, 1);
    EV = zeros(num_states, 1);
    E_total = zeros(num_states, 1);

    for i = 1:num_states
        phi = V(:, i);
        EK(i) = kinetic_energy(D2, phi, m, hx);
        EV(i) = potential_energy(U, phi, hx);
        E_total(i) = EK(i) + EV(i);
    end
end
