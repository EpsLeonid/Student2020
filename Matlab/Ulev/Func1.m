function[Y] = Func1(A,t1,t2,tstart,tend)
t = tstart:1:tend; %init massive
i = 1;
while i <= size(t,2)
    %comparison t with 0 
    if t(i) < 0 %if t<0
 y(i) = 0;
 i = i + 1;
    else
 y(i) = A*(exp(-(t(i)/t1))-exp(-(t(i)/t2)));  %if t>0
 i = i + 1; 
    end
end
Y(2,:) = t;%massive for t
Y(1,:) = y;%massive for y

