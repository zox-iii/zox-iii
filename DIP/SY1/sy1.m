clear all;close all;clc;
%% 1、读入一幅RGB图像，变换为灰度图像和二值图像，并在同一个窗口内分成三个子窗口来分别显示RGB图像和灰度图像，注上文字标题,并将结果以文件形式存到磁盘上。
RGB=imread('V.jpg');                                %图像读入
I=myrgb2gray(RGB);                                  %把 RGB 图像转换成灰度图像
J=myim2bw(RGB);                                     %把 RGB 图像转换成二值图像
figure,suptitle('图像类型转换');                          %Figure 1
subplot(131);imshow(RGB),axis on,title("RGB图像"); 
subplot(132);imshow(I),axis on,title("灰度图像"),imwrite(I,'D:\Project_All_Apps\DIP_project\zuoye\SY1\灰度图像.bmp'); 
subplot(133);imshow(J),axis on,title("二值图像"),imwrite(J,'D:\Project_All_Apps\DIP_project\zuoye\SY1\二值图像.bmp'); 
%% 2、对两幅不同图像执行加、减、乘、除操作，在同一个窗口内分成6个子窗口来分别显示，注上文字标题。
A=imread('scenery.jpg');
B=imread('person.jpg');         %读取图像
A=im2double(A);                 %将图像转换为 double 型、且范围在0-1之间
B=im2double(B);
C=0.5*A+0.5*B;                  %两幅图像相加
D=A-0.7*B;                      %两幅图像相减
E=A.*B;                         %两幅图像相乘
F=A./B;                         %两幅图像相除
figure,suptitle('代数运算');                                %Figure 2
subplot(231);imshow(A),axis on,title('背景图');
subplot(232);imshow(B),axis on,title('人物图');
subplot(233);imshow(C),axis on,title('加'),imwrite(C,'D:\Project_All_Apps\DIP_project\zuoye\SY1\加.bmp');
subplot(234);imshow(D),axis on,title('减'),imwrite(D,'D:\Project_All_Apps\DIP_project\zuoye\SY1\减.bmp');
subplot(235);imshow(E),axis on,title('乘'),imwrite(E,'D:\Project_All_Apps\DIP_project\zuoye\SY1\乘.bmp');
subplot(236);imshow(F),axis on,title('除'),imwrite(F,'D:\Project_All_Apps\DIP_project\zuoye\SY1\除.bmp');