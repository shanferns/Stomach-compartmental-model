function dy = Compartment(time, y, kappa, kappa_PS, mu, rho, t_end, t_end_PS)
    % Compartment Function: Defines the system of ODEs for multiple compartments
    % Inputs:
    %   time        - Current time or time array
    %   y           - State variables for each compartment
    %   kappa       - Parameter for maximum input ICC antrum current
    %   kappa_PS    - Parameter for maximum input ICC PS current
    %   mu          - Gastric contents visocity
    %   rho         - Gastric contents Denisty
    %   t_end       - Time period of antrum ICC wave
    %   t_end_PS    - Time period of PS ICC wave
    
    % Initialize state variables for Compartment 1
    V_m_ICC_comp_1 = y(1, :);      % Membrane potential of ICC in Compartment 1
    V_m_SMC_comp_1 = y(2, :);      % Membrane potential of SMC in Compartment 1
    Ca_i_SM_comp_1 = y(3, :);      % Cytosolic calcium in SMC in Compartment 1
    f_Ltype_SM_comp_1 = y(4, :);  % Activation of L-type channels in Compartment 1
    d_Ltype_SM_comp_1 = y(5, :);  % Deactivation of L-type channels in Compartment 1
    f_ca_Ltype_SM_comp_1 = y(6, :); % Calcium binding to L-type channels in Compartment 1
    f_LVA_SM_comp_1 = y(7, :);    % Activation of LVA channels in Compartment 1
    d_LVA_SM_comp_1 = y(8, :);    % Deactivation of LVA channels in Compartment 1
    Ca2_CaM_comp_1 = y(9, :);     % Calcium-Calmodulin complex in Compartment 1
    CaM_comp_1 = y(10, :);        % Calmodulin concentration in Compartment 1
    Ca4_CaM_comp_1 = y(11, :);    % Calcium-Calmodulin complex (4Ca) in Compartment 1
    CaM_MLCK_comp_1 = y(12, :);   % Calmodulin-MLCK complex in Compartment 1
    MLCK_comp_1 = y(13, :);       % Myosin Light Chain Kinase (MLCK) in Compartment 1
    Ca2_CaM_MLCK_comp_1 = y(14, :); % Calcium-Calmodulin-MLCK complex in Compartment 1
    Ca4_CaM_MLCK_comp_1 = y(15, :); % Calcium-Calmodulin-MLCK complex (4Ca) in Compartment 1
    CaM_Buf_comp_1 = y(16, :);    % Calmodulin buffering in Compartment 1
    Buf_comp_1 = y(17, :);        % Buffering species concentration in Compartment 1
    Mp_comp_1 = y(18, :);         % Myosin Phosphorylation in Compartment 1
    M_comp_1 = y(19, :);          % Myosin state in Compartment 1
    AMp_comp_1 = y(20, :);        % Activated Myosin Phosphorylation in Compartment 1
    AM_comp_1 = y(21, :);         % Activated Myosin state in Compartment 1
    stretch_comp_1 = y(22, :);    % Stretch in Compartment 1

    % Initialize state variables for Compartment 2 (similar to Compartment 1)
    V_m_ICC_comp_2 = y(23, :);
    V_m_SMC_comp_2 = y(24, :);
    Ca_i_SM_comp_2 = y(25, :);
    f_Ltype_SM_comp_2 = y(26, :);
    d_Ltype_SM_comp_2 = y(27, :);
    f_ca_Ltype_SM_comp_2 = y(28, :);
    f_LVA_SM_comp_2 = y(29, :);
    d_LVA_SM_comp_2 = y(30, :);
    Ca2_CaM_comp_2 = y(31, :);
    CaM_comp_2 = y(32, :);
    Ca4_CaM_comp_2 = y(33, :);
    CaM_MLCK_comp_2 = y(34, :);
    MLCK_comp_2 = y(35, :);
    Ca2_CaM_MLCK_comp_2 = y(36, :);
    Ca4_CaM_MLCK_comp_2 = y(37, :);
    CaM_Buf_comp_2 = y(38, :);
    Buf_comp_2 = y(39, :);
    Mp_comp_2 = y(40, :);
    M_comp_2 = y(41, :);
    AMp_comp_2 = y(42, :);
    AM_comp_2 = y(43, :);
    stretch_comp_2 = y(44, :);

    % Initialize state variables for Compartment 3 (similar to Compartment 1)
    V_m_ICC_comp_3 = y(45, :);
    V_m_SMC_comp_3 = y(46, :);
    Ca_i_SM_comp_3 = y(47, :);
    f_Ltype_SM_comp_3 = y(48, :);
    d_Ltype_SM_comp_3 = y(49, :);
    f_ca_Ltype_SM_comp_3 = y(50, :);
    f_LVA_SM_comp_3 = y(51, :);
    d_LVA_SM_comp_3 = y(52, :);
    Ca2_CaM_comp_3 = y(53, :);
    CaM_comp_3 = y(54, :);
    Ca4_CaM_comp_3 = y(55, :);
    CaM_MLCK_comp_3 = y(56, :);
    MLCK_comp_3 = y(57, :);
    Ca2_CaM_MLCK_comp_3 = y(58, :);
    Ca4_CaM_MLCK_comp_3 = y(59, :);
    CaM_Buf_comp_3 = y(60, :);
    Buf_comp_3 = y(61, :);
    Mp_comp_3 = y(62, :);
    M_comp_3 = y(63, :);
    AMp_comp_3 = y(64, :);
    AM_comp_3 = y(65, :);
    stretch_comp_3 = y(66, :);

    % Initialize state variables for Compartment 4 (similar to Compartment 1)
    V_m_ICC_comp_4 = y(67, :);
    V_m_SMC_comp_4 = y(68, :);
    Ca_i_SM_comp_4 = y(69, :);
    f_Ltype_SM_comp_4 = y(70, :);
    d_Ltype_SM_comp_4 = y(71, :);
    f_ca_Ltype_SM_comp_4 = y(72, :);
    f_LVA_SM_comp_4 = y(73, :);
    d_LVA_SM_comp_4 = y(74, :);
    Ca2_CaM_comp_4 = y(75, :);
    CaM_comp_4 = y(76, :);
    Ca4_CaM_comp_4 = y(77, :);
    CaM_MLCK_comp_4 = y(78, :);
    MLCK_comp_4 = y(79, :);
    Ca2_CaM_MLCK_comp_4 = y(80, :);
    Ca4_CaM_MLCK_comp_4 = y(81, :);
    CaM_Buf_comp_4 = y(82, :);
    Buf_comp_4 = y(83, :);
    Mp_comp_4 = y(84, :);
    M_comp_4 = y(85, :);
    AMp_comp_4 = y(86, :);
    AM_comp_4 = y(87, :);
    stretch_comp_4 = y(88, :);

    % Additional flow and control variables across compartments
    Q_pr_forw_cont_comp_1 = y(89, :);
    Q_pr_forw_cont_comp_2 = y(90, :);
    Q_pr_forw_cont_comp_3 = y(91, :);

    u_pr_back_cont_comp_1 = y(92, :);
    u_pr_back_cont_comp_2 = y(93, :);
    u_pr_back_cont_comp_3 = y(94, :);

    % Define compartment lengths (in cm)
    H_comp_1 = 7;
    H_comp_2 = 9.2950;
    H_comp_3 = 13;
    H_comp_4 = 13.5;

    comp_1_length = H_comp_1;
    comp_2_length = H_comp_2 - H_comp_1;
    comp_3_length = H_comp_3 - H_comp_2;

    % Define initial radii for each compartment (in cm)
    r_ini_comp_1 = 5.5 / 2;  % cm
    r_ini_comp_2 = 5 / 2;    % cm
    r_ini_comp_3 = 3 / 2;    % cm
    r_ini_comp_4 = 0.9 / 2;  % cm

    % Error thresholds for compartment dynamics
    error_open = 0.1;      % Threshold for flow opening dynamics (volumetric flow rate (cm^3/s))
    error_closed = -0.01;  % Threshold for flow closing dynamics (velocity (cm/s))



%% Electrical Activity Parameters

% Cyclic time (unit s)
% Defining the cyclic time for each compartment
time_cyc_comp_1 = time;
time_cyc_comp_2 = time;
time_cyc_comp_3 = time;
time_cyc_comp_4 = time;

% Time open (unit s)
% Defines how long each compartment is "open" during its cycle
t_open = 7;              % Time open for Compartment 1
t_open_1 = 7;            % Time open for Compartment 2 (or other compartments)

% Conduction velocity (unit cm/s)
% Defines the speed of signal conduction across compartments
c_comp_1 = 0.25;         % Conduction velocity for Compartment 1
c_comp_2 = 0.25;         % Conduction velocity for Compartment 2
c_comp_3 = 0.6;          % Conduction velocity for Compartment 3

% Decay constants for SMC and ICC
s_ICC = 0.05;            % Decay constant for ICC
s_SMC = 0.05;            % Decay constant for SMC

% Correction factors for geometry resistance at the PS during gastric flow
correction_a_1 = 0.92;  
correction_a_2 = 0.05;  

% Gap junction coupling conductance (unit S)
G_coup_comp_2_3_4 = 1.255; % Coupling conductance for compartments 2, 3, and 4
G_coup_comp_1 = G_coup_comp_2_3_4 * 0.5; % Coupling conductance for Compartment 1 (half of the others)

% Resting membrane potentials (unit mV)
V_m_rest_ICC = -70;      % Resting membrane potential for ICC (Interstitial Cells of Cajal)
V_m_rest_SMC = -70;      % Resting membrane potential for SMC (Smooth Muscle Cells)

