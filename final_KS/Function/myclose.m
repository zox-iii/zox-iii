% ����myclose:����ģ���ͼ����б�����
% �������:I:ԭͼ��
%          modelx:ģ�壨���ڱ���ɫΪ��ɫ��
%          �в���n��n>0��:ִ��n�Σ��ݹ�ʵ�֣�
%          �޲���n:ִ��һ��
% �������:��������ͼ������OUT
% ʹ�ú���:nargin:�жϺ��������������Ŀ����
%         myswell():����
%         mycorrode():��ʴ
function OUT=myclose(I,model,n)
if nargin ==2
    OUT=myswell(I,model);%�����ͺ�ʴ
    OUT=mycorrode(OUT,model);
elseif nargin>2
	OUT=myswell(I,model);
	OUT=mycorrode(OUT,model);
	n=n-1;
	if n>0
        OUT=myclose(OUT,model,n);
	end
end