A função toeplitz no MATLAB é usada para criar uma matriz Toeplitz. 
Uma matriz Toeplitz é uma matriz quadrada na qual cada diagonal descendente da esquerda
para a direita tem o mesmo valor. Em outras palavras, todos os elementos em cada uma dessas diagonais são iguais.


lambda = 10; % Taxa de chegadas (chamadas por minuto)
mu = 1/10; % Taxa de duração das chamadas (1/minuto)
T = 60; % Duração total da simulação em minutos
t_interval = 0:1:T; % Intervalo de tempo de 0 a 60 minutos com incremento de 1 minuto

function M = simswitch(lambda, mu, t)
    % Chegadas de Poisson, taxa lambda
    % Duração exponencial (mu) das chamadas
    % Para o vetor t de tempos
    % M(i) = número de chamadas no tempo t(i)
    
    s = poissonarrivals(lambda, max(t));
    y = s + exprnd(1/mu, size(s));
    A = histc(s, t);
    D = histc(y, t);
    M = A - D;
end

M = simswitch(lambda, mu, t_interval);

plot(t_interval, M);
xlabel('Tempo (minutos)');
ylabel('Número de chamadas');
title('Simulação de atividades telefônicas');
