function y = rosenbrock_95101077(x)
global func_count
y = 100*(x(2)-x(1)^2)^2 + (1-x(1))^2;
func_count = func_count + 1;