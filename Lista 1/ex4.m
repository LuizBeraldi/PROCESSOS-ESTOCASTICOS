% x5.m
sx = -10:10;
[SX1, SX2, SX3, SX4, SX5] = ndgrid(sx, sx, sx, sx, sx);

P = sqrt(SX1.^2 + SX2.^2 + SX3.^2 + SX4.^2 + SX5.^2);
k = 1.0 / sum(P(:));
P = k * P;

EX3 = sum(P(:) .* SX3(:));
EX32 = sum(P(:) .* (SX3(:).^2));
sigma3 = sqrt(EX32 - EX3.^2);

disp(['k = ', num2str(k)]);
disp(['EX3 = ', num2str(EX3)]);
disp(['sigma3 = ', num2str(sigma3)]);
