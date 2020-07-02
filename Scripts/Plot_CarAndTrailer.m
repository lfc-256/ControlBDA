close all;
x1=ScopeData.signals.values(1:151,1),'DisplayName','ScopeData.signals.values(1:151,1)','YDataSource','ScopeData.signals.values(1:151,1)'
y1=ScopeData.signals.values(1:151,2),'DisplayName','ScopeData.signals.values(1:151,2)','YDataSource','ScopeData.signals.values(1:151,2)'
xh=ScopeData.signals.values(1:151,3),'DisplayName','ScopeData.signals.values(1:151,3)','YDataSource','ScopeData.signals.values(1:151,3)'
yh=ScopeData.signals.values(1:151,4),'DisplayName','ScopeData.signals.values(1:151,4)','YDataSource','ScopeData.signals.values(1:151,4)'
x2=ScopeData.signals.values(1:151,5),'DisplayName','ScopeData.signals.values(1:151,5)','YDataSource','ScopeData.signals.values(1:151,5)'
y2=ScopeData.signals.values(1:151,6),'DisplayName','ScopeData.signals.values(1:151,6)','YDataSource','ScopeData.signals.values(1:151,6)'
phi=ScopeData.signals.values(1:151,7),'DisplayName','ScopeData.signals.values(1:151,7)','YDataSource','ScopeData.signals.values(1:151,7)'
gamma=ScopeData.signals.values(1:151,8),'DisplayName','ScopeData.signals.values(1:151,8)','YDataSource','ScopeData.signals.values(1:151,8)'
jkk=ScopeData_jkk.signals.values(1:151,1),'DisplayName','ScopeData.signals.values(1:151,2)','YDataSource','ScopeData.signals.values(1:151,1)'

figure('Name','Car and Trailer model','NumberTitle','off');

subplot(2,2,[1,2]);
p1=plot(gamma,'r','linewidth',2);
grid on
hold on
plot(-jkk,'b','linewidth',2);
p2=plot(jkk,'b','linewidth',2);
title('Rear axel angle')
ylabel('rad')
xlabel('ms')
legend([p1 p2],{'Hitch angle','Jackknife angle'})

subplot(2,2,[3,4]);
grid on
hold on
for i=1:151
    plot([x1(i) xh(i)],[y1(i) yh(i)],'k','linewidth',2)   
    plot([xh(i) x2(i)],[yh(i) y2(i)],'m','linewidth',2) 
    plot(x1(i),y1(i),'r>','linewidth',2)
    plot(xh(i),yh(i),'bs','linewidth',2)
    plot(x2(i),y2(i),'y>','linewidth',2)
    pause(0.2)  
    cla
    if i<151
        if x1(i+1) == x1(i)
            break
        end
    end
end
for i=1:151
    plot([x1(i) xh(i)],[y1(i) yh(i)],'k','linewidth',2)   
    plot([xh(i) x2(i)],[yh(i) y2(i)],'m','linewidth',2) 
end
title('Vehicle displacement.')
xlabel('m')
ylabel('m')
p3=plot(x1,y1,'r>','linewidth',2)
p4=plot(xh,yh,'bs','linewidth',2)
p5=plot(x2,y2,'y>','linewidth',2)
p2=plot([x1(151) xh(151)],[y1(151) yh(151)],'c','linewidth',5)
plot([xh(151) x2(151)],[yh(151) y2(151)],'c','linewidth',5) 
p1=plot([x1(1) xh(1)],[y1(1) yh(1)],'g','linewidth',5)
plot([xh(1) x2(1)],[yh(1) y2(1)],'g','linewidth',5) 
legend([p1 p2 p3 p4 p5],{'Start','Final','Front axle','Hitch','Trailer axle'})
