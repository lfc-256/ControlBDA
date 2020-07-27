%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Testing.m
%   This script execute four simulink models corresponding to: Optimal control, PI control, Free Model control and Free Model control 
%    Modified.
%   The simulation is performed for straight, circle, winding and return to line displacement.
%   Plot control signals and hitch angle.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

%Generate variables necessary to simulation 
run('variable_dictionary') 

%Total simulation time in seconds
time=20;

%variable that represents the total number of maneuvers
Total_manuever = 4;

%Struct to save results
simOut = repmat(Simulink.SimulationOutput, 16, 1);

%Loop to execute simulink models
for i = 1:Total_manuever
    manuever=i;
	simOut(i) = sim('Vehicle_trailer_PIcontrol','ReturnWorkspaceOutputs', 'on','TimeOut',time);
    simOut(i+4) = sim('Vehicle_trailer_OptimalControl','ReturnWorkspaceOutputs', 'on','TimeOut',time);
    simOut(i+8) = sim('Vehicle_trailer_FreeModelControl','ReturnWorkspaceOutputs', 'on','TimeOut',time);
    simOut(i+12) = sim('Vehicle_trailer_FreeModelControl_Modified','ReturnWorkspaceOutputs', 'on','TimeOut',time);
end

%jackknife signal
jkk=simOut(1,1).get('ScopeData_jkk');
jkk_signal=jkk.signals.values(:,1);

%PI Control
signals_control_Straight_PI=simOut(1,1).get('ScopeData_SteeringAngle');
signals_control_circle_PI=simOut(2,1).get('ScopeData_SteeringAngle');
signals_control_Winding_PI=simOut(3,1).get('ScopeData_SteeringAngle');
signals_control_ReturnToLine_PI=simOut(4,1).get('ScopeData_SteeringAngle');

reference_Straight_PI=signals_control_Straight_PI.signals.values(:,1);
signal_control_Straight_PI=signals_control_Straight_PI.signals.values(:,2);
reference_Circle_PI=signals_control_circle_PI.signals.values(:,1);
signal_control_Circle_PI=signals_control_circle_PI.signals.values(:,2);
reference_Winding_PI=signals_control_Winding_PI.signals.values(:,1);
signal_control_Winding_PI=signals_control_Winding_PI.signals.values(:,2);
reference_ReturnToLine_PI=signals_control_ReturnToLine_PI.signals.values(:,1);
signal_control_ReturnToLine_PI=signals_control_ReturnToLine_PI.signals.values(:,2);

gamma_Straight_PI=simOut(1,1).get('ScopeData');
gamma_circle_PI=simOut(2,1).get('ScopeData');
gamma_Winding_PI=simOut(3,1).get('ScopeData');
gamma_ReturnToLine_PI=simOut(4,1).get('ScopeData');

Signal_gamma_Straight_pi=gamma_Straight_PI.signals.values(:,8);
Signal_gamma_circle_pi=gamma_circle_PI.signals.values(:,8);
Signal_gamma_Winding_pi=gamma_Winding_PI.signals.values(:,8);
Signal_gamma_ReturnToLine_pi=gamma_ReturnToLine_PI.signals.values(:,8);

%Optimal  Control
signals_control_Straight_Optimal=simOut(5,1).get('ScopeData_SteeringAngle');
signals_control_circle_Optimal=simOut(6,1).get('ScopeData_SteeringAngle');
signals_control_Winding_Optimal=simOut(7,1).get('ScopeData_SteeringAngle');
signals_control_ReturnToLine_Optimal=simOut(8,1).get('ScopeData_SteeringAngle');

signal_control_Straight_Optimal=signals_control_Straight_Optimal.signals.values(:,2);
signal_control_Circle_Optimal=signals_control_circle_Optimal.signals.values(:,2);
signal_control_Winding_Optimal=signals_control_Winding_Optimal.signals.values(:,2);
signal_control_ReturnToLine_Optimal=signals_control_ReturnToLine_Optimal.signals.values(:,2);

gamma_Straight_Optimal=simOut(5,1).get('ScopeData');
gamma_circle_Optimal=simOut(6,1).get('ScopeData');
gamma_Winding_Optimal=simOut(7,1).get('ScopeData');
gamma_ReturnToLine_Optimal=simOut(8,1).get('ScopeData');

Signal_gamma_Straight_Optimal=gamma_Straight_Optimal.signals.values(:,8);
Signal_gamma_circle_Optimal=gamma_circle_Optimal.signals.values(:,8);
Signal_gamma_Winding_Optimal=gamma_Winding_Optimal.signals.values(:,8);
Signal_gamma_ReturnToLine_Optimal=gamma_ReturnToLine_Optimal.signals.values(:,8);

