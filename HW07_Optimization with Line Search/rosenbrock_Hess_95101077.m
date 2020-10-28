function y = rosenbrock_Hess_95101077(x)
global Hess_count
y = [-400*x(2)+1200*x(1)^2+2, -400*x(1); -400*x(1), 200];
Hess_count = Hess_count + 1;