% Calcium concentration (SMC) and related parameters
F = 96484.6;             % Faraday's constant (units in Environment)
Vol_SM = 3.5e-3;        % Volume in SMC (membrane volume)
tau_f_Ltype_SM = 225.6231e-3; % Time constant for activation of L-type channel in SMC
tau_d_Ltype_SM = 1.2331e-3;  % Time constant for deactivation of L-type channel in SMC
tau_f_ca_Ltype_SM = 5.247e-3; % Time constant for calcium activation in L-type channel
tau_d_LVA_SM = 7.8706e-3; % Time constant for LVA channel deactivation in SMC
G_max_Ltype_2 = 65.0;    % Maximum conductance for L-type channels in SMC
RToF = 26.7137;          % Voltage related parameter
T_correction_Ca = 2.6235; % Calcium correction factor
Ca_o_SM = 2.5;           % Extracellular calcium concentration in mM
G_max_LVA = 0.18;        % Maximum conductance for LVA channels
J_max_CaSR = 317.05;     % Maximum calcium release rate from SR in mM/s

%% Mechanical Activity Parameters

% Reactions for MLC activation from Gajendiran & Buist (Table 1)
% Defining various reaction rates for calcium and muscle interactions
Kf_Ca2CaM = 12.0;        % Forward rate for CaM and Ca2 binding (uM/s)
Kr_Ca2CaM = 12.0;        % Reverse rate for CaM and Ca2 binding (1/s)
Kf_Ca2Ca4 = 480.0;       % Forward rate for Ca2 to Ca4 conversion (uM/s)
Kr_Ca2Ca4 = 1200.0;      % Reverse rate for Ca2 to Ca4 conversion (1/s)
Kf_CaMMLCK = 5.0;        % Forward rate for CaM and MLCK binding (uM/s)
Kr_CaMMLCK = 135.0;      % Reverse rate for CaM and MLCK binding (1/s)
Kf_Ca2CaMtoCa2_CaM_MLCK = 840.0; % Forward rate for Ca2 to MLCK activation (uM/s)
Kr_Ca2CaMtoCa2_CaM_MLCK = 45.4;  % Reverse rate for Ca2 to MLCK activation (1/s)
Kf_MLCKact = 28.0;       % Forward rate for MLCK activation (uM/s)
Kr_MLCKact = 0.0308;     % Reverse rate for MLCK activation (1/s)
Kf_Ca2CaMMLCK = 120.0;   % Forward rate for Ca2 to CaM-MlCK complex (uM/s)
Kr_Ca2CaMMLCK = 4.0;     % Reverse rate for Ca2 to CaM-MlCK complex (1/s)
Kf_CaCaMMLCK = 7.5;      % Forward rate for Ca2-CaM to CaM-MLCK complex (uM/s)
Kr_CaCaMMLCK = 3.75;     % Reverse rate for Ca2-CaM to CaM-MLCK complex (1/s)
Kf_CaMBuf = 5.0;         % Forward rate for CaM buffering (uM/s)
Kr_CaMBuf = 25.0;        % Reverse rate for CaM buffering (1/s)
Kf_CaMBufdis = 7.6;      % Forward rate for CaM unbuffering (uM/s)
Kr_CaMBufdis = 22.8;     % Reverse rate for CaM unbuffering (1/s)
Vmax_MLCKact = 27.0;     % Maximum rate for MLCK activation (1/s)
Km_MLCKact = 10.0;       % Michaelis-Menten constant for MLCK activation (uM)
HM_k3 = 15.0;            % Reaction rate constant (1/s)
HM_k4 = 5.0;             % Reaction rate constant (1/s)
Vmax_MLCP = 16.0;        % Maximum rate for MLCP (1/s)
Km_MLCP = 15.0;          % Michaelis-Menten constant for MLCP (uM)
HM_k7 = 10.0;            % Reaction rate constant (1/s)
HM_k8 = 0.0;             % Reaction rate constant (1/s)

MLCP = 7.5;              % Myosin Light Chain Phosphatase concentration
stress_max = 238.3;      % Maximum stress (kPa)

% NLVM Model Parameters
% Defining parameters for the non-linear visoelastic model
S_1_comp_1_2_3_4 = 0.448;
S_2_comp_1_2_3_4 = 0.894; 
S_3_comp_1_2_3_4 = 2;
S_4_comp_1_2_3_4 = 4.199;
S_5_comp_1_2_3_4 = -0.187;
S_6_comp_1_2_3_4 = 5;

% Tissue Parameters (in cm)
% Defines the length of undeformed tissues in each compartment
L_t_comp_1 = 2.4;  % cm for Compartment 1
L_t_comp_2 = 2.4;  % cm for Compartment 2
L_t_comp_3 = 2.1;  % cm for Compartment 3
L_t_comp_4 = 6;    % cm for Compartment 4


   
%% Time for different compartments

% Time to start electrical activity in Compartment 1 based on its length and conduction velocity
t_start_comp_1 = (comp_1_length / c_comp_1);

% If the cyclic time for Compartment 1 is less than the start time, set current to 0, otherwise adjust the cyclic time
if (time_cyc_comp_1 < t_start_comp_1) 
    I_ICC_comp_1 = 0;
else
    % Adjust the cyclic time after the start time
    time_cyc_comp_1 = time_cyc_comp_1 - t_start_comp_1;

    % Restart the wave cycle once it exceeds t_end (i.e., reset the time to within one period)
    while (time_cyc_comp_1 > t_end) 
        time_cyc_comp_1 = time_cyc_comp_1 - t_end;
    end

    % If the time is within the opening duration, set current to kappa (activation), else set it to 0
    if (time_cyc_comp_1 <= t_open) 
        I_ICC_comp_1 = kappa;  % Current is activated within this time range
    else
        I_ICC_comp_1 = 0;  % No current outside the opening period
    end
end

% Time to start electrical activity in Compartment 2 based on the combined length of Compartment 1 and Compartment 2, and their conduction velocities
t_start_comp_2 = (comp_1_length / c_comp_1) + (comp_2_length / c_comp_2);

% Similar process as for Compartment 1: adjust cyclic time, and reset it if necessary
if (time_cyc_comp_2 < t_start_comp_2) 
    I_ICC_comp_2 = 0;
else
    time_cyc_comp_2 = time_cyc_comp_2 - t_start_comp_2;
    while (time_cyc_comp_2 > t_end) 
        time_cyc_comp_2 = time_cyc_comp_2 - t_end;
    end

    % Activate current within the time period defined by t_open
    if (time_cyc_comp_2 <= t_open) 
        I_ICC_comp_2 = kappa; 
    else
        I_ICC_comp_2 = 0;  
    end
end

% Time to start electrical activity in Compartment 3 based on the combined length of Compartment 1, 2, and 3, and their conduction velocities
t_start_comp_3 = (comp_1_length / c_comp_1) + (comp_2_length / c_comp_2) + (comp_3_length / c_comp_3);

% Same process as previous compartments, adjusting cyclic time and resetting it
if (time_cyc_comp_3 < t_start_comp_3) 
    I_ICC_comp_3 = 0;
else
    time_cyc_comp_3 = time_cyc_comp_3 - t_start_comp_3;
    while (time_cyc_comp_3 > t_end) 
        time_cyc_comp_3 = time_cyc_comp_3 - t_end;
    end

    % Activate current within the time period defined by t_open
    if (time_cyc_comp_3 <= t_open) 
        I_ICC_comp_3 = kappa; 
    else
        I_ICC_comp_3 = 0;  
    end
end

% Time to start electrical activity in Compartment 4, which starts after Compartment 3
t_start_comp_4 = t_start_comp_3;

% Adjust cyclic time and reset it if necessary, then calculate activation current
if (time_cyc_comp_4 < t_start_comp_4) 
    I_ICC_comp_4 = 0;
else
    time_cyc_comp_4 = time_cyc_comp_4 - t_start_comp_4;
    while (time_cyc_comp_4 > t_end_PS) 
        time_cyc_comp_4 = time_cyc_comp_4 - t_end_PS;
    end

    % Activate current within the time period defined by t_open_1 for Compartment 4
    if (time_cyc_comp_4 <= t_open_1) 
        I_ICC_comp_4 = kappa_PS; 
    else
        I_ICC_comp_4 = 0;  
    end
end

%% Proximal Antrum - Stomach

% ODEs for electrical activity

% Dynamics of the membrane potential in the ICC (Interstitial Cells of Cajal) compartment.
dy(1,:) = (I_ICC_comp_1.*exp(-s_ICC.^2.*(time_cyc_comp_1).^2)-V_m_ICC_comp_1 + V_m_rest_ICC)./(exp(-s_ICC.^2.*(time_cyc_comp_1).^2));

% Coupling current between ICC and smooth muscle cells (SMCs) for the Proximal Antrum.
I_coup_comp_1 = G_coup_comp_1 .* (V_m_ICC_comp_1 - V_m_SMC_comp_1);

% Dynamics of the membrane potential in the smooth muscle cell compartment.
dy(2,:) = (I_coup_comp_1 .* exp(-s_SMC.^2 .* (time_cyc_comp_1).^2) - V_m_SMC_comp_1 + V_m_rest_SMC) ./ (exp(-s_SMC.^2 .* (time_cyc_comp_1).^2));

% Calcium dynamics and ion currents in smooth muscle cells (SMCs).

% Nernst equation for the calcium equilibrium potential in SMCs.
E_Ca_SM_2_comp_1 = 0.5 * RToF * log(Ca_o_SM / Ca_i_SM_comp_1);

