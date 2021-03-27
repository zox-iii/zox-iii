% 函数mysharpen:根据选择的算子对图像进行锐化处理
% 输入参数:I:原图像
%          modelx:水平边缘算子
%          modely:垂直边缘算子
% 输出参数:锐化处理后的图像OUT
% 使用函数:size(x):求矩阵大小
%         sqrt(x):开根号
%         strcmp(choice,''):比较字符串是否相等
%         myconvolve(I，model):卷积操作
function OUT=mysharpen(I,choice)
[x,y]=size(I);
%% 采用Roberts算子进行边缘检测
if strcmp(choice,'Roberts')
    modelx=[0,0,0;0,-1,0;0,0,1];%水平边缘算子
    modely=[0,0,0;0,0,-1;0,1,0];%垂直边缘算子
    b=myconvolve(I,modelx);
    c=myconvolve(I,modely);
    for i=1:x
        for j=1:y
             b(i,j)=sqrt(b(i,j)^2+c(i,j)^2); 
        end
    end
    OUT=uint8(b);
end
%% 采用Sobel算子进行边缘检测
if strcmp(choice,'Sobel')
    modelx=[-1,-2,-1;0,0,0;1,2,1];%水平边缘算子
    modely=[1,0,-1;2,0,-2;1,0,-1];%垂直边缘算子
    b=myconvolve(I,modelx);
    c=myconvolve(I,modely);
    for i=1:x
        for j=1:y
             b(i,j)=sqrt(b(i,j)^2+c(i,j)^2); 
        end
    end
    OUT=uint8(b);
end
%% 采用Prewitt算子进行边缘检测
if strcmp(choice,'Prewitt')
    modelx=[-1,-1,-1;0,0,0;1,1,1];%水平边缘算子
    modely=[-1,0,1;-1,0,1;-1,0,1];%垂直边缘算子
    b=myconvolve(I,modelx);
    c=myconvolve(I,modely);
    for i=1:x
        for j=1:y
             b(i,j)=sqrt(b(i,j)^2+c(i,j)^2); 
        end
    end
    OUT=uint8(b);
end
%% 采用Log算子进行边缘检测
if strcmp(choice,'Log')
    model=[-2,-4,-4,-4,-2;
           -4,0,8,0,-4;
           -4,8,24,8,-4;
           -4,0,8,0,-4;
           -2,-4,-4,-4,-2];%模板
    b=myconvolve(I,model);
    OUT=uint8(b);
end