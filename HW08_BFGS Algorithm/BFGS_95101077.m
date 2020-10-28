function [x_min, f_min, iter] = BFGS_95101077(f, gf, x0, Stop_tol, varargin)
c1 = 0.0001;
c2 = 0.1;
I = eye(length(x0));
x = x0;
g = gf(x0);

% First we do one iteration and then find an appropriate initial value for
% C0. Then we enter the loop until stop condition is met.
C = I;
p = -C * g;

syms a;
phi = @(a) f(x + a*p, varargin{:});
dphi = @(a) p'*gf(x + a*p, varargin{:});
f_bar = 0.001;
alpha = linesearch_95101077(f_bar, phi, dphi, c1, c2);

x_new = x + alpha*p;
g_new = gf(x_new);
delta = x_new - x;
gamma = g_new - g;

C = gamma'*delta/(delta'*delta) * I;

% Now that the initial C is set, we shall enter the main loop.
iter = 1;
while norm(g) > Stop_tol
    p = -C * g;
    
    syms a;
    phi = @(a) f(x + a*p, varargin{:});
    dphi = @(a) p'*gf(x + a*p, varargin{:});
    f_bar = 0.001;
    alpha = linesearch_95101077(f_bar, phi, dphi, c1, c2);
    
    x_new = x + alpha*p;
    g_new = gf(x_new);
    delta = x_new - x;
    gamma = g_new - g;
    
    a = 1/(gamma'*delta);
    C = (I - a*delta*gamma')*C*(I-a*gamma*delta') + a*delta*delta';
    
    g = g_new;
    x = x_new;
    
    iter = iter + 1;
end

x_min = x;
f_min = f(x, varargin{:});