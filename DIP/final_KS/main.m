clear all;close all;clc;
%% step1 ��ȡͼƬ ͳһ�߶�+�ҶȻ�+��ʾ
[filename,pathname] =uigetfile({'*.jpg','*.bmp'},'ѡ��Ҫʶ��ĳ�����ͼ��');%ѡ��ͼƬ·��
if(filename == 0)
    msgbox({'��ѡ����Ҫʶ�����������ͼ��','[Author��3170602001 �ź�÷]'},'����ʶ��', 'warn');
    return     %��û��ѡ��ͼƬ�򱨴�����ʾ�򡢲�ֹͣ����
end  
global FILENAME %����ȫ�ֱ�������ȡͼ���·����
FILENAME =[pathname filename];%�ϳ�·��+�ļ���
str='./Result/'; %����洢�ָ����ַ�ͼ���·��
RGB=imread(FILENAME);%��ȡԭͼ��RGB
[x,~,~]=size(RGB);%��ȡԭͼ��Ĵ�С
rate=400/x;%ͳһ�߶�Ϊ400
RGB=imresize(RGB,rate);%��ͼ��������Ŵ���
I1 = myrgb2gray(RGB);    %rgb2grayת���ɻҶ�ͼI1
figure(1),imshow(RGB),axis on,title('ԭʼ��ɫͼ��'),xlabel('Author��3170602001 �ź�÷ ','Color','b');    %��ʾͼ��
figure(2),imshow(I1),axis on,title('ԭʼ�Ҷ�ͼ��'),xlabel('Author��3170602001 �ź�÷ ','Color','b');
%% Step2 ���ƶ�λǰ��ͼ��Ԥ����  ��Ե���+��̬������+����С����           
I2=edge(I1,'Prewitt',0.14);%ѡ����ֵ 0.14���� prewitt���ӽ��б�Ե���
figure(3),imshow(I2),axis on,title('prewitt���ӱ�Ե���ͼ�� '),xlabel('Author��3170602001 �ź�÷ ','Color','b');
model=[1;1;1];%����ṹԪ��(��ֱ��ʴ)
I3=mycorrode(I2,model);%��ͼ��ʵʩ��ʴ����
figure(4),imshow(I3),axis on,title('��ʴ��ͼ�� '),xlabel('Author��3170602001 �ź�÷ ','Color','b');
model=ones(25,25);%����ṹԪ��
I4=myclose(I3,model);%�����㣬ͼ����ࡢ���ͼ��
figure(5),imshow(I4),axis on,title('���ͼ�� '),xlabel('Author��3170602001 �ź�÷ ','Color','b');
I5=mycut(I4,1400);%ȥ�����ŻҶ�ֵС��1400�Ĳ���
figure(6),imshow(I5),axis on,title('����С����S<1400��'),xlabel('Author��3170602001 �ź�÷ ','Color','b');
imwrite(I5,strcat(str,'���ƴֶ�λ','.jpg'));
%% Step3 ���ƶ�λ ��ɨ��+��ɨ��
%% 3.1 ��ɨ��:ȷ�����Ƶ����±߽�
[y,x,z]=size(I5);  %y�����Ӧ�У�x�����Ӧ�У�z�����Ӧ��ȣ�z=1Ϊ��ֵͼ��
I5=double(I5);  %˫���ȣ������׼ȷ��ÿ������Χ��0~1  0Ϊ�ڣ�1Ϊ�ף���������
I6Y=zeros(y,x);  %����һ����ͼ��һ����С�Ŀվ������ڼ�¼��ɨ��ʱ��ɫ���ص��λ�� 
Blue_y=zeros(y,1);%����һ����������ͬ��ͳ����ɨ��ĳ�е���ɫ���ص����
%��ʼ��ɨ�裬��ÿһ�����ؽ��з�����ͳ��ÿ�ж�Ӧ���������������صĸ�����ȷ�����Ƶ����±߽�
for i=1:y     
	for j=1:x
        if  (I5(i,j,1)==1)      %1Ϊ��ɫ��������
            Blue_y(i,1)=Blue_y(i,1)+1;%ͳ�Ƶ�i����ɫ���ص�ĸ���
            I6Y(i,j)=1; %�����ɫ���ص��λ��
        end
	end
