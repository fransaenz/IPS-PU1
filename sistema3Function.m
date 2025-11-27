% Sistema 3: y[n] = 1/4 x[n] + 1/4 x[n-1] + 1/2 y[n-1]

function y = sistema3Function(x)

    N = length(x);
    y = zeros(1,N);

    for n = 1:N
        xn = x(n);

        xn_1 = 0;
        if n-1 >= 1
            xn_1 = x(n-1);
        end

        yn_1 = 0;
        if n-1 >= 1
            yn_1 = y(n-1);
        end

        y(n) = 0.25*xn + 0.25*xn_1 + 0.5*yn_1;
    end
end

