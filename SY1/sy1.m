clear all;close all;clc;
%% 1������һ��RGBͼ�񣬱任Ϊ�Ҷ�ͼ��Ͷ�ֵͼ�񣬲���ͬһ�������ڷֳ������Ӵ������ֱ���ʾRGBͼ��ͻҶ�ͼ��ע�����ֱ���,����������ļ���ʽ�浽�����ϡ�
RGB=imread('V.jpg');                                %ͼ�����
I=myrgb2gray(RGB);                                  %�� RGB ͼ��ת���ɻҶ�ͼ��
J=myim2bw(RGB);                                     %�� RGB ͼ��ת���ɶ�ֵͼ��
figure,suptitle('ͼ������ת��');                          %Figure 1
subplot(131);imshow(RGB),axis on,title("RGBͼ��"); 
subplot(132);imshow(I),axis on,title("�Ҷ�ͼ��"),imwrite(I,'D:\Project_All_Apps\DIP_project\zuoye\SY1\�Ҷ�ͼ��.bmp'); 
subplot(133);imshow(J),axis on,title("��ֵͼ��"),imwrite(J,'D:\Project_All_Apps\DIP_project\zuoye\SY1\��ֵͼ��.bmp'); 
%% 2����������ͬͼ��ִ�мӡ������ˡ�����������ͬһ�������ڷֳ�6���Ӵ������ֱ���ʾ��ע�����ֱ��⡣
A=imread('scenery.jpg');
B=imread('person.jpg');         %��ȡͼ��
A=im2double(A);                 %��ͼ��ת��Ϊ double �͡��ҷ�Χ��0-1֮��
B=im2double(B);
C=0.5*A+0.5*B;                  %����ͼ�����
D=A-0.7*B;                      %����ͼ�����
E=A.*B;                         %����ͼ�����
F=A./B;                         %����ͼ�����
figure,suptitle('��������');                                %Figure 2
subplot(231);imshow(A),axis on,title('����ͼ');
subplot(232);imshow(B),axis on,title('����ͼ');
subplot(233);imshow(C),axis on,title('��'),imwrite(C,'D:\Project_All_Apps\DIP_project\zuoye\SY1\��.bmp');
subplot(234);imshow(D),axis on,title('��'),imwrite(D,'D:\Project_All_Apps\DIP_project\zuoye\SY1\��.bmp');
subplot(235);imshow(E),axis on,title('��'),imwrite(E,'D:\Project_All_Apps\DIP_project\zuoye\SY1\��.bmp');
subplot(236);imshow(F),axis on,title('��'),imwrite(F,'D:\Project_All_Apps\DIP_project\zuoye\SY1\��.bmp');