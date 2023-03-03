function [h_out, s_out, T_out, P_out] = turbine(h_in, s_in, T_in, P_in, w_dot_compressor)
global fluid


s_out = s_in;

h_out = h_in-w_dot_compressor ;


T_out = refpropm('T', 'H', h_out, 'S', s_out, fluid);
P_out = refpropm('P', 'H', h_out, 'S', s_out, fluid);


end