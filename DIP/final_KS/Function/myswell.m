% ����myswell:����ģ���ͼ��������Ͳ���
% �������:I:ԭͼ��
%          modelx:ģ�壨���ڱ���ɫΪ��ɫ��
% �������:���ͺ��ͼ������OUT
% ʹ�ú���:nargin:�жϺ��������������Ŀ����
%         size(x):������С
%         zeros():Ϊ�������ռ�
%         myim2bw(x):��ֵ������ת��Ϊ�߼�ֵ��
%         sum():���
function OUT=myswell(I,model)
[x,y]=size(I);      %��ȡԭͼ��Ĵ�С
[mx,my]=size(model);%ģ���С
wmx=floor(mx/2);%�߽��С
wmy=floor(my/2);
OUT=myim2bw(zeros(x,y),0.5);
%��չ�߽�
nHW=[x+2*wmx,y+2*wmy];%����ǽ������ı��أ�֮�����������С
data=zeros(nHW);%Ϊ����������ռ�
data(wmx+1:wmx+x,wmy+1:wmy+y)=I(:,:);%Ϊ��������ֵ
for i = 1:wmy
    data(wmx+1:wmx+x,i)=data(wmx+1:wmx+x,wmy+1);%��
    data(wmx+1:wmx+x,i+(nHW(2)-wmy))=data(wmx+1:wmx+x,wmy+y);%��
end
for i = 1:wmx
    data(i,:)=data(wmx+1,:);%��
    data(i+(nHW(1)-wmx),:)=data(nHW(1)-wmx,:);%��
end
%��ʼ����
for i=wmx+1:wmx+x
	for j=wmy+1:wmy+y
        if(sum(sum(data(i-wmx:i+wmx,j-wmy:j+wmy)&model))>0)
            OUT(i-wmx,j-wmy)=1;
        end
	end
end
end


