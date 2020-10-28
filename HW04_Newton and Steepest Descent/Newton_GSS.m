function [x_min, f_min, iter] = Newton_GSS(f, gf, Hf, x0, Stop_tol, GSS_tol, varargin)
x = x0;
p = -Hf(x)\gf(x);
syms a;
g = @(a) f(x + a*p, varargin{:});
[alpha, ~] = GSS(g ,0, 100, GSS_tol, varargin);
x_next = x + alpha*p;
iter = 1;
while norm(x_next - x) > Stop_tol
    x = x_next;
    p = -Hf(x)\gf(x);
    syms a;
    g = @(a) f(x + a*p, varargin{:});
    [alpha, ~] = GSS(g ,0, 100, GSS_tol, varargin);
    x_next = x + alpha*p;
    iter = iter + 1;
end
x_min = x_next;
f_min = f(x_min);
