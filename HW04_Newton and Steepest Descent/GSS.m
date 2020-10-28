function [x_min, N] = GSS(f, a, b, epsilon, varargin)
count = 0;
rho = (3-sqrt(5))/2;
N = 0;

while b-a > epsilon
    N = N+1;
    x = a + (b-a)*rho;
    y = b - (b-a)*rho;
    if f(x, varargin{:})<f(y, varargin{:})
        count = count + 2;
        b = y;
    else
        count = count + 2;
        a = x;
    end
end
x_min = (a+b)/2;
