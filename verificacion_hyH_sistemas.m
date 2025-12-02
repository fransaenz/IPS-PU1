%verificacion de que las rtas impulsional y frecuencial numericas
%del sistema 1 se corresponden con las analiticas


%%verificacion h
L = 200
n = 0:L

impulso = [1 zeros(1, L)];

h1_num = sistema1Function(impulso);
h2_num = sistema2Function(impulso);
h3_num = sistema3Function(impulso);
h4_num = sistema4Function(impulso);

h1_analit = [0.5 0.5 zeros(1, L-1)];
h2_analit = [0.5 -0.5 zeros(1, L-1)];
h3_analit = (1/4)*(n == 0) + (3/8)*(1/2).^(n-1).*(n >= 1);
h4_analit = (1/4)*(n == 0) + ((-1).^n).*(3/8).*(1/2).^(n-1) .* (n >= 1);

%graficas

%s1
figure;
stem(h1_num, 'k', 'LineWidth', 3, 'MarkerSize', 4); hold on;
stem(h1_analit, 'm*', 'LineWidth', 1, 'MarkerSize', 2); hold off;
title('Sistema 1: h[n] numérica vs analítica');
legend('Numérica', 'Analítica'); grid on;
xlabel('n');
ylabel('h[n]');
xlim([0 10]);
ylim([min(h1_num)-0.1 max(h1_num)+0.1]);

%s2
figure;
stem(h2_num, 'k', 'LineWidth', 3, 'MarkerSize', 4); hold on;
stem(h2_analit, 'm*', 'LineWidth', 1, 'MarkerSize', 2); hold off;
title('Sistema 2: h[n] numérica vs analítica');
legend('Numérica', 'Analítica'); grid on;
xlabel('n');
ylabel('h[n]');
xlim([0 10]);
ylim([min(h2_num)-0.1 max(h2_num)+0.1]);

%s3
figure;
stem(h3_num, 'k', 'LineWidth', 3, 'MarkerSize', 4); hold on;
stem(h3_analit, 'm*', 'LineWidth', 1, 'MarkerSize', 2); hold off;
title('Sistema 3: h[n] numérica vs analítica');
legend('Numérica', 'Analítica'); grid on;
xlabel('n');
ylabel('h[n]');
xlim([0 10]);
ylim([min(h3_num)-0.1 max(h3_num)+0.1]);

%s4
figure;
stem(h4_num, 'k', 'LineWidth', 3, 'MarkerSize', 4); hold on;
stem(h4_analit, 'm*', 'LineWidth', 1, 'MarkerSize', 2); hold off;
title('Sistema 4: h[n] numérica vs analítica');
legend('Numérica', 'Analítica'); grid on;
xlabel('n');
ylabel('h[n]');
xlim([0 10]);
ylim([min(h4_num)-0.1 max(h4_num)+0.1]);



%%verificacion H
N = length(h1_num);

%aca hago que se grafiquen mas de un periodo
%para que se contrasste bien con la analitica

s_num = (-N/2 : N/2-1) / N;
s_num_per = [s_num-1 , s_num , s_num+1]
H1_num = fftshift(fft(h1_num));
H2_num = fftshift(fft(h2_num));
H3_num = fftshift(fft(h3_num));
H4_num = fftshift(fft(h4_num));

H1_num_per = [H1_num, H1_num, H1_num];
H2_num_per = [H2_num, H2_num, H2_num];
H3_num_per = [H3_num, H3_num, H3_num];
H4_num_per = [H4_num, H4_num, H4_num];

s_analit = -1:0.001:1
H1_analit = 0.5 + 0.5*exp(-j*2*pi*s_analit);
H2_analit = 0.5 - 0.5*exp(-j*2*pi*s_analit);
H3_analit = (1/4) * (1 + exp(-j*2*pi*s_analit)) ./ (1 - 0.5*exp(-j*2*pi*s_analit));
H4_analit = (1/4) * (1 - exp(-j*2*pi*s_analit)) ./ (1 + 0.5*exp(-j*2*pi*s_analit));

%graficos
%s1
figure;
plot(s_num_per, abs(H1_num_per), 'k', 'LineWidth', 3, 'MarkerSize', 4); hold on;
plot(s_analit, abs(H1_analit), 'm', 'LineWidth', 1, 'MarkerSize', 2); hold off;
title('Sistema 1: |H(e^{j2πs})| numérica vs analítica');
legend('Numérica', 'Analítica'); grid on;
xlabel('s');
ylabel('|H(e^{j2πs})|');
xlim([-1 1]);
ylim([min(abs(H1_analit)) max(abs(H1_analit))+0.1]);

