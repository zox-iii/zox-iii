% ����mycut:������ͨ��ȥ��ͼƬ��ǻ��ı���������
% �������:I:ԭͼ��
% �������:OUT��������ͼƬ����
% ʹ�ú���:size(I):������С
%         zeros():��ȫ�����
%         bwlabel():��ȡ��ͨ����
function OUT=mycut(I)
[x,y]=size(I);
[X8,N] = bwlabel(I,8);%8��ͨ
% s=regionprops(X8,'Area');
% X8=ismember(X8,find([s.Area]>=7000&[s.Area]<=40000));
%% ���������ͨ��������
Area=zeros(N,1);
for i=1:x
    for j=1:y
        for k=1:N
            if X8(i,j)==k
                Area(k,1)=Area(k,1)+1;
            end
        end
    end
end
%% ����ɫ������ͨ����ı������֡����ܲ����ú�
for k=1:N
	if Area(k,1)>=7000 && Area(k,1)<=40000
        for i=1:x
            for j=1:y
                if X8(i,j)==k-1
                X8(i,j)=0;
                end
            end
        end
	end
end
OUT=logical(X8);