%%respuesta impulsional del sistema 1

 %defino cuantas muestras de h quiero en la grafica
N = 5;
L = -N:N;
h = zeros(size(L));

for k = 1:length(L)
  n = L(k)

  if n == 0

    h(k) = 1/2;

  elseif n == 1

    h(k) = -1/2;

  end
 end


 %grafica
figure;
stem(L , h, 'filled', 'MarkerSize', 3);
grid on;
xlabel('n');
ylabel('h[n]');
title('Respuesta impulsional h[n] del Sistema 1');

%%respuesta en frecuencia del sistema 1
