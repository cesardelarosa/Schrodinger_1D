% plot_wavefunctions.m

function plot_wavefunctions(x, V, U, num_states, potential_name, E)
    figure('Color', 'white', 'Position', [100, 100, 800, 600]);
    hold on;

    scale_factor = 4;

    colors = jet(num_states) * 0.9;
    plot(x, U, 'k--', 'LineWidth', 1.5, 'DisplayName', '$U(x)$');

    for i = 1:num_states
        plot(x, scale_factor * V(:, i) + E(i), 'LineWidth', 2, 'Color', colors(i, :), 'DisplayName', ['$\Psi_{' num2str(i) '}(x)$']);
        plot([min(x), max(x)], [E(i), E(i)], '--', 'Color', colors(i, :), 'LineWidth', 1.5, 'DisplayName', ['Nivel $E_{' num2str(i) '}$']);
    end

    ylabel('$\Psi_{i}(x)$, $E$ (a.u.)', 'Interpreter', 'latex', 'FontSize', 14);
    xlabel('$x$ (a.u.)', 'Interpreter', 'latex', 'FontSize', 14);
    title(['Funciones de Onda y Potencial: ', potential_name], 'Interpreter', 'latex', 'FontSize', 16);
    legend('Interpreter', 'latex', 'Location', 'northeastoutside', 'FontSize', 12);
    grid on;

    filename = sprintf('img/%s.png', strrep(potential_name, ' ', '_'));
    print(gcf, filename, '-dpng', '-r300');

    hold off;
end
