% ����mymove:ʵ��ͼ�����������ƽ��
% �������:IΪԭͼ��
%         move_x,move_yΪ��ֱ��ˮƽλ�ƴ�С
% �������:ƽ�Ʊ任���ͼ��OUT
% ʹ�ú���:double(I):���󾫶ȣ�����ͼ��ļ���
%         size(J):�����Ŀ��
%         zeros():����ȫ�����
%         inf:����󣨰�ɫ��
function OUT = mymove(I,move_x,move_y)
J=double(I);
HW=size(J);%��ȡԭͼ���С
OUT=zeros(HW);%�½��µ�ͼ�����
OUT(1:HW(1),1:HW(2))=inf;%��ʼΪ�հ�
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
