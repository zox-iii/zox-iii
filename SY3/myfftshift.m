% 函数myfftshift:变换频谱中心
% 输入参数:I:原图像
% 输出参数:F：处理后的图片数据
% 使用函数:size(I):求矩阵大小
function A = myfftshift(I)
sz = ceil(size(I)/2);
A = I([sz(1)+1:end, 1:sz(1)], [sz(2)+1:end, 1:sz(2)]);
end