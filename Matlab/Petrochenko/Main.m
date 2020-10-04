% Default parameters
A=1;
t=-10:100;
tau1=16;
tau2=5;
k=10;
M=16;
l=5;
%---------------------

%1st, 2nd tasks----------------------------
figure 
plot (t,F1(A, t, tau1, tau2));
title('Task 1 and 2'); % name of graph
ylabel('y'); % name of "y" axis
xlabel('t'); % name of "x" axis
grid on; % turn on grid
%------------------------------------------------

%3rd task-----------------------------
%F2(l, k, A, tau1, tau2, t, M);
figure
plot (t,abs(F2(l, k, A, tau1, tau2, t, M)));
title('Task 3');
ylabel('S');
xlabel('t'); 
grid on; 



