% 函数myconvolve:根据模板对图像进行卷积操作
% 输入参数:I:原图像
%          modelx:模板
% 输出参数:卷积操作后的图像数据OUT
% 使用函数:size(x):求矩阵大小
%         double(x):增加精度
%         zeros():为矩阵分配空间
function OUT=myconvolve(image,model)
HW=size(image);             %获取原图像的大小
image=double(image);
[x,y]=size(model);          %模板大小
OUT=zeros(HW);              %为输出分配空间
%% 加边沿
wall=(x-1)/2;
nHW=[HW(1)+2*wall,HW(2)+2*wall];%加上墙（补充的边沿）之后的数据区大小
data=zeros(nHW);%为数据区分配空间
data(wall+1:wall+HW(1),wall+1:wall+HW(2))=image(:,:);%为数据区赋值
for i = 1:wall
    data(wall+1:wall+HW(1),i)=data(wall+1:wall+HW(1),wall+1);%左
    data(wall+1:wall+HW(1),i+(nHW(2)-wall))=data(wall+1:wall+HW(1),wall+HW(2));%右
end
for i = 1:wall
    data(i,:)=data(wall+1,:);%上
    data(i+(nHW(1)-wall),:)=data(nHW(1)-wall,:);%下
end
%% 计算
for i = wall+1:wall+HW(1)
	for j = wall+1:wall+HW(2)
        for m = 1:x
            for n = 1:y
                OUT(i-wall,j-wall) = OUT(i-wall,j-wall) + ...
                data(i-wall+m-1,j-wall+n-1)*model(m,n);%对整幅图像进行卷积操作
            end
        end
	end
end