% hamiltonian.m

function H = hamiltonian(D2, U, m)
	H = -(1/(2*m)) * D2 + diag(U);
end
