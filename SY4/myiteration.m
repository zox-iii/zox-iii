% 函数myiteration:迭代阈值法
% 输入参数:I:原图像
% 输出参数:阈值threshold
% 使用函数:im2double(I):变为双精度
%         min():最小元素
%         max():最大元素
%         find(A):符合条件A的元素
%         mean():求数组平均值
%         abs():求绝对值
function threshold=myiteration(I)
I=im2double(I);     %变为双精度，即0-1
T0=0.01;            %参数T0
T1=(min(I(:))+max(I(:)))/2;%选取图像中最大像素和最小像素的中阈值作为T1
r1=find(I>T1);%灰度值大于T1的
r2=find(I<=T1);%其他
T2=(mean(I(r1))+mean(I(r2)))/2;%新的阈值T2    %mean函数是一个求数组平均值的函数
while abs(T2-T1)<T0
    T1=T2;
    r1=find(I>T1);%灰度值大于T1的
    r2=find(I<=T1);%其他
    T2=(mean(I(r1))+mean(I(r2)))/2;%新的阈值T2
end
threshold=T2;