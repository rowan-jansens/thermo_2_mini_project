%%%
% Calculates the thrust and Sgen of jet nozzle
%
% Args:
%   h4: enthalpy at state 4 (into nozzle) [J/kg]
%   h1: enthalpy at state 1 (out of nozzle) [J/kg]
%   v_in: velocity of plane [m/s]
% Returns:
%   thrust_spef: specific thrust of engine [N/(kg/s)]
%%%

function thrust_spef = nozzle(h4, h1, v_in)
    % Assume adiabatic nozzle
    h_delta = h4 - h1;
    v_out = sqrt(v_in^2+2*h_delta);
    thrust_spef = (v_out - v_in);
end