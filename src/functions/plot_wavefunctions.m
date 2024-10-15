% plot_wavefunctions.m

function plot_wavefunctions(x, V, U, num_states, potential_name)

	figure('Color', 'white', 'Position', [100, 100, 800, 600]);
    
	ax1 = axes('Position', [0.1, 0.1, 0.67, 0.80]);
    hold(ax1, 'on');
    
	colors = lines(num_states);
    wave_handles = zeros(num_states, 1);
    for i = 1:num_states
        wave_handles(i) = plot(ax1, x, V(:, i), 'LineWidth', 2, 'Color', colors(i, :), 'DisplayName', ['$\Psi_' num2str(i) '(x)$']);
    end
    
	ylabel(ax1, '$\Psi_i(x)$ (a.u.)', 'Interpreter', 'latex', 'FontSize', 14);
    xlabel(ax1, '$x$ (a.u.)', 'Interpreter', 'latex', 'FontSize', 14);
    title(ax1, ['Funciones de Onda y Potencial: ', potential_name], 'Interpreter', 'latex', 'FontSize', 16);
    grid(ax1, 'on');
    
	ax2 = axes('Position', get(ax1, 'Position'));
    hold(ax2, 'on');
    pot_handle = plot(ax2, x, U, 'k--', 'LineWidth', 1.5, 'DisplayName', '$U(x)$');
    ylabel(ax2, '$U(x)$ (a.u.)', 'Interpreter', 'latex', 'FontSize', 14);
    set(ax2, 'YAxisLocation', 'right');
    set(ax2, 'Color', 'none');
    
	legend([wave_handles; pot_handle], {'$\Psi_1(x)$', '$\Psi_2(x)$', '$\Psi_3(x)$', '$\Psi_4(x)$', '$\Psi_5(x)$', '$U(x)$'}, ...
           'Interpreter', 'latex', 'Location', 'northeastoutside', 'FontSize', 12);
    
	filename = sprintf('img/%s.png', strrep(potential_name, ' ', '_'));
    print(gcf, filename, '-dpng', '-r300');
    hold off;

end
