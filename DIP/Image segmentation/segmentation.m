clear all;close all;clc;
%% 1.获取灰度直方图
% I=imread('D:\Project_All_Apps\DIP_project\Images\CH10\Fig1006(a).tif');
% figure,
% subplot(121);imshow(I);
% subplot(122);imhist(I);
%% 2,采用全局阈值对图像进行分割
% clear all;close all;clc;
% I=imread('D:\Project_All_Apps\DIP_project\Images\CH10\Fig1006(a).tif');
% J=I>120;%图像分割，阈值为200
% HW=size(I);%获取图像的大小
% for i=1:HW(1)
%     for j=1:HW(2)
%         if(I(i,j)>130)%图像分割，阈值为500
%             K(i,j)=1;
%         else
%             K(i,j)=0;
%         end
%     end
% end
% figure,
% subplot(131);imshow(I);
% subplot(132);imshow(J);
% subplot(133);imshow(K);
%% 3.采用函数im2bw进行彩色图像的分割
% RGB=imread('D:\Project_All_Apps\DIP_project\Images\CH06\Fig0604(a).tif');
% [X,map]=rgb2ind(RGB,256); %将彩色图像转换为索引图像
% J=ind2gray(X,map);%将索引图像转换为灰度图像
% K=im2bw(X,map,0.4);%图像分割，阈值为0.4
% figure,
% subplot(121);imshow(J);
% subplot(122);imshow(K);
%% 4.采用Otsu算法进行图像分割
I=imread('D:\Project_All_Apps\DIP_project\Images\CH10\Fig1006(a).tif');
%I=rgb2gray(I);
I=im2double(I);
T=graythresh(I);%获取阈值，该函数采用Otsu算法获取灰度图像的最优阈值
J=im2bw(I,T);%图像分割
figure,
subplot(121);imshow(I);
subplot(122);imshow(J);
%%  5.采用迭代式阈值法进行图像分割
% I=imread('D:\Project_All_Apps\DIP_project\Images\CH10\Fig1006(a).tif');
% I=im2double(I);
% T0=0.01;%参数T0
% T1=(min(I(:)+max(I(:))))/2;%选取图像中最大像素和最小像素的中阈值作为T1
% r1=find(I>T1);%灰度值大于T1的
% r2=find(I<=T1);%其他
% T2=(mean(I(r1))+mean(I(r2)))/2;%新的阈值T2    %mean函数是一个求数组平均值的函数
% while abs(T2-T1)<T0
%     T1=T2;
%     r1=find(I>T1);%灰度值大于T1的
%     r2=find(I<=T1);%其他
%     T2=(mean(I(r1))+mean(I(r2)))/2;%新的阈值T2
% end
% J=im2bw(I,T2);%图像分割
% figure,
% subplot(121);imshow(I);
% subplot(122);imshow(J);