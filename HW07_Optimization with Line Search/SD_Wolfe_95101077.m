function [x_min, f_min, iter] = SD_Wolfe_95101077(f, gf, x0, Stop_tol, varargin)
c1 = 0.0001;
c2 = 0.1;
x = x0;
p = -gf(x);
syms a;
phi = @(a) f(x + a*p, varargin{:});
dphi = @(a) p'*gf(x + a*p, varargin{:});
f_bar = 0.001;
alpha = linesearch_95101077(f_bar, phi, dphi, c1, c2);
x_next = x + alpha*p;
iter = 1;
while norm(x_next - x) > Stop_tol
    pause(0.1)
    x = x_next;
    p = -gf(x);
    syms a;
    phi = @(a) f(x + a*p, varargin{:});
    dphi = @(a) p'*gf(x + a*p, varargin{:});
    %     [alpha, ~] = GSS(g ,0, 100, GSS_tol);
    f_bar = 0.1*phi(0);
    alpha = linesearch_95101077(f_bar, phi, dphi, c1, c2);
    x_next = x + alpha*p;
    iter = iter + 1;
end
x_min = x_next;
f_min = f(x_min);

