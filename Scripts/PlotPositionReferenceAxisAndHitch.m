close all;
x1=ScopeData.signals.values(1:31,1),'DisplayName','ScopeData.signals.values(1:31,1)','YDataSource','ScopeData.signals.values(1:31,1)'
y1=ScopeData.signals.values(1:31,2),'DisplayName','ScopeData.signals.values(1:31,1)','YDataSource','ScopeData.signals.values(1:31,2)'
x2=ScopeData1.signals.values(1:31,1),'DisplayName','ScopeData1.signals.values(1:31,1)','YDataSource','ScopeData1.signals.values(1:31,1)'
y2=ScopeData1.signals.values(1:31,2),'DisplayName','ScopeData1.signals.values(1:31,1)','YDataSource','ScopeData1.signals.values(1:31,2)'
figure('Name','Bicycle model translation from front axle to tow hitch','NumberTitle','off');

for i=1:31
     plot([x1(i) x2(i)],[y1(i) y2(i)],'k')    
     grid on
     hold on
     plot(x1(i),y1(i),'r>','linewidth',5)
     plot(x2(i),y2(i),'bs','linewidth',0.5)
     pause(0.1)  
end
 p1=plot(x1,y1,'r>','linewidth',5,'DisplayName','2016')
 p3=plot(x2,y2,'bs','linewidth',0.5,'DisplayName','2016')
 legend([p1 p3],{'Front axle','Hitch'})
 title('Front axle and hitch position change animation.')