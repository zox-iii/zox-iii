% ����myaverage:����ģ���ͼ�������ֵ�˲�
% �������:image:ԭͼ��
%          k:ģ���СΪk��k��kΪ������
% �������:��ֵ�˲����ͼ������OUT
% ʹ�ú���:size(x):������С
%         double(x):���Ӿ���
%         zeros():Ϊ�������ռ�
%         sum(A):���
function OUT=myaverage(image,k)
HW=size(image);%��ȡԭͼ��Ĵ�С
image=double(image);%�����ʱ����double,Ϊ�˱������㾫��
wall=(k-1)/2;
nHW=[HW(1)+2*wall,HW(2)+2*wall];%����ǽ������ı��أ�֮�����������С
data=zeros(nHW);%Ϊ����������ռ�
data(wall+1:wall+HW(1),wall+1:wall+HW(2))=image(:,:);%Ϊ��������ֵ
%��'ǽ'
for i = 1:wall
    data(wall+1:wall+HW(1),i)=data(wall+1:wall+HW(1),wall+1);%��
    data(wall+1:wall+HW(1),i+(nHW(2)-wall))=data(wall+1:wall+HW(1),wall+HW(2));%��
end
for i = 1:wall
    data(i,:)=data(wall+1,:);%��
    data(i+(nHW(1)-wall),:)=data(nHW(1)-wall,:);%��
end
%���ֵ
for i = wall+1:wall+HW(1)
    for j = wall+1:wall+HW(2)
        A=zeros(1,k*k);%Ϊk��kģ������ݷ���ռ�
        for m = i-wall:i+wall
            for n = j-wall:j+wall
                A((m-i+wall)*k+(n-j+wall+1))=data(m,n);
            end
        end
        data(i,j)=sum(A)/(k*k);%���/ģ���С=��ֵ
    end
end
OUT=uint8(data(wall+1:wall+HW(1),wall+1:wall+HW(2)));%�洢��ʱ���һ��洢Ϊuint8���ͣ���ʡ�洢�ռ�,��ʾ��ʱ����uint8