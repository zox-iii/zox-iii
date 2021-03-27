% 函数myswell:根据模板对图像进行膨胀操作
% 输入参数:I:原图像
%          modelx:模板（对于背景色为黑色）
% 输出参数:膨胀后的图像数据OUT
% 使用函数:nargin:判断函数输入参数的数目参数
%         size(x):求矩阵大小
%         zeros():为矩阵分配空间
%         myim2bw(x):二值化（即转化为逻辑值）
%         sum():求和
function OUT=myswell(I,model)
[x,y]=size(I);      %获取原图像的大小
[mx,my]=size(model);%模板大小
wmx=floor(mx/2);%边界大小
wmy=floor(my/2);
OUT=myim2bw(zeros(x,y),0.5);
%扩展边界
nHW=[x+2*wmx,y+2*wmy];%加上墙（补充的边沿）之后的数据区大小
data=zeros(nHW);%为数据区分配空间
data(wmx+1:wmx+x,wmy+1:wmy+y)=I(:,:);%为数据区赋值
for i = 1:wmy
    data(wmx+1:wmx+x,i)=data(wmx+1:wmx+x,wmy+1);%左
    data(wmx+1:wmx+x,i+(nHW(2)-wmy))=data(wmx+1:wmx+x,wmy+y);%右
end
for i = 1:wmx
    data(i,:)=data(wmx+1,:);%上
    data(i+(nHW(1)-wmx),:)=data(nHW(1)-wmx,:);%下
end
%开始膨胀
for i=wmx+1:wmx+x
	for j=wmy+1:wmy+y
        if(sum(sum(data(i-wmx:i+wmx,j-wmy:j+wmy)&model))>0)
            OUT(i-wmx,j-wmy)=1;
        end
	end
end
end


