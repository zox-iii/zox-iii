%??fft?function;??
% ����myfft2:��ά��ɢ����Ҷ�任
% �������:I:ԭͼ��
% �������:F��������ͼƬ����
% ʹ�ú���:size(I):������С
%         ones():��ȫ1����?
%         im2double()��˫����
%         fft():һά����Ҷ�任
function F = myfft2(I)
I=im2double(I);
[x,y] = size(I);
Ax = ones(x,y);
ans = ones(x,y);
com = 0+1i;%�鲿
% ��ÿһ�н���DFT  
for m=1:y
	Ax(:,m) = fft(I(:,m));%һά����Ҷ�任
end
% ��ÿһ�н���DFT    
for k=1:x
	ans(k,:) = fft(Ax(k,:));
end
F=ans;
end