% L-type calcium current in smooth muscle cells (SMCs).
I_Ltype_SM_comp_1 = G_max_Ltype_2 * f_Ltype_SM_comp_1 * d_Ltype_SM_comp_1 * f_ca_Ltype_SM_comp_1 * (V_m_SMC_comp_1 - E_Ca_SM_2_comp_1);

% Another calcium equilibrium potential for SMCs, and the LVA current.
E_Ca_SM_1_comp_1 = 0.5 * RToF * log(Ca_o_SM / Ca_i_SM_comp_1);
I_LVA_SM_comp_1 = G_max_LVA * f_LVA_SM_comp_1 * d_LVA_SM_comp_1 * (V_m_SMC_comp_1 - E_Ca_SM_1_comp_1);

% Calcium release from the sarcoplasmic reticulum (SR) in smooth muscle cells.
J_CaSR_SM_comp_1 = J_max_CaSR * (Ca_i_SM_comp_1 * 1.0)^1.34;

% Change in calcium ion concentration in smooth muscle cells due to ion currents.
dy(3,:) = 1 * ((-I_Ltype_SM_comp_1 - I_LVA_SM_comp_1) / (2.0 * 1.0 * 1.0 * F * Vol_SM) - J_CaSR_SM_comp_1);

% Activation and deactivation dynamics for L-type calcium channels.
f_inf_Ltype_SM_comp_1 = 1.0 / (1.0 + exp((V_m_SMC_comp_1 + 43.0) / 8.9));
dy(4,:) = (f_inf_Ltype_SM_comp_1 - f_Ltype_SM_comp_1) / tau_f_Ltype_SM;

d_inf_Ltype_SM_comp_1 = 1.0 / (1.0 + exp((V_m_SMC_comp_1 + 17.0) / -4.3));
dy(5,:) = (d_inf_Ltype_SM_comp_1 - d_Ltype_SM_comp_1) / tau_d_Ltype_SM;

% Calcium ion dynamics and binding in smooth muscle cells.
f_ca_inf_Ltype_SM_comp_1 = 1.0 - 1.0 / (1.0 + exp((Ca_i_SM_comp_1 - 0.00012401) / -0.0000131));
dy(6,:) = (f_ca_inf_Ltype_SM_comp_1 - f_ca_Ltype_SM_comp_1) / tau_f_ca_Ltype_SM;

% Activation and deactivation dynamics for LVA calcium channels.
tau_f_LVA_SM_comp_1 = T_correction_Ca * 7.58e-3 * exp(V_m_SMC_comp_1 * 0.00817);
f_inf_LVA_SM_comp_1 = 1.0 / (1.0 + exp((V_m_SMC_comp_1 + 15.8) / 7.0));
dy(7,:) = (f_inf_LVA_SM_comp_1 - f_LVA_SM_comp_1) / tau_f_LVA_SM_comp_1;

d_inf_LVA_SM_comp_1 = 1.0 / (1.0 + exp((V_m_SMC_comp_1 + 27.5) / -10.9));
dy(8,:) = (d_inf_LVA_SM_comp_1 - d_LVA_SM_comp_1) / tau_d_LVA_SM;

% Conversion of intracellular calcium concentration from milli to microscale
Ca_SMC_comp_1 = Ca_i_SM_comp_1 * 1000;

%% ODEs for mechanical activity

% The following equations describe the dynamics of calcium binding and interactions with various proteins in the smooth muscle cells of the proximal antrum.
% These include interactions with calmodulin (CaM), MLCK (Myosin Light Chain Kinase), buffers, and various complex formations that regulate muscle contraction.

dy(9,:) = Kf_Ca2CaM * Ca_SMC_comp_1 * Ca_SMC_comp_1 * CaM_comp_1 - Kr_Ca2CaM * Ca2_CaM_comp_1 - Kf_Ca2Ca4 * Ca_SMC_comp_1 * Ca_SMC_comp_1 * Ca2_CaM_comp_1 + Kr_Ca2Ca4 * Ca4_CaM_comp_1 - Kf_Ca2CaMtoCa2_CaM_MLCK * Ca2_CaM_comp_1 * MLCK_comp_1 + Kr_Ca2CaMtoCa2_CaM_MLCK * Ca2_CaM_MLCK_comp_1 + Kf_CaMBufdis * CaM_Buf_comp_1 * Ca_SMC_comp_1 * Ca_SMC_comp_1 - Kr_CaMBufdis * Ca2_CaM_comp_1 * Buf_comp_1;

% Further binding and dissociation events for calcium, CaM, and MLCK interactions.
dy(10,:) = -Kf_Ca2CaM * Ca_SMC_comp_1 * Ca_SMC_comp_1 * CaM_comp_1 + Kr_Ca2CaM * Ca2_CaM_comp_1 - Kf_CaMMLCK * CaM_comp_1 * MLCK_comp_1 + Kr_CaMMLCK * CaM_MLCK_comp_1 - Kf_CaMBuf * CaM_comp_1 * Buf_comp_1 + Kr_CaMBuf * CaM_Buf_comp_1;

% Dynamics of calcium-induced activation of MLCK and its associated effects.
dy(11,:) = Kf_Ca2Ca4 * Ca_SMC_comp_1 * Ca_SMC_comp_1 * Ca2_CaM_comp_1 - Kr_Ca2Ca4 * Ca4_CaM_comp_1 - Kf_MLCKact * Ca4_CaM_comp_1 * MLCK_comp_1 + Kr_MLCKact * Ca4_CaM_MLCK_comp_1;

% Dynamics of MLCK activation and its interaction with calcium and other proteins.
dy(12,:) = Kf_CaMMLCK * CaM_comp_1 * MLCK_comp_1 - Kr_CaMMLCK * CaM_MLCK_comp_1 - Kf_Ca2CaMMLCK * Ca_SMC_comp_1 * Ca_SMC_comp_1 * CaM_MLCK_comp_1 + Kr_Ca2CaMMLCK * Ca2_CaM_MLCK_comp_1;

% More interactions between calcium, MLCK, and associated molecules affecting contraction.
dy(13,:) = -Kf_CaMMLCK * CaM_comp_1 * MLCK_comp_1 + Kr_CaMMLCK * CaM_MLCK_comp_1 - Kf_Ca2CaMtoCa2_CaM_MLCK * Ca2_CaM_comp_1 * MLCK_comp_1 + Kr_Ca2CaMtoCa2_CaM_MLCK * Ca2_CaM_MLCK_comp_1 - Kf_MLCKact * Ca4_CaM_comp_1 * MLCK_comp_1 + Kr_MLCKact * Ca4_CaM_MLCK_comp_1;

% The MLCK activation process, also including complex dynamics with buffering proteins.
dy(14,:) = Kf_Ca2CaMtoCa2_CaM_MLCK * Ca2_CaM_comp_1 * MLCK_comp_1 - Kr_Ca2CaMtoCa2_CaM_MLCK * Ca2_CaM_MLCK_comp_1 + Kf_Ca2CaMMLCK * Ca_SMC_comp_1 * Ca_SMC_comp_1 * CaM_MLCK_comp_1 - Kr_Ca2CaMMLCK * Ca2_CaM_MLCK_comp_1 - Kf_CaCaMMLCK * Ca_SMC_comp_1 * Ca_SMC_comp_1 * Ca2_CaM_MLCK_comp_1 + Kr_CaCaMMLCK * Ca4_CaM_MLCK_comp_1;

% Further dynamics of MLCK activation and calcium binding proteins.
dy(15,:) = Kf_MLCKact * Ca4_CaM_comp_1 * MLCK_comp_1 - Kr_MLCKact * Ca4_CaM_MLCK_comp_1 + Kf_CaCaMMLCK * Ca_SMC_comp_1 * Ca_SMC_comp_1 * Ca2_CaM_MLCK_comp_1 - Kr_CaCaMMLCK * Ca4_CaM_MLCK_comp_1;

% Dynamics of calcium buffering in smooth muscle cells.
dy(16,:) = Kf_CaMBuf * CaM_comp_1 * Buf_comp_1 - Kr_CaMBuf * CaM_Buf_comp_1 - Kf_CaMBufdis * CaM_Buf_comp_1 * Ca_SMC_comp_1 * Ca_SMC_comp_1 + Kr_CaMBufdis * Ca2_CaM_comp_1 * Buf_comp_1;

% Buffering dynamics related to CaM binding and dissociation.
dy(17,:) = -Kf_CaMBuf * CaM_comp_1 * Buf_comp_1 + Kr_CaMBuf * CaM_Buf_comp_1 + Kf_CaMBufdis * CaM_Buf_comp_1 * Ca_SMC_comp_1 * Ca_SMC_comp_1 - Kr_CaMBufdis * Ca2_CaM_comp_1 * Buf_comp_1;

% Hai-Murphy model (number of cross bridge formation through active MLCK)
dy(18,:) = Vmax_MLCKact * M_comp_1 * Ca4_CaM_MLCK_comp_1 / (Km_MLCKact + M_comp_1) - HM_k3 * Mp_comp_1 + HM_k4 * AMp_comp_1 - Vmax_MLCP * Mp_comp_1 * MLCP / (Km_MLCP + Mp_comp_1);

dy(19,:) = -Vmax_MLCKact * M_comp_1 * Ca4_CaM_MLCK_comp_1 / (Km_MLCKact + M_comp_1) + Vmax_MLCP * Mp_comp_1 * MLCP / (Km_MLCP + Mp_comp_1) + HM_k7 * AM_comp_1 - HM_k8 * M_comp_1;

dy(20,:) = Vmax_MLCKact * AM_comp_1 * Ca4_CaM_MLCK_comp_1 / (Km_MLCKact + AM_comp_1) + HM_k3 * Mp_comp_1 - HM_k4 * AMp_comp_1 - Vmax_MLCP * AMp_comp_1 * MLCP / (Km_MLCP + AMp_comp_1);

