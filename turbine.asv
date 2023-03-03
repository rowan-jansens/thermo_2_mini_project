function [h_out_real, s_out, T_out, P_out] = turbine(h_in, s_in, T_in, P_in, w_dot_compressor, n_turbine)
global fluid

s_out_ideal = s_in;
h_out_ideal = h_in-w_dot_compressor;




w_dot_real = w_dot_compressor*effeciency;
h_out_real = h_in -w_dot_real;

s_out = refpropm('S', 'P', , 'H', h_out_real, fluid);
T_out = refpropm('T', 'H', h_out_real, 'S', s_out, fluid);
P_out = refpropm('P', 'H', h_out_real, 'S', s_out, fluid);


end