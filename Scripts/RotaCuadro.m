function dato = RotaCuadro(Cuadro,Transform)
 
for j=1:4
    La=Cuadro(j);
    Xa=get(La,'xdata');Ya=get(La,'ydata');Za=get(La,'zdata');
    P1=[Xa(1),Ya(1),Za(1),1]'; P2=[Xa(2),Ya(2),Za(2),1]';
    P1=Transform*P1; P2=Transform*P2;
    Xa=[P1(1),P2(1)];Ya=[P1(2),P2(2)];Za=[P1(3),P2(3)];
    set(La,'xdata',Xa,'ydata',Ya,'zdata',Za);
    
end
