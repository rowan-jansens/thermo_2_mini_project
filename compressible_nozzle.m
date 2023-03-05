%%%
% Calculates the thrust and Sgen of jet nozzle
%
% Args:
%   rho_in: density at nozzle inlet (kg/m^3)
%   s_in: entropy at nozzle inlet (refprop default units
%   P_in: pressure at nozzle inlet (i.e. P4) (Kpa) 
%   v_in: velocity at nozzle inlet (m/s)
% Returns:
%   h_out: enthalpy at outlet
%   T_out: temperature at outlet (K)
%   P_out: pressure at outlet (Kpa)
%   v_out: velocity out outlet (m/s)
%   thrust_stat: static thrust (N)
%%%


function [h_out, s_out, T_out, P_out, v_out, thrust_stat] = compressible_nozzle(rho_in, s_in, P_in, v_in)

    global fluid mass_flow_rate
    
    % Air Params:
    P_out = 101; %atmospheric pressure
    gamma = 1.4177; %for adiabatic process
    
    % Properties
    s_out = s_in; %treat as ideal adiabatic process => isentropic
    rho_out = refpropm('D','P',P_out,'S',s_out,fluid); %find density at nozzle exit

    % Find velocity out (uses Compressible Bernoulli Equation)
    A = P_in*1000/rho_in - P_out*1000/rho_out; %converts to Pa from Kpa
    B = gamma / (gamma - 1);
    C = v_in^2 * 0.5;
    v_out = sqrt(2*(B*A + C));
    
    % Calculate static thrust
    thrust_stat = mass_flow_rate * (v_out - v_in);
    
    % Calculate output params
    h_out = refpropm('H','P', P_out, 'S', s_out, fluid);
    T_out = refpropm('T','P', P_out, 'S', s_out, fluid);
end