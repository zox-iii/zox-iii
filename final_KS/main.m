clear all;close all;clc;
%% step1 读取图片 统一高度+灰度化+显示
[filename,pathname] =uigetfile({'*.jpg','*.bmp'},'选择要识别的车牌照图像');%选择图片路径
if(filename == 0)
    msgbox({'请选择需要识别的汽车车牌图像','[Author：3170602001 张宏梅]'},'车牌识别', 'warn');
    return     %若没有选择图片则报错误提示框、并停止运行
end  
global FILENAME %定义全局变量“读取图像的路径”
FILENAME =[pathname filename];%合成路径+文件名
str='./Result/'; %定义存储分割后的字符图像的路径
RGB=imread(FILENAME);%读取原图像RGB
[x,~,~]=size(RGB);%获取原图像的大小
rate=400/x;%统一高度为400
RGB=imresize(RGB,rate);%对图像进行缩放处理
I1 = myrgb2gray(RGB);    %rgb2gray转换成灰度图I1
figure(1),imshow(RGB),axis on,title('原始彩色图像'),xlabel('Author：3170602001 张宏梅 ','Color','b');    %显示图像
figure(2),imshow(I1),axis on,title('原始灰度图像'),xlabel('Author：3170602001 张宏梅 ','Color','b');
%% Step2 车牌定位前的图像预处理  边缘检测+形态化处理+消除小对象           
I2=edge(I1,'Prewitt',0.14);%选择阈值 0.14，用 prewitt算子进行边缘检测
figure(3),imshow(I2),axis on,title('prewitt算子边缘检测图像 '),xlabel('Author：3170602001 张宏梅 ','Color','b');
model=[1;1;1];%构造结构元素(垂直腐蚀)
I3=mycorrode(I2,model);%对图像实施腐蚀操作
figure(4),imshow(I3),axis on,title('腐蚀后图像 '),xlabel('Author：3170602001 张宏梅 ','Color','b');
model=ones(25,25);%构造结构元素
I4=myclose(I3,model);%闭运算，图像聚类、填充图像
figure(5),imshow(I4),axis on,title('填充图像 '),xlabel('Author：3170602001 张宏梅 ','Color','b');
I5=mycut(I4,1400);%去除聚团灰度值小于1400的部分
figure(6),imshow(I5),axis on,title('消除小对象（S<1400）'),xlabel('Author：3170602001 张宏梅 ','Color','b');
imwrite(I5,strcat(str,'车牌粗定位','.jpg'));
%% Step3 车牌定位 行扫描+列扫描
%% 3.1 行扫描:确定车牌的上下边界
[y,x,z]=size(I5);  %y方向对应行，x方向对应列，z方向对应深度，z=1为二值图像
I5=double(I5);  %双精度，计算更准确，每个方向范围在0~1  0为黑，1为白（车牌区域）
I6Y=zeros(y,x);  %创建一个与图像一样大小的空矩阵，用于记录行扫描时蓝色像素点的位置 
Blue_y=zeros(y,1);%创建一个列向量，同于统计行扫描某行的蓝色像素点个数
%开始行扫描，对每一个像素进行分析，统计每行对应的满足条件的像素的个数，确定车牌的上下边界
for i=1:y     
	for j=1:x
        if  (I5(i,j,1)==1)      %1为蓝色车牌区域
            Blue_y(i,1)=Blue_y(i,1)+1;%统计第i行蓝色像素点的个数
            I6Y(i,j)=1; %标记蓝色像素点的位置
        end
	end
end
[temp,MaxY]=max(Blue_y);%Y方向车牌区域确定.temp为向量 white_y的元素中的最大值， MaxY为该值的索引
Th=5;  %设置阈值参数（要提取的蓝颜色参数经验值范围）
PY1=MaxY;%向上追溯，直到车牌区域上边界
while((Blue_y(PY1,1)>=Th)&&(PY1>1))
    PY1=PY1-1;
end
PY2=MaxY;%向下追溯，直到车牌区域的下边界
while((Blue_y(PY2,1)>=Th)&&(PY2<y))
    PY2=PY2+1;
end
%对车牌区域进行校正，加框，减少车牌区域信息丢失
PY1=PY1-2;
PY2=PY2+2;
if PY1<1
    PY1=1;
end
if PY2>y
    PY2=y;
