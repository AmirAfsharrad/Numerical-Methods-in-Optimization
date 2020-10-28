function result = linesearch_95101077(f_bar, phi, dphi, c1, c2)
phi0 = phi(0);
dphi0 = dphi(0);
alpha_max = (f_bar - phi0)/(c1*dphi0);
alpha_prev = 0;
alpha = 1;
i = 1;
while(1)
    current_phi = phi(alpha);
    if current_phi <= f_bar
        result = alpha;
        return;
    end
    if (current_phi > (phi0 + c1*alpha*dphi0)) || (i > 1 && current_phi > phi(alpha_prev))
        result = zoom_95101077(alpha_prev, alpha, phi, dphi, c1, c2);
        return;
    end
    current_dphi = dphi(alpha);
    if (abs(current_dphi) <= -c2*dphi0)
        result = alpha;
        return;
    end
    if (current_dphi >= 0)
        result = zoom_95101077(alpha, alpha_prev, phi, dphi, c1, c2);
        return;
    end
    if (alpha_max <= 2*alpha - alpha_prev)
        alpha_prev = alpha;
        alpha = alpha_max;
    else
        A = 2*alpha - alpha_prev;
        B = min(alpha_max, alpha + 10*(alpha - alpha_prev));
        alpha_prev = alpha;
        alpha = (A+B)/2;
    end
    i = i+1;
end