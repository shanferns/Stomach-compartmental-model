function [Phi_j_comp_ini, x_j_ini_comp_ini, xi_j_comp_ini] = compartment_retrograde_ini(u_pr_back_comp_ini, r_fin_comp_ini, mu, rho)
% COMPARTMENT_RETROGRADE_INI - Computes initial values for retrograde flow in a compartmental model.
%
% Inputs:
%   u_pr_back_comp_ini - Initial backward velocity (jet velocity) in the compartment.
%   r_fin_comp_ini     - Final radius of the jet in the compartment.
%   mu                - Viscosity of the fluid.
%   rho               - Density of the fluid.
%
% Outputs:
%   Phi_j_comp_ini     - Jet momentum flux.
%   x_j_ini_comp_ini   - Initial jet reference distance.
%   xi_j_comp_ini      - Dimensionless parameter.

% Compute kinematic viscosity (nu)
nu = mu / rho;  

% Compute the initial jet momentum flux (Phi_j)
Phi_j_comp_ini = pi * (u_pr_back_comp_ini * r_fin_comp_ini)^2;

% Compute initial jet reference distance (x_j_ini)
x_j_ini_comp_ini = ((3 * (r_fin_comp_ini^4) * Phi_j_comp_ini * u_pr_back_comp_ini) / ...
                   (512 * (nu^3) * pi))^(1/3);

% Compute the dimensionless penetration parameter (xi_j)
xi_j_comp_ini = (sqrt(3 * Phi_j_comp_ini) * r_fin_comp_ini) / ...
                (sqrt(16 * pi) * nu * x_j_ini_comp_ini);

end