end
I7Y=RGB(PY1:PY2,:,:);%得到行过滤后的车牌区域
%% 3.2 列扫描:确定车牌的左右边界
I6X=zeros(y,x);  %创建一个与图像一样大小的空矩阵，用于记录列扫描时蓝色像素点的位置 
Blue_x=zeros(1,x);  %创建一个行向量，同于统计列扫描某行的蓝色像素点个数
%开始列扫描，对每一个像素进行分析，统计每列对应的满足条件的像素的个数，确定车牌的左右边界
for j=1:x     
    for i=PY1:PY2
           if  (I5(i,j,1)==1) 
              Blue_x(1,j)=Blue_x(1,j)+1;  %统计第j列蓝色像素点的个数
              I6X(i,j)=1; %标记蓝色像素点的位置
           end
    end
end
Th1=3; %选取的阈值
PX1=1;%向右追溯，直到找到车牌区域左边界
while(Blue_x(1,PX1)<Th1)&&(PX1<x)
    PX1=PX1+1;
end
PX2=x;%向左追溯，直到找到车牌区域右边界
while(Blue_x(1,PX2)<Th1)&&(PX2>PX1)
    PX2=PX2-1;
end
% 对车牌区域进行校正，加框，减少信息丢失
PX1=PX1-2;
PX2=PX2+2;
if PX1<1
    PX1=1;
end
if PX2>x
    PX2=x;
end
I7X=RGB(:,PX1:PX2,:);%得到列过滤后的车牌区域
%% 3.3 分割车牌区域并显示
License=RGB(PY1:PY2,PX1:PX2,:);
figure(7);%显示
subplot(2,2,1);imshow(RGB),axis on,title('原图像','FontWeight','Bold');
subplot(2,2,2);imshow(I7Y),axis on,title('行过滤结果','FontWeight','Bold');
subplot(2,2,4);imshow(I7X),axis on,title('列过滤结果','FontWeight','Bold');
subplot(2,2,3);imshow(License),axis on,title('车牌区域','FontWeight','Bold');
xlabel('Author：3170602001 张宏梅 ','Color','b');
imwrite(License,strcat(str,'License彩色图像','.jpg'));
%% Step4 字符切割前的图像预处理 统一高度+灰度化+二值化+形态化处理+消除小对象
[h,w]=size(License);%返回车牌部分尺大小信息，并存储在 m,n中
rate=70/h;%（统一高度=70）
License=imresize(License,rate);%对图像进行缩放处理
J1=myrgb2gray(License);%将车牌图像转换为灰度图
[hight,width]=size(J1);%返回车牌部分尺大小信息，并存储在hight,width中（后面一直还会用到）
J2=myim2bw(J1);%转换图像为二进制图像
figure(8),
subplot(3,1,1),imshow(License),axis on,title('车牌图像 ');
subplot(3,1,2),imshow(J1),axis on,title('车牌灰度图像 ');
subplot(3,1,3),imshow(J2),axis on,title('车牌二值化图像');
xlabel('Author：3170602001 张宏梅 ','Color','b');
%为消除小对象进行开运算(先腐蚀再膨胀)
model=[0,1,0;1,1,1;0,1,0];%model为3*3模板
J3=myopen(J2,model);
%比较面积比判断是否需要腐蚀和膨胀 
model=[0,0,0;0,1,0;0,0,1];%model为3*3模板
bw=bwarea(J3)/(hight*width);
if bw>=0.365 %bwarea函数计算二值图像中对象的总面积，与整个面积的比是否大于 0.365
    J4=mycorrode(J3,model);%如果大于 0.365则图像进行腐蚀
elseif bw<=0.235 %计算二值图像中对象的总面积与整个面积的比是否小于0.235
    J4=myswell(J3,model);%如果小于则实现膨胀操作
else
    J4=J3;
