function y=test1(A,T1,T2,t)
%m=zeros(1,length(t)); %создание массива
for i=1:length(t)

    if t(i)<0           %проверить условие t<0
    y(i)=0;             %если условие выполняется 

    else                %проверить условие t>0
    y(i)=A*(exp(-t(i)/T1)-exp(-t(i)/T2));  %если условие выполняется 
end

end

