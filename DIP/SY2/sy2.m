clear all;close all;clc;
%% 1、为图像分别加高斯噪声和椒盐噪声，采用中值滤波方法对受噪声干扰的图像滤波，窗口分别采用3*3,5*5,7*7。
I=imread('Fig1006(a).tif');                                     %读取灰度图像
J=imnoise(I,'salt & pepper',0.06);                           	%给灰度图像添加椒盐噪声
K=imnoise(I,'gaussian',0.05,0.05);                              %给灰度图像添加高斯噪声  
figure,suptitle('原图+加噪声的图像');                            %Figure 1
subplot(131), imshow(I), title('原图');                        
subplot(132), imshow(J), title('椒盐噪声');
subplot(133), imshow(K), title('高斯噪声');
J1=mymiddle(J,3);
J2=mymiddle(J,5);
J3=mymiddle(J,7);
figure,suptitle('中值滤波处理椒盐噪声');                         %Figure 2
subplot(131), imshow(J1), title('3×3 模板的中值滤波');
subplot(132), imshow(J2), title('5×5 模板的中值滤波');
subplot(133), imshow(J3), title('7×7 模板的中值滤波');
K1=mymiddle(K,3);
K2=mymiddle(K,5);
K3=mymiddle(K,7);
figure,suptitle('中值滤波处理高斯噪声');                         %Figure 3
subplot(131), imshow(K1), title('3×3 模板的中值滤波');
subplot(132), imshow(K2), title('5×5 模板的中值滤波');
subplot(133), imshow(K3), title('7×7 模板的中值滤波');
%% 2、对受噪声干扰的图像进行均值滤波。
J4=myaverage(J,3);
K4=myaverage(K,3);
figure,suptitle('3×3 模板的均值滤波');                          %Figure 4
subplot(121), imshow(J4), title('均值滤波处理椒盐噪声');
subplot(122), imshow(K4), title('均值滤波处理高斯噪声');
%% 3、分别采用Roberts 算子、Sobel算子、Prewitt算子和Log算子进行图像锐化。
I=imread('Fig1006(a).tif');
S1=mysharpen(I,'Roberts');
S2=mysharpen(I,'Sobel');
S3=mysharpen(I,'Prewitt');
S4=mysharpen(I,'Log');
figure,suptitle('图像锐化[1]');                        %Figure 5
subplot(131), imshow(I), title('原图');
subplot(132), imshow(I+S1), title('Roberts算子');
subplot(133), imshow(I+S2), title('Sobel算子');
figure,suptitle('图像锐化[2]');                        %Figure 6
subplot(121), imshow(I+S3), title('Prewitt算子');
subplot(122), imshow(I+S4), title('Log算子');