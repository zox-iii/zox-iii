% ����mysharpen:����ѡ������Ӷ�ͼ������񻯴���
% �������:I:ԭͼ��
%          modelx:ˮƽ��Ե����
%          modely:��ֱ��Ե����
% �������:�񻯴�����ͼ��OUT
% ʹ�ú���:size(x):������С
%         sqrt(x):������
%         strcmp(choice,''):�Ƚ��ַ����Ƿ����
%         myconvolve(I��model):�������
function OUT=mysharpen(I,choice)
[x,y]=size(I);
%% ����Roberts���ӽ��б�Ե���
if strcmp(choice,'Roberts')
    modelx=[0,0,0;0,-1,0;0,0,1];%ˮƽ��Ե����
    modely=[0,0,0;0,0,-1;0,1,0];%��ֱ��Ե����
    b=myconvolve(I,modelx);
    c=myconvolve(I,modely);
    for i=1:x
        for j=1:y
             b(i,j)=sqrt(b(i,j)^2+c(i,j)^2); 
        end
    end
    OUT=uint8(b);
end
%% ����Sobel���ӽ��б�Ե���
if strcmp(choice,'Sobel')
    modelx=[-1,-2,-1;0,0,0;1,2,1];%ˮƽ��Ե����
    modely=[1,0,-1;2,0,-2;1,0,-1];%��ֱ��Ե����
    b=myconvolve(I,modelx);
    c=myconvolve(I,modely);
    for i=1:x
        for j=1:y
             b(i,j)=sqrt(b(i,j)^2+c(i,j)^2); 
        end
    end
    OUT=uint8(b);
end
%% ����Prewitt���ӽ��б�Ե���
if strcmp(choice,'Prewitt')
    modelx=[-1,-1,-1;0,0,0;1,1,1];%ˮƽ��Ե����
    modely=[-1,0,1;-1,0,1;-1,0,1];%��ֱ��Ե����
    b=myconvolve(I,modelx);
    c=myconvolve(I,modely);
    for i=1:x
        for j=1:y
             b(i,j)=sqrt(b(i,j)^2+c(i,j)^2); 
        end
    end
    OUT=uint8(b);
end
%% ����Log���ӽ��б�Ե���
if strcmp(choice,'Log')
    model=[-2,-4,-4,-4,-2;
           -4,0,8,0,-4;
           -4,8,24,8,-4;
           -4,0,8,0,-4;
           -2,-4,-4,-4,-2];%ģ��
    b=myconvolve(I,model);
    OUT=uint8(b);
end