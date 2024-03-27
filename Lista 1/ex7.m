lambda = 0.5; % Taxa de Poisson
T = 10; % Intervalo de tempo

function s = poissonarrivals(lambda, T)
    % Tempo de chegadas
    % s = [s(1), ..., s(n)]
    % s(n) <= T < s(n+1)
    
    pkg load statistics % Carregar o pacote de estatísticas
    
    n = ceil(1.1 * lambda * T);
    s = cumsum(exprnd(1/lambda, 1, n));
    
    while (s(end) < T)
        s_new = s(end) + cumsum(exprnd(1/lambda, 1, n));
        s = [s, s_new];
    end
    
    s = s(s <= T);
end


arrivals = poissonarrivals(lambda, T);
disp(arrivals);