end
[temp,MaxY]=max(Blue_y);%Y����������ȷ��.tempΪ���� white_y��Ԫ���е����ֵ�� MaxYΪ��ֵ������
Th=5;  %������ֵ������Ҫ��ȡ������ɫ��������ֵ��Χ��
PY1=MaxY;%����׷�ݣ�ֱ�����������ϱ߽�
while((Blue_y(PY1,1)>=Th)&&(PY1>1))
    PY1=PY1-1;
end
PY2=MaxY;%����׷�ݣ�ֱ������������±߽�
while((Blue_y(PY2,1)>=Th)&&(PY2<y))
    PY2=PY2+1;
end
%�Գ����������У�����ӿ򣬼��ٳ���������Ϣ��ʧ
PY1=PY1-2;
PY2=PY2+2;
if PY1<1
    PY1=1;
end
if PY2>y
    PY2=y;
end
I7Y=RGB(PY1:PY2,:,:);%�õ��й��˺�ĳ�������
%% 3.2 ��ɨ��:ȷ�����Ƶ����ұ߽�
I6X=zeros(y,x);  %����һ����ͼ��һ����С�Ŀվ������ڼ�¼��ɨ��ʱ��ɫ���ص��λ�� 
Blue_x=zeros(1,x);  %����һ����������ͬ��ͳ����ɨ��ĳ�е���ɫ���ص����
%��ʼ��ɨ�裬��ÿһ�����ؽ��з�����ͳ��ÿ�ж�Ӧ���������������صĸ�����ȷ�����Ƶ����ұ߽�
for j=1:x     
    for i=PY1:PY2
           if  (I5(i,j,1)==1) 
              Blue_x(1,j)=Blue_x(1,j)+1;  %ͳ�Ƶ�j����ɫ���ص�ĸ���
              I6X(i,j)=1; %�����ɫ���ص��λ��
           end
    end
end
Th1=3; %ѡȡ����ֵ
PX1=1;%����׷�ݣ�ֱ���ҵ�����������߽�
while(Blue_x(1,PX1)<Th1)&&(PX1<x)
    PX1=PX1+1;
end
PX2=x;%����׷�ݣ�ֱ���ҵ����������ұ߽�
while(Blue_x(1,PX2)<Th1)&&(PX2>PX1)
    PX2=PX2-1;
end
% �Գ����������У�����ӿ򣬼�����Ϣ��ʧ
PX1=PX1-2;
PX2=PX2+2;
if PX1<1
    PX1=1;
end
if PX2>x
    PX2=x;
end
I7X=RGB(:,PX1:PX2,:);%�õ��й��˺�ĳ�������
%% 3.3 �ָ��������ʾ
License=RGB(PY1:PY2,PX1:PX2,:);
figure(7);%��ʾ
subplot(2,2,1);imshow(RGB),axis on,title('ԭͼ��','FontWeight','Bold');
subplot(2,2,2);imshow(I7Y),axis on,title('�й��˽��','FontWeight','Bold');
subplot(2,2,4);imshow(I7X),axis on,title('�й��˽��','FontWeight','Bold');
subplot(2,2,3);imshow(License),axis on,title('��������','FontWeight','Bold');
xlabel('Author��3170602001 �ź�÷ ','Color','b');
imwrite(License,strcat(str,'License��ɫͼ��','.jpg'));
%% Step4 �ַ��и�ǰ��ͼ��Ԥ���� ͳһ�߶�+�ҶȻ�+��ֵ��+��̬������+����С����
[h,w]=size(License);%���س��Ʋ��ֳߴ�С��Ϣ�����洢�� m,n��
rate=70/h;%��ͳһ�߶�=70��
License=imresize(License,rate);%��ͼ��������Ŵ���
J1=myrgb2gray(License);%������ͼ��ת��Ϊ�Ҷ�ͼ
[hight,width]=size(J1);%���س��Ʋ��ֳߴ�С��Ϣ�����洢��hight,width�У�����һֱ�����õ���
J2=myim2bw(J1);%ת��ͼ��Ϊ������ͼ��
figure(8),
subplot(3,1,1),imshow(License),axis on,title('����ͼ�� ');
subplot(3,1,2),imshow(J1),axis on,title('���ƻҶ�ͼ�� ');
subplot(3,1,3),imshow(J2),axis on,title('���ƶ�ֵ��ͼ��');
xlabel('Author��3170602001 �ź�÷ ','Color','b');
%Ϊ����С������п�����(�ȸ�ʴ������)
model=[0,1,0;1,1,1;0,1,0];%modelΪ3*3ģ��
J3=myopen(J2,model);
%�Ƚ�������ж��Ƿ���Ҫ��ʴ������ 
model=[0,0,0;0,1,0;0,0,1];%modelΪ3*3ģ��
bw=bwarea(J3)/(hight*width);
if bw>=0.365 %bwarea���������ֵͼ���ж���������������������ı��Ƿ���� 0.365
    J4=mycorrode(J3,model);%������� 0.365��ͼ����и�ʴ
