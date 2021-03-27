% 函数myclose:根据模板对图像进行闭运算
% 输入参数:I:原图像
%          modelx:模板（对于背景色为黑色）
%          有参数n（n>0）:执行n次（递归实现）
%          无参数n:执行一次
% 输出参数:闭运算后的图像数据OUT
% 使用函数:nargin:判断函数输入参数的数目参数
%         myswell():膨胀
%         mycorrode():腐蚀
function OUT=myclose(I,model,n)
if nargin ==2
    OUT=myswell(I,model);%先膨胀后腐蚀
    OUT=mycorrode(OUT,model);
elseif nargin>2
	OUT=myswell(I,model);
	OUT=mycorrode(OUT,model);
	n=n-1;
	if n>0
        OUT=myclose(OUT,model,n);
	end
end