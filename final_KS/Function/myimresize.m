% ����myimresize:����˫���Բ�ֵ����ͼ��������Ŵ���
% �������:IΪԭͼ��
%           zoom_x,zoom_y��ʾ���ŵı���
% �������:ƽ�Ʊ任���ͼ��OUT
% ʹ�ú���:floor(x):����ȡ��
%         ceil(x):����ȡ��
%         round(x):ȡ��ӽ�������
function OUT=myimresize(I,zoom_x,zoom_y)
if nargin==2 %���������ֻ��2������Ϊ�ȱ����任
    zoom_y=zoom_x;
end
[xx,yy,m]=size(I);%��ȡԭͼ���С
J=double(I); %��ά����תΪ˫��������
if m == 1   %������Ϊ�Ҷ�ͼ��ʱ
rHW=[round(xx*zoom_x),round(yy*zoom_y)];%�µ�ͼ��߿�
data=zeros(rHW);%�½��µ�ͼ�����
data(1:rHW(1),1:rHW(2))=inf;%��ʼΪ�հ�
for i = 1 : rHW(1)        %���ź��ͼ��ģ�i,j��λ�ö�Ӧԭͼ�ģ�x,y��
    for j = 1 : rHW(2)
        x = i / zoom_x ;
        y = j / zoom_y ;
        u = x - floor(x);
        v = y - floor(y); %�õ�С����������
        if x < 1           %ͼ�����С�߽紦��
            x = 1;
        end
        if y < 1
            y = 1;
        end
        if x > xx           %ͼ������߽紦��
            x = xx;
        end
        if y > yy
            y = yy;
        end
        %��ԭͼ���ĸ���ʵ���ص���˫���Բ�ֵ��á��顱���ص�����ֵ
        data(i, j) = J(floor(x), floor(y)) * u * v + ...
                    J(floor(x), ceil(y)) * (1-u) * v + ...
                    J(ceil(x), floor(y)) * u * (1-v) + ...
                    J(ceil(x), ceil(y)) *(1-u) * (1-v);
    end
end
OUT=uint8(data);%���Ž��
elseif m == 3   %������Ϊ��ɫͼ��ʱ
    R=I(:,:,1);%��ȡ��ɫ����
    G=I(:,:,2);%��ȡ��ɫ����
    B=I(:,:,3);%��ȡ��ɫ����  
    Result(:,:,1) = myimresize(R,zoom_x,zoom_y);
    Result(:,:,2) = myimresize(G,zoom_x,zoom_y);
    Result(:,:,3) = myimresize(B,zoom_x,zoom_y);%RGB����ͳ�ƺ����
    OUT = Result;
end
end