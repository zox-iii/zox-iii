clear all;close all;clc;
%% 1��������ֵ��ʵ��ͼ��ָ�ֱ����������ֵѡȡ����ʵ�֡�
I=imread('Fig1006(a).tif');
threshold1=myiteration(I);
threshold2=myotsu(I);
J1=im2bw(I,threshold1);
J2=im2bw(I,threshold2);
figure,suptitle('������ֵ��ͼ��ָ�');                %Figure 1
subplot(131),imshow(I),axis on,title('ԭͼ') ; 
subplot(132),imshow(J1),axis on,title('������ֵ��');
subplot(133),imshow(J2),axis on,title('otsu��ֵ��') ; 
%% 2���ֱ���Roberts,Sobel��������˹��˹���Ӷ�ͼ����б�Ե��⣬�Ƚ��������Ӵ���Ĳ�֮ͬ����
E1=mysharpen(I,'Roberts');
E2=mysharpen(I,'Sobel');
E3=mysharpen(I,'Log');
figure,suptitle('��Ե���');                          %Figure 2
subplot(221), imshow(I), title('ԭͼ');
subplot(222), imshow(E1), title('Roberts����');
subplot(223), imshow(E2), title('Sobel����');
subplot(224), imshow(E3), title('Log����');
%% 3��ʵ�ַεķָ������������֣��Σ���ɫ��ʾ���ͱ�������ɫ��ʾ���� 
Lung=imread('lung.jpg');
threshold=myotsu(Lung);
S1=im2bw(Lung,threshold);%��ֵ�������κ���ǻ���������ַָ���
S2=~S1;%��ɫ��ʹ�β���Ϊ��ɫ
X8=mycut(S2);%ȥ����ǻ��ı���������
figure,suptitle('�εķָ�');                          %Figure 3
subplot(221),imshow(Lung),axis on,title('ԭͼ') ; 
subplot(222),imshow(S1),axis on,title('��ֵ��');
subplot(223),imshow(S2),axis on,title('��ɫ') ;
subplot(224),imshow(X8),axis on,title('�ָ��'),imwrite(X8,'D:\Project_All_Apps\DIP_project\zuoye\SY5\�ηָ��.tif'); 