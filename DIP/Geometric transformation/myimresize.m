% ����myimresize:����˫���Բ�ֵ����ͼ��������Ŵ���
% �������:IΪԭͼ��
%           zoom_x,zoom_y��ʾ���ŵı���
% �������:ƽ�Ʊ任���ͼ��OUT
% ʹ�ú���:floor(x):����ȡ��
%         ceil(x):����ȡ��
%         round(x):ȡ��ӽ�������
function OUT=myimresize(I,zoom_x,zoom_y)
J=double(I); %��ά����תΪ˫��������
HW=size(J);%��ȡԭͼ���С
OUT=zeros(HW);%�½��µ�ͼ�����
OUT(1:HW(1),1:HW(2))=inf;%��ʼΪ�հ�
rHW=[round(HW(1)*zoom_y),round(HW(2)*zoom_x)];%�µ�ͼ��߿�
for i = 1 : rHW(1)        %���ź��ͼ��ģ�i,j��λ�ö�Ӧԭͼ�ģ�x,y��
    for j = 1 : rHW(2)
        x = i / zoom_y ;
        y = j / zoom_x ;
        u = x - floor(x);
        v = y - floor(y); %�õ�С����������
        if x < 1           %ͼ��ı߽紦��
            x = 1;
        end
        if y < 1
            y = 1;
        end
        %��ԭͼ���ĸ���ʵ���ص���˫���Բ�ֵ��á��顱���ص�����ֵ
        OUT(i, j) = J(floor(x), floor(y)) * u * v + ...
                    J(floor(x), ceil(y)) * (1-u) * v + ...
                    J(ceil(x), floor(y)) * u * (1-v) + ...
                    J(ceil(x), ceil(y)) *(1-u) * (1-v);
    end
end
OUT=uint8(OUT(1:HW(1),1:HW(2)));
end