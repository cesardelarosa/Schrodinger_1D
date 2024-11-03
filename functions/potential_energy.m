% potential_energy.m

function EV = potential_energy(U, phi, hx)
    U = U(:);
	EV = sum(U .* (phi.^2)) * hx;
end
