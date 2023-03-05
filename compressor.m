function [h_out, s_out, T_out, P_out, W_dot, S_gen] = compressor(h_in, s_in, T_in, P_in, pressure_ratio, n_compressor)
   global fluid mass_flow_rate

    %assume isentropic compressor
    s_out = s_in;

    %calculate presssure from pressure ratio
    P_out = P_in*pressure_ratio;

    %other parameters using refprop
    h_out = refpropm('H', 'P', P_out, 'S', s_out, fluid);
    
    %calculate work
    W_dot_ideal = mass_flow_rate*(h_out - h_in)
    W_dot = W_dot_ideal/n_compressor;

    h_out = (W_dot/mass_flow_rate) + h_in;
    T_out = refpropm('T', 'P', P_out, 'h', h_out, fluid);
    s_out = refpropm('S', 'P', P_out, 'h', h_out, fluid);

    S_gen = mass_flow_rate*(s_out-s_in)

end