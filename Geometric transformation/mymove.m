% 函数mymove:实现图像的上下左右平移
% 输入参数:I为原图像
%         move_x,move_y为竖直，水平位移大小
% 输出参数:平移变换后的图像OUT
% 使用函数:double(I):增大精度，便于图像的计算
%         size(J):求矩阵的宽高
%         zeros():生成全零矩阵
%         inf:无穷大（白色）
function OUT = mymove(I,move_x,move_y)
J=double(I);
HW=size(J);%获取原图像大小
OUT=zeros(HW);%新建新的图像矩阵
OUT(1:HW(1),1:HW(2))=inf;%初始为空白
if((move_x>=0) && (move_y>=0))
    OUT(move_x+1:HW(1),move_y+1:HW(2))=J(1:HW(1)-move_x,1:HW(2)-move_y);
elseif((move_x>0) && (move_y<0))
    OUT(move_x+1:HW(1),1:HW(2)+move_y)=J(1:HW(1)-move_x,1-move_y:HW(2));
elseif((move_x<0) && (move_y>0))
    OUT(1:HW(1)+move_x,move_y+1:HW(2))=J(1-move_x:HW(1),1:HW(2)-move_y); 
elseif((move_x<0) && (move_y<0))
    OUT(1:HW(1)+move_x,1:HW(2)+move_y)=J(1-move_x:HW(1),1-move_y:HW(2));
end
OUT=uint8(OUT);
end
