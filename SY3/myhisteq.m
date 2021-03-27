% 函数myhisteq:直方图均衡化（包括对彩色图像的处理）
% 输入参数:I:原图像
% 输出参数:OUT：处理后的图片数据
% 使用函数:size(I):求矩阵大小
%         double(I):增加精度计算更准确
%         floor():向下取整
%         myhisteq():画图像的频率分布直方图
function OUT = myhisteq(I)
%% 初始化数据
[x,y,m] = size(I);                      % 图像大小x*y
L = 256;                                % 灰度级256级
I = double(I);                          % 增加精度计算更准确
Result = zeros(L,5);                  % 定义处理过程相关数据的矩阵
if m==1                                 %当为灰度图像时
%% Result第一列：灰度级别
Result(1:L,1) = 0:L-1;          
%% Result第二列：不同灰度级别统计的数目
for c = 1:x                     
    for r = 1:y
        for k = 0:L-1  
            if ( I(c,r) == k)
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
%% 得到均衡化的数据为：
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
%% 将均衡化的数据图像转换为灰度图像
OUT = im2uint8(mat2gray(J));
elseif m == 3                   %彩色图像均衡化
    OUT =I;
    R=I(:,:,1);%提取红色分量
    G=I(:,:,2);%提取绿色分量
    B=I(:,:,3);%提取蓝色分量  
    R=myhisteq(R);
    G=myhisteq(G);
    B=myhisteq(B);
    OUT(:,:,1)=R;
    OUT(:,:,2)=G;
    OUT(:,:,3)=B;
end
end
