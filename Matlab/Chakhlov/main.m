% основной файл проекта для зананий 1.1, 1.2, 1.3
clc
t=-10:1:100;
A=1;
t1=16;
t2=5;
k=10;
l=6;
M=16;
y = try1(t, A, t1, t2) 
s = try2(k, l, M, t, y);
% построение графиков
figure; 
plot(t,y,'green')
grid on;   

figure;
plot(t,s,'red') 
grid on;   