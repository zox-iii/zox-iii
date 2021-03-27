clear all;close all;clc;
%% 采用函数fspecial（）和imfilter（）提取图像边框
I=imread('D:\Project_All_Apps\DIP_project\Images\CH10\Fig1006(a).tif');
I=im2double(I);
h=fspecial('laplacian');%laplacian算子，拉普拉斯算子
J=imfilter(I,h,'replicate');%图像滤波，'replicate'边界选项，这里表示：图像大小通过复制外边界的值来拓展，大小和原图一样
K=im2bw(J,40/255);%变为二值图像

figure,
subplot(121);imshow(J);axis on,title('');
subplot(122);imshow(K);axis on,title('');