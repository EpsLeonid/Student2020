function y=test1(A,T1,T2,t)
%m=zeros(1,length(t)); %�������� �������
for i=1:length(t)

    if t(i)<0           %��������� ������� t<0
    y(i)=0;             %���� ������� ����������� 

    else                %��������� ������� t>0
    y(i)=A*(exp(-t(i)/T1)-exp(-t(i)/T2));  %���� ������� ����������� 
end

end

