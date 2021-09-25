close all;
x1=ScopeData.signals.values(:,1);'DisplayName';'ScopeData.signals.values(1:151,1)';'YDataSource';'ScopeData.signals.values(1:151,1)';
y1=ScopeData.signals.values(:,2);'DisplayName';'ScopeData.signals.values(1:151,2)';'YDataSource';'ScopeData.signals.values(1:151,2)';
xh=ScopeData.signals.values(:,3);'DisplayName';'ScopeData.signals.values(1:151,3)';'YDataSource';'ScopeData.signals.values(1:151,3)';
yh=ScopeData.signals.values(:,4);'DisplayName';'ScopeData.signals.values(1:151,4)';'YDataSource';'ScopeData.signals.values(1:151,4)';
x2=ScopeData.signals.values(:,5);'DisplayName';'ScopeData.signals.values(1:151,5)';'YDataSource';'ScopeData.signals.values(1:151,5)';
y2=ScopeData.signals.values(:,6);'DisplayName';'ScopeData.signals.values(1:151,6)';'YDataSource';'ScopeData.signals.values(1:151,6)';
phi=ScopeData.signals.values(:,7);'DisplayName';'ScopeData.signals.values(1:151,7)';'YDataSource';'ScopeData.signals.values(1:151,7)';
gamma=ScopeData.signals.values(:,8);'DisplayName';'ScopeData.signals.values(1:151,8);''YDataSource';'ScopeData.signals.values(1:151,8)';
jkkData=ScopeData_jkk.signals.values(:,1);'DisplayName';'ScopeData.signals.values(1:151,1);''YDataSource';'ScopeData.signals.values(1:151,1)';
steering=ScopeData_SteeringAngle.signals.values(:,1);'DisplayName';'ScopeData.signals.values(1:151,1)';'YDataSource';'ScopeData.signals.values(1:151,1)';
signal_control=ScopeData_SteeringAngle.signals.values(:,2);'DisplayName';'ScopeData.signals.values(1:151,2)';'YDataSource';'ScopeData.signals.values(1:151,2)';

figure('Name','Car and Trailer model','NumberTitle','off');
subplot(1,2,1);
p1=plot(steering,'r','linewidth',2);
grid on;
hold on;
p2=plot(signal_control,'b','linewidth',1);
title('Steering angle');
ylabel('rad');
xlabel('ms');
legend([p1,p2],{'Steering Angle','Signal control'});

subplot(1,2,2);
p1=plot(gamma,'r','linewidth',2);
grid on;
hold on;
p2=plot(jkkData,'b','linewidth',2);
plot(-jkkData,'b','linewidth',2);
p3=plot(tolerance*jkkData,'g--','linewidth',1);
plot(-tolerance*jkkData,'g--','linewidth',1);
title('Comparison of Hitch angle with Jackknife angle');
ylabel('rad');
xlabel('ms');
legend([p1 p2 p3],{'Hitch angle','Jackknife angle','Jackknife angle with tolerance'});

% hold off;
% figure(2);
% % subplot(3,2,[3,4]);
% grid on;
% hold on;
% N=size(x1);
% for i=1:100:N(1)
%     plot([x1(i) xh(i)],[y1(i) yh(i)],'k','linewidth',2);   
%     plot([xh(i) x2(i)],[yh(i) y2(i)],'m','linewidth',2) ;
%     plot(x1(i),y1(i),'r>','linewidth',2);
%     plot(xh(i),yh(i),'bs','linewidth',2);
%     plot(x2(i),y2(i),'y>','linewidth',2);
%     pause(0.1)  
%     cla;
%     if i<N(1)
%         if x1(i+1) == x1(i)
%             break
%         end
%     end
% end
% for i=1:100:N(1)
%     plot([x1(i) xh(i)],[y1(i) yh(i)],'k','linewidth',2);
%     plot([xh(i) x2(i)],[yh(i) y2(i)],'m','linewidth',2);
% end
% title('Vehicle displacement.');
% xlabel('m');
% ylabel('m');
% p3=plot(x1,y1,'r>','linewidth',2);
% p4=plot(xh,yh,'bs','linewidth',2);
% p5=plot(x2,y2,'y>','linewidth',2);
% p2=plot([x1(N(1)) xh(N(1))],[y1(N(1)) yh(N(1))],'c','linewidth',5);
% plot([xh(N(1)) x2(N(1))],[yh(N(1)) y2(N(1))],'c','linewidth',5);
% p1=plot([x1(1) xh(1)],[y1(1) yh(1)],'g','linewidth',5);
% plot([xh(1) x2(1)],[yh(1) y2(1)],'g','linewidth',5);
% legend([p1 p2 p3 p4 p5],{'Start','Final','Front axle','Hitch','Trailer axle'});

