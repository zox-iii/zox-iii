clear all;close all;clc;
%% 1��������̬ѧ������ʵ��ͼ��ȥ�롣
I=imread('Fig0911(a).tif');
model=[0,1,0;1,1,1;0,1,0];  %����3��3ģ�壨����ɫΪ��ɫ��
I1=myswell(I,model);%����
I2=myclose(I1,model,5);%������
I3=mycorrode(I2,model,2);%��ʴ
I4=myopen(I3,model,5);%������
I5=myswell(I4,model);%����
figure,suptitle('ָ��ȥ��');     %Figure 1
subplot(231),imshow(I),axis on,title('ָ�ƣ���������'); 
subplot(232),imshow(I1),axis on,title('����1��');
subplot(233),imshow(I2),axis on,title('������5��');
subplot(234),imshow(I3),axis on,title('��ʴ2��'); 
subplot(235),imshow(I4),axis on,title('������5��');
subplot(236),imshow(I5),axis on,title('����1��');
%% 2����ͼ��ָ�ʵ�飨ʵ���ģ��õ��ķָ���������̬ѧ�����Էβ�����Ŀն�������䡣
L=imread('ʵ����_�ηָ��.tif');
model=[0,1,0;1,1,1;0,1,0];  %����3��3ģ��
S=myswell(L,model,6);%����
S1=myclose(S,model,5);%������
S2=mycorrode(S1,model,6);%��ʴ
figure,suptitle('��-��̬ѧ����');%Figure 2
subplot(221),imshow(L),axis on,title('ԭͼ'); 
subplot(222),imshow(S),axis on,title('����6��');
subplot(223),imshow(S1),axis on,title('������5��');
subplot(224),imshow(S2),axis on,title('��ʴ6��');