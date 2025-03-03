function [r_star_forw_max,r_star_back_max,u_pr_forw_max,u_pr_back_max] = compartment_max(kappa,s_ICC,s_SMC,G_coup,V_m_rest_ICC,V_m_rest_SMC,stress_var_max,L_t,r_ini,mu,c)

% Define maximum ICC current
I_ICC_max = kappa;

% Time constant for peak response
time_peak_max = 4.2;

% Compute maximum steady-state ICC membrane voltage
V_m_ICC_max = V_m_rest_ICC + I_ICC_max .* exp(-s_ICC.^2 * time_peak_max.^2);

% Compute maximum steady-state SMC membrane voltage
V_m_SMC_max = (V_m_rest_SMC + G_coup .* V_m_ICC_max) ./ (1 + G_coup .* exp(-power(s_SMC .* time_peak_max, 2)));

% Define polynomial coefficients for AM formation
AM_coef = [6.7920262849441e-11, 2.36064401621829e-08, 3.41125846263303e-06, 0.000263493012596117, 0.0116204115288108, 0.288856232830177, 3.72982779244224, 20.4075090775852];

% Compute active myosin (AM) formation
AM_max = polyval(AM_coef, V_m_SMC_max);

% Define polynomial coefficients for AMp formation
AMp_coef = [-2.87664792399098e-09, -9.74192098725501e-07, -0.000135381220925182, -0.00982458982596925, -0.388845344365181, -7.81499630175955, -59.9272590298836];

% Compute phosphorylated active myosin (AMp) formation
AMp_max = polyval(AMp_coef, V_m_SMC_max);

% Compute the maximum number of cross-bridges formed
%Maximum number of cross bridges formed

Bridge_max = 23.99436;

n_c_max = (AMp_max + AM_max) / Bridge_max;

% Compute the maximum stress response from cross-bridge formation
stress_max = stress_var_max * n_c_max;

% Define coefficients for stretch response
stretch_coef = [0.0251365429560003, 0.000410465607457354, 0.027933603804621, 4.20428720524137, 2.11791424119782];

% Compute the maximum stretch response
stretch_max = stretch_coef(1) .* (log(power(stretch_coef(2) .* (stress_max + stretch_coef(3)), stretch_coef(4)))) + stretch_coef(5);

% Equilibrium stretch threshold
stretch_eq_num = 0.020429;

% Compute maximum contraction (deformation) based on stretch
if stretch_max > 1
    L_d_max = (stretch_max - stretch_eq_num) * L_t;
    omega_1_max = L_d_max / 4;
    omega_d_max = (omega_1_max - (L_t / 4)) / 2;
    omega_2_max = sqrt(power(omega_1_max, 2) - power(omega_d_max, 2));
    omega_3_max = 2 * omega_2_max;
    r_d_max = sqrt(power(omega_3_max, 2) - power(L_t / 2, 2));
    r_fin_max = r_ini - r_d_max;
else
    r_fin_max = r_ini;
    r_d_max = 0;
end

% Define the initial and final radii
r_star_forw_max = r_ini;
phi_max = r_d_max / r_ini;
r_star_back_max = r_fin_max;

% Compute sphincter opening function
V_star_max = (phi_max * (4 + phi_max)) / (2 + 3 * power(phi_max, 2));

% Compute peristaltic flow for forward propagation (sphincter open)
d_P_d_Y_forw_max = -((2 * phi_max - (1/2) * power(phi_max, 2)) * V_star_max - ...
                     (1 + (1/2) * power(phi_max, 2)) + power(r_star_forw_max / r_ini, 2)) * ...
                     ((-8 * mu * c * power(r_ini, 2)) / power(r_star_forw_max, 4));
                  
u_pr_forw_max = -(1 / (8 * mu)) * d_P_d_Y_forw_max * (power(r_star_forw_max, 2));

% Compute peristaltic flow for backward propagation (sphincter closed)
d_P_d_Y_back_max = -((2 * phi_max - (1/2) * power(phi_max, 2)) * V_star_max - ...
                     (1 + (1/2) * power(phi_max, 2)) + power(r_star_back_max / r_ini, 2)) * ...
                     ((-8 * mu * c * power(r_ini, 2)) / power(r_star_back_max, 4));
                  
u_pr_back_max = -(1 / (8 * mu)) * d_P_d_Y_back_max * (power(r_star_back_max, 2));

end
