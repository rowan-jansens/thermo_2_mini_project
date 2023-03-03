function [thrust] = turbo_jet(T_1, P_1, T_max, pressure_ratio, mass_flow_rate)
% State 1 = before the compressor
% State 2 = before the combustor
% State 3 = before the turbine
% State 4 = before the nozzel


[h_2, s_2, T_2, P_2, W_dot_compressor] = compressor(NaN, NaN, T_1, P_1, pressure_ratio);

    

end