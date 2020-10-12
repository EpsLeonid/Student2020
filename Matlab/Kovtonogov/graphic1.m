function  [Y] = graphic1(A,t1,t2,t)

Y=zeros(1,length(t)); 
for n=1:length(t)
    if t(n)<0
       Y(n)=0;
    else  
       y=A*(  (exp(-t(n)/t1)) - (exp(-t(n)/t2)));
       Y(n)=y;
    end
end
end

