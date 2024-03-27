a = 0
n = 0
m = 0

function x = gseq(a, n, m)
    nn = 0:n;
    cx = 1 ./ (1 + a * nn.^2);
    x = gaussvector(0, cx, m);
end

% Definição da função gaussvector para gerar vetores de amostras
function x = gaussvector(mu, cov_func, m)
    n = length(cov_func) - 1;
    x = zeros(n+1, m);
    for i = 1:m
        samples = randn(n+1, 1);
        cov_matrix = toeplitz(cov_func);
        perturbation = eye(n+1) * eps;
        cov_matrix = cov_matrix + perturbation;
        L = chol(cov_matrix, 'lower');
        x(:, i) = L * samples + mu;
    end
end

% Exemplos de gráficos
figure;

% Gráfico (a): a = 1
subplot(2, 1, 1);
a = 1;
x = gseq(a, 50, 5);
plot(0:50, x);
title('a = 1');
xlabel('n');
ylabel('x');
grid on;

% Gráfico (b): a = 0.01
subplot(2, 1, 2);
a = 0.01;
x = gseq(a, 50, 5);
plot(0:50, x);
title('a = 0.01');
xlabel('n');
ylabel('x');
grid on;
