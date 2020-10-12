% parameters for function test1
A=1;
T1=16;
T2=5;
t=-10:100;

y= test1(A,T1,T2,t);  % start function test1 from task 1.2 
figure;
plot(t,y,'green');     % plot function test1 from task 1.2
grid on;

% parameters for function test2
k = 7;
l =7;
M=16;
s=test2(l, k, t, M, y) % start function test2 from task 1.3
figure;
plot(t,s,'red');       % plot function test2 from task 1.3
grid on;
