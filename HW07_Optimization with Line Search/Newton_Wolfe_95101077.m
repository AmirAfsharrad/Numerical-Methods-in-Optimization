function [x_min, f_min, iter] = Newton_Wolfe(f, gf, Hf, x0, Stop_tol, varargin)
c1 = 0.0001;
c2 = 0.1;
x = x0;
p = -Hf(x)\gf(x);
syms a;
phi = @(a) f(x + a*p, varargin{:});
dphi = @(a) p'*gf(x + a*p, varargin{:});
f_bar = 0.001;
alpha = linesearch_95101077(f_bar, phi, dphi, c1, c2);
x_next = x + alpha*p;
iter = 1;
while norm(x_next - x) > Stop_tol
    x = x_next;
    p = -Hf(x)\gf(x);
    syms a;
    phi = @(a) f(x + a*p, varargin{:});
    dphi = @(a) p'*gf(x + a*p, varargin{:});
    f_bar = 0.001;
    alpha = linesearch_95101077(f_bar, phi, dphi, c1, c2);
    
    x_next = x + alpha*p;
    iter = iter + 1;
end
x_min = x_next;
f_min = f(x_min);
