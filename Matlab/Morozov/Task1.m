function Y=Task1(A,T1,T2,t) 
for i=1:length(t)
    if t(i)<0      %�������� �������
        y(i)=0;
    else           %�������� ���������� �������
        Y(i)=A*(exp(-t(i)/T1)-exp(-t(i)/T2));
    end
end