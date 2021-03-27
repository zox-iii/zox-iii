% 函数mycut:根据连通性去掉小对象
% 输入参数:I:原图像  |  P:分界值
% 输出参数:OUT：处理后的图片数据
% 使用函数:size(I):求矩阵大小
%         zeros():建全零矩阵
%         bwlabel():获取连通区域
function OUT=mycut(I,P)
[x,y]=size(I);
[X8,N] = bwlabel(I,8);%8连通
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
Area  %输出显示连通部分面积
%% 将白色部分连通区域的背景部分置黑
for k=1:N
	if Area(k,1)<=P
        for i=1:x
            for j=1:y
                if X8(i,j)==k
                X8(i,j)=0;
                end
            end
        end
	end
end
OUT=logical(X8);