%Free Model Control
signals_control_Straight_FMC=simOut(9,1).get('ScopeData_SteeringAngle');
signals_control_circle_FMC=simOut(10,1).get('ScopeData_SteeringAngle');
signals_control_Winding_FMC=simOut(11,1).get('ScopeData_SteeringAngle');
signals_control_ReturnToLine_FMC=simOut(12,1).get('ScopeData_SteeringAngle');

signal_control_Straight_FMC=signals_control_Straight_FMC.signals.values(:,2);
signal_control_Circle_FMC=signals_control_circle_Optimal.signals.values(:,2);
signal_control_Winding_FMC=signals_control_Winding_FMC.signals.values(:,2);
signal_control_ReturnToLine_FMC=signals_control_ReturnToLine_FMC.signals.values(:,2);

gamma_Straight_FMC=simOut(9,1).get('ScopeData');
gamma_circle_FMC=simOut(10,1).get('ScopeData');
gamma_Winding_FMC=simOut(11,1).get('ScopeData');
gamma_ReturnToLine_FMC=simOut(12,1).get('ScopeData');

Signal_gamma_Straight_FMC=gamma_Straight_FMC.signals.values(:,8);
Signal_gamma_circle_FMC=gamma_circle_FMC.signals.values(:,8);
Signal_gamma_Winding_FMC=gamma_Winding_FMC.signals.values(:,8);
Signal_gamma_ReturnToLine_FMC=gamma_ReturnToLine_FMC.signals.values(:,8);

%Free Model Control Modified
signals_control_Straight_FMCM=simOut(13,1).get('ScopeData_SteeringAngle');
signals_control_circle_FMCM=simOut(14,1).get('ScopeData_SteeringAngle');
signals_control_Winding_FMCM=simOut(15,1).get('ScopeData_SteeringAngle');
signals_control_ReturnToLine_FMCM=simOut(16,1).get('ScopeData_SteeringAngle');

signal_control_Straight_FMCM=signals_control_Straight_FMCM.signals.values(:,2);
signal_control_Circle_FMCM=signals_control_circle_FMCM.signals.values(:,2);
signal_control_Winding_FMCM=signals_control_Winding_FMCM.signals.values(:,2);
signal_control_ReturnToLine_FMCM=signals_control_ReturnToLine_FMCM.signals.values(:,2);

gamma_Straight_FMCM=simOut(13,1).get('ScopeData');
gamma_circle_FMCM=simOut(14,1).get('ScopeData');
gamma_Winding_FMCM=simOut(15,1).get('ScopeData');
gamma_ReturnToLine_FMCM=simOut(16,1).get('ScopeData');

Signal_gamma_Straight_FMCM=gamma_Straight_FMCM.signals.values(:,8);
Signal_gamma_circle_FMCM=gamma_circle_FMCM.signals.values(:,8);
Signal_gamma_Winding_FMCM=gamma_Winding_FMCM.signals.values(:,8);
Signal_gamma_ReturnToLine_FMCM=gamma_ReturnToLine_FMCM.signals.values(:,8);


%Generate plot to straigt
figure('Name','Prueba de controladores: desplazamiento en linea recta','NumberTitle','off');
subplot(2,1,1);
grid on
hold on
p4=plot(signal_control_Straight_FMC,'r-','linewidth',1);
p5=plot(signal_control_Straight_FMCM,'g-','linewidth',1);
p1=plot(reference_Straight_PI,'k-','linewidth',1);
p2=plot(signal_control_Straight_PI,'y-','linewidth',1);
p3=plot(signal_control_Straight_Optimal,'m-','linewidth',1);

title('Señal de control comparada con referencia')
legend([p1 p2 p3 p4 p5],{'Señal de referencia','Control PI','Control Óptimo', 'Control Libre de Modelo','Control Libre de Modelo Modificado'})
ylabel('rad')
xlabel('ms')
subplot(2,1,2);
grid on
hold on
p1=plot(jkk_signal,'k-','linewidth',1);
plot(-jkk_signal,'k-','linewidth',1);
p4=plot(Signal_gamma_Straight_FMC,'r-','linewidth',1);
p5=plot(Signal_gamma_Straight_FMCM,'g-','linewidth',1);
p2=plot(Signal_gamma_Straight_pi,'y-','linewidth',1);
p3=plot(Signal_gamma_Straight_Optimal,'m-','linewidth',1);

title('Comportamiendo del ángulo de Enganche aplicando control')
legend([p1 p2 p3 p4 p5],{'Señal de Jackknife','Control PI','Control Óptimo', 'Control Libre de Modelo','Control Libre de Modelo Modificado'})
ylabel('rad')
xlabel('ms')

