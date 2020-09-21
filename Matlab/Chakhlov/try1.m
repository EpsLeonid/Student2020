function [buffer] = try1(t, A, t1, t2) %����������� �������

clc
buffer=1:1:length(t); %����������� �������� ����������

   for i=1:1:length(t) %���� ��� �������� ����� ���������
      if t(i)<0
       buffer(i)=0; %������ �������� ������� � �����
      else
       buffer(i)=A*(exp(-(t(i)/t1))-exp(-(t(i)/t2))); % ���������� � ������ �������� ������� � �����
      end
   end

plot(t,buffer) %���������� ������� �������
grid on;

end

