clear all;close all;clc;
%% ��⵽ͼ���е��߶Σ�����
I=imread('D:\Project_All_Apps\DIP_project\Images\CH10\Fig1006(a).tif');
h1=[-1,-1,-1;2,2,2;-1,-1,-1];%ģ�壬��ʾ�߶�Ϊˮƽ�߶�
h2=[-1,-1,2;-1,2,-1;2,-1,-1];%+45���߶�
h3=[-1,2,-1;-1,2,-1;-1,2,-1];%��ֱ�߶�
h4=[2,-1,-1;-1,2,-1;-1,-1,2];%-45���߶�
J1=imfilter(I,h1);%�߶μ��
J2=imfilter(I,h2);
J3=imfilter(I,h3);
J4=imfilter(I,h4);
J=J1+J2+J3+J4;%�����߶ε���

figure,
subplot(321);imshow(I);axis on,title('ԭͼ');
subplot(322);imshow(J);axis on,title('�����߶ε���');
subplot(323);imshow(J1);axis on,title('ˮƽ�߶�');
subplot(324);imshow(J2);axis on,title('+45���߶�');
subplot(325);imshow(J3);axis on,title('��ֱ�߶�');
subplot(326);imshow(J4);axis on,title('-45���߶�');