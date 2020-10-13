tau1 = 16;
tau2 = 5;
A = 1;
t = -10:100;
y = curve_array(tau1, tau2, A, t);

k = 9;
l = 5;
M = 16;
f = curve_filter(y,k,l,M);

plot(t, y);
grid on;

figure;

plot(t,f);
grid on;
