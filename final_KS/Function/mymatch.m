% 函数mymatch:模板匹配进行字符识别操作
% 输入参数:str为需要识别的字符图像所在路径
% 输出参数:result为识别结果字符串
% 使用函数:fullfile():将地址串在一起
%         ls():列出该文件夹下的所有文件名
%         length():求长度
%         fileparts():返回指定文件的路径名称、文件名和扩展名。
%         myim2bw():二值化
%         sum():求和
%         abs():求绝对值
%         min():求最小值
%         strcat():将结果字符串连接起来
function result=mymatch(str)%计算两图像欧式距离
string=["character","letter","letter+number"];%对应的模板下的子文件夹名称
length_f=zeros(3,1);%每个小模板库下的字符图数量
result=[];%识别结果
for st=1:3%循环建立模板库数据
    dirpath = fullfile(pwd, 'Template',string(st),'*.bmp');%后面为地址串（pwd为当前目录所在位置）
    files = ls(dirpath);%得到该路径下的所有文件
    length_f(st)=length(files);%求该文件夹下的模板图数量
    for t = 1 : length_f(st)
        filenamet = fullfile(pwd,'Template',string(st), files(t,:));%得到该路径下的所有文件的列表      
        [filepath,name,ext] = fileparts(filenamet);   %  fileparts()函数:返回指定文件的路径名称、文件名和扩展名。       
        imagedata = imread(filenamet);%读取该图片                                   
        imagedata = im2bw( imagedata,0.5); %二值化为logic数据                 
        pattern(st,t).feature = imagedata; %取图片特征信息                                              
        pattern(st,t).name =name; %取模版字符名字
    end
end
for m = 1 : 7 %循环分割的字符图像进行匹配
	image=imread([str,'Nword',num2str(m),'.bmp']);%读取对应图片
    switch m
        case 1
            for n = 1 : length_f(1)
                distance(m,n)=sum(sum(abs(image-pattern(1,n).feature)));%距离数组
            end
        case 2
            for n = 1 : length_f(2)
                distance(m,n)=sum(sum(abs(image-pattern(2,n).feature)));%距离数组
            end
        case {3,4,5,6,7}
            for n = 1 : length_f(3)
                distance(m,n)=sum(sum(abs(image-pattern(3,n).feature)));%距离数组
            end  
    end
    st=m;
    if st>3
        st=3;
    end
	[value,number]=min(distance(m,:));%距离最小的
	res(m) = pattern(st,number).name;
    result = strcat(result,res(m));%将结果字符串连接起来
end
end