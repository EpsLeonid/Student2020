clc;
y = Func1(1,16,5,-10,100);
S = Func2(13,6,15,1,y(1,:));
t=y(2,:);
%Draw expontnta 
figure(1);
plot(t,y(1,:),'b','LineWidth',2)
title('Exponenta'); 
ylabel('y'); 
xlabel('t'); 
grid on; 
%Draw cusp-like 
figure(2);
plot(t,S,'r','LineWidth',2)
title('CUSP-LIKE');
ylabel('S');
xlabel('t'); 
grid on; 