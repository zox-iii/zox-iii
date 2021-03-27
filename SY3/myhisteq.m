% ����myhisteq:ֱ��ͼ���⻯�������Բ�ɫͼ��Ĵ���
% �������:I:ԭͼ��
% �������:OUT��������ͼƬ����
% ʹ�ú���:size(I):������С
%         double(I):���Ӿ��ȼ����׼ȷ
%         floor():����ȡ��
%         myhisteq():��ͼ���Ƶ�ʷֲ�ֱ��ͼ
function OUT = myhisteq(I)
%% ��ʼ������
[x,y,m] = size(I);                      % ͼ���Сx*y
L = 256;                                % �Ҷȼ�256��
I = double(I);                          % ���Ӿ��ȼ����׼ȷ
Result = zeros(L,5);                  % ���崦�����������ݵľ���
if m==1                                 %��Ϊ�Ҷ�ͼ��ʱ
%% Result��һ�У��Ҷȼ���
Result(1:L,1) = 0:L-1;          
%% Result�ڶ��У���ͬ�Ҷȼ���ͳ�Ƶ���Ŀ
for c = 1:x                     
    for r = 1:y
        for k = 0:L-1  
            if ( I(c,r) == k)
                Result(k+1,2) =  Result(k+1,2) +1;
            end
        end
    end
end
%% Result�����У���ͬ�Ҷȼ���ͳ�Ƶĸ���
Result(1:L,3) = Result(1:L,2)/(x*y);
%% Result�����У���ͬ�Ҷȼ����ۻ��ֲ�
for k = 0:L-1                           
    for j = 1:k+1
        Result(k+1,4) = Result(k+1,4)+Result(j,3); 
    end
end
%% Result�����У�ӳ��
Result(1:L,5) = floor(((L-1)-0)*Result(1:L,4)+0.5);
%% �õ����⻯������Ϊ��
J = zeros(r,c,1);
for c = 1:x                     
    for r = 1:y
        for k = 0:L-1  
            if ( I(c,r) == k)
                J(c,r) =  Result(k+1,5);
            end
        end
    end
end
%% �����⻯������ͼ��ת��Ϊ�Ҷ�ͼ��
OUT = im2uint8(mat2gray(J));
elseif m == 3                   %��ɫͼ����⻯
    OUT =I;
    R=I(:,:,1);%��ȡ��ɫ����
    G=I(:,:,2);%��ȡ��ɫ����
    B=I(:,:,3);%��ȡ��ɫ����  
    R=myhisteq(R);
    G=myhisteq(G);
    B=myhisteq(B);
    OUT(:,:,1)=R;
    OUT(:,:,2)=G;
    OUT(:,:,3)=B;
end
end
