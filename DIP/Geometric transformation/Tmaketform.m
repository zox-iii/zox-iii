close all;
clear all;
clc;
RGB=imread('D:\Project_All_Apps\DIP_project\Images\OTHER\kris(1).jpg'); %ͼ�����
i=rgb2gray(RGB); %�� RGB ͼ��ת���ɻҶ�ͼ��
%% ͼ����ת
ia=maketform('affine',[cosd(30) -sind(30) 0; sind(30) cosd(30) 0; 0 0 1]');%������ת�����ṹ��
ia=imtransform(i,ia);%ʵ��ͼ����ת
%% ͼ�������
ib=maketform('affine',[5 0 0;0 10.5 0;0 0 1]');%�������Ų����ṹ��
ib=imtransform(i,ib);%ʵ��ͼ�������
%% ͼ���ƽ��
xform=[1 0 55; 0 1 115; 0 0 1]';
ic=maketform('affine',xform);%ʵ��ͼ���ƽ��
ic=imtransform(i,ic,'Xdata',[1 (size(i,2)+xform(3,1))],'Ydata',[1 (size(i,1)+xform(3,2))],'FillValues',255);%����ͼ��ƽ�ƣ�size(i,2)��ʾԭʼͼ��������xform(3,1)��ʾ�����е�һ��
%% ͼ�������б�
id=maketform('affine',[1 4 0;2 1 0;0 0 1]');%����ͼ�������б�����ṹ��
id=imtransform(i,id,'FillValues',255);%ʵ��ͼ�������б�
%% ͼ��ת�ñ任
T=affine2d([0 1 0;1 0 0;0 0 1]);%����ռ�任�ṹT.����Ϊת�ñ任����
ie=imwarp(i,T);                %��ԭͼ��I����ת�ñ任
%%
figure
subplot(1,2,1),imshow(ia),axis on;
subplot(1,2,2),imshow(ib),axis on;
figure
subplot(1,2,1),imshow(ic),axis on;
subplot(1,2,2),imshow(id),axis on;
figure
imshow(ie),axis on;