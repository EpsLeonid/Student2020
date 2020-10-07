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
V=F1(A, t, tau1, tau2);
plot (t,V);
title('Task 1 and 2'); % name of graph
ylabel('V'); % name of "y" axis
xlabel('t'); % name of "x" axis
grid on; % turn on grid
%------------------------------------------------

%3rd task-----------------------------
%F2(l, k, A, tau1, tau2, t, M);
figure
S=abs(F2(l, k, t, M, V));
plot (t,S);
title('Task 3');
ylabel('S');
xlabel('t'); 
grid on; 



