function [r_fin,r_d] = compartment_radius(stretch,L_t,r_ini)

stretch_eq_num = 0.020429; % Equilibrium stretch threshold

% Compute deformation and final radius
if stretch > 1
    L_d = (stretch - stretch_eq_num) .* L_t;
    omega_1 = L_d ./ 4;
    omega_d = (omega_1 - (L_t ./ 4)) ./ 2;
    omega_2 = sqrt(power(omega_1, 2) - power(omega_d, 2));
    omega_3 = 2 .* omega_2;
    r_d = sqrt(power(omega_3, 2) - power(L_t ./ 2, 2));
    r_fin = r_ini - r_d;
else
    r_fin = r_ini;
    r_d = 0;
end

end