dy(21,:) = -Vmax_MLCKact * AM_comp_1 * Ca4_CaM_MLCK_comp_1 / (Km_MLCKact + AM_comp_1) + Vmax_MLCP * AMp_comp_1 * MLCP / (Km_MLCP + AMp_comp_1) - HM_k7 * AM_comp_1 + HM_k8 * M_comp_1;


n_c_comp_1 = (AMp_comp_1 + AM_comp_1) ./ (Mp_comp_1 + M_comp_1 + AMp_comp_1 + AM_comp_1);

% Ensure the number of cross bridges formed is real (no imaginary numbers).
n_c_comp_1 = real(n_c_comp_1);

% Calculate the stress in the smooth muscle cells based on number of cross bridges formed.
stress_comp_1 = stress_max * n_c_comp_1;

% Stretch calculation and elastance model

stretch_comp_1 = real(stretch_comp_1);  % Ensuring the stretch value is real (removes imaginary part if present)

% Elastance calculation, modeling the stiffness of the compartment as a function of stretch
Elast_comp_1 = 2.*S_1_comp_1_2_3_4.*(stretch_comp_1).*(power((stretch_comp_1),2) - 1).*exp(S_2_comp_1_2_3_4.*power(power((stretch_comp_1),2)-1,2));

% Dashpot behavior (viscous damping element), modeling resistance to deformation
dashpot_1_comp_1 = S_4_comp_1_2_3_4.*exp(S_5_comp_1_2_3_4.*(stress_comp_1 - (Elast_comp_1)*S_3_comp_1_2_3_4));

% Modified dashpot considering a non-linear effect (tanh function for smoother transition)
dashpot_2_comp_1 = dashpot_1_comp_1.*tanh(S_6_comp_1_2_3_4.*power(stretch_comp_1 - 0.98,2));

% Updating the rate of change for the mechanical ODE with dashpot effects
dy(22, :) = (1/(dashpot_2_comp_1))*(stress_comp_1 - Elast_comp_1);

% Compartment radius calculation
[r_fin_comp_1, r_d_comp_1] = compartment_radius(stretch_comp_1, L_t_comp_1, r_ini_comp_1); 
% This function calculates the final radius and the deformation radius

% ODEs for fluid activity (forward and backward directions)

% Forward direction gastric flow calculations
r_star_forw_comp_1 = r_ini_comp_1;  % Initial radius for forward movement

phi_forw_comp_1 = r_d_comp_1 / r_ini_comp_1;  % Ratio of radius change

% Peristalsis (propagation of contraction waves) calculation for gastric
% contents forward movement (towards PS)
[u_pr_forw_comp_1] = compartment_peristalsis(phi_forw_comp_1, r_star_forw_comp_1, r_ini_comp_1, c_comp_1, mu);

Q_pr_forw_comp_1 = u_pr_forw_comp_1 * pi * power(r_star_forw_comp_1, 2);  % Flow rate for forward direction

% Backward direction gastric flow calculations
r_star_back_comp_1 = r_fin_comp_1;  % Radius for backward movement

phi_back_comp_1 = r_d_comp_1 / r_ini_comp_1;  % Ratio of radius change for backward direction

% Peristalsis calculation that result inital fluid flow for backward
% movement (away from PS)
[u_pr_back_comp_1] = compartment_peristalsis(phi_back_comp_1, r_star_back_comp_1, r_ini_comp_1, c_comp_1, mu);




%% Middle Antrum - Stomach


% The implications of the equations are same as compartment 1 (see
% compartment 1 commenting)

dy(23,:) = (I_ICC_comp_2.*exp(-s_ICC.^2.*(time_cyc_comp_2).^2)-V_m_ICC_comp_2 + V_m_rest_ICC)./(exp(-s_ICC.^2.*(time_cyc_comp_2).^2));
I_coup_comp_2=G_coup_comp_2_3_4.*(V_m_ICC_comp_2-V_m_SMC_comp_2);
dy(24,:) = (I_coup_comp_2.*exp(-s_SMC.^2.*(time_cyc_comp_2).^2)-V_m_SMC_comp_2 + V_m_rest_SMC)./(exp(-s_SMC.^2.*(time_cyc_comp_2).^2));



E_Ca_SM_2_comp_2=0.5*RToF*log(Ca_o_SM/Ca_i_SM_comp_2);
I_Ltype_SM_comp_2=G_max_Ltype_2*f_Ltype_SM_comp_2*d_Ltype_SM_comp_2*f_ca_Ltype_SM_comp_2*(V_m_SMC_comp_2-E_Ca_SM_2_comp_2);
E_Ca_SM_1_comp_2=0.5*RToF*log(Ca_o_SM/Ca_i_SM_comp_2);
I_LVA_SM_comp_2=G_max_LVA*f_LVA_SM_comp_2*d_LVA_SM_comp_2*(V_m_SMC_comp_2-E_Ca_SM_1_comp_2);

J_CaSR_SM_comp_2=J_max_CaSR*(Ca_i_SM_comp_2*1.0)^1.34;

dy(25,:)=1*((-I_Ltype_SM_comp_2-I_LVA_SM_comp_2)/(2.0*1.0*1.0*F*Vol_SM)-J_CaSR_SM_comp_2);

f_inf_Ltype_SM_comp_2=1.0/(1.0+exp((V_m_SMC_comp_2+43.0)/8.9));
dy(26,:)=(f_inf_Ltype_SM_comp_2-f_Ltype_SM_comp_2)/tau_f_Ltype_SM;

d_inf_Ltype_SM_comp_2=1.0/(1.0+exp((V_m_SMC_comp_2+17.0)/-4.3));
dy(27,:)=(d_inf_Ltype_SM_comp_2-d_Ltype_SM_comp_2)/tau_d_Ltype_SM;



f_ca_inf_Ltype_SM_comp_2=1.0-1.0/(1.0+exp((Ca_i_SM_comp_2-0.00012401)/-0.0000131));
dy(28,:)=(f_ca_inf_Ltype_SM_comp_2-f_ca_Ltype_SM_comp_2)/tau_f_ca_Ltype_SM;



tau_f_LVA_SM_comp_2=T_correction_Ca*7.58e-3*exp(V_m_SMC_comp_2*0.00817);
f_inf_LVA_SM_comp_2=1.0/(1.0+exp((V_m_SMC_comp_2+15.8)/7.0));
dy(29,:)=(f_inf_LVA_SM_comp_2-f_LVA_SM_comp_2)/tau_f_LVA_SM_comp_2;

d_inf_LVA_SM_comp_2=1.0/(1.0+exp((V_m_SMC_comp_2+27.5)/-10.9));
dy(30,:)=(d_inf_LVA_SM_comp_2-d_LVA_SM_comp_2)/tau_d_LVA_SM;


Ca_SMC_comp_2=Ca_i_SM_comp_2*1000;

