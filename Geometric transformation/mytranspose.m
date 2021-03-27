%函数mytranspose:实现图像转置
%输入参数:I原图像
%输出参数:OUT转置变换后的图像
function OUT=mytranspose(I)
J=double(I);
HW=size(J);%获取原图像大小
OUT=zeros(HW(2),HW(1));%新建新的图像矩阵
OUT(1:HW(2),1:HW(1))=inf;%初始为空白
for i = 1:HW(2)
    for j=1:HW(1)
       OUT(i, j) = J(j,i);
    end
end
OUT=uint8(OUT);
end