% ����myclose:����ģ���ͼ����п�����
% �������:I:ԭͼ��
%          modelx:ģ�壨���ڱ���ɫΪ��ɫ��
%          �в���n��n>0��:ִ��n�Σ��ݹ�ʵ�֣�
%          �޲���n:ִ��һ��
% �������:��������ͼ������OUT
% ʹ�ú���:nargin:�жϺ��������������Ŀ����
%         myswell():����
%         mycorrode():��ʴ
function OUT =myopen(I,model,n)
if nargin ==2
    OUT=mycorrode(I,model);%�ȸ�ʴ������
    OUT=myswell(OUT,model);
elseif nargin>2
	OUT=mycorrode(I,model);
	OUT=myswell(OUT,model);
	n=n-1;
	if n>0
        OUT=myclose(OUT,model,n);
	end
end