figure;
plot(s_num_per, angle(H1_num_per), 'k', 'LineWidth', 3, 'MarkerSize', 4); hold on;
plot(s_analit, angle(H1_analit), 'm', 'LineWidth', 1, 'MarkerSize', 2); hold off;
title('Sistema 1: arg(H(e^{j2πs})) numérica vs analítica');
legend('Numérica', 'Analítica'); grid on;
xlabel('s');
ylabel('arg(H(e^{j2πs}))');
xlim([-1 1]);
ylim([min(angle(H1_analit))-0.1 max(angle(H1_analit))+0.1]);

%s2
figure;
plot(s_num_per, abs(H2_num_per), 'k', 'LineWidth', 3, 'MarkerSize', 4); hold on;
plot(s_analit, abs(H2_analit), 'm', 'LineWidth', 1, 'MarkerSize', 2); hold off;
title('Sistema 2: |H(e^{j2πs})| numérica vs analítica');
legend('Numérica', 'Analítica'); grid on;
xlabel('s');
ylabel('|H(e^{j2πs})|');
xlim([-1 1]);
ylim([min(abs(H2_analit)) max(abs(H2_analit))+0.1]);

figure;
plot(s_num_per, angle(H2_num_per), 'k', 'LineWidth', 3, 'MarkerSize', 4); hold on;
plot(s_analit, angle(H2_analit), 'm', 'LineWidth', 1, 'MarkerSize', 2); hold off;
title('Sistema 2: arg(H(e^{j2πs})) numérica vs analítica');
legend('Numérica', 'Analítica'); grid on;
xlabel('s');
ylabel('arg(H(e^{j2πs}))');
xlim([-0.99 0.99]);
ylim([min(angle(H2_analit))-0.1 max(angle(H2_analit))+0.1]);

%s3
figure;
plot(s_num_per, abs(H3_num_per), 'k', 'LineWidth', 3, 'MarkerSize', 4); hold on;
plot(s_analit, abs(H3_analit), 'm', 'LineWidth', 1, 'MarkerSize', 2); hold off;
title('Sistema 3: |H(e^{j2πs})| numérica vs analítica');
legend('Numérica', 'Analítica'); grid on;
xlabel('s');
ylabel('|H(e^{j2πs})|');
xlim([-1 1]);
ylim([min(abs(H3_analit)) max(abs(H3_analit))+0.1]);

figure;
plot(s_num_per, angle(H3_num_per), 'k', 'LineWidth', 3, 'MarkerSize', 4); hold on;
plot(s_analit, angle(H3_analit), 'm', 'LineWidth', 1, 'MarkerSize', 2); hold off;
title('Sistema 3: arg(H(e^{j2πs})) numérica vs analítica');
legend('Numérica', 'Analítica'); grid on;
xlabel('s');
ylabel('arg(H(e^{j2πs}))');
xlim([-1 1]);
ylim([min(angle(H3_analit))-0.1 max(angle(H3_analit))+0.1]);


%s4
figure;
plot(s_num_per, abs(H4_num_per), 'k', 'LineWidth', 3, 'MarkerSize', 4); hold on;
plot(s_analit, abs(H4_analit), 'm', 'LineWidth', 1, 'MarkerSize', 2); hold off;
title('Sistema 4: |H(e^{j2πs})| numérica vs analítica');
legend('Numérica', 'Analítica'); grid on;
xlabel('s');
ylabel('|H(e^{j2πs})|');
xlim([-1 1]);
ylim([min(abs(H4_analit)) max(abs(H4_analit))+0.1]);

figure;
plot(s_num_per, angle(H4_num_per), 'k', 'LineWidth', 3, 'MarkerSize', 4); hold on;
plot(s_analit, angle(H4_analit), 'm', 'LineWidth', 1, 'MarkerSize', 2); hold off;
title('Sistema 4: arg(H(e^{j2πs})) numérica vs analítica');
legend('Numérica', 'Analítica'); grid on;
xlabel('s');
ylabel('arg(H(e^{j2πs}))');
xlim([-0.99 0.99]);
ylim([min(angle(H4_analit))-0.1 max(angle(H4_analit))+0.1]);