elseif bw<=0.235 %�����ֵͼ���ж�������������������ı��Ƿ�С��0.235
    J4=myswell(J3,model);%���С����ʵ�����Ͳ���
else
    J4=J3;
end
J5=mycut(J4,50);%����ϸС������Ҫ�ǵڶ��͵���֮���Բ�����˿��
figure(9),
subplot(3,1,1),imshow(J3),axis on,title('�������');
subplot(3,1,2),imshow(J4),axis on,title('���ͻ�ʴ�����');
subplot(3,1,3),imshow(J5),axis on,title('����С����S<50����');
xlabel('Author��3170602001 �ź�÷ ','Color','b');
imwrite(J5,strcat(str,'License��ֵͼ��','.jpg'));
%% Step5 �ַ��ָ� ͶӰ�� 
%% 5.1 ���㳵��ˮƽͶӰ+��ˮƽͶӰ���з�ȷ���+ȥ������ˮƽ�߿�+��ȡ����ַ��߶�
histcol=sum(J5);      %���㴹ֱͶӰ����
histrow=sum(J5');      %����ˮƽͶӰ����
figure(10),
subplot(3,1,1),imshow(J5),axis on,title('���ƶ�ֵ��ͼ');
subplot(3,1,2),bar(histcol),axis on,title('��ֱͶӰ�����߿�');%bar������ֱͶӰ
subplot(3,1,3),bar(histrow),axis on,title('ˮƽͶӰ�����߿�');%bar����ˮƽͶӰ
xlabel('Author��3170602001 �ź�÷ ','Color','b');
%��ˮƽͶӰ���з�ȷ���:�����������±߽��Ӱ��
levelrow=(mean(histrow)+min(histrow))/2;%��ˮƽͶӰ�ľ�ֵ����Сֵ��ƽ��ֵ��Ϊ��ֵȥ�ж��Ƿ�Ϊ��������
count1=0;%������ͳ�ƹȵ׵�ĸ���
mt=1;%���������������
for k=1:hight  %hightΪ���Ƹ�
    if histrow(k)<=levelrow   %��ˮƽͶӰ�����ݵ���ˮƽ��ֵ��˵�����ǹȵ�                     
        count1=count1+1;  %ͳ�ƹȵ׵�ĸ��������ڼ����ַ��߶�                              
    else     %���ǹȵ�
        if count1>=1   %�õ�ǰ�ǿ��Ϊcount1�Ĺȵ�
            markrow(mt)=k;%��¼�����㣨���λ�ã��ַ�����
            markrow1(mt)=count1;%��¼�ȿ�ȣ��ȵ�����������½�������һ�������㣩
            mt=mt+1;  %�����������1
        end
        count1=0;   %ͳ��һ���ȵף���������
    end
end
if mt==2    %ֻ��һ�������㣨��������ģ�
    markrow(mt)=hight;  %������һ���ַ�
    markrow1(mt)=count1;  %�ȵ׵���
    mt=mt+1;
end
markrow2=diff(markrow);%������У�����������һ�������㣩
[~,n1]=size(markrow2); %m1=1,n1Ϊ�ܷ����
n1=n1+1;  %����n1=3
markrow(mt)=hight;  %ָ���һ���ַ�
markrow1(mt)=count1;  %�ȵ׵���
for k=1:n1  %��ѭ�������ҷ�����λ�ã����ַ��߶ȵ��е�
    markrow3(k)=markrow(k+1)-markrow1(k+1);%��һ���½���
    markrow4(k)=markrow3(k)-markrow(k);%���ȣ����������½��㣩
    markrow5(k)=markrow3(k)-double(uint16(markrow4(k)/2));%������λ��
end 
%ȥˮƽ�����£��߿�,��ȡ�ַ��߶�
maxhight=max(markrow2);%��ȡ����࣬��һ���ַ�+һ���ȵ׿�
findrow=find(markrow2==maxhight);%���ص����������������
rowtop=markrow(findrow);%������������λ��
rowbot=markrow(findrow+1)-markrow1(findrow+1);%��������һ��������-��������ڵĹȵ׶�=����ַ�����½���
J6=J5(rowtop:rowbot,:);  %ȥ��ˮƽ�߿��
maxhight=rowbot-rowtop+1;   %����ַ��߶�(rowbot-rowtop+1)
%% 5.2 ���㳵�ƴ�ֱͶӰ+����ÿ���ַ�����λ��+��ȡ����ַ����
histcol=sum(J6);  %���㴹ֱͶӰ
figure(11),
subplot(2,1,1),bar(histcol),axis on,title('��ֱͶӰ��ȥˮƽ�߿��');%������ƵĴ�ֱͶӰͼ��
subplot(2,1,2),imshow(J6),axis on,title('��ֵ��ͼ��ȥˮƽ�߿��') %�����ֱͶӰͼ��
title(['�����ַ��߶ȣ� ',int2str(maxhight)],'Color','r');%��������ַ��߶�
xlabel('Author��3170602001 �ź�÷ ','Color','b');
%�Դ�ֱͶӰ���з�ȷ���
levelcol=(mean(histcol)+min(histcol))/4;%�Դ�ֱͶӰ��ֱ��ͼƽ��ֵ����Сֵ֮�͵�1/4Ϊ��ֵ���ж��ַ�����
count1=0;%������ͳ�ƹȵ׵�ĸ���
mt=1;%���������������
for k=1:width  %widthΪ���Ƶĳ���
    if histcol(k)<=levelcol  %С����ֵΪ�ַ��������
        count1=count1+1; %�ȵ׿���ۼ�
    else 
        if count1>=1
            markcol(mt)=k; %�ַ�������
            markcol1(mt)=count1; %�ȿ�ȣ��½�������һ�������㣩
            mt=mt+1;%�����������1
        end
        count1=0; %������һ���ȵ׿�ȣ���������
    end
end
if mt==7   %û�����ұ߽�
    while mt>1   %����λ��
        markcol(mt)=markcol(mt-1); %�ַ�������
        markcol1(mt)=markcol1(mt-1); %�ȿ��
        mt=mt-1;
    end
    markcol(1)=0;  %�����߽�
    markcol1(1)=0;
    mt=8;
end
if mt==8   %û���ұ߽�
    markcol(mt)=width;%�����һ����������Ϊ���ƿ���ұ߽����ڵ�
    markcol1(mt)=count1;%���ȵ׿��
    markcol2(mt)=markcol(mt)-markcol(mt-1);
    mt=mt+1;
end
markcol2=diff(markcol);%����루����������һ�������㣩������һ���ַ���Ⱥ�һ���ȵ׿��
markcol(mt)=width;%�����һ����������Ϊ���ƿ���ұ߽����ڵ�
markcol1(mt)=count1;%���ȵ׿��
markcol2(mt-1)=markcol(mt)-markcol(mt-1);
[m1,n1]=size(markcol2);%�������
n1=n1+1;%���������n1=9
for k=1:n1-1  %��ѭ�������ҷ�����λ�ã���ÿ���ַ���ȵ��е�
    markcol3(k)=markcol(k+1)-markcol1(k+1);%��k���½��㣨��k���ַ��Ľ���λ�ã�
    markcol4(k)=markcol3(k)-markcol(k); %�ַ���ȣ����������½��㣩
    markcol5(k)=markcol3(k)-double(uint16(markcol4(k)/2));%��k���壨�ַ�������λ��
end 
markcol6=diff(markcol5); %�ַ����ľ������У��ַ����ĵ�����һ���ַ����ĵ㣩
maxs=max(markcol6); %�������ֵ����Ϊ�ڶ��ַ�������ַ����ľ���
findcol=find(markcol6==maxs);%��ȡ���ֵ����
markcol6(findcol)=0;%�ѵڶ��ַ�������ַ����ľ�������ľ���Ϊ0
maxwidth=max(markcol6);%�����������ֵ����Ϊ����ַ��ָ���
%% 5.3 ��ȡ�ָ��ַ�,���任Ϊ40��*20�б�׼��ͼ����
figure(12),
for k=findcol-1:findcol+5
	co=k-findcol+2;%��Ӧ���ַ����
	cleft=markcol5(k)-maxwidth/2; %markcol5�ǵ�k���ַ�����λ�ã�celftΪ��һ���ȵ׵�ƽ��ֵ������k���ַ�����ѷָ�����ֵ
	cright=markcol5(k)+maxwidth/2-2; %crightΪ��k���ַ�����ѷָ�����ֵ
	if cleft<1
        cleft=1;%ȷ����һ���ַ��ķָ���ֵ
        cright=maxwidth;  
	end
	if cright>width
        cright=width;%ȷ�����һ���ַ��ķָ���ֵ
        cleft=width-maxwidth;
	end
	J7=J5(rowtop:rowbot,cleft:cright);      
	subplot(3,7,co),imshow(J7),title(int2str(co));
	if co==4
        xlabel(['�����ַ���ȣ� ',int2str(maxwidth)],'Color','r');
	end
	J8=imresize(J7,[40 20]);%�任Ϊ40��*20�б�׼��ͼ
	subplot(3,7,co+7),imshow(J8);
	if co==4
        title('��׼��Ϊ40*20�ĳ����ַ�','Color','m');
    end
    fname=strcat(str,int2str(co),'.jpg');
	imwrite(J8,fname,'jpg');
end    
%% Step6 �ַ�ʶ�� �и���ַ���һ��+ģ��ƥ��+�洢ʶ����
%��һ��
for i=1:7   %ѭ�������и�õĳ����ַ�
	image=imread([str,num2str(i),'.jpg']);%��ȡ�ָ�õ����ַ�
	image=mynormalise(image);%���ַ�ͼ�����Ԥ������һ����СΪ 40*20
	imwrite(image,strcat(str,['Nword',num2str(i)],'.bmp'),'bmp');%�洢��һ�����ַ�
end
for i=1:7
	image=imread([str,'Nword',num2str(i),'.bmp']);
    subplot(3,7,i+14);imshow(image);
    if i==4
        title({'�ӿ򼰹�һ��Ϊ40*20��ĳ����ַ�'},'Color','g');
        xlabel('Author��3170602001 �ź�÷ ','Color','b');
    end
end
%ģ��ƥ��(strΪ�ָ���ַ�����·��)
result=mymatch(str);
figure(13),
subplot(6,7,1:14),imshow(License),title('��һ�������ƶ�λ','FontWeight','Bold');
subplot(6,7,15:28),imshow(J5);title('���ƶ�ֵͼ');
for i=1:7
	image=imread([str,'Nword',num2str(i),'.bmp']);
    subplot(6,7,i+28),imshow(image);
	if i==4
        title('�ڶ��������Ʒָ�','FontWeight','Bold');
        xlabel(['��������ʶ����Ϊ(�Ѵ�����־�ļ���): ',result,'3170602001 �ź�÷ '],'Color','r','FontWeight','Bold');
	end
end
msgbox({'����ʶ����Ϊ��',result,'[3170602001 �ź�÷]'},'����ʶ��', 'help');
%����ʶ������txt�ļ���
fid=fopen('����ʶ��log.txt','a+');
fprintf(fid,'%s\t%s\n',result,datestr(now));
fclose(fid);
 
 
 
 
 