%Generate plot to circle
figure('Name','Prueba de controladores: desplazamiento en circulo','NumberTitle','off');
subplot(2,1,1);
grid on
hold on
p4=plot(signal_control_Circle_FMC,'r-','linewidth',1);
p5=plot(signal_control_Circle_FMCM,'g-','linewidth',1);
p1=plot(reference_Circle_PI,'k-','linewidth',1);
p2=plot(signal_control_Circle_PI,'y-','linewidth',1);
p3=plot(signal_control_Circle_Optimal,'m-','linewidth',1);

title('Señal de control comparada con referencia')
legend([p1 p2 p3 p4 p5],{'Señal de referencia','Control PI','Control Óptimo', 'Control Libre de Modelo','Control Libre de Modelo Modificado'})
ylabel('rad')
xlabel('ms')
subplot(2,1,2);
grid on
hold on
p1=plot(jkk_signal,'k-','linewidth',1);
plot(-jkk_signal,'k-','linewidth',1);
p4=plot(Signal_gamma_circle_FMC,'r-','linewidth',1);
p5=plot(Signal_gamma_circle_FMCM,'g-','linewidth',1);
p2=plot(Signal_gamma_circle_pi,'y-','linewidth',1);
p3=plot(Signal_gamma_circle_Optimal,'m-','linewidth',1);

title('Comportamiendo del ángulo de Enganche aplicando control')
legend([p1 p2 p3 p4 p5],{'Señal de Jackknife','Control PI','Control Óptimo', 'Control Libre de Modelo','Control Libre de Modelo Modificado'})
ylabel('rad')
xlabel('ms')

%Generate plot to Winding
figure('Name','Prueba de controladores: desplazamiento con curvas multiples','NumberTitle','off');
subplot(2,1,1);
grid on
hold on
p4=plot(signal_control_Winding_FMC,'r-','linewidth',1);
p5=plot(signal_control_Winding_FMCM,'g-','linewidth',1);
p1=plot(reference_Winding_PI,'k-','linewidth',1);
p2=plot(signal_control_Winding_PI,'y-','linewidth',1);
p3=plot(signal_control_Winding_Optimal,'m-','linewidth',1);

title('Señal de control comparada con referencia')
legend([p1 p2 p3 p4 p5],{'Señal de referencia','Control PI','Control Óptimo', 'Control Libre de Modelo','Control Libre de Modelo Modificado'})
ylabel('rad')
xlabel('ms')
subplot(2,1,2);
grid on
hold on
p1=plot(jkk_signal,'k-','linewidth',1);
plot(-jkk_signal,'k-','linewidth',1);
p4=plot(Signal_gamma_Winding_FMC,'r-','linewidth',1);
p5=plot(Signal_gamma_Winding_FMCM,'g-','linewidth',1);
p2=plot(Signal_gamma_Winding_pi,'y-','linewidth',1);
p3=plot(Signal_gamma_Winding_Optimal,'m-','linewidth',1);

title('Comportamiendo del ángulo de Enganche aplicando control')
legend([p1 p2 p3 p4 p5],{'Señal de Jackknife','Control PI','Control Óptimo', 'Control Libre de Modelo','Control Libre de Modelo Modificado'})
ylabel('rad')
xlabel('ms')

%Generate plot to Return to line
figure('Name','Prueba de controladores: desplazamiento con giro brusco','NumberTitle','off');
subplot(2,1,1);
grid on
hold on
p4=plot(signal_control_ReturnToLine_FMC,'r-','linewidth',1);
p5=plot(signal_control_ReturnToLine_FMCM,'g-','linewidth',1);
p1=plot(reference_ReturnToLine_PI,'k-','linewidth',1);
p2=plot(signal_control_ReturnToLine_PI,'y-','linewidth',1);
p3=plot(signal_control_ReturnToLine_Optimal,'m-','linewidth',1);

title('Señal de control comparada con referencia')
legend([p1 p2 p3 p4 p5],{'Señal de referencia','Control PI','Control Óptimo', 'Control Libre de Modelo','Control Libre de Modelo Modificado'})
ylabel('rad')
xlabel('ms')
subplot(2,1,2);
grid on
hold on
p1=plot(jkk_signal,'k-','linewidth',1);
plot(-jkk_signal,'k-','linewidth',1);
p4=plot(Signal_gamma_ReturnToLine_FMC,'r-','linewidth',1);
p5=plot(Signal_gamma_ReturnToLine_FMCM,'g-','linewidth',1);
p2=plot(Signal_gamma_ReturnToLine_pi,'y-','linewidth',1);
p3=plot(Signal_gamma_ReturnToLine_Optimal,'m-','linewidth',1);

title('Comportamiendo del ángulo de Enganche aplicando control')
legend([p1 p2 p3 p4 p5],{'Señal de Jackknife','Control PI','Control Óptimo', 'Control Libre de Modelo','Control Libre de Modelo Modificado'})
ylabel('rad')
xlabel('ms')