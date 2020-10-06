function Y=Task1(A,T1,T2,t) 
for i=1:length(t)
    if t(i)<0      %проверка условия
        y(i)=0;
    else           %проверка оставшихся условий
        Y(i)=A*(exp(-t(i)/T1)-exp(-t(i)/T2));
    end
end