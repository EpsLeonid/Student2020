function  graphic
A = 1;
t1 = 16;
t2 = 5;
t=-10:100;
Y=zeros(1,length(t)); 
for i=1:length(t)
    if t(i)<0
       Y(i)=0;
    else  
       y=A*(  (exp(-t(i)/t1)) - (exp(-t(i)/t2)));
       Y(i)=y;
    end
end
plot (t,Y);
end

