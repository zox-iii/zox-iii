RGB=imread('kris(1).jpg');                              %��ȡRGBͼ��
I = rgb2gray(RGB);                                     %�� RGB ͼ��ת���ɻҶ�ͼ�� 
%% ֱ�����Ա任��ֱ�ӳ��Ա���
I1=I*2;
I2=I/2;
figure;
subplot(1,3,1);
imshow(I);
title('ԭͼ');
subplot(1,3,2);
imshow(I1);
title('����2��');
subplot(1,3,3);
imshow(I2);
title('����1/2��');
%%  �����Ա任�����������ɱ任
figure;
A=double(I);
B=40*(log(A+1));
I3=uint8(B);
subplot(1,3,1);
imshow(I3);
title('����');
I_D=double(I);
C=I_D/255;
I4=uint8(255*(C.^0.7));
subplot(1,3,2);
imshow(I4);
title('���ɱ任����=0.5');
I5=uint8(255*(C.^1.3));
subplot(1,3,3);
imshow(I5);
title('���ɱ任����=1.5');
%% ֱ��ͼ����
figure;
subplot(2,2,1);imshow(I);title('ԭʼͼ��');
subplot(2,2,2);imhist(I);%imhist��ʵ����ʾ��ǰͼ���ֱ��ͼ�ֲ�
ylim('auto');title('ԭʼͼ���ֱ��ͼ');
J=histeq(I,256);%histeq��ʵ��ֱ��ͼ����
subplot(2,2,3);imshow(J);title('�任���ͼ��');
subplot(2,2,4);imhist(J);
title('�任���ֱ��ͼ');ylim('auto');