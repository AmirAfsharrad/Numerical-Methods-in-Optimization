function y = rosenbrock_grad_95101077(x)
global grad_count
y = [200*(x(2)-x(1)^2)*(-2*x(1)) - 2*(1-x(1)); 200*(x(2)-x(1)^2)];
grad_count = grad_count + 1;