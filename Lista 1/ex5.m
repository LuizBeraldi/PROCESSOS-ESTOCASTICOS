mu = [1; 2];
C = [2, 1; 1, 3];
x = [1.5; 2.5];

function f = gaussvector(mu, C, x)
    % Calcula a dimensão do vetor aleatório gaussiano
    n = length(mu);
    
    % Calcula a constante de normalização
    const = (2 * pi)^(-n/2) * det(C)^(-1/2);
    
    % Calcula a exponencial da parte exponencial da função de densidade de probabilidade
    exp_part = exp(-0.5 * (x - mu)' * inv(C) * (x - mu));
    
    % Calcula a função de densidade de probabilidade
    f = const * exp_part;
end

f = gaussvector(mu, C, x);
fprintf('Resposta:\n')
disp(f);
