% 函数mycut:根据连通性去掉图片胸腔外的背景和气管
% 输入参数:I:原图像
% 输出参数:OUT：处理后的图片数据
% 使用函数:size(I):求矩阵大小
%         zeros():建全零矩阵
%         bwlabel():获取连通区域
function OUT=mycut(I)
[x,y]=size(I);
[X8,N] = bwlabel(I,8);%8连通
% s=regionprops(X8,'Area');
% X8=ismember(X8,find([s.Area]>=7000&[s.Area]<=40000));
%% 计算各个连通区域的面积
Area=zeros(N,1);
for i=1:x
    for j=1:y
        for k=1:N
            if X8(i,j)==k
                Area(k,1)=Area(k,1)+1;
            end
        end
    end
end
%% 将白色部分连通区域的背景部分、气管部分置黑
for k=1:N
	if Area(k,1)>=7000 && Area(k,1)<=40000
        for i=1:x
            for j=1:y
                if X8(i,j)==k-1
                X8(i,j)=0;
                end
            end
        end
	end
end
OUT=logical(X8);