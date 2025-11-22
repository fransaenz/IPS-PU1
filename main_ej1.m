% SCRIPT PRINCIPAL

%carga la senial con un numero de alumno como parametro
[x, n] = senial(038973);

%grafica de la funcion
figure(1);
stem(n, x);
grid on;
title("Señal x[n]");
xlabel("n"); ylabel("x[n]");

%obtencion de TFTD aproximada mediante la TDF con N potencia de 2
x = x(:)';
L = length(x);
M = 2^nextpow2(L); %relleno de ceros
X = fft(x, M);     %calculo de TDF

%grafico del modulo de X
modulo_X = abs(X);
s = (0:N-1)/N;
figure;
plot(s, modulo_X); grid on;
xlabel('s');
ylabel('|X(s)|');

%grafico de la fase de X
phaseX_unwrapped = unwrap(phaseX);

figure;
plot(s, phaseX_unwrapped); grid on;
xlabel('s');
ylabel('arg(X(s))[rad]');
