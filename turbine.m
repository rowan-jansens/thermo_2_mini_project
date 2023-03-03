function [h_out, s_out, T_out, P_out, w_dot] = turbine(h_in, s_in, T_in, P_in)
P_out = 1000;
s_out = refpropm('S', 'T', T_in, 'P', P_in, 'air');
s_out_check = s_out-s_in
h_out = refpropm('H', 'P', P_out, 'S', s_out, 'air');
T_out = refpropm('T', 'P', P_out, 'S', s_out, 'air');
w_dot = (h_in-h_out);

end