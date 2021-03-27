clear all;close all;clc;
%% 1、采用阈值法实现图像分割，分别采用两种阈值选取方法实现。
I=imread('Fig1006(a).tif');
threshold1=myiteration(I);
threshold2=myotsu(I);
J1=im2bw(I,threshold1);
J2=im2bw(I,threshold2);
figure,suptitle('基于阈值的图像分割');                %Figure 1
subplot(131),imshow(I),axis on,title('原图') ; 
subplot(132),imshow(J1),axis on,title('迭代阈值法');
subplot(133),imshow(J2),axis on,title('otsu阈值法') ; 
%% 2、分别用Roberts,Sobel和拉普拉斯高斯算子对图像进行边缘检测，比较三种算子处理的不同之处。
E1=mysharpen(I,'Roberts');
E2=mysharpen(I,'Sobel');
E3=mysharpen(I,'Log');
figure,suptitle('边缘检测');                          %Figure 2
subplot(221), imshow(I), title('原图');
subplot(222), imshow(E1), title('Roberts算子');
subplot(223), imshow(E2), title('Sobel算子');
subplot(224), imshow(E3), title('Log算子');
%% 3、实现肺的分割，结果包括两部分：肺（白色显示）和背景（黑色显示）。 
Lung=imread('lung.jpg');
threshold=myotsu(Lung);
S1=im2bw(Lung,threshold);%二值化，将肺和胸腔等其他部分分隔开
S2=~S1;%反色，使肺部变为白色
X8=mycut(S2);%去掉胸腔外的背景和气管
figure,suptitle('肺的分割');                          %Figure 3
subplot(221),imshow(Lung),axis on,title('原图') ; 
subplot(222),imshow(S1),axis on,title('二值化');
subplot(223),imshow(S2),axis on,title('反色') ;
subplot(224),imshow(X8),axis on,title('分割后'),imwrite(X8,'D:\Project_All_Apps\DIP_project\zuoye\SY5\肺分割后.tif'); 