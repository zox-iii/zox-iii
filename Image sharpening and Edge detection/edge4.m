clear all;close all;clc;
%% ���ú���fspecial������imfilter������ȡͼ��߿�
I=imread('D:\Project_All_Apps\DIP_project\Images\CH10\Fig1006(a).tif');
I=im2double(I);
h=fspecial('laplacian');%laplacian���ӣ�������˹����
J=imfilter(I,h,'replicate');%ͼ���˲���'replicate'�߽�ѡ������ʾ��ͼ���Сͨ��������߽��ֵ����չ����С��ԭͼһ��
K=im2bw(J,40/255);%��Ϊ��ֵͼ��

figure,
subplot(121);imshow(J);axis on,title('');
subplot(122);imshow(K);axis on,title('');