end
J5=mycut(J4,50);%消除细小对象，主要是第二和第三之间的圆点和螺丝钉
figure(9),
subplot(3,1,1),imshow(J3),axis on,title('开运算后');
subplot(3,1,2),imshow(J4),axis on,title('膨胀或腐蚀处理后');
subplot(3,1,3),imshow(J5),axis on,title('消除小对象（S<50）后');
xlabel('Author：3170602001 张宏梅 ','Color','b');
imwrite(J5,strcat(str,'License二值图像','.jpg'));
%% Step5 字符分割 投影法 
%% 5.1 计算车牌水平投影+对水平投影进行峰谷分析+去掉车牌水平边框+获取最大字符高度
histcol=sum(J5);      %计算垂直投影数据
histrow=sum(J5');      %计算水平投影数据
figure(10),
subplot(3,1,1),imshow(J5),axis on,title('车牌二值子图');
subplot(3,1,2),bar(histcol),axis on,title('垂直投影（含边框）');%bar画出垂直投影
subplot(3,1,3),bar(histrow),axis on,title('水平投影（含边框）');%bar画出水平投影
xlabel('Author：3170602001 张宏梅 ','Color','b');
%对水平投影进行峰谷分析:消除车牌上下边界的影响
levelrow=(mean(histrow)+min(histrow))/2;%把水平投影的均值和最小值的平均值作为阈值去判断是否为车牌区域
count1=0;%参数：统计谷底点的个数
mt=1;%参数：上升点个数
for k=1:hight  %hight为车牌高
    if histrow(k)<=levelrow   %当水平投影的数据低于水平阈值，说明其是谷底                     
        count1=count1+1;  %统计谷底点的个数，用于计算字符高度                              
    else     %不是谷底
        if count1>=1   %该点前是宽度为count1的谷底
            markrow(mt)=k;%记录上升点（点的位置）字符区域
            markrow1(mt)=count1;%记录谷宽度（谷点的数量，即下降点至下一个上升点）
            mt=mt+1;  %上升点个数加1
        end
        count1=0;   %统计一个谷底，计数清零
    end
end
if mt==2    %只有一个上升点（车牌区域的）
    markrow(mt)=hight;  %添加最后一个字符
    markrow1(mt)=count1;  %谷底点数
    mt=mt+1;
end
markrow2=diff(markrow);%峰距数列（上升点至下一个上升点）
[~,n1]=size(markrow2); %m1=1,n1为总峰距数
n1=n1+1;  %峰数n1=3
markrow(mt)=hight;  %指最后一个字符
markrow1(mt)=count1;  %谷底点数
for k=1:n1  %该循环用于找峰中心位置，即字符高度的中点
    markrow3(k)=markrow(k+1)-markrow1(k+1);%上一个下降点
    markrow4(k)=markrow3(k)-markrow(k);%峰宽度（上升点至下降点）
    markrow5(k)=markrow3(k)-double(uint16(markrow4(k)/2));%峰中心位置
end 
%去水平（上下）边框,获取字符高度
maxhight=max(markrow2);%获取最大峰距，即一个字符+一个谷底宽
findrow=find(markrow2==maxhight);%返回的是最大峰距所在序数
rowtop=markrow(findrow);%最大峰距的上升点位置
rowbot=markrow(findrow+1)-markrow1(findrow+1);%最大峰距的下一个上升点-最大峰距所在的谷底度=最大字符宽度下降点
J6=J5(rowtop:rowbot,:);  %去掉水平边框后
maxhight=rowbot-rowtop+1;   %最大字符高度(rowbot-rowtop+1)
%% 5.2 计算车牌垂直投影+计算每个字符中心位置+获取最大字符宽度
histcol=sum(J6);  %计算垂直投影
figure(11),
subplot(2,1,1),bar(histcol),axis on,title('垂直投影（去水平边框后）');%输出车牌的垂直投影图像
subplot(2,1,2),imshow(J6),axis on,title('二值化图像（去水平边框后）') %输出垂直投影图像
title(['车牌字符高度： ',int2str(maxhight)],'Color','r');%输出车牌字符高度
xlabel('Author：3170602001 张宏梅 ','Color','b');
%对垂直投影进行峰谷分析
levelcol=(mean(histcol)+min(histcol))/4;%以垂直投影的直方图平均值与最小值之和的1/4为阈值，判断字符与间隔
count1=0;%参数：统计谷底点的个数
mt=1;%参数：上升点个数
for k=1:width  %width为车牌的长度
    if histcol(k)<=levelcol  %小于阈值为字符间隔区域
        count1=count1+1; %谷底宽度累加
    else 
        if count1>=1
            markcol(mt)=k; %字符上升点
            markcol1(mt)=count1; %谷宽度（下降点至下一个上升点）
            mt=mt+1;%上升点个数加1
        end
        count1=0; %计算完一个谷底宽度，参数清零
    end
end
if mt==7   %没有左右边界
    while mt>1   %交换位置
        markcol(mt)=markcol(mt-1); %字符上升点
        markcol1(mt)=markcol1(mt-1); %谷宽度
        mt=mt-1;
    end
    markcol(1)=0;  %添加左边界
    markcol1(1)=0;
    mt=8;
end
if mt==8   %没有右边界
    markcol(mt)=width;%把最后一个上升点设为车牌宽度右边界所在点
    markcol1(mt)=count1;%最后谷底宽度
    markcol2(mt)=markcol(mt)-markcol(mt-1);
    mt=mt+1;
end
markcol2=diff(markcol);%峰距离（上升点至下一个上升点），包含一个字符宽度和一个谷底宽度
markcol(mt)=width;%把最后一个上升点设为车牌宽度右边界所在点
markcol1(mt)=count1;%最后谷底宽度
markcol2(mt-1)=markcol(mt)-markcol(mt-1);
[m1,n1]=size(markcol2);%峰距数列
n1=n1+1;%计算完峰数n1=9
for k=1:n1-1  %该循环用于找峰中心位置，即每个字符宽度的中点
    markcol3(k)=markcol(k+1)-markcol1(k+1);%第k个下降点（第k个字符的结束位置）
    markcol4(k)=markcol3(k)-markcol(k); %字符宽度（上升点至下降点）
    markcol5(k)=markcol3(k)-double(uint16(markcol4(k)/2));%第k个峰（字符）中心位置
end 
markcol6=diff(markcol5); %字符中心距离数列（字符中心点至下一个字符中心点）
maxs=max(markcol6); %查找最大值，即为第二字符与第三字符中心距离
findcol=find(markcol6==maxs);%获取最大值序数
markcol6(findcol)=0;%把第二字符与第三字符中心距离的中心距置为0
maxwidth=max(markcol6);%继续查找最大值，即为最大字符分割宽度
%% 5.3 提取分割字符,并变换为40行*20列标准子图保存
figure(12),
for k=findcol-1:findcol+5
	co=k-findcol+2;%对应的字符标号
	cleft=markcol5(k)-maxwidth/2; %markcol5是第k个字符中心位置，celft为上一个谷底的平均值，即第k个字符的最佳分割左阈值
	cright=markcol5(k)+maxwidth/2-2; %cright为第k个字符的最佳分割右阈值
	if cleft<1
        cleft=1;%确定第一个字符的分割阈值
        cright=maxwidth;  
	end
	if cright>width
        cright=width;%确定最后一个字符的分割阈值
        cleft=width-maxwidth;
	end
	J7=J5(rowtop:rowbot,cleft:cright);      
	subplot(3,7,co),imshow(J7),title(int2str(co));
	if co==4
        xlabel(['车牌字符宽度： ',int2str(maxwidth)],'Color','r');
	end
	J8=imresize(J7,[40 20]);%变换为40行*20列标准子图
	subplot(3,7,co+7),imshow(J8);
	if co==4
        title('标准化为40*20的车牌字符','Color','m');
    end
    fname=strcat(str,int2str(co),'.jpg');
	imwrite(J8,fname,'jpg');
end    
%% Step6 字符识别 切割的字符归一化+模板匹配+存储识别结果
%归一化
for i=1:7   %循环读入切割好的车牌字符
	image=imread([str,num2str(i),'.jpg']);%读取分割得到的字符
	image=mynormalise(image);%对字符图像进行预处理、归一化大小为 40*20
	imwrite(image,strcat(str,['Nword',num2str(i)],'.bmp'),'bmp');%存储归一化后字符
end
for i=1:7
	image=imread([str,'Nword',num2str(i),'.bmp']);
    subplot(3,7,i+14);imshow(image);
    if i==4
        title({'加框及归一化为40*20后的车牌字符'},'Color','g');
        xlabel('Author：3170602001 张宏梅 ','Color','b');
    end
end
%模板匹配(str为分割的字符所在路径)
result=mymatch(str);
figure(13),
subplot(6,7,1:14),imshow(License),title('第一步：车牌定位','FontWeight','Bold');
subplot(6,7,15:28),imshow(J5);title('车牌二值图');
for i=1:7
	image=imread([str,'Nword',num2str(i),'.bmp']);
    subplot(6,7,i+28),imshow(image);
	if i==4
        title('第二步：车牌分割','FontWeight','Bold');
        xlabel(['第三步：识别结果为(已存入日志文件中): ',result,'3170602001 张宏梅 '],'Color','r','FontWeight','Bold');
	end
end
msgbox({'车牌识别结果为：',result,'[3170602001 张宏梅]'},'车牌识别', 'help');
%导出识别结果到txt文件中
fid=fopen('车牌识别log.txt','a+');
fprintf(fid,'%s\t%s\n',result,datestr(now));
fclose(fid);
 
 
 
 
 