%% ��ʼ������
RGB=imread('kris(1).jpg');            %��ȡRGBͼ��
I = rgb2gray(RGB);                    %�� RGB ͼ��ת���ɻҶ�ͼ��
[x,y] = size(I);                      %ͼ���Сx*y
L = 256;
Result = zeros(L,5);                  %���崦�����������ݵľ���
New = zeros(L,3);
%% Result��һ�У��Ҷȼ���
Result(1:L,1) = 0:L-1;          
New(1:L,1) = 0:L-1;
%% Result�ڶ��У���ͬ�Ҷȼ���ͳ�Ƶ���Ŀ
for r = 1:x                     
    for c = 1:y
        for k = 0:L-1  
            if ( I(r,c) == k)
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
%% �õ��µ�ֱ��ͼ������
for r = 0:L-1                           
    for k = 0:L-1
        if ( Result(r+1,5) == k )
            New(k+1,2) = New(k+1,2) + Result(r+1,3);
        end
    end
end
New(:,3) = New(:,2)*(x*y);
%% �õ����⻯������Ϊ��
J = zeros(r,c);
for r = 1:x                     
    for c = 1:y
        for k = 0:L-1  
            if ( I(r,c) == k)
                J(r,c) =  Result(k+1,5);
            end
        end
    end
end
%% �����⻯������ͼ��ת��Ϊ�Ҷ�ͼ��
Gray = im2uint8(mat2gray(J));
figure,
subplot(1,2,1),imshow(Gray),title('�����⻯����任���ͼ��');
subplot(1,2,2),bar(0:L-1,New(:,3),0.3,'r'),xlabel('�Ҷ�ֵ'),ylabel('���ִ���'),title('ͼ���ֱ��ͼ');
colormap gray;c=colorbar('location','southoutside');caxis([0,255]);
%% �ԱȲ���
K=histeq(RGB,256);
figure,
subplot(1,2,1),imshow(K),title('ʹ�ú���histeq�任���ͼ��');%histeq��ʵ��ֱ��ͼ����
subplot(1,2,2),imhist(K),title('ͼ���ֱ��ͼ') ;      
