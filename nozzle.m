%%%
% Calculates the thrust and Sgen of jet nozzle
%
% Args:
%   h4: enthalpy at state 4 (into nozzle) [J/kg]
%   h1: enthalpy at state 1 (out of nozzle) [J/kg]
%   v_plane: velocity of plane [m/s]
%   q_spef: spefic heat transfer rate from exhaust steam to
%       environment [W/(kg/s)]
%   area_inlet: the area of the jet inlet (default 0.000254469m^2)
%   P4: the pressure at jet inlet
% Returns:
%   thrust_spef: specific thrust of engine [N/(kg/s)]
%%%

function thrust_spef = nozzle(h4, h1, v_plane, q_spef, area_inlet = 0.000254469,P4)
    % No longer assumes Assume adiabatic nozzle
    h_delta = h4 - h1;
    density = refpropm('D','P',P4,'H',h4,fluid)%density at state 1
    v_dot = m_dot / density;
    v_in = v_dot/area_inlet;
    v_out = sqrt(v_in^2+2*h_delta*q_spef); %velocity out of turbine
    thrust_spef = (v_out - v_plane);
end