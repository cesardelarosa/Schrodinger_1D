% run_potential.m

clear; clc; close all;
addpath('functions');
addpath('potentials');

L = 5;           % Máximo valor de L
Nx = 250;        % Número de intervalos
m = 1;           % Masa en unidades atómicas
num_states = 10;  % Número de estados a considerar

[x, hx] = discretize_space(L, Nx);

potentials = {
    'Pozo Finito', @(x) potential_finite_well(x, 5, L);
    'Potencial de Kronig-Penney', @(x) potential_kronig_penney(x, 30, 0.6, 0.1);
    'Potencial Armónico', @(x) potential_harmonic(x, m, 1);
    'Dos Pozos Cercanos', @(x) potential_double_well(x, 0.1, 2.5);
};

fprintf('Lista de potenciales disponibles:\n');
for i = 1:size(potentials, 1)
    fprintf('%d. %s\n', i, potentials{i, 1});
end

idx = input('Ingrese el índice del potencial (1-4): ');

if idx >= 1 && idx <= size(potentials, 1)
    potential_name = potentials{idx, 1};
    potential_func = potentials{idx, 2};
    fprintf('Ejecutando: %s\n', potential_name);
    process_potential(potential_name, potential_func, L, Nx, m, num_states, x, hx);
else
    error('Índice de potencial no válido.');
end

pause;