figure(3);
%subplot(3,2,[5,6]);
PHI2=phi-gamma;                                  %Define angle reference to trailer
car_color='r';                                   %Car color                               
car=CreaCuadro3(length_c,width_c,car_color,4);   %Create car
trailer_color='b';                               %Trailer color   
trailer=CreaCuadro3(length_t,w,trailer_color,4); %Create trailer
xlabel('m'); 
ylabel('m');
grid on
x1a=0;                                            %Auxiliary variable
y1a=0;                                            %Auxiliary variable
phi1a=0;                                          %Auxiliary variable     
x2a=0;                                            %Auxiliary variable
y2a=0;                                            %Auxiliary variable
phi2a=0;                                          %Auxiliary variable
gama1a=0;                                         %Auxiliary variable
y1max=80; 
x1max=70;
vv=[0,x1max,0,y1max];
hold on
for i=1:100:N(1)
    x11=x1(i);
    y11=y1(i);
    x22=x2(i);
    y22=y2(i);
    phi1=phi(i);
    gama1=gamma(i);
    phi2=PHI2(i);
    Tpc=translh([x11,y11,0])*trotzh(phi1);
    Tpr=translh([x22,y22,0])*trotzh(phi2);
    x1a=x11;
    y1a=y11; 
    x2a=x22; 
    y2a=y22; 
    phi1a=phi1; 
    gama1a=gama1;
    plot([x1(i) xh(i)],[y1(i) yh(i)],'k--','linewidth',1);   
    plot([xh(i) x2(i)],[yh(i) y2(i)],'m','linewidth',1) ;
    RotaCuadro(car,Tpc);
    RotaCuadro(trailer,Tpr);
    X11a(i)=x1(i);
    Y11a(i)=y1(i);
    pause(0.1);
    Tpc=trotzh(-phi1)*translh([-x11,-y11,0]);
    Tpr=trotzh(-phi2)*translh([-x22,-y22,0]);     
    RotaCuadro(car,Tpc);
    RotaCuadro(trailer,Tpr);
    if i<N(1)
        if x1(i+1) == x1(i)
            break
        end
    end 
end
Tpc=translh([x11,y11,0])*trotzh(phi1);
Tpr=translh([x22,y22,0])*trotzh(phi2);
RotaCuadro(car,Tpc);
RotaCuadro(trailer,Tpr);
p3=plot([x1(N(1)) xh(N(1))],[y1(N(1)) yh(N(1))],'r','linewidth',5);
p4=plot([x1(1) xh(1)],[y1(1) yh(1)],'b','linewidth',5);
p2=plot([x1(N(1)) xh(N(1))],[y1(N(1)) yh(N(1))],'c','linewidth',5);
plot([xh(N(1)) x2(N(1))],[yh(N(1)) y2(N(1))],'c','linewidth',5); 
p1=plot([x1(1) xh(1)],[y1(1) yh(1)],'g','linewidth',5);
plot([xh(1) x2(1)],[yh(1) y2(1)],'g','linewidth',5); 
legend([p1 p2 p3 p4 ],{'Start','Final','car','trailer'});
title('Vehicle displacement.');
