% ����myrgb2gray:�� RGB ͼ��ת���ɻҶ�ͼ��
% �������:image:ԭͼ��
% �������:�Ҷ�ͼ��OUT
% ʹ�ú���:size(x):������С
%         double(x):���Ӿ���
%         zeros():Ϊ�������ռ�
function gray=myrgb2gray(image)
[x,y,h]=size(image);%��ȡԭͼ��Ĵ�С
image=double(image);%�����ʱ����double,Ϊ�˱������㾫��
if h==1
    gray=image;%���ֻ��һ��ͨ��˵���ǻҶ�ͼ�񣬲���Ҫ���任
else
    gray=zeros(x,y);%Ϊ���ͼ�����ռ�
    for i = 1:x
        for j = 1:y
            gray(i,j)=image(i,j,1)*0.299+image(i,j,2)*0.587+image(i,j,3)*0.114;%���ݹ�ʽ����
        end
    end
end
gray=uint8(gray);%�洢��ʱ���һ��洢Ϊuint8���ͣ���ʡ�洢�ռ�,��ʾ��ʱ����uint8