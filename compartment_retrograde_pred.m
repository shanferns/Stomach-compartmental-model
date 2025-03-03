function [u_js_comp_pred] = compartment_retrograde_pred(H_comp_ini, H_comp_pred, x_j_ini_comp_3, ...
                                                        u_pr_back_comp, xi_j_comp_pred, Phi_j_comp_ini, ...
                                                        mu, rho)
% COMPARTMENT_RETROGRADE_PRED - Computes the predicted retrograde jet velocity in a compartmental model.
%
% Inputs:
%   x_j_ini_comp_3  - Initial jet penetration distance in the compartment.
%   u_pr_back_comp  - Initial backward jet velocity.
%   xi_j_comp_pred  - Dimensionless penetration parameter for prediction.
%   Phi_j_comp_ini  - Initial jet momentum flux.
%   mu             - Dynamic viscosity of the fluid.
%   rho            - Density of the fluid.
%
% Output:
%   u_js_comp_pred - Predicted retrograde jet velocity.

% Compute kinematic viscosity (nu)
nu = mu / rho;

% Compute distance the jet has to travel
L_jet_comp_pred = H_comp_ini - H_comp_pred;

% Compute new jet penetration distance
x_2_comp_pred = x_j_ini_comp_3 + L_jet_comp_pred;

% Compute non-dimensional parameter xi_1_star
xi_1_star_comp_pred = (nu * u_pr_back_comp * L_jet_comp_pred) / Phi_j_comp_ini;

% Compute predicted retrograde jet velocity
u_js_comp_pred = (3 * Phi_j_comp_ini) / (8 * pi * nu * x_2_comp_pred * ...
                    (xi_1_star_comp_pred + (1/4) * xi_j_comp_pred^2)^2);

% Handle NaN values by setting them to zero
u_js_comp_pred(isnan(u_js_comp_pred)) = 0;

% Ensure output is a real number
u_js_comp_pred = real(u_js_comp_pred);

end