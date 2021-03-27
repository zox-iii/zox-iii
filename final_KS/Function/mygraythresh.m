% 函数mygraythresh:确定阈值
% 输入参数:I:原图像
% 输出参数:阈值level
function [level,em] = mygraythresh(I)
narginchk(1,1);%验证输入参数数目
validateattributes(I,{'uint8','uint16','double','single','int16'},{'nonsparse'});%对函数输入进行检查
if ~isempty(I)
  I = im2uint8(I(:));%将输入转换为无符号8位整型
  num_bins = 256;%设置灰度级为256级
  counts = imhist(I,num_bins);%imhist(I,n)其中，I为灰度的输入图像，n为指定的灰度级数目，缺省值为256；
  p = counts / sum(counts);%每一个灰度级下的像素点的个数除以总的像素点得到该灰度级发生的概率
  omega = cumsum(p);%求累加和。按行累加，即概率分布
  mu = cumsum(p .* (1:num_bins)');%灰度级的累加和
  mu_t = mu(end);%整个图像的平均灰度即mu的最后一个值
  sigma_b_squared = (mu_t * omega - mu).^2 ./ (omega .* (1 - omega)); %%求类间方差
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