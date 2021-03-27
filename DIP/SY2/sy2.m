clear all;close all;clc;
%% 1��Ϊͼ��ֱ�Ӹ�˹�����ͽ���������������ֵ�˲����������������ŵ�ͼ���˲������ڷֱ����3*3,5*5,7*7��
I=imread('Fig1006(a).tif');                                     %��ȡ�Ҷ�ͼ��
J=imnoise(I,'salt & pepper',0.06);                           	%���Ҷ�ͼ����ӽ�������
K=imnoise(I,'gaussian',0.05,0.05);                              %���Ҷ�ͼ����Ӹ�˹����  
figure,suptitle('ԭͼ+��������ͼ��');                            %Figure 1
subplot(131), imshow(I), title('ԭͼ');                        
subplot(132), imshow(J), title('��������');
subplot(133), imshow(K), title('��˹����');
J1=mymiddle(J,3);
J2=mymiddle(J,5);
J3=mymiddle(J,7);
figure,suptitle('��ֵ�˲�����������');                         %Figure 2
subplot(131), imshow(J1), title('3��3 ģ�����ֵ�˲�');
subplot(132), imshow(J2), title('5��5 ģ�����ֵ�˲�');
subplot(133), imshow(J3), title('7��7 ģ�����ֵ�˲�');
K1=mymiddle(K,3);
K2=mymiddle(K,5);
K3=mymiddle(K,7);
figure,suptitle('��ֵ�˲������˹����');                         %Figure 3
subplot(131), imshow(K1), title('3��3 ģ�����ֵ�˲�');
subplot(132), imshow(K2), title('5��5 ģ�����ֵ�˲�');
subplot(133), imshow(K3), title('7��7 ģ�����ֵ�˲�');
%% 2�������������ŵ�ͼ����о�ֵ�˲���
J4=myaverage(J,3);
K4=myaverage(K,3);
figure,suptitle('3��3 ģ��ľ�ֵ�˲�');                          %Figure 4
subplot(121), imshow(J4), title('��ֵ�˲�����������');
subplot(122), imshow(K4), title('��ֵ�˲������˹����');
%% 3���ֱ����Roberts ���ӡ�Sobel���ӡ�Prewitt���Ӻ�Log���ӽ���ͼ���񻯡�
I=imread('Fig1006(a).tif');
S1=mysharpen(I,'Roberts');
S2=mysharpen(I,'Sobel');
S3=mysharpen(I,'Prewitt');
S4=mysharpen(I,'Log');
figure,suptitle('ͼ����[1]');                        %Figure 5
subplot(131), imshow(I), title('ԭͼ');
subplot(132), imshow(I+S1), title('Roberts����');
subplot(133), imshow(I+S2), title('Sobel����');
figure,suptitle('ͼ����[2]');                        %Figure 6
subplot(121), imshow(I+S3), title('Prewitt����');
subplot(122), imshow(I+S4), title('Log����');