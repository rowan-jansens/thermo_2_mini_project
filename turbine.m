function [h_out_real, s_out, T_out, P_out, rho_out] = turbine(h_in, s_in, T_in, P_in, W_dot_compressor, n_turbine)
global fluid mass_flow_rate

s_out_ideal = s_in;                                         %Ideal entropy
h_out_ideal = h_in - (W_dot_compressor / mass_flow_rate);                        %Ideal enthalpy

W_dot_real = W_dot_compressor*n_turbine;                 %Real work
h_out_real = h_in - (W_dot_real/mass_flow_rate);                             %Real Enthalpy

Cp = refpropm('C', 'T', T_in, 'S', s_out_ideal, fluid);
Cv = refpropm('O', 'T', T_in, 'S', s_out_ideal, fluid);
gamma_air = Cp/Cv;     %gamma unitless

P_out = (P_in*1000*(-1*(((W_dot_real)/(n_turbine*Cp*T_in*mass_flow_rate))-1))^(gamma_air/(gamma_air-1))); %Pressure outP_ou
P_out = P_out/1000;

s_out = refpropm('S', 'P', P_out, 'H', h_out_real, fluid);          %entropy out
T_out = refpropm('T', 'P', P_out, 'H', h_out_real, fluid);          %tempature out
rho_out = refpropm('D', 'P', P_out, 'H', h_out_real, fluid);

end