dy(31, :)=  Kf_Ca2CaM*Ca_SMC_comp_2*Ca_SMC_comp_2*CaM_comp_2 - Kr_Ca2CaM*Ca2_CaM_comp_2 -Kf_Ca2Ca4*Ca_SMC_comp_2*Ca_SMC_comp_2*Ca2_CaM_comp_2 + Kr_Ca2Ca4*Ca4_CaM_comp_2 -Kf_Ca2CaMtoCa2_CaM_MLCK*Ca2_CaM_comp_2*MLCK_comp_2 + Kr_Ca2CaMtoCa2_CaM_MLCK*Ca2_CaM_MLCK_comp_2 + Kf_CaMBufdis*CaM_Buf_comp_2*Ca_SMC_comp_2*Ca_SMC_comp_2 - Kr_CaMBufdis*Ca2_CaM_comp_2*Buf_comp_2;
dy(32, :)= -Kf_Ca2CaM*Ca_SMC_comp_2*Ca_SMC_comp_2*CaM_comp_2 + Kr_Ca2CaM*Ca2_CaM_comp_2 -Kf_CaMMLCK*CaM_comp_2*MLCK_comp_2 + Kr_CaMMLCK*CaM_MLCK_comp_2 -Kf_CaMBuf*CaM_comp_2*Buf_comp_2 + Kr_CaMBuf*CaM_Buf_comp_2;
dy(33, :)=  Kf_Ca2Ca4*Ca_SMC_comp_2*Ca_SMC_comp_2*Ca2_CaM_comp_2 - Kr_Ca2Ca4*Ca4_CaM_comp_2 -Kf_MLCKact*Ca4_CaM_comp_2*MLCK_comp_2 + Kr_MLCKact*Ca4_CaM_MLCK_comp_2;
dy(34, :)=  Kf_CaMMLCK*CaM_comp_2*MLCK_comp_2 - Kr_CaMMLCK*CaM_MLCK_comp_2 -Kf_Ca2CaMMLCK*Ca_SMC_comp_2*Ca_SMC_comp_2*CaM_MLCK_comp_2 + Kr_Ca2CaMMLCK*Ca2_CaM_MLCK_comp_2;
dy(35, :)= -Kf_CaMMLCK*CaM_comp_2*MLCK_comp_2 + Kr_CaMMLCK*CaM_MLCK_comp_2 -Kf_Ca2CaMtoCa2_CaM_MLCK*Ca2_CaM_comp_2*MLCK_comp_2 + Kr_Ca2CaMtoCa2_CaM_MLCK*Ca2_CaM_MLCK_comp_2 -Kf_MLCKact*Ca4_CaM_comp_2*MLCK_comp_2 + Kr_MLCKact*Ca4_CaM_MLCK_comp_2;
dy(36, :)=  Kf_Ca2CaMtoCa2_CaM_MLCK*Ca2_CaM_comp_2*MLCK_comp_2 - Kr_Ca2CaMtoCa2_CaM_MLCK*Ca2_CaM_MLCK_comp_2 + Kf_Ca2CaMMLCK*Ca_SMC_comp_2*Ca_SMC_comp_2*CaM_MLCK_comp_2 - Kr_Ca2CaMMLCK*Ca2_CaM_MLCK_comp_2 -Kf_CaCaMMLCK*Ca_SMC_comp_2*Ca_SMC_comp_2*Ca2_CaM_MLCK_comp_2 + Kr_CaCaMMLCK*Ca4_CaM_MLCK_comp_2;
dy(37, :)=  Kf_MLCKact*Ca4_CaM_comp_2*MLCK_comp_2 - Kr_MLCKact*Ca4_CaM_MLCK_comp_2 + Kf_CaCaMMLCK*Ca_SMC_comp_2*Ca_SMC_comp_2*Ca2_CaM_MLCK_comp_2 - Kr_CaCaMMLCK*Ca4_CaM_MLCK_comp_2;
dy(38, :)=  Kf_CaMBuf*CaM_comp_2*Buf_comp_2 - Kr_CaMBuf*CaM_Buf_comp_2 -Kf_CaMBufdis*CaM_Buf_comp_2*Ca_SMC_comp_2*Ca_SMC_comp_2 + Kr_CaMBufdis*Ca2_CaM_comp_2*Buf_comp_2;
dy(39, :)= -Kf_CaMBuf*CaM_comp_2*Buf_comp_2 + Kr_CaMBuf*CaM_Buf_comp_2 +Kf_CaMBufdis*CaM_Buf_comp_2*Ca_SMC_comp_2*Ca_SMC_comp_2 - Kr_CaMBufdis*Ca2_CaM_comp_2*Buf_comp_2;
dy(40, :)=  Vmax_MLCKact*M_comp_2*Ca4_CaM_MLCK_comp_2/(Km_MLCKact+M_comp_2) -HM_k3*Mp_comp_2 + HM_k4*AMp_comp_2 -Vmax_MLCP*Mp_comp_2*MLCP/(Km_MLCP+Mp_comp_2);
dy(41, :)= -Vmax_MLCKact*M_comp_2*Ca4_CaM_MLCK_comp_2/(Km_MLCKact+M_comp_2) +Vmax_MLCP*Mp_comp_2*MLCP/(Km_MLCP+Mp_comp_2) + HM_k7*AM_comp_2 - HM_k8*M_comp_2;
dy(42, :)=  Vmax_MLCKact*AM_comp_2*Ca4_CaM_MLCK_comp_2/(Km_MLCKact+AM_comp_2) + HM_k3*Mp_comp_2 - HM_k4*AMp_comp_2 -Vmax_MLCP*AMp_comp_2*MLCP/(Km_MLCP+AMp_comp_2);
dy(43, :)= -Vmax_MLCKact*AM_comp_2*Ca4_CaM_MLCK_comp_2/(Km_MLCKact+AM_comp_2) + Vmax_MLCP*AMp_comp_2*MLCP/(Km_MLCP+AMp_comp_2) -HM_k7*AM_comp_2 + HM_k8*M_comp_2;

  n_c_comp_2 = (AMp_comp_2+AM_comp_2)./(Mp_comp_2+M_comp_2+AMp_comp_2+AM_comp_2);

  n_c_comp_2 = real(n_c_comp_2);

stress_comp_2 = stress_max*n_c_comp_2;

stretch_comp_2 = real(stretch_comp_2);

Elast_comp_2 = 2.*S_1_comp_1_2_3_4.*(stretch_comp_2).*(power((stretch_comp_2),2) - 1).*exp(S_2_comp_1_2_3_4.*power(power((stretch_comp_2),2)-1,2));

dashpot_1_comp_2 = S_4_comp_1_2_3_4.*exp(S_5_comp_1_2_3_4.*(stress_comp_2- (Elast_comp_2)*S_3_comp_1_2_3_4));
dashpot_2_comp_2 = dashpot_1_comp_2.*tanh(S_6_comp_1_2_3_4.*power(stretch_comp_2-0.98,2));

dy(44, :) = (1/(dashpot_2_comp_2))*(stress_comp_2 - Elast_comp_2);

[r_fin_comp_2,r_d_comp_2] = compartment_radius(stretch_comp_2,L_t_comp_2,r_ini_comp_2);

% forward-----------------------------------

r_star_forw_comp_2 = r_ini_comp_2;

phi_forw_comp_2 = r_d_comp_2/r_ini_comp_2;

[u_pr_forw_comp_2] = compartment_peristalsis(phi_forw_comp_2,r_star_forw_comp_2,r_ini_comp_2,c_comp_2,mu);

Q_pr_forw_comp_2 = u_pr_forw_comp_2*pi*power(r_star_forw_comp_2,2);

%---------------------------------------------------

%backward

r_star_back_comp_2 = r_fin_comp_2;

phi_back_comp_2 = r_d_comp_2/r_ini_comp_2;

[u_pr_back_comp_2] = compartment_peristalsis(phi_back_comp_2,r_star_back_comp_2,r_ini_comp_2,c_comp_2,mu);

%-------------------------------------------


%% Terminal Antrum - Stomach

% The implications of the equations are same as compartment 1 (see
% compartment 1 commenting)


dy(45,:) = (I_ICC_comp_3.*exp(-s_ICC.^2.*(time_cyc_comp_3).^2)-V_m_ICC_comp_3 + V_m_rest_ICC)./(exp(-s_ICC.^2.*(time_cyc_comp_3).^2));
I_coup_comp_3=G_coup_comp_2_3_4.*(V_m_ICC_comp_3-V_m_SMC_comp_3);
dy(46,:) = (I_coup_comp_3.*exp(-s_SMC.^2.*(time_cyc_comp_3).^2)-V_m_SMC_comp_3 + V_m_rest_SMC)./(exp(-s_SMC.^2.*(time_cyc_comp_3).^2));



E_Ca_SM_2_comp_3=0.5*RToF*log(Ca_o_SM/Ca_i_SM_comp_3);
I_Ltype_SM_comp_3=G_max_Ltype_2*f_Ltype_SM_comp_3*d_Ltype_SM_comp_3*f_ca_Ltype_SM_comp_3*(V_m_SMC_comp_3-E_Ca_SM_2_comp_3);
E_Ca_SM_1_comp_3=0.5*RToF*log(Ca_o_SM/Ca_i_SM_comp_3);
I_LVA_SM_comp_3=G_max_LVA*f_LVA_SM_comp_3*d_LVA_SM_comp_3*(V_m_SMC_comp_3-E_Ca_SM_1_comp_3);

J_CaSR_SM_comp_3=J_max_CaSR*(Ca_i_SM_comp_3*1.0)^1.34;

dy(47,:)=1*((-I_Ltype_SM_comp_3-I_LVA_SM_comp_3)/(2.0*1.0*1.0*F*Vol_SM)-J_CaSR_SM_comp_3);

f_inf_Ltype_SM_comp_3=1.0/(1.0+exp((V_m_SMC_comp_3+43.0)/8.9));
dy(48,:)=(f_inf_Ltype_SM_comp_3-f_Ltype_SM_comp_3)/tau_f_Ltype_SM;

d_inf_Ltype_SM_comp_3=1.0/(1.0+exp((V_m_SMC_comp_3+17.0)/-4.3));
dy(49,:)=(d_inf_Ltype_SM_comp_3-d_Ltype_SM_comp_3)/tau_d_Ltype_SM;



f_ca_inf_Ltype_SM_comp_3=1.0-1.0/(1.0+exp((Ca_i_SM_comp_3-0.00012401)/-0.0000131));
dy(50,:)=(f_ca_inf_Ltype_SM_comp_3-f_ca_Ltype_SM_comp_3)/tau_f_ca_Ltype_SM;



tau_f_LVA_SM_comp_3=T_correction_Ca*7.58e-3*exp(V_m_SMC_comp_3*0.00817);
f_inf_LVA_SM_comp_3=1.0/(1.0+exp((V_m_SMC_comp_3+15.8)/7.0));
dy(51,:)=(f_inf_LVA_SM_comp_3-f_LVA_SM_comp_3)/tau_f_LVA_SM_comp_3;

d_inf_LVA_SM_comp_3=1.0/(1.0+exp((V_m_SMC_comp_3+27.5)/-10.9));
dy(52,:)=(d_inf_LVA_SM_comp_3-d_LVA_SM_comp_3)/tau_d_LVA_SM;


Ca_SMC_comp_3=Ca_i_SM_comp_3*1000;


