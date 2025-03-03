function [Q_emp] = compartment_emptying(Q_pr_forw_cont_comp_1,Q_pr_forw_cont_comp_2,Q_pr_forw_cont_comp_3,occlusion_sph_comp_4,r_ini_comp_3,mu,rho,correction_a_2,correction_a_1)

D_duodenum = 2; % cm Duodenum diameter
D_TA = 3; % cm Terminal antrum diameter
K = 1.5; % Friction coefficient

% Compute total flow rate
Q_PA_MA_TA = Q_pr_forw_cont_comp_1 + Q_pr_forw_cont_comp_2 + Q_pr_forw_cont_comp_3;

% Compute average diameter and friction radius
D_star = (D_duodenum + D_TA) ./ 2;
r_fric = D_star ./ 2;

% Compute frictional velocity
u_fric = (abs(Q_PA_MA_TA) ./ (pi .* power(r_fric, 2)));

% Compute Reynolds number
Re_enter_check = (rho .* u_fric .* r_ini_comp_3 .* 2) ./ mu;

% Compute correction factor
correction = tanh(power(correction_a_2 .* Re_enter_check, correction_a_1));

% Compute friction length
L_fric = K .* D_star;

% Compute quadratic equation coefficients
b_quad = ((correction .* 64) .* (mu ./ rho) .* L_fric) ./ power(D_star, 2);
a_quad = 1;
c_quad = power(u_fric, 2);

% Compute emptying velocity
u_emp = (-b_quad + sqrt(power(b_quad, 2) + 4 .* a_quad .* c_quad)) ./ (2 .* a_quad);

% Compute and Convert emptying flow rate from cm³/s to mL/min
Q_emp = u_emp .* pi .* power(r_fric, 2) .* 60;

end
