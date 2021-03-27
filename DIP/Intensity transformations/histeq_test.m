%% 初始化数据
RGB=imread('kris(1).jpg');            %读取RGB图像
I = rgb2gray(RGB);                    %把 RGB 图像转换成灰度图像
[x,y] = size(I);                      %图像大小x*y
L = 256;
Result = zeros(L,5);                  %定义处理过程相关数据的矩阵
New = zeros(L,3);
%% Result第一列：灰度级别
Result(1:L,1) = 0:L-1;          
New(1:L,1) = 0:L-1;
%% Result第二列：不同灰度级别统计的数目
for r = 1:x                     
    for c = 1:y
        for k = 0:L-1  
            if ( I(r,c) == k)
                Result(k+1,2) =  Result(k+1,2) +1;
            end
        end
    end
end
%% Result第三列：不同灰度级别统计的概率
Result(1:L,3) = Result(1:L,2)/(x*y);
%% Result第四列：不同灰度级别累积分布
for k = 0:L-1                           
    for j = 1:k+1
        Result(k+1,4) = Result(k+1,4)+Result(j,3); 
    end
end
%% Result第五列：映射
Result(1:L,5) = floor(((L-1)-0)*Result(1:L,4)+0.5);
%% 得到新的直方图的数据
for r = 0:L-1                           
    for k = 0:L-1
        if ( Result(r+1,5) == k )
            New(k+1,2) = New(k+1,2) + Result(r+1,3);
        end
    end
end
New(:,3) = New(:,2)*(x*y);
%% 得到均衡化的数据为：
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
%% 将均衡化的数据图像转换为灰度图像
Gray = im2uint8(mat2gray(J));
figure,
subplot(1,2,1),imshow(Gray),title('按均衡化步骤变换后的图像');
subplot(1,2,2),bar(0:L-1,New(:,3),0.3,'r'),xlabel('灰度值'),ylabel('出现次数'),title('图像的直方图');
colormap gray;c=colorbar('location','southoutside');caxis([0,255]);
%% 对比测试
K=histeq(RGB,256);
figure,
subplot(1,2,1),imshow(K),title('使用函数histeq变换后的图像');%histeq是实现直方图均衡
subplot(1,2,2),imhist(K),title('图像的直方图') ;      
