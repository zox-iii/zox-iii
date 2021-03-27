% ����myim2bw:�� RGB ͼ��ת���ɶ�ֵͼ��
% �������:image:ԭͼ��
% �������:��ֵͼ��OUT
% ʹ�ú���:size(x):������С
%         double(x):���Ӿ���
%         zeros():Ϊ�������ռ�
%         graythresh(image):��ȡ��ֵ
function bw=myim2bw(image)
image=myrgb2gray(image);%�Ƚ�RGBͼ��ת��Ϊ�Ҷ�ͼ��
threshold = graythresh(image);%�Զ�ȷ����ֵ����ֵ
image=im2double(image);
[x,y]=size(image);%��ȡԭͼ��Ĵ�С
bw=zeros(x,y);%Ϊ���ͼ�����ռ�
for i = 1:x
    for j = 1:y
        if image(i,j)<threshold
            bw(i,j)=0;
        else
            bw(i,j)=255;
        end
    end
end
bw=logical(uint8(bw));