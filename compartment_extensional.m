function [U, u_sq] = compartment_extensional(r_d, r_ini, L_t, L_d, stress, Elast, dashpot_2)
% COMPARTMENT_SQUEEZE - Computes the squeezing velocity and associated flow parameters in a compartment.
%
% Inputs:
%   r_d        - Deformed radius.
%   r_ini      - Initial radius of the compartment.
%   L_t        - Initial tissue length of the compartment.
%   L_d        - Deformed tissue length of the compartment.
%   stress     - stress.
%   Elast      - Hyperelastic principle stress.
%   dashpot_2  - Dashpot coefficient (viscous resistance).
%
% Outputs:
%   U   - Velocity of gastric wall due to extensional.
%   u_sq - Gastric contents velocity by extensional flow.

% Compute the velocity of gastric wall due to extensional
U = sqrt(3 .* power(r_d, 2) + power(L_t, 2)) .* (L_t ./ (4 .* r_d)) .* (1 ./ dashpot_2) .* (stress - Elast);

% Compute the average velocity velocity of gastric wall due to extensional
U_avg = (((L_t * r_d) / 2 + 2 * sqrt(power(L_d, 2) / 16 - power(L_d / 8 - L_t / 8, 2)) * (L_d / 8 - L_t / 8)) * U) ...
        / (L_t * r_d);

% Compute the final deformed radius
r_fin = r_ini - r_d;

% Compute the gastric contents velocity by extensional flow
u_sq = (U_avg * L_t * r_fin) / power(r_ini, 2);

end