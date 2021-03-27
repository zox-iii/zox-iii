clear all;close all;clc;
%% 采用Roberts算子进行边缘检测
I=imread('D:\Project_All_Apps\DIP_project\Images\CH10\Fig1006(a).tif');
I=im2double(I);
[J,thresh]=edge(I,'roberts',35/255);%这个函数的作用是返回分割阈值，
                                    %分割阈值的作用是该函数会忽略小于阈值的像素
figure,
subplot(121);imshow(I);axis on,title('原图');
subplot(122);imshow(J);axis on,title('Roberts算子');
%% 采用Prewitt算子进行边缘检测
I=imread('D:\Project_All_Apps\DIP_project\Images\CH10\Fig1006(a).tif');
I=im2double(I);
[J,thresh]=edge(I,'prewitt',[],'both');%[]表示系统自动计算阈值进行二值化，
                                       %horizontal（水平）、vertical（垂直）、both（两个都是）
figure,
subplot(121);imshow(I);axis on,title('原图');
subplot(122);imshow(I+J);axis on,title('Prewitt算子');
%% 采用sobel算子进行边缘检测
I=imread('D:\Project_All_Apps\DIP_project\Images\CH10\Fig1006(a).tif');
I=im2double(I);
[J,thresh]=edge(I,'sobel',[],'both');%[]表示系统自动计算阈值进行二值化，
                                       %horizontal（水平）、vertical（垂直）、both（两个都是）
figure,
subplot(121);imshow(I);axis on,title('原图');
subplot(122);imshow(I+J);axis on,title('sobel算子');