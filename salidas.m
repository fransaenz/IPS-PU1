% Script para la  aplicar los 4 sistemas a senial y graficar las salidas


%carga la senial con un numero de alumno como parametro
[n, x] = senial(38973);

y1 = sistema1Function(x);
y2 = sistema2Function(x);
y3 = sistema3Function(x);
y4 = sistema4Function(x);

%s1
figure;
stem(n, y1, '.', 'MarkerSize', 3);
grid on;
title('Salida del Sistema 1');
xlabel('n'); ylabel('y1[n]');

%s2
figure;
stem(n, y2, '.', 'MarkerSize', 3);;
grid on;
title('Salida del Sistema 2');
xlabel('n'); ylabel('y2[n]');

%s3
figure;
stem(n, y3, '.', 'MarkerSize', 3);
grid on;
title('Salida del Sistema 3');
xlabel('n'); ylabel('y3[n]');

%4
figure;
stem(n, y4, '.', 'MarkerSize', 3);
grid on;
title('Salida del Sistema 4');
xlabel('n'); ylabel('y4[n]');

%%obtencion de la TFTD aprox de cada salida (mediante TDF)

N = length(x);
s = (-N/2 : N/2-1) / N;

%TDF de cada salida
Y1 = fft(y1);
Y2 = fft(y2);
Y3 = fft(y3);
Y4 = fft(y4);


%graficos
%Y1
figure;
plot(s, fftshift(abs(Y1)));
grid on;
title('Un periodo del modulo de la TFTD aproximada de la salida del Sistema 1 y1[n]');
xlabel('s'); ylabel('|Y1(e^{j2πs})|');
xlim([-0.5 0.5]);
ylim ([min(abs(Y1)) max(abs(Y1))+1])

figure;
plot(s, fftshift(angle(Y1)));
grid on;
title('Un periodo de la fase de la TFTD aproximada de la salida del Sistema 1 y1[n]');
xlabel('s'); ylabel('arg(Y1(e^{j2πs}))');
xlim([-0.5 0.5]);
ylim ([min(angle(Y1))-0.1 max(angle(Y1))+0.1])

%Y2
figure;
plot(s, fftshift(abs(Y2)));
grid on;
title('Un periodo del modulo de la TFTD aproximada de la salida del Sistema 2 y2[n]');
xlabel('s'); ylabel('|Y2(e^{j2πs})|');
xlim([-0.51 0.51]);
ylim ([min(abs(Y2)) max(abs(Y2))+1])

figure;
plot(s, fftshift(angle(Y2)));
grid on;
title('Un periodo de la fase de la TFTD aproximada de la salida del Sistema 2 y2[n]');
xlabel('s'); ylabel('arg(Y2(e^{j2πs}))');
xlim([-0.51 0.51]);
ylim ([min(angle(Y2))-0.1 max(angle(Y2))+0.1])

%Y3
figure;
plot(s, fftshift(abs(Y3)));
grid on;
title('Un periodo del modulo de la TFTD aproximada de la salida del Sistema 3 y3[n]');
xlabel('s'); ylabel('|Y3(e^{j2πs})|');
xlim([-0.5 0.5]);
ylim ([min(abs(Y3)) max(abs(Y3))+1])

figure;
plot(s, fftshift(angle(Y3)));
grid on;
title('Un periodo de la fase de la TFTD aproximada de la salida del Sistema 3 y3[n]');
xlabel('s'); ylabel('arg(Y3(e^{j2πs}))');
xlim([-0.5 0.5]);
ylim ([min(angle(Y3))-0.1 max(angle(Y3))+0.1])

%Y4
figure;
plot(s, fftshift(abs(Y4)));
grid on;
title('Un periodo del modulo de la TFTD aproximada de la salida del Sistema 4 y4[n]');
xlabel('s'); ylabel('|Y4(e^{j2πs})|');
xlim([-0.5 0.5]);
ylim ([min(abs(Y4)) max(abs(Y4))+1])

figure;
plot(s, fftshift(angle(Y4)));
grid on;
title('Un periodo de la fase de la TFTD aproximada de la salida del Sistema 4 y4[n]');
xlabel('s'); ylabel('arg(Y4(e^{j2πs}))');
xlim([-0.5 0.5]);
ylim ([min(angle(Y4))-0.1 max(angle(Y4))+0.1])
