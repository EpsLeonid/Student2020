function graphic
A = 1;
t1 = 16;
t2 = 5;
t = -10:1:100;
x = t;
if(t<0)
    y = 0;
else
y = A*(exp(t/t1)-exp(t/t2));
plot(x,y);
end