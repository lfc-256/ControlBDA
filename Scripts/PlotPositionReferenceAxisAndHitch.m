close all;
x1=ScopeData.signals.values(1:31,1),'DisplayName','ScopeData.signals.values(1:31,1)','YDataSource','ScopeData.signals.values(1:31,1)'
y1=ScopeData.signals.values(1:31,2),'DisplayName','ScopeData.signals.values(1:31,1)','YDataSource','ScopeData.signals.values(1:31,2)'
x2=ScopeData1.signals.values(1:31,1),'DisplayName','ScopeData1.signals.values(1:31,1)','YDataSource','ScopeData1.signals.values(1:31,1)'
y2=ScopeData1.signals.values(1:31,2),'DisplayName','ScopeData1.signals.values(1:31,1)','YDataSource','ScopeData1.signals.values(1:31,2)'
figure('Name','Bicycle model translation from front axle to tow hitch','NumberTitle','off');
p2=plot([x1(1) x2(1)],[y1(1) y2(1)],'g','linewidth',5)    
grid on
hold on
for i=1:31
     plot([x1(i) x2(i)],[y1(i) y2(i)],'k')    
     plot(x1(i),y1(i),'r>','linewidth',5)
     plot(x2(i),y2(i),'bs','linewidth',0.5)
     pause(0.1)  
end
 p1=plot(x1,y1,'r>','linewidth',5)
 p3=plot(x2,y2,'bs','linewidth',0.5)
 p4=plot([x1(31) x2(31)],[y1(31) y2(31)],'m','linewidth',5) 
 legend([p2 p1 p3 p4],{'Initial position','Front axle','Hitch','Final position'})
 title('Front axle and hitch position change simulation.')