dy(53, :)=  Kf_Ca2CaM*Ca_SMC_comp_3*Ca_SMC_comp_3*CaM_comp_3 - Kr_Ca2CaM*Ca2_CaM_comp_3 -Kf_Ca2Ca4*Ca_SMC_comp_3*Ca_SMC_comp_3*Ca2_CaM_comp_3 + Kr_Ca2Ca4*Ca4_CaM_comp_3 -Kf_Ca2CaMtoCa2_CaM_MLCK*Ca2_CaM_comp_3*MLCK_comp_3 + Kr_Ca2CaMtoCa2_CaM_MLCK*Ca2_CaM_MLCK_comp_3 + Kf_CaMBufdis*CaM_Buf_comp_3*Ca_SMC_comp_3*Ca_SMC_comp_3 - Kr_CaMBufdis*Ca2_CaM_comp_3*Buf_comp_3;
dy(54, :)= -Kf_Ca2CaM*Ca_SMC_comp_3*Ca_SMC_comp_3*CaM_comp_3 + Kr_Ca2CaM*Ca2_CaM_comp_3 -Kf_CaMMLCK*CaM_comp_3*MLCK_comp_3 + Kr_CaMMLCK*CaM_MLCK_comp_3 -Kf_CaMBuf*CaM_comp_3*Buf_comp_3 + Kr_CaMBuf*CaM_Buf_comp_3;
dy(55, :)=  Kf_Ca2Ca4*Ca_SMC_comp_3*Ca_SMC_comp_3*Ca2_CaM_comp_3 - Kr_Ca2Ca4*Ca4_CaM_comp_3 -Kf_MLCKact*Ca4_CaM_comp_3*MLCK_comp_3 + Kr_MLCKact*Ca4_CaM_MLCK_comp_3;
dy(56, :)=  Kf_CaMMLCK*CaM_comp_3*MLCK_comp_3 - Kr_CaMMLCK*CaM_MLCK_comp_3 -Kf_Ca2CaMMLCK*Ca_SMC_comp_3*Ca_SMC_comp_3*CaM_MLCK_comp_3 + Kr_Ca2CaMMLCK*Ca2_CaM_MLCK_comp_3;
dy(57, :)= -Kf_CaMMLCK*CaM_comp_3*MLCK_comp_3 + Kr_CaMMLCK*CaM_MLCK_comp_3 -Kf_Ca2CaMtoCa2_CaM_MLCK*Ca2_CaM_comp_3*MLCK_comp_3 + Kr_Ca2CaMtoCa2_CaM_MLCK*Ca2_CaM_MLCK_comp_3 -Kf_MLCKact*Ca4_CaM_comp_3*MLCK_comp_3 + Kr_MLCKact*Ca4_CaM_MLCK_comp_3;
dy(58, :)=  Kf_Ca2CaMtoCa2_CaM_MLCK*Ca2_CaM_comp_3*MLCK_comp_3 - Kr_Ca2CaMtoCa2_CaM_MLCK*Ca2_CaM_MLCK_comp_3 + Kf_Ca2CaMMLCK*Ca_SMC_comp_3*Ca_SMC_comp_3*CaM_MLCK_comp_3 - Kr_Ca2CaMMLCK*Ca2_CaM_MLCK_comp_3 -Kf_CaCaMMLCK*Ca_SMC_comp_3*Ca_SMC_comp_3*Ca2_CaM_MLCK_comp_3 + Kr_CaCaMMLCK*Ca4_CaM_MLCK_comp_3;
dy(59, :)=  Kf_MLCKact*Ca4_CaM_comp_3*MLCK_comp_3 - Kr_MLCKact*Ca4_CaM_MLCK_comp_3 + Kf_CaCaMMLCK*Ca_SMC_comp_3*Ca_SMC_comp_3*Ca2_CaM_MLCK_comp_3 - Kr_CaCaMMLCK*Ca4_CaM_MLCK_comp_3;
dy(60, :)=  Kf_CaMBuf*CaM_comp_3*Buf_comp_3 - Kr_CaMBuf*CaM_Buf_comp_3 -Kf_CaMBufdis*CaM_Buf_comp_3*Ca_SMC_comp_3*Ca_SMC_comp_3 + Kr_CaMBufdis*Ca2_CaM_comp_3*Buf_comp_3;
dy(61, :)= -Kf_CaMBuf*CaM_comp_3*Buf_comp_3 + Kr_CaMBuf*CaM_Buf_comp_3 +Kf_CaMBufdis*CaM_Buf_comp_3*Ca_SMC_comp_3*Ca_SMC_comp_3 - Kr_CaMBufdis*Ca2_CaM_comp_3*Buf_comp_3;
dy(62, :)=  Vmax_MLCKact*M_comp_3*Ca4_CaM_MLCK_comp_3/(Km_MLCKact+M_comp_3) -HM_k3*Mp_comp_3 + HM_k4*AMp_comp_3 -Vmax_MLCP*Mp_comp_3*MLCP/(Km_MLCP+Mp_comp_3);
dy(63, :)= -Vmax_MLCKact*M_comp_3*Ca4_CaM_MLCK_comp_3/(Km_MLCKact+M_comp_3) +Vmax_MLCP*Mp_comp_3*MLCP/(Km_MLCP+Mp_comp_3) + HM_k7*AM_comp_3 - HM_k8*M_comp_3;
dy(64, :)=  Vmax_MLCKact*AM_comp_3*Ca4_CaM_MLCK_comp_3/(Km_MLCKact+AM_comp_3) + HM_k3*Mp_comp_3 - HM_k4*AMp_comp_3 -Vmax_MLCP*AMp_comp_3*MLCP/(Km_MLCP+AMp_comp_3);
dy(65, :)= -Vmax_MLCKact*AM_comp_3*Ca4_CaM_MLCK_comp_3/(Km_MLCKact+AM_comp_3) + Vmax_MLCP*AMp_comp_3*MLCP/(Km_MLCP+AMp_comp_3) -HM_k7*AM_comp_3 + HM_k8*M_comp_3;



n_c_comp_3 = (AMp_comp_3+AM_comp_3)./(Mp_comp_3+M_comp_3+AMp_comp_3+AM_comp_3);


n_c_comp_3 = real(n_c_comp_3);

stress_comp_3 = stress_max*n_c_comp_3;
stretch_comp_3 = real(stretch_comp_3);

Elast_comp_3 = 2.*S_1_comp_1_2_3_4.*(stretch_comp_3).*(power((stretch_comp_3),2) - 1).*exp(S_2_comp_1_2_3_4.*power(power((stretch_comp_3),2)-1,2));

dashpot_1_comp_3 = S_4_comp_1_2_3_4.*exp(S_5_comp_1_2_3_4.*(stress_comp_3- (Elast_comp_3)*S_3_comp_1_2_3_4));
dashpot_2_comp_3 = dashpot_1_comp_3.*tanh(S_6_comp_1_2_3_4.*power(stretch_comp_3-0.98,2));

dy(66, :) = (1/(dashpot_2_comp_3))*(stress_comp_3 - Elast_comp_3);


[r_fin_comp_3,r_d_comp_3] = compartment_radius(stretch_comp_3,L_t_comp_3,r_ini_comp_3);


% forward-----------------------------------

r_star_forw_comp_3 = r_ini_comp_3;

phi_forw_comp_3 = r_d_comp_3/r_ini_comp_3;

[u_pr_forw_comp_3] = compartment_peristalsis(phi_forw_comp_3,r_star_forw_comp_3,r_ini_comp_3,c_comp_3,mu);

Q_pr_forw_comp_3 = u_pr_forw_comp_3*pi*power(r_star_forw_comp_3,2);

%---------------------------------------------------

%backward

r_star_back_comp_3 = r_fin_comp_3;

phi_back_comp_3 = r_d_comp_3/r_ini_comp_3;

[u_pr_back_comp_3] = compartment_peristalsis(phi_back_comp_3,r_star_back_comp_3,r_ini_comp_3,c_comp_3,mu);

%----------------------------------------------------


%% Pyloric Sphincter - Stomach

% The implications of the equations are same as compartment 1 (see
% compartment 1 commenting)

dy(67,:) = (I_ICC_comp_4.*exp(-s_ICC.^2.*(time_cyc_comp_4).^2)-V_m_ICC_comp_4 + V_m_rest_ICC)./(exp(-s_ICC.^2.*(time_cyc_comp_4).^2));
I_coup_comp_4=G_coup_comp_2_3_4.*(V_m_ICC_comp_4-V_m_SMC_comp_4);
dy(68,:) = (I_coup_comp_4.*exp(-s_SMC.^2.*(time_cyc_comp_4).^2)-V_m_SMC_comp_4 + V_m_rest_SMC)./(exp(-s_SMC.^2.*(time_cyc_comp_4).^2));

E_Ca_SM_2_comp_4=0.5*RToF*log(Ca_o_SM/Ca_i_SM_comp_4);
I_Ltype_SM_comp_4=G_max_Ltype_2*f_Ltype_SM_comp_4*d_Ltype_SM_comp_4*f_ca_Ltype_SM_comp_4*(V_m_SMC_comp_4-E_Ca_SM_2_comp_4);
E_Ca_SM_1_comp_4=0.5*RToF*log(Ca_o_SM/Ca_i_SM_comp_4);
I_LVA_SM_comp_4=G_max_LVA*f_LVA_SM_comp_4*d_LVA_SM_comp_4*(V_m_SMC_comp_4-E_Ca_SM_1_comp_4);

J_CaSR_SM_comp_4=J_max_CaSR*(Ca_i_SM_comp_4*1.0)^1.34;

dy(69,:)=1*((-I_Ltype_SM_comp_4-I_LVA_SM_comp_4)/(2.0*1.0*1.0*F*Vol_SM)-J_CaSR_SM_comp_4);

f_inf_Ltype_SM_comp_4=1.0/(1.0+exp((V_m_SMC_comp_4+43.0)/8.9));
dy(70,:)=(f_inf_Ltype_SM_comp_4-f_Ltype_SM_comp_4)/tau_f_Ltype_SM;

d_inf_Ltype_SM_comp_4=1.0/(1.0+exp((V_m_SMC_comp_4+17.0)/-4.3));
dy(71,:)=(d_inf_Ltype_SM_comp_4-d_Ltype_SM_comp_4)/tau_d_Ltype_SM;


