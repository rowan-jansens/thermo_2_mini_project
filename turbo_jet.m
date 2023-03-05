function [thrust] = turbo_jet(T_1, P_1, T_max, pressure_ratio)
global fluid mass_flow_rate
% State 1 = before the compressor
% State 2 = before the combustor
% State 3 = before the turbine
% State 4 = before the nozzel  

v_plane = 0;

%inputs
 % calculate input state using inital conditions
    s_1 = refpropm('S', 'T', T_1, 'P', P_1, fluid)
    h_1 = refpropm('H', 'T', T_1, 'P', P_1, fluid)


[h_2, s_2, T_2, P_2, w_dot_compressor] = compressor(h_1, s_1, T_1, P_1, pressure_ratio, 0.8)
[h_3, s_3, T_3, P_3, q_dot_comb] = combustor(h_2, s_2, T_2, P_2, T_max)
[h_4, s_4, T_4, P_4] = turbine(h_3, s_3, T_3, P_3, w_dot_compressor, .8)
thrust_spef = nozzle(h_4, h_1, v_plane, 703500)



figure(1)
clf
subplot(1, 3, 1)
plot([1 2 3 4], [T_1 T_2 T_3 T_4])
subplot(1, 3, 2)
plot([1 2 3 4], [s_1 s_2 s_3 s_4])
subplot(1, 3, 3)
plot([1 2 3 4], [P_1 P_2 P_3 P_4])

    

end