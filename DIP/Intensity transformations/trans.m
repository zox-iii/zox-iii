RGB=imread('kris(1).jpg');                              %读取RGB图像
I = rgb2gray(RGB);                                     %把 RGB 图像转换成灰度图像 
%% 直接线性变换：直接乘以倍数
I1=I*2;
I2=I/2;
figure;
subplot(1,3,1);
imshow(I);
title('原图');
subplot(1,3,2);
imshow(I1);
title('线性2倍');
subplot(1,3,3);
imshow(I2);
title('线性1/2倍');
%%  非线性变换：对数和幂律变换
figure;
A=double(I);
B=40*(log(A+1));
I3=uint8(B);
subplot(1,3,1);
imshow(I3);
title('对数');
I_D=double(I);
C=I_D/255;
I4=uint8(255*(C.^0.7));
subplot(1,3,2);
imshow(I4);
title('幂律变换—γ=0.5');
I5=uint8(255*(C.^1.3));
subplot(1,3,3);
imshow(I5);
title('幂律变换—γ=1.5');
%% 直方图均衡
figure;
subplot(2,2,1);imshow(I);title('原始图像');
subplot(2,2,2);imhist(I);%imhist是实现显示当前图像的直方图分布
ylim('auto');title('原始图像的直方图');
J=histeq(I,256);%histeq是实现直方图均衡
subplot(2,2,3);imshow(J);title('变换后的图像');
subplot(2,2,4);imhist(J);
title('变换后的直方图');ylim('auto');