function [compartment_1_velocity, compartment_2_velocity, compartment_3_velocity, compartment_4_velocity] = compartment_velocity( ...
    u_js_comp_1_TA, u_js_comp_2_TA, u_js_comp_1_MA, u_pr_back_cont_comp_3, u_pr_back_cont_comp_2, u_pr_back_cont_comp_1, ...
    Q_comp_sph_comp_4, Q_pr_forw_cont_comp_3, Q_pr_forw_cont_comp_2, Q_pr_forw_cont_comp_1, Q_sq_relax_comp_3, ...
    r_ini_comp_1, r_ini_comp_2, r_ini_comp_3, r_ini_comp_4, occlusion_sph_comp_4)
% COMPARTMENT_VELOCITY - Computes velocity in four compartments based on jet flows and peristalsis.
%
% Inputs:
%   u_js_comp_1_TA       - Jet velocity from terminal antrum (TA) to compartment 1.
%   u_js_comp_2_TA       - Jet velocity from terminal antrum (TA) to compartment 2.
%   u_js_comp_1_MA       - Jet velocity from middle antrum (MA) to compartment 1.
%   u_pr_back_cont_comp_3 - Reverse peristaltic velocity in compartment 3 (closed PS).
%   u_pr_back_cont_comp_2 - Reverse peristaltic velocity in compartment 2 (closed PS).
%   u_pr_back_cont_comp_1 - Reverse peristaltic velocity in compartment 1 (closed PS).
%   Q_comp_sph_comp_4    - Flow rate through the pyloric sphincter (compartment 4).
%   Q_pr_forw_cont_comp_3 - Forward flow rate due to peristalsis in compartment 3.
%   Q_pr_forw_cont_comp_2 - Forward flow rate due to peristalsis in compartment 2.
%   Q_pr_forw_cont_comp_1 - Forward flow rate due to peristalsis in compartment 1.
%   Q_sq_relax_comp_3    - Flow rate due to relaxation in compartment 3.
%   r_ini_comp_1         - Initial radius of compartment 1.
%   r_ini_comp_2         - Initial radius of compartment 2.
%   r_ini_comp_3         - Initial radius of compartment 3.
%   r_ini_comp_4         - Initial radius of compartment 4.
%   occlusion_sph_comp_4 - Occlusion of the pyloric sphincter
%
% Outputs:
%   compartment_1_velocity - Velocity in compartment 1.
%   compartment_2_velocity - Velocity in compartment 2.
%   compartment_3_velocity - Velocity in compartment 3.
%   compartment_4_velocity - Velocity in compartment 4.

%% Compartment 1 Velocity
% Compute emptying velocity in compartment 1
compartment_1_velocity_inter = (-Q_pr_forw_cont_comp_1) ./ (pi * power(r_ini_comp_1, 2));

% Compute jet velocities: contributions from TA, MA, and reverse peristalsis (closed PS)
velocity_jet_comp_1 = u_js_comp_1_TA + u_js_comp_1_MA + u_pr_back_cont_comp_1;

% Final velocity considering sphincter occlusion
compartment_1_velocity = compartment_1_velocity_inter .* occlusion_sph_comp_4 ...
                         + velocity_jet_comp_1 .* (1 - occlusion_sph_comp_4) ...
                         + (-Q_sq_relax_comp_3) ./ (pi * power(r_ini_comp_1, 2));

%% Compartment 2 Velocity
% Compute emptying velocity in compartment 2
compartment_2_velocity_inter = (-Q_pr_forw_cont_comp_1 - Q_pr_forw_cont_comp_2) ./ (pi * power(r_ini_comp_2, 2));

% Compute jet velocities: contributions from TA and reverse peristalsis (closed PS)
velocity_jet_comp_2 = u_js_comp_2_TA + u_pr_back_cont_comp_2;

% Final velocity considering sphincter occlusion
compartment_2_velocity = compartment_2_velocity_inter .* occlusion_sph_comp_4 ...
                         + velocity_jet_comp_2 .* (1 - occlusion_sph_comp_4) ...
                         + (-Q_sq_relax_comp_3) ./ (pi * power(r_ini_comp_2, 2));

%% Compartment 3 Velocity
% Compute emptying velocity in compartment 3
compartment_3_velocity_inter = (-Q_pr_forw_cont_comp_1 - Q_pr_forw_cont_comp_2 - Q_pr_forw_cont_comp_3) ./ (pi * power(r_ini_comp_3, 2));

% Compute reverse flow due to peristalsis and closed PS
velocity_jet_comp_3 = u_pr_back_cont_comp_3;

% Final velocity considering sphincter occlusion
compartment_3_velocity = compartment_3_velocity_inter .* occlusion_sph_comp_4 ...
                         + velocity_jet_comp_3 .* (1 - occlusion_sph_comp_4);

%% Compartment 4 Velocity
% Compute velocity through the pyloric sphincter
compartment_4_velocity_inter = -Q_comp_sph_comp_4 ./ (pi * power(r_ini_comp_4, 2));

% Final velocity (since compartment 4 only has outflow)
compartment_4_velocity = compartment_4_velocity_inter;

end