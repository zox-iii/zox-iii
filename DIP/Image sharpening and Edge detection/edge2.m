clear all;close all;clc;
%% ����Roberts���ӽ��б�Ե���
I=imread('D:\Project_All_Apps\DIP_project\Images\CH10\Fig1006(a).tif');
I=im2double(I);
[J,thresh]=edge(I,'roberts',35/255);%��������������Ƿ��طָ���ֵ��
                                    %�ָ���ֵ�������Ǹú��������С����ֵ������
figure,
subplot(121);imshow(I);axis on,title('ԭͼ');
subplot(122);imshow(J);axis on,title('Roberts����');
%% ����Prewitt���ӽ��б�Ե���
I=imread('D:\Project_All_Apps\DIP_project\Images\CH10\Fig1006(a).tif');
I=im2double(I);
[J,thresh]=edge(I,'prewitt',[],'both');%[]��ʾϵͳ�Զ�������ֵ���ж�ֵ����
                                       %horizontal��ˮƽ����vertical����ֱ����both���������ǣ�
figure,
subplot(121);imshow(I);axis on,title('ԭͼ');
subplot(122);imshow(I+J);axis on,title('Prewitt����');
%% ����sobel���ӽ��б�Ե���
I=imread('D:\Project_All_Apps\DIP_project\Images\CH10\Fig1006(a).tif');
I=im2double(I);
[J,thresh]=edge(I,'sobel',[],'both');%[]��ʾϵͳ�Զ�������ֵ���ж�ֵ����
                                       %horizontal��ˮƽ����vertical����ֱ����both���������ǣ�
figure,
subplot(121);imshow(I);axis on,title('ԭͼ');
subplot(122);imshow(I+J);axis on,title('sobel����');