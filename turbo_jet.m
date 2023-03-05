function [thrust_stat, Q_dot_comb, usefull_enthalpy] = turbo_jet(T_1, P_1, T_max, pressure_ratio)
global fluid mass_flow_rate
% State 1 = before the compressor
% State 2 = before the combustor
% State 3 = before the turbine
% State 4 = before the nozzel  

v_plane = 0;
a_turbine = pi*(0.084/2)^2;

%inputs
 % calculate input state using inital conditions
    s_1 = refpropm('S', 'T', T_1, 'P', P_1, fluid)
    h_1 = refpropm('H', 'T', T_1, 'P', P_1, fluid)


[h_2, s_2, T_2, P_2, W_dot_compressor] = compressor(h_1, s_1, T_1, P_1, pressure_ratio, 0.8)
[h_3, s_3, T_3, P_3, Q_dot_comb] = combustor(h_2, s_2, T_2, P_2, T_max)
[h_4, s_4, T_4, P_4] = turbine(h_3, s_3, T_3, P_3, W_dot_compressor, 0.8)

rho_4 = refpropm('D','P',P_4,'H',h_4,fluid);
v_in  = mass_flow_rate / (rho_4*a_turbine)
[h_4_prime, s_4_prime, T_4_prime, P_4_prume, v_out, thrust_stat] = compressible_nozzle(rho_4, s_4, P_4, v_in)
% thrust_spef = nozzle(h_4, h_1, v_plane, 0, a_turbine, P_4)
usefull_enthalpy = h_4 - h_1;

figure(1)
clf
subplot(1, 3, 1)
plot([1 2 3 4], [T_1 T_2 T_3 T_4])
title("Temperature")

subplot(1, 3, 3)
plot([1 2 3 4], [P_1 P_2 P_3 P_4])
title("Presssure")


subplot(1, 3, 2)
plot([1 2 3 4], [s_1 s_2 s_3 s_4])
title("Entropy")


    

end