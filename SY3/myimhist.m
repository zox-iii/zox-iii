% ����myimhist:��ͼ���Ƶ�ʷֲ�ֱ��ͼ�������Բ�ɫͼ��Ĵ���
% �������:I:ԭͼ��
% �������:OUT��������ͼƬ����
% ʹ�ú���:size(I):������С
%         double(I):���Ӿ��ȼ����׼ȷ
%         colorbar():��ͼ��ĻҶ���
%         zeros():��ȫ0����?
function OUT=myimhist(I)
[x,y,m] = size(I);                      % ͼ���Сx*y
L = 256;                                % �Ҷȼ�256��
I = double(I);                          % ���Ӿ��ȼ����׼ȷ
Result = zeros(L,2);                    % ���崦�����������ݵľ���
if m == 1
Result(1:L,1) = 0:L-1;                  %Result��һ�У��Ҷȼ��� 
for c = 1:x                     
    for r = 1:y
        for k = 0:L-1  
            if ( I(c,r) == k)
                Result(k+1,2) =  Result(k+1,2) +1;%Result�ڶ��У���ͬ�Ҷȼ���ͳ�Ƶ���Ŀ
            end
        end
    end
end
OUT = Result(:,2);
elseif m == 3
    R=I(:,:,1);%��ȡ��ɫ����
    G=I(:,:,2);%��ȡ��ɫ����
    B=I(:,:,3);%��ȡ��ɫ����  
    Result(:,2) = myimhist(R) + myimhist(G) + myimhist(B);%RGB����ͳ�ƺ����
OUT = Result(:,2);
end
%% ��ʾ
bar(0:L-1,Result(:,2),0.3,'r'),xlabel('�Ҷ�ֵ'),ylabel('���ִ���'),title('ͼ���ֱ��ͼ');
colormap gray;                                          %�Ҷ���
c=colorbar('location','southoutside');caxis([0,255]);   %�Ҷ���λ��