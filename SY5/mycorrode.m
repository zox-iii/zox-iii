% 函数mycorrode:根据模板对图像进行腐蚀操作
% 输入参数:I:原图像
%          modelx:模板（对于背景色为黑色）
%          有参数n（n>0）:执行n次（递归实现）
%          无参数n:执行一次
% 输出参数:腐蚀后的图像数据OUT
% 使用函数:nargin:判断函数输入参数的数目参数
%         size(x):求矩阵大小
%         zeros():为矩阵分配空间
%         im2bw(x):二值化（即转化为逻辑值）
%         sum():求和
function OUT=mycorrode(I,model,n)
if nargin ==2
    [x,y]=size(I);      %获取原图像的大小
    w=(size(model)-1)/2;
    OUT=im2bw(zeros(x,y));
    for i=w+1:x-1
        for j=w+1:y-1
            if(sum(sum(I(i-w:i+w,j-w:j+w)&model))==sum(model(:)))
                OUT(i,j)=1;
            end
        end
    end
elseif nargin>2
    [x,y]=size(I);      %获取原图像的大小
    w=(size(model)-1)/2;
    OUT=im2bw(zeros(x,y));
    for i=w+1:x-1
        for j=w+1:y-1
            if(sum(sum(I(i-w:i+w,j-w:j+w)&model))==sum(model(:)))
                OUT(i,j)=1;
            end
        end
    end
	n=n-1;
	if n>0
        OUT=mycorrode(OUT,model,n);
	end
end