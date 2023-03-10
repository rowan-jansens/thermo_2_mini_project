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
%   P4: the pressure at jet inlet (Kpa)
%   fluid: the fluid
%   m_dot: mass flow rate
% Returns:
%   thrust_spef: specific thrust of engine [N/(kg/s)]
%%%


function [h_out, s_out, T_out, P_out, velocity_out] = simple_nozzle(h_in, s_in, T_in, T_1)

    global fluid mass_flow_rate
    P_out = 101; %atmospheric
    T_exit = T_in; %treat like an expansion valve, t=const
    T_out = T_1;
    density = refpropm('D','T',T_exit,'P',P_out,fluid); %find density at nozzle exit

    s_out = refpropm('S','T',T_out,'P',P_out,fluid);
    h_out = refpropm('H','T',T_out,'P',P_out,fluid);


    %velocity using continuity equation
    area_outlet = pi*(0.084/2)^2; %m^2
    velocity_out = mass_flow_rate/area_outlet/density;  %velocity out of the engine

end