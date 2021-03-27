%% 空间域几何变换
close all;
clear all; %#ok<*CLALL>
clc;
%% RGB->灰度图像  
RGB=imread('D:\Project_All_Apps\DIP_project\Images\OTHER\kris(1).jpg'); %图像读入
I=rgb2gray(RGB); %把 RGB 图像转换成灰度图像
%% 1.图像的平移（Image translation）
% move_x=100;%竖直位移(默认向下)
% move_y=60;%水平位移(默认向右)
% OUT_1_1=mymove(I,move_x,move_y);
% move_x=100;move_y=-60;
% OUT_1_2=mymove(I,move_x,move_y);
% move_x=-100;move_y=60;
% OUT_1_3=mymove(I,move_x,move_y);
% move_x=-100;move_y=-60;
% OUT_1_4=mymove(I,move_x,move_y);
% move_x=1050;move_y=-60;%超出图像范围的情况
% OUT_1_5=mymove(I,move_x,move_y);
% figure,suptitle('【图像平移】');
% subplot(2,3,1),imshow(I),axis on,title('原图像'); 
% subplot(2,3,2),imshow(OUT_1_1),axis on,title('平移变换1');
% subplot(2,3,3),imshow(OUT_1_2),axis on,title('平移变换2');
% subplot(2,3,4),imshow(OUT_1_3),axis on,title('平移变换3');
% subplot(2,3,5),imshow(OUT_1_4),axis on,title('平移变换4');
% subplot(2,3,6),imshow(OUT_1_5),axis on,title('平移变换5（平移距离超出原图像坐标范围）');
%% 2.图像的缩放（Image scaling）
% zoom_x=0.5;zoom_y=0.5;%等比缩小
% OUT_2_1=myimresize(I,zoom_x,zoom_y);
% zoom_x=2;zoom_y=2;%等比放大
% OUT_2_2=myimresize(I,zoom_x,zoom_y);
% zoom_x=0.5;zoom_y=0.8;%非比例缩小
% OUT_2_3=myimresize(I,zoom_x,zoom_y);
% zoom_x=1.8;zoom_y=1;%非比例放大
% OUT_2_4=myimresize(I,zoom_x,zoom_y);
% figure,suptitle('【图像缩放1】');
% subplot(1,3,1),imshow(I),axis on,title('原图像') 
% subplot(1,3,2),imshow(OUT_2_1),axis on,title('等比缩小变换');
% subplot(1,3,3),imshow(OUT_2_2),axis on,title('等比放大变换');
% figure,suptitle('【图像缩放2】');
% subplot(1,3,1),imshow(I),axis on,title('原图像') 
% subplot(1,3,2),imshow(OUT_2_3),axis on,title('非比例缩小变换');
% subplot(1,3,3),imshow(OUT_2_4),axis on,title('非比例放大变换');
%% 3.图像的旋转（Image rotation）
% alpha=30;%默认>0为逆时针旋转
% OUT_3_1=myimrotate(I,alpha);
% alpha=120;
% OUT_3_2=myimrotate(I,alpha);
% alpha=-30;%默认<0为顺时针旋转
% OUT_3_3=myimrotate(I,alpha);
% alpha=-100;
% OUT_3_4=myimrotate(I,alpha);
% figure,suptitle('【图像逆时针旋转】');
% subplot(1,3,1),imshow(I),axis on,title('原图像');
% subplot(1,3,2),imshow(OUT_3_1),axis on,title('图像旋转1');
% subplot(1,3,3),imshow(OUT_3_2),axis on,title('图像旋转2');
% figure,suptitle('【图像顺时针旋转】');
% subplot(1,3,1),imshow(I),axis on,title('原图像');
% subplot(1,3,2),imshow(OUT_3_3),axis on,title('图像旋转3');
% subplot(1,3,3),imshow(OUT_3_4),axis on,title('图像旋转4');
%% 4.图像的镜像变换（Image mirror transformation）
OUT_4_1=mymirror(I,'level');%选择参数'level'即为水平镜像
OUT_4_2=mymirror(I,'vertical');%选择参数'vertical'即为垂直镜像
figure,suptitle('【图像镜像变换】');
subplot(1,3,1),imshow(I),axis on,title('原图像');
subplot(1,3,2),imshow(OUT_4_1),axis on,title('水平镜像');
subplot(1,3,3),imshow(OUT_4_2),axis on,title('垂直镜像');
%% 5.图像的转置（Image transpose）
OUT_5_1=mytranspose(I);
figure,suptitle('【图像转置变换】');
subplot(1,2,1),imshow(I),axis on,title('原图像');
subplot(1,2,2),imshow(OUT_5_1),axis on,title('转置变换');
%% 6.图像的剪切（Image clipping）
J=double(I);
OUT_6=J(500:1000,200:300);
figure,suptitle('【图像剪切】');
subplot(1,2,1),imshow(I),axis on,title('原图像');
subplot(1,2,2),imshow(uint8(OUT_6)),axis on,title('剪切');
%% 调用matlab函数的显示（Display）
% X1=imresize(I,2); %对图像进行缩放(使用matlab的函数)
% X2=imrotate(I,45,'bilinear'); %对图像进行旋转(使用matlab的函数)
% X3=imcrop(I,[75 68 200 400]); %对图像进行剪切
% figure,imshow(I);
% figure,imshow(X1);
% figure,imshow(X2);
% figure,imshow(X3);