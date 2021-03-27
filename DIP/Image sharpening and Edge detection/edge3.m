clear all;close all;clc;
%% ���ú���fspecial��������Ԥ����ģ��
format rat;
I=imread('D:\Project_All_Apps\DIP_project\Images\CH10\Fig1006(a).tif');
I=im2double(I);
hsobel=fspecial('sobel');%sobel����
hprewitt=fspecial('prewitt');%prewitt����
hlaplacian=fspecial('laplacian');%laplacian���ӣ�������˹����
hlog=fspecial('log',3);%log���ӣ���˹-������˹����
format short;%����������ݵĸ�ʽ�����ȱ���6λ
J1=imfilter(I,hsobel);%�߶μ��
J2=imfilter(I,hprewitt);
J3=imfilter(I,hlaplacian);
J4=imfilter(I,hlog);

figure,
subplot(321);imshow(I);axis on,title('ԭͼ');
subplot(322);imshow(J1);axis on,title('sobel����');
subplot(323);imshow(J2);axis on,title('prewitt����');
subplot(324);imshow(J3);axis on,title('laplacian����');
subplot(325);imshow(J4);axis on,title('log����');
