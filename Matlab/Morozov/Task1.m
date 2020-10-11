function y=Task1(A,T1,T2,t) 

for i=1:length(t)
    
    if t(i)<0      %Checking the condition
        y(i)=0;
    else           %Verification of the remaining conditions
        y(i)=A*(exp(-t(i)/T1)-exp(-t(i)/T2));
    end
end