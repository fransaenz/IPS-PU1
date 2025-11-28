% Sistema 2: y[n] = 1/2 x[n] - 1/2 x[n-1]

function y = sistema1Function(x)

    N = length(x);
    y = zeros(1,N);

    for n = 1:N
        xn = x(n);
        xn_1 = 0;
        if n-1 >= 1
            xn_1 = x(n-1);
        end
        y(n) = 0.5*xn - 0.5*xn_1;
    end
end

