clear all;close all;clc;
%% 采用函数fspecial（）产生预定义模板
format rat;
I=imread('D:\Project_All_Apps\DIP_project\Images\CH10\Fig1006(a).tif');
I=im2double(I);
hsobel=fspecial('sobel');%sobel算子
hprewitt=fspecial('prewitt');%prewitt算子
hlaplacian=fspecial('laplacian');%laplacian算子，拉普拉斯算子
hlog=fspecial('log',3);%log算子，高斯-拉普拉斯算子
format short;%设置输出数据的格式，精度保留6位
J1=imfilter(I,hsobel);%线段检测
J2=imfilter(I,hprewitt);
J3=imfilter(I,hlaplacian);
J4=imfilter(I,hlog);

figure,
subplot(321);imshow(I);axis on,title('原图');
subplot(322);imshow(J1);axis on,title('sobel算子');
subplot(323);imshow(J2);axis on,title('prewitt算子');
subplot(324);imshow(J3);axis on,title('laplacian算子');
subplot(325);imshow(J4);axis on,title('log算子');
