%% �ռ��򼸺α任
close all;
clear all; %#ok<*CLALL>
clc;
%% RGB->�Ҷ�ͼ��  
RGB=imread('D:\Project_All_Apps\DIP_project\Images\OTHER\kris(1).jpg'); %ͼ�����
I=rgb2gray(RGB); %�� RGB ͼ��ת���ɻҶ�ͼ��
%% 1.ͼ���ƽ�ƣ�Image translation��
% move_x=100;%��ֱλ��(Ĭ������)
% move_y=60;%ˮƽλ��(Ĭ������)
% OUT_1_1=mymove(I,move_x,move_y);
% move_x=100;move_y=-60;
% OUT_1_2=mymove(I,move_x,move_y);
% move_x=-100;move_y=60;
% OUT_1_3=mymove(I,move_x,move_y);
% move_x=-100;move_y=-60;
% OUT_1_4=mymove(I,move_x,move_y);
% move_x=1050;move_y=-60;%����ͼ��Χ�����
% OUT_1_5=mymove(I,move_x,move_y);
% figure,suptitle('��ͼ��ƽ�ơ�');
% subplot(2,3,1),imshow(I),axis on,title('ԭͼ��'); 
% subplot(2,3,2),imshow(OUT_1_1),axis on,title('ƽ�Ʊ任1');
% subplot(2,3,3),imshow(OUT_1_2),axis on,title('ƽ�Ʊ任2');
% subplot(2,3,4),imshow(OUT_1_3),axis on,title('ƽ�Ʊ任3');
% subplot(2,3,5),imshow(OUT_1_4),axis on,title('ƽ�Ʊ任4');
% subplot(2,3,6),imshow(OUT_1_5),axis on,title('ƽ�Ʊ任5��ƽ�ƾ��볬��ԭͼ�����귶Χ��');
%% 2.ͼ������ţ�Image scaling��
% zoom_x=0.5;zoom_y=0.5;%�ȱ���С
% OUT_2_1=myimresize(I,zoom_x,zoom_y);
% zoom_x=2;zoom_y=2;%�ȱȷŴ�
% OUT_2_2=myimresize(I,zoom_x,zoom_y);
% zoom_x=0.5;zoom_y=0.8;%�Ǳ�����С
% OUT_2_3=myimresize(I,zoom_x,zoom_y);
% zoom_x=1.8;zoom_y=1;%�Ǳ����Ŵ�
% OUT_2_4=myimresize(I,zoom_x,zoom_y);
% figure,suptitle('��ͼ������1��');
% subplot(1,3,1),imshow(I),axis on,title('ԭͼ��') 
% subplot(1,3,2),imshow(OUT_2_1),axis on,title('�ȱ���С�任');
% subplot(1,3,3),imshow(OUT_2_2),axis on,title('�ȱȷŴ�任');
% figure,suptitle('��ͼ������2��');
% subplot(1,3,1),imshow(I),axis on,title('ԭͼ��') 
% subplot(1,3,2),imshow(OUT_2_3),axis on,title('�Ǳ�����С�任');
% subplot(1,3,3),imshow(OUT_2_4),axis on,title('�Ǳ����Ŵ�任');
%% 3.ͼ�����ת��Image rotation��
% alpha=30;%Ĭ��>0Ϊ��ʱ����ת
% OUT_3_1=myimrotate(I,alpha);
% alpha=120;
% OUT_3_2=myimrotate(I,alpha);
% alpha=-30;%Ĭ��<0Ϊ˳ʱ����ת
% OUT_3_3=myimrotate(I,alpha);
% alpha=-100;
% OUT_3_4=myimrotate(I,alpha);
% figure,suptitle('��ͼ����ʱ����ת��');
% subplot(1,3,1),imshow(I),axis on,title('ԭͼ��');
% subplot(1,3,2),imshow(OUT_3_1),axis on,title('ͼ����ת1');
% subplot(1,3,3),imshow(OUT_3_2),axis on,title('ͼ����ת2');
% figure,suptitle('��ͼ��˳ʱ����ת��');
% subplot(1,3,1),imshow(I),axis on,title('ԭͼ��');
% subplot(1,3,2),imshow(OUT_3_3),axis on,title('ͼ����ת3');
% subplot(1,3,3),imshow(OUT_3_4),axis on,title('ͼ����ת4');
%% 4.ͼ��ľ���任��Image mirror transformation��
OUT_4_1=mymirror(I,'level');%ѡ�����'level'��Ϊˮƽ����
OUT_4_2=mymirror(I,'vertical');%ѡ�����'vertical'��Ϊ��ֱ����
figure,suptitle('��ͼ����任��');
subplot(1,3,1),imshow(I),axis on,title('ԭͼ��');
subplot(1,3,2),imshow(OUT_4_1),axis on,title('ˮƽ����');
subplot(1,3,3),imshow(OUT_4_2),axis on,title('��ֱ����');
%% 5.ͼ���ת�ã�Image transpose��
OUT_5_1=mytranspose(I);
figure,suptitle('��ͼ��ת�ñ任��');
subplot(1,2,1),imshow(I),axis on,title('ԭͼ��');
subplot(1,2,2),imshow(OUT_5_1),axis on,title('ת�ñ任');
%% 6.ͼ��ļ��У�Image clipping��
J=double(I);
OUT_6=J(500:1000,200:300);
figure,suptitle('��ͼ����С�');
subplot(1,2,1),imshow(I),axis on,title('ԭͼ��');
subplot(1,2,2),imshow(uint8(OUT_6)),axis on,title('����');
%% ����matlab��������ʾ��Display��
% X1=imresize(I,2); %��ͼ���������(ʹ��matlab�ĺ���)
% X2=imrotate(I,45,'bilinear'); %��ͼ�������ת(ʹ��matlab�ĺ���)
% X3=imcrop(I,[75 68 200 400]); %��ͼ����м���
% figure,imshow(I);
% figure,imshow(X1);
% figure,imshow(X2);
% figure,imshow(X3);