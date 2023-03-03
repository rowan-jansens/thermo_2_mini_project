function [h_out, s_out, T_out, P_out, W_dot] = compressor(h_in, s_in, T_in, P_in, pressure_ratio)
   global fluid

    %assume isentropic compressor
    s_out = s_in;

    %calculate presssure from pressure ratio
    P_out = P_in*pressure_ratio;

    %other parameters using refprop
    h_out = refpropm('H', 'P', P_out, 'S', s_out, fluid);
    T_out = refpropm('T', 'P', P_out, 'S', s_out, fluid);

    %calculate work
    W_dot = (h_out - h_in);

end