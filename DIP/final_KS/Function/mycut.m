% ����mycut:������ͨ��ȥ��С����
% �������:I:ԭͼ��  |  P:�ֽ�ֵ
% �������:OUT��������ͼƬ����
% ʹ�ú���:size(I):������С
%         zeros():��ȫ�����
%         bwlabel():��ȡ��ͨ����
function OUT=mycut(I,P)
[x,y]=size(I);
[X8,N] = bwlabel(I,8);%8��ͨ
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
Area  %�����ʾ��ͨ�������
%% ����ɫ������ͨ����ı��������ú�
for k=1:N
	if Area(k,1)<=P
        for i=1:x
            for j=1:y
                if X8(i,j)==k
                X8(i,j)=0;
                end
            end
        end
	end
end
OUT=logical(X8);