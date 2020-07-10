function Linea = CreaLinea(P1,P2,Color,Ancho)
    X=[P1(1),P2(1)]; Y=[P1(2),P2(2)]; Z=[P1(3),P2(3)];
Linea=line(X,Y,Z,'Color',Color,'LineWidth',Ancho);
