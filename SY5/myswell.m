% ����myswell:����ģ���ͼ��������Ͳ���
% �������:I:ԭͼ��
%          modelx:ģ�壨���ڱ���ɫΪ��ɫ��
%          �в���n��n>0��:ִ��n�Σ��ݹ�ʵ�֣�
%          �޲���n:ִ��һ��
% �������:���ͺ��ͼ������OUT
% ʹ�ú���:nargin:�жϺ��������������Ŀ����
%         size(x):������С
%         zeros():Ϊ�������ռ�
%         im2bw(x):��ֵ������ת��Ϊ�߼�ֵ��
%         sum():���
function OUT=myswell(I,model,n)
if nargin ==2
    [x,y]=size(I);      %��ȡԭͼ��Ĵ�С
    w=(size(model)-1)/2;
    OUT=im2bw(zeros(x,y));
    for i=w+1:x-1
        for j=w+1:y-1
            if(sum(sum(I(i-w:i+w,j-w:j+w)&model))>0)
                OUT(i,j)=1;
            end
        end
    end
elseif nargin>2
	[x,y]=size(I);      %��ȡԭͼ��Ĵ�С
    w=(size(model)-1)/2;
    OUT=im2bw(zeros(x,y));
    for i=w+1:x-1
        for j=w+1:y-1
            if(sum(sum(I(i-w:i+w,j-w:j+w)&model))>0)
                OUT(i,j)=1;
            end
        end
    end
	n=n-1;
	if n>0
        OUT=myswell(OUT,model,n);
	end
end