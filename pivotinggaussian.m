% GRAFICA 22.1
clear all;
function gauss_elim_random_matrices(num_matrices, min_size, max_size)
    ratios = []; 
    sizes = []; 
    for n = 1:num_matrices
        m = randi([min_size, max_size]);
        %A = rand(m);
        A = randn(m,m)/sqrt(m);
        U = A; 
        for k = 1:m-1
            for i = 1:m
                [~, pivot_row] = max(abs(U(k:end, k))); 
                pivot_row = pivot_row + k - 1;
                if pivot_row ~= k
                    U([k, pivot_row], :) = U([pivot_row, k], :);
                end
            end
            for j = k+1:m
                ljk = U(j,k)/U(k,k);
                U(j,k:m) = U(j,k:m) - ljk*U(k,k:m);
            end
        end
        max_U = max(abs(U(:)));
        max_A = max(abs(A(:)));
        ratio = max_U / max_A;
        ratios = [ratios, ratio];
        sizes = [sizes, m];
    end
 
    mm = 1:max(sizes);
    % ratio vs m
    subplot(1,2,1),plot(sizes, ratios, '.', 'MarkerSize', 15); 
    xlabel('Tamaño de la matriz (m)', 'FontSize', 14); 
    ylabel('Factor de Crecimiento', 'FontSize', 14); 
    title('Ratio vs Tamaño de la matriz', 'FontSize', 16); 
    grid on, hold on,
    plot(mm,sqrt(mm),'r')
    
    subplot(1,2,2),loglog(sizes, ratios, '.', 'MarkerSize', 15); 
    xlabel('Tamaño de la matriz (m)', 'FontSize', 14); 
    ylabel('Factor de Crecimiento', 'FontSize', 14); 
    title('Ratio vs Tamaño de la matriz', 'FontSize', 16); 
    grid on, hold on,
    loglog(mm,sqrt(mm),'r')

    #std_sizes = std(sizes);
    #mean_sizes = mean(sizes);
    #line([mean_sizes, mean_sizes+std_sizes], [min(ratios), max(ratios)], 'Color', 'r', 'LineStyle', '--');
    #hold off;    
end

gauss_elim_random_matrices(496, 1, 1000);


