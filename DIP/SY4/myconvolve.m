% ����myconvolve:����ģ���ͼ����о������
% �������:I:ԭͼ��
%          modelx:ģ��
% �������:����������ͼ������OUT
% ʹ�ú���:size(x):������С
%         double(x):���Ӿ���
%         zeros():Ϊ�������ռ�
function OUT=myconvolve(image,model)
HW=size(image);             %��ȡԭͼ��Ĵ�С
image=double(image);
[x,y]=size(model);          %ģ���С
OUT=zeros(HW);              %Ϊ�������ռ�
%% �ӱ���
wall=(x-1)/2;
nHW=[HW(1)+2*wall,HW(2)+2*wall];%����ǽ������ı��أ�֮�����������С
data=zeros(nHW);%Ϊ����������ռ�
data(wall+1:wall+HW(1),wall+1:wall+HW(2))=image(:,:);%Ϊ��������ֵ
for i = 1:wall
    data(wall+1:wall+HW(1),i)=data(wall+1:wall+HW(1),wall+1);%��
    data(wall+1:wall+HW(1),i+(nHW(2)-wall))=data(wall+1:wall+HW(1),wall+HW(2));%��
end
for i = 1:wall
    data(i,:)=data(wall+1,:);%��
    data(i+(nHW(1)-wall),:)=data(nHW(1)-wall,:);%��
end
%% ����
for i = wall+1:wall+HW(1)
	for j = wall+1:wall+HW(2)
        for m = 1:x
            for n = 1:y
                OUT(i-wall,j-wall) = OUT(i-wall,j-wall) + ...
                data(i-wall+m-1,j-wall+n-1)*model(m,n);%������ͼ����о������
            end
        end
	end
end