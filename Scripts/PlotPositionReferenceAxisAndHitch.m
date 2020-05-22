close all;
x1=ScopeData.signals.values(1:30001,1),'DisplayName','ScopeData.signals.values(1:30001,1)','YDataSource','ScopeData.signals.values(1:30001,1)'
y1=ScopeData.signals.values(1:30001,2),'DisplayName','ScopeData.signals.values(1:30001,1)','YDataSource','ScopeData.signals.values(1:30001,2)'
x2=ScopeData1.signals.values(1:30001,1),'DisplayName','ScopeData1.signals.values(1:30001,1)','YDataSource','ScopeData1.signals.values(1:30001,1)'
y2=ScopeData1.signals.values(1:30001,2),'DisplayName','ScopeData1.signals.values(1:30001,1)','YDataSource','ScopeData1.signals.values(1:30001,2)'
plot(x1,y1,'b','linewidth',10)
hold on
plot(x2,y2,'r','linewidth',5)
legend('Reference Point','Hitch')
title('Front reference and hitch')