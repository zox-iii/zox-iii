% ����mynormalise:��ͼ���һ��������һ��Ϊ40*20
% �������:IΪԭͼ��
% �������:��һ�����ͼ��OUT
% ʹ�ú���:size():��ͼ��Ĵ�С
%         zeros():ȫ0����
%         imresize():���ű任
%         im2bw():��ֵ��
function OUT=mynormalise(image)
%�ַ�����߿򰴱������ԷŴ�
[x,y]=size(image);
ny=y+10;
image=[zeros(x,round((ny-y)/2)) image zeros(x,round((ny-y)/2))];
image=imresize(image,[40,20]);
OUT=im2bw(image,0.5);
end
