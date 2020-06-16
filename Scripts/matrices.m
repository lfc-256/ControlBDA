

M = [m1+m2,-m2*(c1+a2),-m2*a2,0;
     m1*c1,Iz1,0,0;
     -m2*a2,Iz2+(m2*a2*(c1+a2)),Iz2+(m2*a2^2),0;
     0,0,0,1];
 
 D = [-(Cyf+Cyr+Cyt)/vx,((-Cyf*a1)+(Cyr*b1)+(Cyt*(c1+12))-((m1+m2)*vx^2))/vx,Cyt*l2/vx,Cyt;
      -(Cyf*(a1+c1)+Cyr*e1)/vx, (-Cyf*a1*(a1+c1)+(Cyr*b1*e1)-(m1*c1*vx^2))/vx, 0, 0;
      (Cyt*l2)/vx,-(Cyt*l2*(c1+l2)+m2*a2*vx^2)/vx,-(Cyt*l2^2)/vx,-Cyt*l2;
       0,0,1,0];
   
 E=[Cyf, 0, 0;
    Cyf*(a1+c1), 1, 0;
    0, 0, 1;
    0, 0, 0];

F=[1 1;
   c1, 0;
   0, -a2;
   0, 0];
A=inv(M)*D;
B=inv(M)*E;
G=inv(M)*F;