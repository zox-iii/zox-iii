%����mytranspose:ʵ��ͼ��ת��
%�������:Iԭͼ��
%�������:OUTת�ñ任���ͼ��
function OUT=mytranspose(I)
J=double(I);
HW=size(J);%��ȡԭͼ���С
OUT=zeros(HW(2),HW(1));%�½��µ�ͼ�����
OUT(1:HW(2),1:HW(1))=inf;%��ʼΪ�հ�
for i = 1:HW(2)
    for j=1:HW(1)
       OUT(i, j) = J(j,i);
    end
end
OUT=uint8(OUT);
end