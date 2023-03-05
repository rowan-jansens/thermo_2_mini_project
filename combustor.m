function [h_out, s_out, T_out, P_out, Q_dot_comb,fuel_m_dot] = combustor(h_in, s_in, T_in, P_in, T_max)

global fluid

P_out = P_in;                                       % Combustion chamber is isobaric
T_out = T_max;                                      % Outputs the maximum combustion chamber pressure (design parameter)
s_out = refpropm('S','T',T_out,'P',P_out,fluid);    % Calculates the entropy at combustion chamber output
h_out = refpropm('H','T',T_out,'P',P_out,fluid);    % Calculates the enthalpy at combustion chamber output

Q_dot_comb = h_out - h_in;


j_per_kg_A1 = 43150000;                    % Joules per kg of jet A-1 fuel

fuel_m_dot = j_per_kg_A1 / Q_dot_comb;      % Fuel mass flow rate [kg/s]

end


