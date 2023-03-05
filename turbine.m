function [h_out_real, s_out, T_out, P_out] = turbine(h_in, s_in, T_in, P_in, w_dot_compressor, n_turbine)
global fluid

s_out_ideal = s_in;                                         %Ideal entropy
h_out_ideal = h_in-w_dot_compressor;                        %Ideal enthalpy

w_dot_real = w_dot_compressor*n_turbine                    %Real work
h_out_real = h_in -w_dot_real                              %Real Enthalpy


gamma_air = refpropm('K', 'T', T_in, 'H', h_out_real, fluid)     %gamma unitless
P_out = -(w_dot_real/(n_turbine*1005*T_in)-1)^(gamma_air/(gamma_air-1))*P_in %Pressure out

s_out = refpropm('S', 'P', P_out, 'H', h_out_real, fluid);          %entropy out
T_out = refpropm('T', 'P', P_out, 'H', h_out_real, fluid);          %tempature out

end