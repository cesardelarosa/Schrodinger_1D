% config.m

% Añadir rutas de los subdirectorios
addpath('functions');
addpath('potentials');

% Parámetros generales
global L Nx m num_states x hx

L = 5;          % Máximo valor de L
Nx = 250;       % Número de intervalos
m = 1;          % Masa en unidades atómicas
hbar = 1;       % Constante de Planck reducida
num_states = 5; % Número de estados a considerar

% Discretización del espacio
[x, hx] = discretize_space(L, Nx);

% Definir los tipos de potenciales
potentials = {
    'Potencial Armónico', @(x) potential_harmonic(x, m, 1);
    'Potencial Gaussiano', @(x) potential_gaussian(x, 1, 1);
    'Pozo Infinito', @(x) potential_infinite_well(x, L);
    'Potencial de Morse', @(x) potential_morse(x, 5, 1, 0);
    'Potencial de Lennard-Jones', @(x) potential_lennard_jones(x, 1, 1);
    'Pozo Finito', @(x) potential_finite_well(x, 5, L);
    'Pozo Arbitrario', @(x) potential_arbitrary(x);
    'Dos Pozos Cercanos', @(x) potential_double_well(x, 1, L);
};

% Función para obtener el índice del potencial
function idx = get_potential_index(name)
    
	potentials = {
        'Potencial Armónico', @(x) potential_harmonic(x, m, 1);
        'Potencial Gaussiano', @(x) potential_gaussian(x, 1, 1);
        'Pozo Infinito', @(x) potential_infinite_well(x, L);
        'Potencial de Morse', @(x) potential_morse(x, 5, 1, 0);
        'Potencial de Lennard-Jones', @(x) potential_lennard_jones(x, 1, 1);
        'Pozo Finito', @(x) potential_finite_well(x, 5, L);
        'Pozo Arbitrario', @(x) potential_arbitrary(x);
        'Dos Pozos Cercanos', @(x) potential_double_well(x, 1, L);
    };

    for i = 1:size(potentials, 1)
        if ~isempty(strfind(lower(potentials{i, 1}), lower(name)))
			idx = i;
			break;
        end
    end

    if isempty(idx)
        error('Potencial no encontrado.');
    end

end