f_ca_inf_Ltype_SM_comp_4=1.0-1.0/(1.0+exp((Ca_i_SM_comp_4-0.00012401)/-0.0000131));
dy(72,:)=(f_ca_inf_Ltype_SM_comp_4-f_ca_Ltype_SM_comp_4)/tau_f_ca_Ltype_SM;


tau_f_LVA_SM_comp_4=T_correction_Ca*7.58e-3*exp(V_m_SMC_comp_4*0.00817);
f_inf_LVA_SM_comp_4=1.0/(1.0+exp((V_m_SMC_comp_4+15.8)/7.0));
dy(73,:)=(f_inf_LVA_SM_comp_4-f_LVA_SM_comp_4)/tau_f_LVA_SM_comp_4;

d_inf_LVA_SM_comp_4=1.0/(1.0+exp((V_m_SMC_comp_4+27.5)/-10.9));
dy(74,:)=(d_inf_LVA_SM_comp_4-d_LVA_SM_comp_4)/tau_d_LVA_SM;


Ca_SMC_comp_4=Ca_i_SM_comp_4*1000;

dy(75, :)=  Kf_Ca2CaM*Ca_SMC_comp_4*Ca_SMC_comp_4*CaM_comp_4 - Kr_Ca2CaM*Ca2_CaM_comp_4 -Kf_Ca2Ca4*Ca_SMC_comp_4*Ca_SMC_comp_4*Ca2_CaM_comp_4 + Kr_Ca2Ca4*Ca4_CaM_comp_4 -Kf_Ca2CaMtoCa2_CaM_MLCK*Ca2_CaM_comp_4*MLCK_comp_4 + Kr_Ca2CaMtoCa2_CaM_MLCK*Ca2_CaM_MLCK_comp_4 + Kf_CaMBufdis*CaM_Buf_comp_4*Ca_SMC_comp_4*Ca_SMC_comp_4 - Kr_CaMBufdis*Ca2_CaM_comp_4*Buf_comp_4;
dy(76, :)= -Kf_Ca2CaM*Ca_SMC_comp_4*Ca_SMC_comp_4*CaM_comp_4 + Kr_Ca2CaM*Ca2_CaM_comp_4 -Kf_CaMMLCK*CaM_comp_4*MLCK_comp_4 + Kr_CaMMLCK*CaM_MLCK_comp_4 -Kf_CaMBuf*CaM_comp_4*Buf_comp_4 + Kr_CaMBuf*CaM_Buf_comp_4;
dy(77, :)=  Kf_Ca2Ca4*Ca_SMC_comp_4*Ca_SMC_comp_4*Ca2_CaM_comp_4 - Kr_Ca2Ca4*Ca4_CaM_comp_4 -Kf_MLCKact*Ca4_CaM_comp_4*MLCK_comp_4 + Kr_MLCKact*Ca4_CaM_MLCK_comp_4;
dy(78, :)=  Kf_CaMMLCK*CaM_comp_4*MLCK_comp_4 - Kr_CaMMLCK*CaM_MLCK_comp_4 -Kf_Ca2CaMMLCK*Ca_SMC_comp_4*Ca_SMC_comp_4*CaM_MLCK_comp_4 + Kr_Ca2CaMMLCK*Ca2_CaM_MLCK_comp_4;
dy(79, :)= -Kf_CaMMLCK*CaM_comp_4*MLCK_comp_4 + Kr_CaMMLCK*CaM_MLCK_comp_4 -Kf_Ca2CaMtoCa2_CaM_MLCK*Ca2_CaM_comp_4*MLCK_comp_4 + Kr_Ca2CaMtoCa2_CaM_MLCK*Ca2_CaM_MLCK_comp_4 -Kf_MLCKact*Ca4_CaM_comp_4*MLCK_comp_4 + Kr_MLCKact*Ca4_CaM_MLCK_comp_4;
dy(80, :)=  Kf_Ca2CaMtoCa2_CaM_MLCK*Ca2_CaM_comp_4*MLCK_comp_4 - Kr_Ca2CaMtoCa2_CaM_MLCK*Ca2_CaM_MLCK_comp_4 + Kf_Ca2CaMMLCK*Ca_SMC_comp_4*Ca_SMC_comp_4*CaM_MLCK_comp_4 - Kr_Ca2CaMMLCK*Ca2_CaM_MLCK_comp_4 -Kf_CaCaMMLCK*Ca_SMC_comp_4*Ca_SMC_comp_4*Ca2_CaM_MLCK_comp_4 + Kr_CaCaMMLCK*Ca4_CaM_MLCK_comp_4;
dy(81, :)=  Kf_MLCKact*Ca4_CaM_comp_4*MLCK_comp_4 - Kr_MLCKact*Ca4_CaM_MLCK_comp_4 + Kf_CaCaMMLCK*Ca_SMC_comp_4*Ca_SMC_comp_4*Ca2_CaM_MLCK_comp_4 - Kr_CaCaMMLCK*Ca4_CaM_MLCK_comp_4;
dy(82, :)=  Kf_CaMBuf*CaM_comp_4*Buf_comp_4 - Kr_CaMBuf*CaM_Buf_comp_4 -Kf_CaMBufdis*CaM_Buf_comp_4*Ca_SMC_comp_4*Ca_SMC_comp_4 + Kr_CaMBufdis*Ca2_CaM_comp_4*Buf_comp_4;
dy(83, :)= -Kf_CaMBuf*CaM_comp_4*Buf_comp_4 + Kr_CaMBuf*CaM_Buf_comp_4 +Kf_CaMBufdis*CaM_Buf_comp_4*Ca_SMC_comp_4*Ca_SMC_comp_4 - Kr_CaMBufdis*Ca2_CaM_comp_4*Buf_comp_4;
dy(84, :)=  Vmax_MLCKact*M_comp_4*Ca4_CaM_MLCK_comp_4/(Km_MLCKact+M_comp_4) -HM_k3*Mp_comp_4 + HM_k4*AMp_comp_4 -Vmax_MLCP*Mp_comp_4*MLCP/(Km_MLCP+Mp_comp_4);
dy(85, :)= -Vmax_MLCKact*M_comp_4*Ca4_CaM_MLCK_comp_4/(Km_MLCKact+M_comp_4) +Vmax_MLCP*Mp_comp_4*MLCP/(Km_MLCP+Mp_comp_4) + HM_k7*AM_comp_4 - HM_k8*M_comp_4;
dy(86, :)=  Vmax_MLCKact*AM_comp_4*Ca4_CaM_MLCK_comp_4/(Km_MLCKact+AM_comp_4) + HM_k3*Mp_comp_4 - HM_k4*AMp_comp_4 -Vmax_MLCP*AMp_comp_4*MLCP/(Km_MLCP+AMp_comp_4);
dy(87, :)= -Vmax_MLCKact*AM_comp_4*Ca4_CaM_MLCK_comp_4/(Km_MLCKact+AM_comp_4) + Vmax_MLCP*AMp_comp_4*MLCP/(Km_MLCP+AMp_comp_4) -HM_k7*AM_comp_4 + HM_k8*M_comp_4;

  n_c_comp_4 = (AMp_comp_4+AM_comp_4)./(Mp_comp_4+M_comp_4+AMp_comp_4+AM_comp_4);

stress_comp_4 = stress_max*1*n_c_comp_4;


% NLVM model paramters for PS

S_1_comp_1_2_3_4 = 0.448;  % Scaling factor for the stretch-dependent term in elastance
S_2_comp_1_2_3_4 = 0.894;  % Scaling factor for the exponential term related to stretch in elastance

S_3_comp_1_2_3_4_5 = 2;     % Modified coefficient affecting the stress-elastance relationship in the dashpot model
S_4_comp_1_2_3_4_5 = 4.199; % Material constant for dashpot behavior

S_5_comp_1_2_3_4_5 = -0.21879;  % Material constant for the dashpot model
S_6_comp_1_2_3_4_5 = 20;       % A constant controlling the non-linear damping effect of the dashpot (tanh function factor)


Elast_comp_4 = 2.*S_1_comp_1_2_3_4.*(stretch_comp_4).*(power((stretch_comp_4),2) - 1).*exp(S_2_comp_1_2_3_4.*power(power((stretch_comp_4),2)-1,2));

dashpot_1_comp_4 = S_4_comp_1_2_3_4_5.*exp(S_5_comp_1_2_3_4_5.*(stress_comp_4- (Elast_comp_4)*S_3_comp_1_2_3_4_5));
dashpot_2_comp_4 = dashpot_1_comp_4.*tanh(S_6_comp_1_2_3_4_5.*power(stretch_comp_4-0.98,2));

dy(88, :) = (1/(dashpot_2_comp_4))*(stress_comp_4 - Elast_comp_4);


[r_fin_comp_4,r_d_comp_4] = compartment_radius(stretch_comp_4,L_t_comp_4,r_ini_comp_4);

if r_fin_comp_4<=0
r_fin_comp_4=0;
end

% Occlusion Sphincter (Compartment 4)
% Calculate the ratio of final radius to initial radius for compartment 4
occlusion_sph_comp_4 = (r_fin_comp_4 / r_ini_comp_4);

%-------------------------------------------------

% Extensional flow

% Stretch equilibrium number used to calculate displacement
stretch_eq_num = 0.020429;

% Calculate displacement based on stretch and equilibrium number
L_def_comp_3 = (stretch_comp_3 - stretch_eq_num) * L_t_comp_3;

% Calculate extensional flow velocity and displacement for compartment 3
[U_comp_3, u_sq_comp_3] = compartment_extensional(r_d_comp_3, r_ini_comp_3, L_t_comp_3, L_def_comp_3, stress_comp_3, Elast_comp_3, dashpot_2_comp_3);

