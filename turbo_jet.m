function [thrust] = turbo_jet(T_1, P_1, T_max, pressure_ratio, mass_flow_rate)
global fluid
% State 1 = before the compressor
% State 2 = before the combustor
% State 3 = before the turbine
% State 4 = before the nozzel

v_plane = 0;

%inputs
 % calculate input state using inital conditions
    s_1 = refpropm('S', 'T', T_1, 'P', P_1, fluid)
    h_1 = refpropm('H', 'T', T_1, 'P', P_1, fluid)


[h_2, s_2, T_2, P_2, w_dot_compressor] = compressor(h_1, s_1, T_1, P_1, pressure_ratio);
[h_3, s_3, T_3, P_3, q_dot_comb] = combustor(h_2, s_2, T_2, P_2, T_max);
[h_4, s_4, T_4, P_4, w_dot] = turbine(h_3, s_3, T_3, P_3)
thrust_spef = nozzle(h_4, h_1, v_plane)


    

end