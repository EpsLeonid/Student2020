% Запуск функций из заданий
y = zadanie1(1,16,5,-10,1000);
S = zadanie2(500,500,16,y(1,:));
t = y(2,:);
figure(1);
plot(t,y(1,:));
figure(2);
plot(t,S);