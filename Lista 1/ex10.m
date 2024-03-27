% Definindo os parâmetros
alpha = 0.1; % Parâmetro alpha

% Número de passos de tempo
n_steps = 1000;

% Tamanho do passo de tempo
dt = 0.01;

% Inicializando o vetor para armazenar os valores do processo Browniano
W = zeros(n_steps, 1);

% Gerando incrementos do processo Browniano
dW = sqrt(dt) * randn(n_steps, 1);

% Calculando o processo Browniano
for i = 2:n_steps
    W(i) = W(i-1) + alpha * dW(i);
end

% Plotando o processo Browniano
plot(0:dt:(n_steps*dt-dt), W);
xlabel('Tempo');
ylabel('Valor do Processo Browniano');
title('Processo Browniano com Parâmetro Alpha');
