% ����myfftshift:�任Ƶ������
% �������:I:ԭͼ��
% �������:F��������ͼƬ����
% ʹ�ú���:size(I):������С
function A = myfftshift(I)
sz = ceil(size(I)/2);
A = I([sz(1)+1:end, 1:sz(1)], [sz(2)+1:end, 1:sz(2)]);
end