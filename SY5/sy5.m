clear all;close all;clc;
%% 1、采用形态学处理方法实现图像去噪。
I=imread('Fig0911(a).tif');
model=[0,1,0;1,1,1;0,1,0];  %定义3×3模板（背景色为黑色）
I1=myswell(I,model);%膨胀
I2=myclose(I1,model,5);%闭运算
I3=mycorrode(I2,model,2);%腐蚀
I4=myopen(I3,model,5);%开运算
I5=myswell(I4,model);%膨胀
figure,suptitle('指纹去噪');     %Figure 1
subplot(231),imshow(I),axis on,title('指纹（有噪声）'); 
subplot(232),imshow(I1),axis on,title('膨胀1次');
subplot(233),imshow(I2),axis on,title('闭运算5次');
subplot(234),imshow(I3),axis on,title('腐蚀2次'); 
subplot(235),imshow(I4),axis on,title('开运算5次');
subplot(236),imshow(I5),axis on,title('膨胀1次');
%% 2、对图像分割实验（实验四）得到的分割结果进行形态学处理，对肺部区域的空洞进行填充。
L=imread('实验四_肺分割后.tif');
model=[0,1,0;1,1,1;0,1,0];  %定义3×3模板
S=myswell(L,model,6);%膨胀
S1=myclose(S,model,5);%闭运算
S2=mycorrode(S1,model,6);%腐蚀
figure,suptitle('肺-形态学处理');%Figure 2
subplot(221),imshow(L),axis on,title('原图'); 
subplot(222),imshow(S),axis on,title('膨胀6次');
subplot(223),imshow(S1),axis on,title('闭运算5次');
subplot(224),imshow(S2),axis on,title('腐蚀6次');