% Squeeze flow relaxation
% If the flow velocity is negative, set relaxation to squeeze velocity, else set to 0
if U_comp_3 < 0
    u_sq_relax_comp_3 = u_sq_comp_3;  % Relaxation occurs if the velocity is negative  (Extensional flow)
else
    u_sq_relax_comp_3 = 0;  % No relaxation if velocity is positive
end

% Calculate squeeze flow relaxation rate for compartment 3
% (Q_sq_relax_comp_3) (Extensional flow)
Q_sq_relax_comp_3 = u_sq_relax_comp_3 * pi * power(r_ini_comp_3, 2);

%------------------------------------------

% Peristalsis Max

% Calculate the forward and backward radii, and velocities for compartment 1
[r_star_forw_max_comp_1, r_star_back_max_comp_1, u_pr_forw_max_comp_1, u_pr_back_max_comp_1] = compartment_max(kappa, s_ICC, s_SMC, G_coup_comp_1, V_m_rest_ICC, V_m_rest_SMC, stress_max, L_t_comp_1, r_ini_comp_1, mu, c_comp_1);

% Calculate the forward and backward radii, and velocities for compartment 2
[r_star_forw_max_comp_2, r_star_back_max_comp_2, u_pr_forw_max_comp_2, u_pr_back_max_comp_2] = compartment_max(kappa, s_ICC, s_SMC, G_coup_comp_2_3_4, V_m_rest_ICC, V_m_rest_SMC, stress_max, L_t_comp_2, r_ini_comp_2, mu, c_comp_2);

% Calculate the forward peristaltic flow rate for compartment 1
Q_pr_forw_max_comp_1 = u_pr_forw_max_comp_1 * pi * power(r_star_forw_max_comp_1, 2);

% Calculate the forward peristaltic flow rate for compartment 2
Q_pr_forw_max_comp_2 = u_pr_forw_max_comp_2 * pi * power(r_star_forw_max_comp_2, 2);

% Calculate the backward peristaltic flow rate for compartment 1
Q_pr_back_max_comp_1 = u_pr_back_max_comp_1 * pi * power(r_star_back_max_comp_1, 2);

% Calculate the backward peristaltic flow rate for compartment 2
Q_pr_back_max_comp_2 = u_pr_back_max_comp_2 * pi * power(r_star_back_max_comp_2, 2);


%-----------------------------------------

k_pr = 10; % Growth factor for controlling the rate of change of fluid flow (High vale so it follows the path of the actual)

% Peristalsis Forward - Open Sphincter Connectivity

% Forward peristalsis for compartment 1
if  (Q_pr_forw_cont_comp_1 < abs(Q_pr_forw_max_comp_1 + error_open)) && (abs(Q_pr_forw_comp_2) < abs(Q_pr_forw_max_comp_1 + error_open))
    dy(89, :) = k_pr * (abs(Q_pr_forw_comp_1) - Q_pr_forw_cont_comp_1);
elseif (abs(Q_pr_forw_comp_2) > abs(Q_pr_forw_max_comp_1 + error_open))
    dy(89, :) = k_pr * (0 - Q_pr_forw_cont_comp_1);
else
    dy(89, :) = 0;
end

% Forward peristalsis for compartment 2
if  (abs(Q_pr_forw_comp_2) > abs(Q_pr_forw_max_comp_1 + error_open)) && ...
    (Q_pr_forw_cont_comp_2 < abs(Q_pr_forw_max_comp_2 + error_open)) && ...
    (abs(Q_pr_forw_comp_3) < abs(Q_pr_forw_max_comp_2 + error_open))

    dy(90, :) = k_pr * (abs(Q_pr_forw_comp_2) - Q_pr_forw_cont_comp_2);
elseif (abs(Q_pr_forw_comp_3) > abs(Q_pr_forw_max_comp_2 + error_open))
    dy(90, :) = k_pr * (0 - Q_pr_forw_cont_comp_2);
else
    dy(90, :) = 0;
end

% Forward peristalsis for compartment 3
if  (abs(Q_pr_forw_comp_3) > abs(Q_pr_forw_max_comp_2 + error_open))
    dy(91, :) = k_pr * (abs(Q_pr_forw_comp_3) - Q_pr_forw_cont_comp_3);
elseif (U_comp_3 < 0) % If squeeze velocity is negative
    dy(91, :) = k_pr * (0 - Q_pr_forw_cont_comp_3);
else
    dy(91, :) = 0;
end

% Peristalsis Forward - Closed Sphincter Connectivity

% Backward peristalsis for compartment 1
if  (u_pr_back_cont_comp_1 < abs(u_pr_back_max_comp_1 + error_closed)) && ...
    (abs(u_pr_back_comp_2) < abs(u_pr_back_max_comp_1 + error_closed))

    dy(92, :) = k_pr * (abs(u_pr_back_comp_1) - u_pr_back_cont_comp_1);
elseif (abs(u_pr_back_comp_2) > abs(u_pr_back_max_comp_1 + error_closed))
    dy(92, :) = k_pr * (0 - u_pr_back_cont_comp_1);
else
    dy(92, :) = 0;
end

% Backward peristalsis for compartment 2
if (abs(u_pr_back_comp_2) > abs(u_pr_back_max_comp_1 + error_closed)) && ...
    (u_pr_back_cont_comp_2 < abs(u_pr_back_max_comp_2 + error_closed)) && ...
    (abs(u_pr_back_comp_3) < abs(u_pr_back_max_comp_2 + error_closed))

    dy(93, :) = k_pr * (abs(u_pr_back_comp_2) - u_pr_back_cont_comp_2);
elseif (abs(u_pr_back_comp_3) > abs(u_pr_back_max_comp_2 + error_closed))
    dy(93, :) = k_pr * (0 - u_pr_back_cont_comp_2);
else
    dy(93, :) = 0;
end

% Backward peristalsis for compartment 3
if (abs(u_pr_back_comp_3) > abs(u_pr_back_max_comp_2 + error_closed))
    dy(94, :) = k_pr * (abs(u_pr_back_comp_3) - u_pr_back_cont_comp_3);
elseif (U_comp_3 < 0) % If squeeze velocity is negative
    dy(94, :) = k_pr * (0 - u_pr_back_cont_comp_3);
else
    dy(94, :) = 0;
end

%-----------------------------------------
% Gastric Emptying Calculation

% Compute the emptying flow rate using peristalsis and occlusion parameters
[Q_emp] = compartment_emptying(Q_pr_forw_cont_comp_1, Q_pr_forw_cont_comp_2, Q_pr_forw_cont_comp_3, occlusion_sph_comp_4, r_ini_comp_3, mu, rho, correction_a_2, correction_a_1);

%-----------------------------------------
% Total flow through the sphincter

% Compute the total flow through the sphincter, including squeeze
% relaxation (from cm^3/s to mL/min)
Q_comp_sph = (Q_emp + 60 * Q_sq_relax_comp_3 * 1) .* occlusion_sph_comp_4;

% Convert to per-second flow rate (from mL/min to cm^3/s)
Q_comp_sph_comp_4 = Q_comp_sph ./ 60;


%% Reverse Jet flow - TA (Initiating)
% Initializes retrograde flow for compartment 3 using backward flow parameters and fluid properties.
[Phi_j_comp_3,x_j_ini_comp_3,xi_j_comp_3] = compartment_retrograde_ini(u_pr_back_cont_comp_3,r_fin_comp_3,mu,rho);

%% Reverse Jet flow - MA (compartment 2)
% Predicts retrograde flow for compartment 2 based on compartment 3's initial flow velocity.
[u_js_comp_2_TA] = compartment_retrograde_pred(H_comp_3, H_comp_2, x_j_ini_comp_3, u_pr_back_cont_comp_3,xi_j_comp_3,Phi_j_comp_3,mu,rho);

% Initializes retrograde flow for compartment 2.
[Phi_j_comp_2,x_j_ini_comp_2,xi_j_comp_2] = compartment_retrograde_ini(u_pr_back_cont_comp_2,r_star_back_max_comp_2,mu,rho);

%% Reverse Jet flow - PA (compartment 1)
% Predicts retrograde flow for compartment 1 based on compartments 3 and 2's initial flow velocity.
[u_js_comp_1_TA] = compartment_retrograde_pred(H_comp_3, H_comp_1, x_j_ini_comp_3, u_pr_back_cont_comp_3,xi_j_comp_3,Phi_j_comp_3,mu,rho);
[u_js_comp_1_MA] = compartment_retrograde_pred(H_comp_2, H_comp_1, x_j_ini_comp_2, u_pr_back_cont_comp_2,xi_j_comp_2,Phi_j_comp_2,mu,rho);

% Initializes retrograde flow for compartment 1.
[Phi_j_comp_1,x_j_ini_comp_1,xi_j_comp_1] = compartment_retrograde_ini(u_pr_back_cont_comp_1,r_star_back_max_comp_1,mu,rho);

%% Compute compartment velocities
% Calculates velocities for all compartments based on backward and forward flow data and other parameters.
[compartment_1_velocity,compartment_2_velocity,compartment_3_velocity,compartment_4_velocity] = compartment_velocity(u_js_comp_1_TA,u_js_comp_2_TA,u_js_comp_1_MA,u_pr_back_cont_comp_3,u_pr_back_cont_comp_2,u_pr_back_cont_comp_1,Q_comp_sph_comp_4,Q_pr_forw_cont_comp_3,Q_pr_forw_cont_comp_2,Q_pr_forw_cont_comp_1,Q_sq_relax_comp_3,r_ini_comp_1,r_ini_comp_2,r_ini_comp_3,r_ini_comp_4,occlusion_sph_comp_4);


end