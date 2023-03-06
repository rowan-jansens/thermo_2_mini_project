function [h_out, s_out, T_out, P_out, Q_dot_comb,fuel_m_dot,rho_out_comb] = combustor(h_in, s_in, T_in, P_in, T_max)

global fluid mass_flow_rate

P_out = P_in;                                    % Combustion chamber is isobaric
T_out = T_max;                                   % Outputs the maximum combustion chamber pressure (design parameter)


s_out = refpropm('S','T',T_out,'P',P_out,fluid); % Calculates the entropy at combustion chamber outlet
h_out = refpropm('H','T',T_out,'P',P_out,fluid); % Calculates the enthalpy at combustion chamber outlet

rho_out_comb = refpropm('D','T',T_out,'P',P_out,fluid); % Calculates density of air at combustion chamber outlet

Q_dot_comb = (h_out - h_in) * mass_flow_rate;


j_per_kg_A1 = 43150000;                    % Joules per kg of jet A-1 fuel

fuel_m_dot = j_per_kg_A1 / Q_dot_comb;      % Fuel mass flow rate [kg/s]

end


