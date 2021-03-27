% ����mygraythresh:ȷ����ֵ
% �������:I:ԭͼ��
% �������:��ֵlevel
function [level,em] = mygraythresh(I)
narginchk(1,1);%��֤���������Ŀ
validateattributes(I,{'uint8','uint16','double','single','int16'},{'nonsparse'});%�Ժ���������м��
if ~isempty(I)
  I = im2uint8(I(:));%������ת��Ϊ�޷���8λ����
  num_bins = 256;%���ûҶȼ�Ϊ256��
  counts = imhist(I,num_bins);%imhist(I,n)���У�IΪ�Ҷȵ�����ͼ��nΪָ���ĻҶȼ���Ŀ��ȱʡֵΪ256��
  p = counts / sum(counts);%ÿһ���Ҷȼ��µ����ص�ĸ��������ܵ����ص�õ��ûҶȼ������ĸ���
  omega = cumsum(p);%���ۼӺ͡������ۼӣ������ʷֲ�
  mu = cumsum(p .* (1:num_bins)');%�Ҷȼ����ۼӺ�
  mu_t = mu(end);%����ͼ���ƽ���Ҷȼ�mu�����һ��ֵ
  sigma_b_squared = (mu_t * omega - mu).^2 ./ (omega .* (1 - omega)); %%����䷽��
  maxval = max(sigma_b_squared);
  isfinite_maxval = isfinite(maxval);
  if isfinite_maxval
    idx = mean(find(sigma_b_squared == maxval));
    level = (idx - 1) / (num_bins - 1);
  else
    level = 0.0;
  end
else
  level = 0.0;
  isfinite_maxval = false;
end
if nargout > 1
  if isfinite_maxval
    em = maxval/(sum(p.*((1:num_bins).^2)') - mu_t^2);
  else
    em = 0;
  end
end