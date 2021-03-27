clear all;close all;clc;
%% 检测到图像中的线段，叠加
I=imread('D:\Project_All_Apps\DIP_project\Images\CH10\Fig1006(a).tif');
h1=[-1,-1,-1;2,2,2;-1,-1,-1];%模板，表示线段为水平线段
h2=[-1,-1,2;-1,2,-1;2,-1,-1];%+45°线段
h3=[-1,2,-1;-1,2,-1;-1,2,-1];%垂直线段
h4=[2,-1,-1;-1,2,-1;-1,-1,2];%-45°线段
J1=imfilter(I,h1);%线段检测
J2=imfilter(I,h2);
J3=imfilter(I,h3);
J4=imfilter(I,h4);
J=J1+J2+J3+J4;%四条线段叠加

figure,
subplot(321);imshow(I);axis on,title('原图');
subplot(322);imshow(J);axis on,title('四条线段叠加');
subplot(323);imshow(J1);axis on,title('水平线段');
subplot(324);imshow(J2);axis on,title('+45°线段');
subplot(325);imshow(J3);axis on,title('垂直线段');
subplot(326);imshow(J4);axis on,title('-45°线段');