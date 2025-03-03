function [u_pr] = compartment_peristalsis(phi,r_star,r_ini,c,mu)

V_star = (phi .* (4 + phi)) ./ (2 + 3 .* power(phi, 2));

% Compute pressure gradient
d_P_d_Y = -((2.*phi -(1./2).*power(phi,2)).*V_star - (1 +(1./2).*power(phi,2)) + power(r_star./r_ini,2)).*((-8.*mu.*c.*power(r_ini,2))./power(r_star,4));

% Compute peristaltic flow velocity
u_pr = -(1 / (8 * mu)) .* d_P_d_Y .* power(r_star, 2);

end
