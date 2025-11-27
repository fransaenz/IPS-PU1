%%respuesta impulsional del sistema 3

 %defino cuantas muestras de h quiero en la grafica
N = 10;
L = -N:N;
h = zeros(size(L));

for k = 1:length(L)
  n = L(k)

  if n == 0

    h(k) = 1/4;

  elseif n>0

    h(k) = (3/8) * (1/2)^(n-1);

  end
 end


 %grafica
figure;
stem(L , h, 'filled', 'MarkerSize', 2);
grid on;
xlabel('n');
ylabel('h[n]');
title('Respuesta impulsional h[n] del Sistema 3');

%%respuesta en frecuencia del sistema 3

