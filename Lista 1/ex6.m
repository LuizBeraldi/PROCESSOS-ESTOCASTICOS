% Gerando uma matriz 3x3 de números aleatórios entre 0 e 1
disp('Matriz aleatória:');
matriz_aleatoria = rand(3, 3);
disp(matriz_aleatoria);
disp(' ');

% Gerando uma matriz aleatória
disp('Matriz aleatória A:');
A = rand(3, 3);
disp(A);
disp(' ');

% Decompondo a matriz A em valores singulares
[U, S, V] = svd(A);

% Exibindo os resultados
disp('Matriz U (Uso Singular):');
disp(U);
disp(' ');

disp('Matriz S (Valores Singulares):');
disp(S);
disp(' ');

disp('Matriz V (V Transposto):');
disp(V);
disp(' ');

% Definindo vetores de coordenadas
x = 1:3;
y = 1:2;

% Gerando grade bidimensional
[X, Y] = ndgrid(x, y);

% Exibindo a grade
disp('Grade bidimensional (X):');
disp(X);
disp(' ');

disp('Grade bidimensional (Y):');
disp(Y);

