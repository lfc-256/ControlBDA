% X&Y position graph for Bicycle model vehicle 
close all;

x1=Front.signals.values(:,1);
y1=Front.signals.values(:,2);

figure('Name','Bicycle Model Vehicle','NumberTitle','off');
p1=plot(x1(1),y1(1),'go','linewidth',5);    
grid on
hold on

plot([x1(1) x1(2)],[y1(1) y1(2)],'k')
p2=plot(x1(1),y1(1),'r>','linewidth',2);
pause(0.1)
for i=2:21
    plot([x1(i-1) x1(i)],[y1(i-1) y1(i)],'k')    
    p2=plot(x1(i),y1(i),'r>','linewidth',2);
    pause(0.1)  
end

p1=plot(x1(1),y1(1),'go','linewidth',5);
p3=plot(x1(21),y1(21),'mo','linewidth',5);
legend([p1 p2 p3],{'Initial position','Front axle','Final position'})
title('Bicycle model vehicle front axle''s position');

