
function  y=myfun(x); 

 % ����_������� ,  ���� � �������� "for n _ if_else"

 N=length(x);% ����� ������ ������ �������� t,dt=1 (�������� ������ t1:dt:t2)
 for n=1:N
if x(n)>=0
     y(n)=exp(-x(n)/16)-exp(-x(n)/5); % �������� 2-�� ���������.
 else
   y(n)=0; % �������� 1-�� ���������.;
end
end
%figure
% plot(x,y,'g') %�������1(��������-�������-����).
%grid on       % ���������� �������.
%xlabel('war X')
%ylabel('function Y(x)')

 