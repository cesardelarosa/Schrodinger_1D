% main.m

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
    'Potencial de Kronig-Penney', @(x) potential_kronig_penney(x, 7.5, 1.6, 0.9);
    'Potencial Armónico', @(x) potential_harmonic(x, m, 1);
    'Dos Pozos Cercanos', @(x) potential_double_well(x, 0.1, 2);
};

for i = 1:size(potentials, 1)
    potential_name = potentials{i, 1};
    potential_func = potentials{i, 2};
    process_potential(potential_name, potential_func, L, Nx, m, num_states, x, hx);
end
