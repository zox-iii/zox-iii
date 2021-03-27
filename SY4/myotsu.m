% 函数myotsu:最大类间差法
% 输入参数:I:原图像
% 输出参数:阈值threshold
% 使用函数:size(I):求矩阵大小
%         rgb2gray():rgb转化为灰度图像
%         im2double():变为双精度，即0-1
function threshold=myotsu(I)
[M,N,i]=size(I);     %得到图像行列值
if i>1
    I=rgb2gray(I);%若不是灰度图像则先处理为灰度图像
end
I=im2double(I);  %变为双精度，即0-1
number_all=M*N;  %总像素值
hui_all=0;       %预设图像总灰度值为0
ICV_t=0;        %预设最大方差为0
for i=1:M
    for j=1:N
        hui_all=hui_all+I(i,j);%得到图像总灰度值
    end
end
all_ave=hui_all*255/number_all;   %图像灰度值的总平均值
 
%t为某个阈值，把原图像分为A部分（每个像素值>=t）与B部分（每个像素值<t）
for t=0:255                       %不断试探最优t值
    hui_A=0;                      %不断重置A部分总灰度值
    hui_B=0;                      %不断重置B部分总灰度值
    number_A=0;                   %不断重置A部分总像素
    number_B=0;                   %不断重置B部分总像素
    for i=1:M                     %遍历原图像每个像素的灰度值
        for j=1:N
            if (I(i,j)*255>=t)    %分割出灰度值>=t的像素
                number_A=number_A+1;  %得到A部分总像素
                hui_A=hui_A+I(i,j);   %得到A部分总灰度值
            elseif (I(i,j)*255<t) %分割出灰度值<t的像素
                number_B=number_B+1;  %得到B部分总像素
                hui_B=hui_B+I(i,j);   %得到B部分总灰度值
            end
        end
    end
    PA=number_A/number_all;            %得到A部分像素总数与图像总像素的比列
    PB=number_B/number_all;            %得到B部分像素总数与图像总像素的比列
    A_ave=hui_A*255/number_A;          %得到A部分总灰度值与A部分总像素的比例
    B_ave=hui_B*255/number_B;          %得到B部分总灰度值与B部分总像素的比例
    ICV=PA*((A_ave-all_ave)^2)+PB*((B_ave-all_ave)^2);  %Otsu算法
    if (ICV>ICV_t)                     %不断判断，得到最大方差
        ICV_t=ICV;
        k=t;                           %得到最大方差的最优阈值
    end
end
threshold=k/255;                           %显示阈值