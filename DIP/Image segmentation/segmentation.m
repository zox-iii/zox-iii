clear all;close all;clc;
%% 1.��ȡ�Ҷ�ֱ��ͼ
% I=imread('D:\Project_All_Apps\DIP_project\Images\CH10\Fig1006(a).tif');
% figure,
% subplot(121);imshow(I);
% subplot(122);imhist(I);
%% 2,����ȫ����ֵ��ͼ����зָ�
% clear all;close all;clc;
% I=imread('D:\Project_All_Apps\DIP_project\Images\CH10\Fig1006(a).tif');
% J=I>120;%ͼ��ָ��ֵΪ200
% HW=size(I);%��ȡͼ��Ĵ�С
% for i=1:HW(1)
%     for j=1:HW(2)
%         if(I(i,j)>130)%ͼ��ָ��ֵΪ500
%             K(i,j)=1;
%         else
%             K(i,j)=0;
%         end
%     end
% end
% figure,
% subplot(131);imshow(I);
% subplot(132);imshow(J);
% subplot(133);imshow(K);
%% 3.���ú���im2bw���в�ɫͼ��ķָ�
% RGB=imread('D:\Project_All_Apps\DIP_project\Images\CH06\Fig0604(a).tif');
% [X,map]=rgb2ind(RGB,256); %����ɫͼ��ת��Ϊ����ͼ��
% J=ind2gray(X,map);%������ͼ��ת��Ϊ�Ҷ�ͼ��
% K=im2bw(X,map,0.4);%ͼ��ָ��ֵΪ0.4
% figure,
% subplot(121);imshow(J);
% subplot(122);imshow(K);
%% 4.����Otsu�㷨����ͼ��ָ�
I=imread('D:\Project_All_Apps\DIP_project\Images\CH10\Fig1006(a).tif');
%I=rgb2gray(I);
I=im2double(I);
T=graythresh(I);%��ȡ��ֵ���ú�������Otsu�㷨��ȡ�Ҷ�ͼ���������ֵ
J=im2bw(I,T);%ͼ��ָ�
figure,
subplot(121);imshow(I);
subplot(122);imshow(J);
%%  5.���õ���ʽ��ֵ������ͼ��ָ�
% I=imread('D:\Project_All_Apps\DIP_project\Images\CH10\Fig1006(a).tif');
% I=im2double(I);
% T0=0.01;%����T0
% T1=(min(I(:)+max(I(:))))/2;%ѡȡͼ����������غ���С���ص�����ֵ��ΪT1
% r1=find(I>T1);%�Ҷ�ֵ����T1��
% r2=find(I<=T1);%����
% T2=(mean(I(r1))+mean(I(r2)))/2;%�µ���ֵT2    %mean������һ��������ƽ��ֵ�ĺ���
% while abs(T2-T1)<T0
%     T1=T2;
%     r1=find(I>T1);%�Ҷ�ֵ����T1��
%     r2=find(I<=T1);%����
%     T2=(mean(I(r1))+mean(I(r2)))/2;%�µ���ֵT2
% end
% J=im2bw(I,T2);%ͼ��ָ�
% figure,
% subplot(121);imshow(I);
% subplot(122);imshow(J);