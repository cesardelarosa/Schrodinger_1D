% main.m
% Resolución de la ecuación de Schrödinger para diferentes pozos de potencial

% Importar constantes y funciones
config;

% Procesar cada potencial
for i = 1:size(potentials, 1)
    process_potential(potentials{i,:});
end
