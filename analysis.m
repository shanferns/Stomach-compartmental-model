%% Analysis

% Inputs:
% time(:,1)           - Array containing time values from the simulation
% a(:,1)            - Gastric flow rate values through PS values (Q_comp_sph) variable in code
% a(:,2)            - Compartment 1 velocity values (compartment_1_velocity) variable in code
% a(:,3)            - Compartment 2 velocity values compartment_2_velocity variable in code
% a(:,4)            - Compartment 3 velocity values compartment_3_velocity variable in code
% a(:,5)            - Compartment 4 velocity values compartment_4_velocity variable in code

% Find the nearest time to target values
target_min = 145;
Array_min = time(:,1);
Index_min = find(min(abs(Array_min - target_min)) == abs(Array_min - target_min));

target_max = 385;
Array_max = time(:,1);
Index_max = find(min(abs(Array_max - target_max)) == abs(Array_max - target_max));

% Extract the portion of the time data that is between the targets
time_new = time(Index_min:Index_max, 1);

% Interpolation of flow rate data
time_new_interpolated = time_new(1,1):0.01:time_new(end, 1);
flowrate_interpolated = interp1(time_new, a(Index_min:Index_max, 1), time_new_interpolated);

% Average flow rate
Average_flowrate = (1 / (Index_max - Index_min + 1)) * sum(a(Index_min:Index_max, 1));
Average_flowrate_interpolated = mean(flowrate_interpolated);

% Gastric mixing compartments lengths
length_PA = 7;
length_MA = 9.295;
length_TA = 13;
length_PS = 13.5;

comp_1_length = length_PA;
comp_2_length = length_MA - length_PA;
comp_3_length = length_TA - length_MA;
comp_4_length = length_PS - length_TA;

% Calculating average velocity between compartments
Average_velocity = (1/3) * (abs((a(Index_min:Index_max, 2) - a(Index_min:Index_max, 3)) / comp_2_length) + ...
                           abs((a(Index_min:Index_max, 3) - a(Index_min:Index_max, 4)) / comp_3_length) + ...
                           abs((a(Index_min:Index_max, 4) - a(Index_min:Index_max, 5)) / comp_4_length));

% Interpolating average velocity
Average_velocity_interpolated = interp1(time_new, Average_velocity, time_new_interpolated);

% Gastric mixing calculation using Simpson's rule
gastric_mixing = (1 / 12) * simps(time_new_interpolated, Average_velocity_interpolated);