tau1 = 16;
tau2 = 5;
A = 1;
t = -10:100;
y = curve_array(tau1, tau2, A, t);
plot(t, y);
grid on;