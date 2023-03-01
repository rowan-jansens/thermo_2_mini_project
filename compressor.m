function [h_out, s_out, T_out, P_out, W_dot] = compressor(h_in, s_in, T_in, P_in, pressure_ratio)
    % calculate input state using inital conditions
    s_in = refpropm('S', 'T', T_in, 'P', P_in, 'air');
    h_in = refpropm('H', 'T', T_in, 'P', P_in, 'air');

    %assume isentropic compressor
    s_out = s_in;

    %calculate presssure from pressure ratio
    P_2 = P_1 * pressure_ratio;

    %other parameters using refprop
    




end