function result = zoom_95101077(a, b, phi, dphi, c1, c2)
phi0 = phi(0);
dphi0 = dphi(0);
while(1)
    phi_a = phi(a);
    if (abs(phi_a) < 10^-10)
        result = alpha_j;
        sprintf('|dPHI(a)| is too small. More iterations may cause problems!');
        return;
    end
    dphi_a = dphi(a);
    temp_phi0 = phi_a;
    temp_dphi0 = (b-a)*dphi_a;
    
    z = -temp_dphi0/(2*temp_phi0);
    phi_z = phi(a+(b-a)*z);
    if (phi_z < temp_phi0 && phi_z < temp_phi0)
        alpha_j = a + z*(b-a);
    else
        alpha_j = (a+b)/2;
    end
    phi_j = phi(alpha_j);
    if (phi_j > phi0 + c1*alpha_j*dphi0) || (phi_j >= phi_a)
        b = alpha_j;
    else
        dphi_j = dphi(alpha_j);
        if abs(dphi_j) <= -c2*dphi0
            result = alpha_j;
            return
        end
        if dphi_j*(b - a) >= 0
            b = a;
        end
        a = alpha_j;
    end
end