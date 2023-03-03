function [h_out, s_out, T_out, P_out, Q_dot_comb] = combustor(h_in, s_in, T_in, P_in,T_max)

P_out = P_in;                                     % Combustion chamber is isobaric
T_out = T_max;                                    % Outputs the maximum combustion chamber pressure (design parameter)
s_out = refpropm('S','T',T_out,'P',P_out,'air');  % Calculates the entropy at combustion chamber output
h_out = refpropm('H','T',T_out,'P',P_out,'air');  % Calculates the enthalpy at combustion chamber output

Q_dot_comb = h_out - h_in

end


% notes:
% Need to pass in T_max
