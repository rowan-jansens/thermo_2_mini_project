function [h_out, s_out, T_out, P_out, W_dot] = compressor(h_in, s_in, T_in, P_in, pressure_ratio)
    % calculate input state using inital conditions
    s_in = refpropm('S', 'T', T_in, 'P', P_in, 'nitrogen');
    h_in = refpropm('H', 'T', T_in, 'P', P_in, 'nitrogen');

    %assume isentropic compressor
    s_out = s_in;

    %calculate presssure from pressure ratio
    P_out = P_in*pressure_ratio;

    %other parameters using refprop
    h_out = refpropm('H', 'P', P_out, 'S', s_out, 'nitrogen');
    T_out = refpropm('T', 'P', P_out, 'S', s_out, 'nitrogen');

    %calculate work
    W_dot = (h_out - h_in);

end