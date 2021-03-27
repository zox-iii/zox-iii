% 函数myaverage:根据模板对图像进行中值滤波
% 输入参数:image:原图像
%          k:模板大小为k×k（k为奇数）
% 输出参数:均值滤波后的图像数据OUT
% 使用函数:size(x):求矩阵大小
%         double(x):增加精度
%         zeros():为矩阵分配空间
%         sum(A):求和
function OUT=myaverage(image,k)
HW=size(image);%获取原图像的大小
image=double(image);%运算的时候用double,为了保持运算精度
wall=(k-1)/2;
nHW=[HW(1)+2*wall,HW(2)+2*wall];%加上墙（补充的边沿）之后的数据区大小
data=zeros(nHW);%为数据区分配空间
data(wall+1:wall+HW(1),wall+1:wall+HW(2))=image(:,:);%为数据区赋值
%加'墙'
for i = 1:wall
    data(wall+1:wall+HW(1),i)=data(wall+1:wall+HW(1),wall+1);%左
    data(wall+1:wall+HW(1),i+(nHW(2)-wall))=data(wall+1:wall+HW(1),wall+HW(2));%右
end
for i = 1:wall
    data(i,:)=data(wall+1,:);%上
    data(i+(nHW(1)-wall),:)=data(nHW(1)-wall,:);%下
end
%求均值
for i = wall+1:wall+HW(1)
    for j = wall+1:wall+HW(2)
        A=zeros(1,k*k);%为k×k模板的数据分配空间
        for m = i-wall:i+wall
            for n = j-wall:j+wall
                A((m-i+wall)*k+(n-j+wall+1))=data(m,n);
            end
        end
        data(i,j)=sum(A)/(k*k);%求和/模板大小=均值
    end
end
OUT=uint8(data(wall+1:wall+HW(1),wall+1:wall+HW(2)));%存储的时候的一般存储为uint8类型，节省存储空间,显示的时候用uint8