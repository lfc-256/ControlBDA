function Cuadro = CreaCuadro3(Largo,Ancho,Color,AnchoL)
    P1=[Largo/2;Ancho/2;0;1];
    P2=[-Largo/2;Ancho/2;0;1];
    L1=CreaLinea(P1,P2,Color,AnchoL);
    P1=P2;
    P2=[-Largo/2;-Ancho/2;0;1];
    L2=CreaLinea(P1,P2,Color,AnchoL);
    P1=P2;
    P2=[Largo/2;-Ancho/2;0;1];
    L3=CreaLinea(P1,P2,Color,AnchoL);
    P1=P2;
    P2=[Largo/2;Ancho/2;0;1];
    L4=CreaLinea(P1,P2,Color,AnchoL);
 
Cuadro=[L1;L2;L3;L4];

