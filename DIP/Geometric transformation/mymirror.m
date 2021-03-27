%函数mymirror:实现图像镜像
%输入参数:I原图像
%        choice选择水平或垂直镜像
%输出参数:OUT镜像变换后的图像
%使用函数:strcmp(a,b):比较两个字符串是否相等
function OUT=mymirror(I,choice)
J=double(I);
HW=size(J);%获取原图像大小
OUT=zeros(HW);%新建新的图像矩阵
OUT(1:HW(1),1:HW(2))=inf;%初始为空白
for i = 1:HW(1)
    for j=1:HW(2)
        if strcmp(choice,'level')
            OUT(i, j) = J(i, HW(2)+1-j);
        elseif strcmp(choice,'vertical')
            OUT(i, j) = J(HW(1)+1-i, j);
        end
    end
end
OUT=uint8(OUT);
end