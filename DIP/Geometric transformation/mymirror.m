%����mymirror:ʵ��ͼ����
%�������:Iԭͼ��
%        choiceѡ��ˮƽ��ֱ����
%�������:OUT����任���ͼ��
%ʹ�ú���:strcmp(a,b):�Ƚ������ַ����Ƿ����
function OUT=mymirror(I,choice)
J=double(I);
HW=size(J);%��ȡԭͼ���С
OUT=zeros(HW);%�½��µ�ͼ�����
OUT(1:HW(1),1:HW(2))=inf;%��ʼΪ�հ�
for i = 1:HW(1)
    for j=1:HW(2)
        if strcmp(choice,'level')
            OUT(i, j) = J(i, HW(2)+1-j);
        elseif strcmp(choice,'vertical')
            OUT(i, j) = J(HW(1)+1-i, j);
        end
    end
end
OUT=uint8(OUT);
end