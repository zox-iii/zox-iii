% ����mymatch:ģ��ƥ������ַ�ʶ�����
% �������:strΪ��Ҫʶ����ַ�ͼ������·��
% �������:resultΪʶ�����ַ���
% ʹ�ú���:fullfile():����ַ����һ��
%         ls():�г����ļ����µ������ļ���
%         length():�󳤶�
%         fileparts():����ָ���ļ���·�����ơ��ļ�������չ����
%         myim2bw():��ֵ��
%         sum():���
%         abs():�����ֵ
%         min():����Сֵ
%         strcat():������ַ�����������
function result=mymatch(str)%������ͼ��ŷʽ����
string=["character","letter","letter+number"];%��Ӧ��ģ���µ����ļ�������
length_f=zeros(3,1);%ÿ��Сģ����µ��ַ�ͼ����
result=[];%ʶ����
for st=1:3%ѭ������ģ�������
    dirpath = fullfile(pwd, 'Template',string(st),'*.bmp');%����Ϊ��ַ����pwdΪ��ǰĿ¼����λ�ã�
    files = ls(dirpath);%�õ���·���µ������ļ�
    length_f(st)=length(files);%����ļ����µ�ģ��ͼ����
    for t = 1 : length_f(st)
        filenamet = fullfile(pwd,'Template',string(st), files(t,:));%�õ���·���µ������ļ����б�      
        [filepath,name,ext] = fileparts(filenamet);   %  fileparts()����:����ָ���ļ���·�����ơ��ļ�������չ����       
        imagedata = imread(filenamet);%��ȡ��ͼƬ                                   
        imagedata = im2bw( imagedata,0.5); %��ֵ��Ϊlogic����                 
        pattern(st,t).feature = imagedata; %ȡͼƬ������Ϣ                                              
        pattern(st,t).name =name; %ȡģ���ַ�����
    end
end
for m = 1 : 7 %ѭ���ָ���ַ�ͼ�����ƥ��
	image=imread([str,'Nword',num2str(m),'.bmp']);%��ȡ��ӦͼƬ
    switch m
        case 1
            for n = 1 : length_f(1)
                distance(m,n)=sum(sum(abs(image-pattern(1,n).feature)));%��������
            end
        case 2
            for n = 1 : length_f(2)
                distance(m,n)=sum(sum(abs(image-pattern(2,n).feature)));%��������
            end
        case {3,4,5,6,7}
            for n = 1 : length_f(3)
                distance(m,n)=sum(sum(abs(image-pattern(3,n).feature)));%��������
            end  
    end
    st=m;
    if st>3
        st=3;
    end
	[value,number]=min(distance(m,:));%������С��
	res(m) = pattern(st,number).name;
    result = strcat(result,res(m));%������ַ�����������
end
end