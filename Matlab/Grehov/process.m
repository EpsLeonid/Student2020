% ����������� ������--�������  myfun; transf.
clear
close all
x=-10:100;
y=myfun(x);
figure
 plot(x,y,'g') %�������1(��������-�������-����).
grid on       % ���������� �������.
xlabel('war X')
ylabel('function Y(x)')

k=8; l=5; M=16;
s=transf(x,y,k,l,M);
 figure;     %������  ��������
 plot(s,'r') % ���������� 2 �������
  grid on 
  xlabel('n')
  ylabel('process S')
% ����� myfun; transf ��������� ��� �������, ������� ������������ ������
% ����������  x, y, s ��� ����������, ���� ���� transf �������� ������ 
% -���������, � ��������� ������ �������� ������ transf, ����� ���������� 
% ��� ������������� ���������� ��������� �������. 