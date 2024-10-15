% kinetic_energy.m

function EK = kinetic_energy(D2, phi, m, hx)
    EK = (1/(2*m)) * (phi' * D2 * phi) * hx;
end
