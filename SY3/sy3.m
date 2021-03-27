clear all;close all;clc;
%% 1、对一幅分辨率低的图像采用直方图均衡化方法实现图像增强，分别采用系统函数和自己编写函数实现相应用功能。
I=imread('Fig0208(a).tif');            %读取一幅分辨率低的灰度图像
H=myhisteq(I);                         %直方图均衡化
figure,suptitle('自编写');             %Figure 1
subplot(131),imshow(I),axis on,title('原图（分辨率低）'); 
subplot(132),imshow(H),title('使用自编写的myhisteq变换后的图像');
subplot(133),myimhist(H),title('图像的直方图'); 
%对比测试
K=histeq(I,256);                       %histeq是实现直方图均衡的系统函数
figure,suptitle('系统函数');            %Figure 2
subplot(131),imshow(I),axis on,title('原图（分辨率低）') ; 
subplot(132),imshow(K),axis on,title('使用函数histeq变换后的图像');
subplot(133),imhist(K),title('图像的直方图') ; 
%% 2、对一幅图像分别进行傅里叶变换和离散余弦变换，并把傅里叶变换直流分量移到频谱中心。
I=imread('Fig0517(a).tif');
F=myfft2(I);          %傅里叶变换
A=sqrt(real(F).^2+imag(F).^2);
F1=(A-min(min(A)))/(max(max(A))-min(min(A)))*225;
F=myfftshift(F);      %将频谱图中零频率成分移动至频谱图中心
A=sqrt(real(F).^2+imag(F).^2);
F2=(A-min(min(A)))/(max(max(A))-min(min(A)))*225;
F3=real(ifft2(ifftshift(F)));  %频率域反变换到空间域，并取实部
F3=im2uint8(mat2gray(F3));    %更改图像类型
figure,suptitle('傅里叶变换');           %Figure 3
subplot(221),imshow(I),axis on,title('原图') ; 
subplot(222),imshow(F1),axis on,title('傅里叶变换频谱图');
subplot(223),imshow(F2),axis on,title('频移后的频谱图') ; 
subplot(224),imshow(F3),axis on,title('逆傅里叶变换');
J = dct2(I);%计算二维 DCT 变换、图像大部分能量集中在上左角处
J(abs(J)<0.1) = 0;%把变换矩阵中小于 10 的值置换为 0，对灰度矩阵进行量化
K = idct2(J)/255;%然后用 idct2 重构图像
figure,suptitle('离散余弦变换');          %Figure 4
subplot(131),imshow(I),axis on,title('原图') ; 
subplot(132),imshow(log(abs(J))),axis on,title('余弦变换系数');
subplot(133),imshow(K),title('余弦反变换恢复图像') ; 