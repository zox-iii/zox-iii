clear all;close all;clc;
%% 1����һ���ֱ��ʵ͵�ͼ�����ֱ��ͼ���⻯����ʵ��ͼ����ǿ���ֱ����ϵͳ�������Լ���д����ʵ����Ӧ�ù��ܡ�
I=imread('Fig0208(a).tif');            %��ȡһ���ֱ��ʵ͵ĻҶ�ͼ��
H=myhisteq(I);                         %ֱ��ͼ���⻯
figure,suptitle('�Ա�д');             %Figure 1
subplot(131),imshow(I),axis on,title('ԭͼ���ֱ��ʵͣ�'); 
subplot(132),imshow(H),title('ʹ���Ա�д��myhisteq�任���ͼ��');
subplot(133),myimhist(H),title('ͼ���ֱ��ͼ'); 
%�ԱȲ���
K=histeq(I,256);                       %histeq��ʵ��ֱ��ͼ�����ϵͳ����
figure,suptitle('ϵͳ����');            %Figure 2
subplot(131),imshow(I),axis on,title('ԭͼ���ֱ��ʵͣ�') ; 
subplot(132),imshow(K),axis on,title('ʹ�ú���histeq�任���ͼ��');
subplot(133),imhist(K),title('ͼ���ֱ��ͼ') ; 
%% 2����һ��ͼ��ֱ���и���Ҷ�任����ɢ���ұ任�����Ѹ���Ҷ�任ֱ�������Ƶ�Ƶ�����ġ�
I=imread('Fig0517(a).tif');
F=myfft2(I);          %����Ҷ�任
A=sqrt(real(F).^2+imag(F).^2);
F1=(A-min(min(A)))/(max(max(A))-min(min(A)))*225;
F=myfftshift(F);      %��Ƶ��ͼ����Ƶ�ʳɷ��ƶ���Ƶ��ͼ����
A=sqrt(real(F).^2+imag(F).^2);
F2=(A-min(min(A)))/(max(max(A))-min(min(A)))*225;
F3=real(ifft2(ifftshift(F)));  %Ƶ���򷴱任���ռ��򣬲�ȡʵ��
F3=im2uint8(mat2gray(F3));    %����ͼ������
figure,suptitle('����Ҷ�任');           %Figure 3
subplot(221),imshow(I),axis on,title('ԭͼ') ; 
subplot(222),imshow(F1),axis on,title('����Ҷ�任Ƶ��ͼ');
subplot(223),imshow(F2),axis on,title('Ƶ�ƺ��Ƶ��ͼ') ; 
subplot(224),imshow(F3),axis on,title('�渵��Ҷ�任');
J = dct2(I);%�����ά DCT �任��ͼ��󲿷���������������Ǵ�
J(abs(J)<0.1) = 0;%�ѱ任������С�� 10 ��ֵ�û�Ϊ 0���ԻҶȾ����������
K = idct2(J)/255;%Ȼ���� idct2 �ع�ͼ��
figure,suptitle('��ɢ���ұ任');          %Figure 4
subplot(131),imshow(I),axis on,title('ԭͼ') ; 
subplot(132),imshow(log(abs(J))),axis on,title('���ұ任ϵ��');
subplot(133),imshow(K),title('���ҷ��任�ָ�ͼ��') ; 