% 函数myimhist:画图像的频率分布直方图（包括对彩色图像的处理）
% 输入参数:I:原图像
% 输出参数:OUT：处理后的图片数据
% 使用函数:size(I):求矩阵大小
%         double(I):增加精度计算更准确
%         colorbar():画图像的灰度条
%         zeros():建全0矩阵?
function OUT=myimhist(I)
[x,y,m] = size(I);                      % 图像大小x*y
L = 256;                                % 灰度级256级
I = double(I);                          % 增加精度计算更准确
Result = zeros(L,2);                    % 定义处理过程相关数据的矩阵
if m == 1
Result(1:L,1) = 0:L-1;                  %Result第一列：灰度级别 
for c = 1:x                     
    for r = 1:y
        for k = 0:L-1  
            if ( I(c,r) == k)
                Result(k+1,2) =  Result(k+1,2) +1;%Result第二列：不同灰度级别统计的数目
            end
        end
    end
end
OUT = Result(:,2);
elseif m == 3
    R=I(:,:,1);%提取红色分量
    G=I(:,:,2);%提取绿色分量
    B=I(:,:,3);%提取蓝色分量  
    Result(:,2) = myimhist(R) + myimhist(G) + myimhist(B);%RGB分量统计后相加
OUT = Result(:,2);
end
%% 显示
bar(0:L-1,Result(:,2),0.3,'r'),xlabel('灰度值'),ylabel('出现次数'),title('图像的直方图');
colormap gray;                                          %灰度条
c=colorbar('location','southoutside');caxis([0,255]);   %灰度条位置