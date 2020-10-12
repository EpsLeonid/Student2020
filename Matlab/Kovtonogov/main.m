
A = 1;
t1 = 16;
t2 = 5;
t=-10:100;
k=6;
l=6;
M=16;

Y = graphic1(A,t1,t2,t);
S = graphic2(k,M,t,l,Y);

figure(1);
plot(t,Y);
figure(2);
plot(t,S);
