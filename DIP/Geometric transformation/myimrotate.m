%函数myimrotate:采用双线性插值法实现图像旋转
%输入参数:I原图像
%        alpha:旋转的角度（>0为逆时针）
%输出参数:OUT旋转变换后的图像
%使用函数:mod(m,n):对m/n取余
%         abs(x):取绝对值
%         ceil(x):向上取整
%         pi:3.1415926......可直接使用
%         floor(x):向下取整
function OUT=myimrotate(I,alpha)
J=double(I);
HW=size(J);%获取原图像大小
alpha=mod(alpha,360);%将旋转角度转换到0~360之间计算
alpha=alpha*pi/180;%得到旋转弧度
%确保旋转后的图片还在坐标系内
nHW(1)=ceil(HW(1)*abs(cos(abs(alpha)))+HW(2)*abs(sin(abs(alpha))));%新图像的高heighth
nHW(2)=ceil(HW(1)*abs(sin(abs(alpha)))+HW(2)*abs(cos(abs(alpha))));%新图像的宽width?
OUT=zeros(nHW);%新建新的图像矩阵
OUT(1:nHW(1),1:nHW(2))=inf;%初始为空白
u0=HW(2)*sin(alpha);u2=HW(1)*cos(alpha);%竖直方向的相关平移量
u1=HW(1)*sin(alpha);u3=HW(2)*cos(alpha);%水平方向的相关平移量
T=[cos(alpha),sin(alpha);-sin(alpha),cos(alpha)];%变换矩阵
for i = 1:nHW(1)%（i,j）是新图像坐标，变换到原图像坐标(x,y)中。
    for j=1:nHW(2)
        if(alpha>=0 && alpha<=pi/2)
            XY=T*([i;j]-[u0;0]);%保证输出在图像的中心
        elseif(alpha>pi/2 && alpha<=pi)
            XY=T*([i;j]-[u0-u2;-u3]);%保证输出在图像的中心 
        elseif(alpha>pi && alpha<=3*pi/2)
            XY=T*([i;j]-[-u2;-u3-u1]);%保证输出在图像的中心
        elseif(alpha>3*pi/2 && alpha<=2*pi)
            XY=T*([i;j]-[0;-u1]);%保证输出在图像的中心
        end
        x=XY(1);%变换得到的原坐标
        y=XY(2);
        if x>=1 && x<=HW(1) && y>=1 && y<=HW(2) %若变换出的x和y在原图像范围内???????????????
        u = x - floor(x);
        v = y - floor(y); %得到小数部分坐标
        %用原图的四个真实像素点来双线性插值获得“虚”像素的像素值
        OUT(i, j) = J(floor(x), floor(y)) * u * v + ...
                    J(floor(x), ceil(y)) * (1-u) * v + ...
                    J(ceil(x), floor(y)) * u * (1-v) + ...
                    J(ceil(x), ceil(y)) *(1-u) * (1-v);
        end
    end
end
OUT=uint8(OUT);
end