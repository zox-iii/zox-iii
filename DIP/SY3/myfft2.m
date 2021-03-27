%??fft?function;??
% 函数myfft2:二维离散傅里叶变换
% 输入参数:I:原图像
% 输出参数:F：处理后的图片数据
% 使用函数:size(I):求矩阵大小
%         ones():建全1矩阵?
%         im2double()：双精度
%         fft():一维傅里叶变换
function F = myfft2(I)
I=im2double(I);
[x,y] = size(I);
Ax = ones(x,y);
ans = ones(x,y);
com = 0+1i;%虚部
% 对每一列进行DFT  
for m=1:y
	Ax(:,m) = fft(I(:,m));%一维傅里叶变换
end
% 对每一行进行DFT    
for k=1:x
	ans(k,:) = fft(Ax(k,:));
end
F=ans;
end