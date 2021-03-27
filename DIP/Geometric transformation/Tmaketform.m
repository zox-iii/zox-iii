close all;
clear all;
clc;
RGB=imread('D:\Project_All_Apps\DIP_project\Images\OTHER\kris(1).jpg'); %图像读入
i=rgb2gray(RGB); %把 RGB 图像转换成灰度图像
%% 图像旋转
ia=maketform('affine',[cosd(30) -sind(30) 0; sind(30) cosd(30) 0; 0 0 1]');%创建旋转参数结构体
ia=imtransform(i,ia);%实现图像旋转
%% 图像的缩放
ib=maketform('affine',[5 0 0;0 10.5 0;0 0 1]');%创建缩放参数结构体
ib=imtransform(i,ib);%实现图像的缩放
%% 图像的平移
xform=[1 0 55; 0 1 115; 0 0 1]';
ic=maketform('affine',xform);%实现图像的平移
ic=imtransform(i,ic,'Xdata',[1 (size(i,2)+xform(3,1))],'Ydata',[1 (size(i,1)+xform(3,2))],'FillValues',255);%进行图像平移，size(i,2)表示原始图像列数，xform(3,1)表示第三行第一列
%% 图像整体切变
id=maketform('affine',[1 4 0;2 1 0;0 0 1]');%创建图像整体切变参数结构体
id=imtransform(i,id,'FillValues',255);%实现图像整体切变
%% 图像转置变换
T=affine2d([0 1 0;1 0 0;0 0 1]);%构造空间变换结构T.这里为转置变换矩阵
ie=imwarp(i,T);                %对原图像I进行转置变换
%%
figure
subplot(1,2,1),imshow(ia),axis on;
subplot(1,2,2),imshow(ib),axis on;
figure
subplot(1,2,1),imshow(ic),axis on;
subplot(1,2,2),imshow(id),axis on;
figure
imshow(ie),axis on;