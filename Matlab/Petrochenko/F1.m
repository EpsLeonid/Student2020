function y = F1(A, t, tau1, tau2)
buf=zeros(1,length(t)); % auxiliary buffer filled with zeros
for i=1:length(t)% check t for negativity
    if t(i)<0
       buf(i)=0;
    else  
       y=A*(  (exp(-t(i)/tau1)) - (exp(-t(i)/tau2)));
       buf(i)=y;
    end
end
%-------------------------Make plot
plot (t,buf);
ylabel('y');
xlabel('t'); 
grid on;

