lambda = 5; % Taxa de chegadas por minuto
T = 10; % Tempo total em minutos
t_interval = 0:0.1:T; % Intervalo de tempo de 0 a 10 minutos com incremento de 0.1 minuto

function s = poissonarrivals(lambda, T)
    
    pkg load statistics % Carregar o pacote de estatísticas
    
    n = ceil(1.1 * lambda * T);
    s = cumsum(exprnd(1/lambda, 1, n));
    
    while (s(end) < T)
        s_new = s(end) + cumsum(exprnd(1/lambda, 1, n));
        s = [s, s_new];
    end
    
    s = s(s <= T);
end

function N = poissonprocess(lambda, t)
    % N(i) = número de chegadas até o tempo t(i)
    s = poissonarrivals(lambda, max(t));
    N = histc(s, t);
end

N = poissonprocess(lambda, t_interval);

plot(t_interval, N);
xlabel('Tempo (minutos)');
ylabel('Número de chegadas');
title('Processo de Poisson com \lambda = 5 chegadas/min');
