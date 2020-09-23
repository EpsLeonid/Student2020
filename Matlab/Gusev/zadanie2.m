function[S] = zadanie2(k,l,M,y)

%сдвигаем массив на k,l и l+k, создаём массивы длины k,l,l+k с нулями и 
%вставляем их в начало исходного массива, получается смещённый график
    y1 = [1:k];
    y1(1,:) = 0;
    Y1 = [y1,y(1,:)];
    y2 = [1:l];
    y2(1,:) = 0;
    Y2 = [y2,y(1,:)];
    y3 = [1:k+l];
    y3(1,:) = 0;
    Y3 = [y3,y(1,:)];
% начальные условия
n = 1;
p = y(n);
s = y(n);    
while n <= size(y,2)
   %вычисляем треугольник, треугольник получается точнее, если k и l взять
   %побольше
    d = y(n) - Y1(n) - Y2(n) + Y3(n);
    p = p + d;
    s = s + p + M*d;
    S(n) = s;
    n = n + 1;
end
