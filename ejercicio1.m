% SCRIPT PRINCIPAL

%%EJERCICIO 1

%%1.

%carga la senial con un numero de alumno como parametro
[n, x] = senial(38973);

%grafica de la funcion
figure(1);
stem(n, x, 'filled', 'MarkerSize', 1);
grid on;
xlabel("n");
ylabel("x[n]");
title("Señal x[n]");

%obtencion de TFTD aproximada mediante la TDF con N potencia de 2
x = x(:)';
N = length(x);
M = 2^nextpow2(N); %relleno de ceros
X = fft(x, M);     %calculo de TDF
s = (0:M-1)/M;

%grafico del modulo de X
modulo_X = abs(X);
figure;
plot(s, modulo_X);
grid on;
xlabel('s');
ylabel('|X(e^{j2πs})|');
title('Modulo de la TFTD aproximada');

%grafico del modulo de X centrado, para mejor interpretacion
s_centrado = linspace(-0.5, 0.5, M);
figure;
plot(s_centrado, fftshift(modulo_X));
grid on;
xlabel('s');
ylabel('|X(e^{j2πs})|');
title('Modulo de la TFTD aproximada centrado en 0');

%grafico de la fase de X
fase_X = angle(X);
fase_X_unwrapped = unwrap(fase_X);

figure;
plot(s, fase_X_unwrapped); grid on;
xlabel('s');
ylabel('arg(X(e^{j2πs}))[rad]');
title('Fase de la TFTD aproximada');

%grafico de la fase de X centrada
figure;
plot(s_centrado, fftshift(fase_X_unwrapped)); grid on;
xlabel('s');
ylabel('arg(X(e^{j2πs})) [rad]');
title('Fase de la TFTD aproximada centrada en 0');


 %%2.
sistema1Graph;
sistema2Graph;
sistema3Graph;
sistema4Graph;

%%3.
verificacion_hyH_sistemas;

%%4. y 5.

salidas;







