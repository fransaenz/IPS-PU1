%%respuesta impulsional del sistema 4

 %defino cuantas muestras de h quiero en la grafica
N = 10;
L = -N:N;
h = zeros(size(L));

for k = 1:length(L)
  n = L(k)

  if n == 0

    h(k) = 1/4;

  elseif n>0

    h(k) = (-1)^n * (3/8) * (1/2)^(n-1);

  end
 end


 %grafica
figure;
stem(L , h, 'filled', 'MarkerSize', 2);
grid on;
xlabel('n');
ylabel('h[n]');
title('Respuesta impulsional h[n] del Sistema 4');

%%respuesta en frecuencia del sistema 4

M = 1000;
s = linspace(-1, 1, M);
H = (1/4) * (1 - exp(-j*2*pi*s)) ./ (1 + 0.5*exp(-j*2*pi*s));

%grafico del modulo
modulo_H = abs(H)
figure;
plot(s, modulo_H);
grid on;
xlabel('s');
ylabel('|H(e^{j2πs})|','interpreter','latex');
title('Modulo de la respuesta frecuencial H(e^{j2πs}) del Sistema 4', 'interpreter', 'latex');
ylim([min(modulo_H), max(modulo_H)+0.1]);

%grafico del fase
figure;
fase_H = angle(H)
plot(s, fase_H);
grid on;
xlabel('s');
ylabel('arg(e^{j2πs})','interpreter','latex');
title('Fase de la respuesta frecuencial  H(e^{j2πs}) del Sistema 4', 'interpreter', 'latex');;

