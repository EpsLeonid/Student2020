% parameters for function test1
A=1;
T1=16;
T2=5;
t=-10:100;

y = test1(A,T1,T2,t);  % start function test1 from task 1.2 
figure;
plot(t,y,'green');     % plot function test1 from task 1.2
grid on;

% parameters for function test2
l=5;
k=11;
m1=160;
m2=10;

y2 = test2(k,l,m1,m2,y);% start function test2 from task 1.3
figure;
plot(t,y2,'red');       % plot function test2 from task 1.3
grid on;
