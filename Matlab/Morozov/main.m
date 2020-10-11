% parameters for function test1
A=1;
T1=16;
T2=5;
t=-10:100;

y = Task1(A,T1,T2,t);  % start function from Task1
figure;
plot(t,y,'red')        % plot function from Task1

% parameters for function test2

l = 6;
k = 13;
m1 = 16;
m2 = 1;

S = Task2(l,k,m1,m2,y);% start function Task2
figure;
plot(t,S,'green')      % plot function from Task2