% 函数myimresize:采用双线性插值法对图像进行缩放处理
% 输入参数:I为原图像
%           zoom_x,zoom_y表示缩放的倍数
% 输出参数:平移变换后的图像OUT
% 使用函数:floor(x):向下取整
%         ceil(x):向上取整
%         round(x):取最接近的整数
function OUT=myimresize(I,zoom_x,zoom_y)
if nargin==2 %若输入参数只有2个，则为等比例变换
    zoom_y=zoom_x;
end
[xx,yy,m]=size(I);%获取原图像大小
J=double(I); %二维矩阵转为双精度类型
if m == 1   %当输入为灰度图像时
rHW=[round(xx*zoom_x),round(yy*zoom_y)];%新的图像高宽
data=zeros(rHW);%新建新的图像矩阵
data(1:rHW(1),1:rHW(2))=inf;%初始为空白
for i = 1 : rHW(1)        %缩放后的图像的（i,j）位置对应原图的（x,y）
    for j = 1 : rHW(2)
        x = i / zoom_x ;
        y = j / zoom_y ;
        u = x - floor(x);
        v = y - floor(y); %得到小数部分坐标
        if x < 1           %图像的最小边界处理
            x = 1;
        end
        if y < 1
            y = 1;
        end
        if x > xx           %图像的最大边界处理
            x = xx;
        end
        if y > yy
            y = yy;
        end
        %用原图的四个真实像素点来双线性插值获得“虚”像素的像素值
        data(i, j) = J(floor(x), floor(y)) * u * v + ...
                    J(floor(x), ceil(y)) * (1-u) * v + ...
                    J(ceil(x), floor(y)) * u * (1-v) + ...
                    J(ceil(x), ceil(y)) *(1-u) * (1-v);
    end
end
OUT=uint8(data);%缩放结果
elseif m == 3   %当输入为彩色图像时
    R=I(:,:,1);%提取红色分量
    G=I(:,:,2);%提取绿色分量
    B=I(:,:,3);%提取蓝色分量  
    Result(:,:,1) = myimresize(R,zoom_x,zoom_y);
    Result(:,:,2) = myimresize(G,zoom_x,zoom_y);
    Result(:,:,3) = myimresize(B,zoom_x,zoom_y);%RGB分量统计后相加
    OUT = Result;
end
end