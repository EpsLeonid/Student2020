function[Y] = zadanie1(A,t1,t2,tstart,tend)

t = tstart:1:tend;
i = 1;
while i <= size(t,2)
    if t(i) < 0
        y(i) = 0;
        i = i + 1;
    else
        y(i) =  A*(exp(-(t(i)/t1))-exp(-(t(i)/t2)));
        i = i + 1;  
    end
end
Y(:,1) = t;
Y(:,2) = y;
