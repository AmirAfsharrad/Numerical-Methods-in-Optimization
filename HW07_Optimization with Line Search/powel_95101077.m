function y = powel_95101077(x)
global func_count
y = (x(1)+10*x(2))^2 + 5*(x(3)-x(4))^2 + (x(2)-2*x(3))^4 + 10*(x(1)-x(4))^4;
func_count = func_count + 1;
