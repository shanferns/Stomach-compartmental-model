# Stomach Compartment Model - MATLAB Scripts

This directory contains MATLAB scripts for modeling gastric motility and emptying using a compartmental approach. Below is a description of each file:

--------------------------------------------------
1. analysis.m
   - To analyze gastric emptying and gastric mixing 

2. Compartment.m
   - Main script for simulating the compartmental model.
   - Defines the system equations and calls relevant functions.

3. compartment_emptying.m
   - Computes gastric emptying dynamics.

4. compartment_extensional.m
   - Calculates extensional flow

5. compartment_max.m
   - Determines maximum values of key variables for smooth computation of compartmental model

6. compartment_peristalsis.m
   - Simulates contraction wave movement and its influence on gastric flow.

7. compartment_radius.m
   - Simulates compartmental radius under deformation

8. compartment_retrograde_ini.m
   - Computes initial retrograde (backward) flow in compartments.
   - Models retropulsion effects caused by peristaltic waves.

9. compartment_retrograde_pred.m
   - Predicts retrograde flow velocity in compartments.

10. compartment_velocity.m
   - Computes total gastric velocity for each compartment.

11. diff_sol.m
   - Solves differential equations for stomach dynamics.
   - Uses numerical solvers (e.g., ode15s) to integrate system equations. (Run this file)

--------------------------------------------------
# USAGE INSTRUCTIONS:
- Run `diff_sol.m` to simulate the stomach model.
- Modify individual function parameters to test different conditions.
- Obtain the arrays that is required in the `analysis.m` and run `analysis.m` for further analysis of the model