% 函数myrgb2gray:把 RGB 图像转换成灰度图像
% 输入参数:image:原图像
% 输出参数:灰度图像OUT
% 使用函数:size(x):求矩阵大小
%         double(x):增加精度
%         zeros():为矩阵分配空间
function gray=myrgb2gray(image)
[x,y,h]=size(image);%获取原图像的大小
image=double(image);%运算的时候用double,为了保持运算精度
if h==1
    gray=image;%如果只有一个通道说明是灰度图像，不需要做变换
else
    gray=zeros(x,y);%为输出图像分配空间
    for i = 1:x
        for j = 1:y
            gray(i,j)=image(i,j,1)*0.299+image(i,j,2)*0.587+image(i,j,3)*0.114;%根据公式计算
        end
    end
end
gray=uint8(gray);%存储的时候的一般存储为uint8类型，节省存储空间,显示的时候用uint8