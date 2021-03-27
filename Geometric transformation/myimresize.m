% 函数myimresize:采用双线性插值法对图像进行缩放处理
% 输入参数:I为原图像
%           zoom_x,zoom_y表示缩放的倍数
% 输出参数:平移变换后的图像OUT
% 使用函数:floor(x):向下取整
%         ceil(x):向上取整
%         round(x):取最接近的整数
function OUT=myimresize(I,zoom_x,zoom_y)
J=double(I); %二维矩阵转为双精度类型
HW=size(J);%获取原图像大小
OUT=zeros(HW);%新建新的图像矩阵
OUT(1:HW(1),1:HW(2))=inf;%初始为空白
rHW=[round(HW(1)*zoom_y),round(HW(2)*zoom_x)];%新的图像高宽
for i = 1 : rHW(1)        %缩放后的图像的（i,j）位置对应原图的（x,y）
    for j = 1 : rHW(2)
        x = i / zoom_y ;
        y = j / zoom_x ;
        u = x - floor(x);
        v = y - floor(y); %得到小数部分坐标
        if x < 1           %图像的边界处理
            x = 1;
        end
        if y < 1
            y = 1;
        end
        %用原图的四个真实像素点来双线性插值获得“虚”像素的像素值
        OUT(i, j) = J(floor(x), floor(y)) * u * v + ...
                    J(floor(x), ceil(y)) * (1-u) * v + ...
                    J(ceil(x), floor(y)) * u * (1-v) + ...
                    J(ceil(x), ceil(y)) *(1-u) * (1-v);
    end
end
OUT=uint8(OUT(1:HW(1),1:HW(2)));
end