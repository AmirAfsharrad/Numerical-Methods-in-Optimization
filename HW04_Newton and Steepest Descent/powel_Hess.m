function y = powel_Hess(x)
global Hess_count
y =     [2 + 120*(x(1)-x(4))^2, 20, 0, -120*(x(1)-x(4))^2;...
        20, 200 + 12*(x(2)-2*x(3))^2, -24*(x(2)-2*x(3))^2, 0;...
        0, -24*(x(2)-2*x(3))^2, 10 + 48*(x(2)-2*x(3))^2, -10;...
        -120*(x(1)-x(4))^2, 0, -10, 10 + 120*(x(1)-x(4))^2];
Hess_count = Hess_count + 1;