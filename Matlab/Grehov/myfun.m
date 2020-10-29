
function  y=myfun(x); 

 % Файл_функция ,  цикл с условием "for n _ if_else"

 N=length(x);% Задан вектор строка значений t,dt=1 (Оператор циклла t1:dt:t2)
 for n=1:N
if x(n)>=0
     y(n)=exp(-x(n)/16)-exp(-x(n)/5); % значения 2-го интервала.
 else
   y(n)=0; % значение 1-го интервала.;
end
end
%figure
% plot(x,y,'g') %Гграфик1(аргумент-функция-цвет).
%grid on       % Оформление графика.
%xlabel('war X')
%ylabel('function Y(x)')

 