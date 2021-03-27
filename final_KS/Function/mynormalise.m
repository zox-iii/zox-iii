% 函数mynormalise:对图像归一化处理、归一化为40*20
% 输入参数:I为原图像
% 输出参数:归一化后的图像OUT
% 使用函数:size():求图像的大小
%         zeros():全0矩阵
%         imresize():缩放变换
%         im2bw():二值化
function OUT=mynormalise(image)
%字符的外边框按比例线性放大
[x,y]=size(image);
ny=y+10;
image=[zeros(x,round((ny-y)/2)) image zeros(x,round((ny-y)/2))];
image=imresize(image,[40,20]);
OUT=im2bw(image,0.5);
end
