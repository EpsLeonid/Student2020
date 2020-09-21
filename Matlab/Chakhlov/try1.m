function [buffer] = try1(t, A, t1, t2) %определение функции

clc
buffer=1:1:length(t); %определение буферной переменной

   for i=1:1:length(t) %цикл для проверки знака аргумента
      if t(i)<0
       buffer(i)=0; %запись значения функции в буфер
      else
       buffer(i)=A*(exp(-(t(i)/t1))-exp(-(t(i)/t2))); % вычисление и запись значения функции в буфер
      end
   end

plot(t,buffer) %построение графика функции
grid on;

end

