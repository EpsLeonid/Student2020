function y=test1(A,T1,T2,t)
 % create an array
for i=1:length(t)

    if t(i)<0           % check the condition t<0
    y(i)=0;             

    else                % check the condition t>0
    y(i)=A*(exp(-t(i)/T1)-exp(-t(i)/T2));  
    end

end

