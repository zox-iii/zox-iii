% 函数myim2bw:把 RGB 图像转换成二值图像
% 输入参数:image:原图像
% 输出参数:二值图像OUT
% 使用函数:size(x):求矩阵大小
%         double(x):增加精度
%         zeros():为矩阵分配空间
%         graythresh(image):获取阈值
function bw=myim2bw(image)
image=myrgb2gray(image);%先将RGB图像转换为灰度图像
threshold = graythresh(image);%自动确定二值化阈值
image=im2double(image);
[x,y]=size(image);%获取原图像的大小
bw=zeros(x,y);%为输出图像分配空间
for i = 1:x
    for j = 1:y
        if image(i,j)<threshold
            bw(i,j)=0;
        else
            bw(i,j)=255;
        end
    end
end
bw=logical(uint8(bw));