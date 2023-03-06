function [thrust_stat, Q_dot_comb, usefull_enthalpy, efficiency] = turbo_jet(T_1, P_1, T_max, pressure_ratio)
global fluid mass_flow_rate
% State 1 = before the compressor
% State 2 = before the combustor
% State 3 = before the turbine
% State 4 = before the nozzel  

v_plane = 0;
a_turbine = pi*(0.084/2)^2;



%inputs
 % calculate input state using inital conditions
    s_1 = refpropm('S', 'T', T_1, 'P', P_1, fluid);
    h_1 = refpropm('H', 'T', T_1, 'P', P_1, fluid);
    rho_1 = refpropm('D', 'T', T_1, 'P', P_1, fluid);


[h_2, s_2, T_2, P_2, W_dot_compressor, rho_2] = compressor(h_1, s_1, T_1, P_1, pressure_ratio, 0.8);
[h_3, s_3, T_3, P_3, Q_dot_comb, rho_3] = combustor(h_2, s_2, T_2, P_2, T_max);
[h_4, s_4, T_4, P_4, rho_4] = turbine(h_3, s_3, T_3, P_3, W_dot_compressor, 0.8);


v_in  = mass_flow_rate / (rho_4*a_turbine);
[h_4_prime, s_4_prime, T_4_prime, P_4_prume, v_out, thrust_stat, rho_5] = compressible_nozzle(rho_4, s_4, P_4, v_in);
% thrust_spef = nozzle(h_4, h_1, v_plane, 0, a_turbine, P_4)
usefull_enthalpy = h_4 - h_1;

efficiency = thrust_stat / Q_dot_comb;

% figure(1)
% clf
% subplot(2, 2, 1)
% plot([1 2 3 4], [T_1 T_2 T_3 T_4], "LineWidth", 2, "Color", spring(1))
% title("Temperature")
% grid on
% grid minor
% xlabel("Station")
% ylabel("Temperature (K)")
%  set(gca,'Color', [0.1 0.1 0.1])
%     set(gca,'XColor',[1 1 1])
%     set(gca,'YColor',[1 1 1])
% 
% 
% subplot(2, 2, 2)
% plot([1 2 3 4], [P_1 P_2 P_3 P_4], "LineWidth", 2, "Color", spring(1))
% title("Presssure")
% grid on
% grid minor
% xlabel("Station")
% ylabel("Pressure (kPa)")
%  set(gca,'Color', [0.1 0.1 0.1])
%     set(gca,'XColor',[1 1 1])
%     set(gca,'YColor',[1 1 1])
% 
% subplot(2, 2, 3)
% plot([1 2 3 4], [s_1 s_2 s_3 s_4], "LineWidth", 2, "Color", spring(1))
% title("Entropy")
% grid on
% grid minor
% xlabel("Station")
% ylabel("Entropy (J/kg K)")
%  set(gca,'Color', [0.1 0.1 0.1])
%     set(gca,'XColor',[1 1 1])
%     set(gca,'YColor',[1 1 1])
% 
% subplot(2, 2, 4)
% plot([1 2 3 4], [h_1 h_2 h_3 h_4], "LineWidth", 2, "Color", spring(1))
% title("Enthalpy")
% grid on
% grid minor
% xlabel("Station")
% ylabel("Enthalpy (J/Kg)")
% 
%  set(gca,'Color', [0.1 0.1 0.1])
%     set(gca,'XColor',[1 1 1])
%     set(gca,'YColor',[1 1 1])
%     set(gcf,'Color','k')
%     set(gcf, 'InvertHardcopy', 'off');
% print(gcf,'plot.png','-dpng','-r600')
% 
% sgtitle("Fluid States", "color", [1 1 1])



    

end