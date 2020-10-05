function y = F1(A, t, tau1, tau2)
y=zeros(1,length(t));
for i=1:length(t)
    if t(i)<0     % check t for negativity
       y(i)=0;
    else  
       y(i)=A*(  (exp(-t(i)/tau1)) - (exp(-t(i)/tau2)));
    end
end


