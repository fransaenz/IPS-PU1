clear all; close all; clc;
%inciso 1: graficar respuesta impulsional retornada por la función hcanald.m
disp('inciso 1: graficar respuesta impulsional retornada por la función hcanald.m, figura 1')
[n, h] = hcanald(03732);
stem(n, h);
title('Respuesta impulsional del canal hA[n]');
xlabel('n'); ylabel('hA[n]');
grid on;
%Para encontrar en que valores de n esta ubicada cada delta y su amplitud:
disp('valores de n donde estan posicionados los deltas');
idx = find(h!=0);
n(idx)
disp('altura de cada delta');
h(idx)
disp('deltas del canal');
disp([n(idx)', h(idx)']);
%inciso 2: una vez realizada la funcion que implementa el sistema con respuesta impulsional hA, comprobamos esta respuesta impulsional aplicando un delta como entrada
%definimos delta
disp('inciso 2: una vez realizada la funcion que implementa el sistema con respuesta impulsional hA, comprobamos esta respuesta impulsional aplicando un delta como entrada');
Delta = [1 zeros(1, length(h)-1)];
%aplicamos sistema
y_delta = canal(Delta, h);
% recortar para comparar (acorto vector y_delta para que tenga la misma longitud que h)
y_delta = y_delta(1:length(h));
% verificar igualdad
disp('Coinciden hA y salida del sistema implementado al poner como entrada un delta? (respuesta debe ser 1 para que coincidan)');
disp(isequal(h, y_delta));
%graficamos y_delta para comprobar que su grafico es igual al de h
disp('graficamos salida del sistema al poner como entrada un delta para comprobar que su grafico es igual al de hA, figura 2');
figure;
stem(y_delta);
xlabel('n'); ylabel('hA[n]');
grid on;
%inciso 3
%cargamos audio en x
[x, fs] = audioread('audio.wav');
%convertimos audio estereo a mono promediando los valores de x
x_mono = mean(x, 2);
%hallamos salida del sistema y cuando se aplica a su entrada la señal de audio x
y = canal(x_mono, h);
%escuchamos ambas senales de entrada y salida del canal (x_mono e y)
pause(3);
disp('inciso 3: escuchamos senial de audio x y luego como se escucha a la salida del canal si utilizamos x como entrada');
pause(0.1);
sound(x_mono, fs);
pause(2);
sound(y, fs);
%graficamos seniales de entrada y de salida del canal
% graficar entrada
disp('graficamos seniales de entrada del canal (x) -figura 3- y de salida del canal (y) -figura 4-');
figure;
plot(x_mono);
title('Señal de entrada x[n]');
xlabel('n'); ylabel('x[n]'); grid on;
% graficar salida
figure;
plot(y);
title('Señal de salida y[n]');
xlabel('n'); ylabel('y[n]'); grid on;
%inciso 4: una vez obtenidos los sistemas para los filtros con 2 y 3 ramas de retardo implementamos las respuestas impulsionales de cada filtro
%filtro con 2 ramas
% 𝑦[𝑛] = 𝑥[𝑛] -0.45𝑥[𝑛−8820] + (0.45)3𝑥[𝑛−26460]
%implementamos respuesta impulsional: hF​[n] = δ[n] - 0.45 δ[n − 8820] + (0.45)3  δ[n - 26460]
h2 = zeros(1, 26460+1);
h2(1) = 1;
h2(8820+1) = -0.45;
h2(26460+1) = 0.45^3;
%filtro con 3 ramas
% 𝑦[𝑛] = 𝑥[𝑛] - 0.45𝑥[𝑛−8820] + (0.45)3𝑥[𝑛−26460] - (0.45)4𝑥[𝑛−35280]
%implementamos respuesta impulsional: hF​[n] = δ[n] - 0.45 δ[𝑛−8820] + (0.45)3 δ[𝑛−26460] - (0.45)4 δ[𝑛−35280]
h3 = zeros(1,35280+1);
h3(1) = 1;
h3(8820+1) = - 0.45;
h3(26460+1) =  0.45^3 ;
h3(35280+1) = - 0.45^4;
%luego graficamos la respuesta impulsional total de la cascada canal + filtro para cada filtro
%para ello convolucionamos las respuestas impulsionales del canal y del filtro y graficamos
% graficamos ht2 (respuesta impulsional total de la cascada con el filtro con 2 ramas de retardo)
disp('inciso 4: graficamos respuesta impulsional total de la cascada con el filtro con 2 ramas de retardo -figura 5-');
ht2 = conv(h, h2);
figure;
stem(ht2);
title('Respuesta impulsional de canal + filtro de 2 ramas');
xlabel('n'); ylabel('ht[n]'); grid on;
%graficamos ht3 (respuesta impulsional total de la cascada con el filtro con 3 ramas de retardo)
disp('graficamos respuesta impulsional total de la cascada con el filtro con 3 ramas de retardo -figura 6-');
ht3 = conv(h, h3);
figure;
stem(ht3);
title('Respuesta impulsional de canal + filtro de 3 ramas');
xlabel('n'); ylabel('ht[n]'); grid on;
%inciso 5: filtramos senial y de salida del canal con cada filtro implementado
%filtramos con filtro de 2 ramas
disp('inciso 5: filtramos senial y de salida del canal con cada filtro implementado');
y2 = conv(y, h2);
%escuchamos salida del sistema (aplicando filtro 2 ramas)
disp('escuchamos salida del sistema luego de aplicar el filtro con 2 ramas de retardo');
pause(0.1);
sound(y2, fs);
pause(3);
%escuchamos entrada del sistema para comparar
disp('escuchamos entrada x del sistema para comparar');
pause(0.1);
sound(x_mono, fs);
pause(3);
%filtramos con filtro de 3 ramas
y3 = conv(y, h3);
%escuchamos salida del sistema con filtro de 3 ramas
disp('escuchamos salida del sistema luego de aplicar el filtro con 3 ramas de retardo');
pause(0.1);
sound(y3, fs);
pause(3);
%volvemos a escuchar entrada del sistema para comparar
disp('volvemos a escuchar entrada x del sistema para comparar');
pause(0.1);
sound(x_mono, fs);
