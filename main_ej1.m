% SCRIPT PRINCIPAL

%carga la senial con un numero de alumno como parametro
[x, n] = senial(038973);

%grafica
figure(1);
stem(n, x);
grid on;
title("Señal x[n]");
xlabel("n"); ylabel("x[n]");




