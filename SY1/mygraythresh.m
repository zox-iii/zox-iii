% 函数mygraythresh:确定阈值
% 输入参数:I:原图像
% 输出参数:阈值level
function [level,em] = mygraythresh(I)
%GRAYTHRESH Global image threshold using Otsu's method.
%   LEVEL = GRAYTHRESH(I) computes a global threshold (LEVEL) that can be
%   used to convert an intensity image to a binary image with IM2BW. LEVEL
%   is a normalized intensity value that lies in the range [0, 1].
%   GRAYTHRESH uses Otsu's method, which chooses the threshold to minimize
%   the intraclass variance of the thresholded black and white pixels.
%
%   [LEVEL EM] = GRAYTHRESH(I) returns effectiveness metric, EM, as the
%   second output argument. It indicates the effectiveness of thresholding
%   of the input image and it is in the range [0, 1]. The lower bound is
%   attainable only by images having a single gray level, and the upper
%   bound is attainable only by two-valued images.
%
%   Class Support
%   -------------
%   The input image I can be uint8, uint16, int16, single, or double, and it
%   must be nonsparse.  LEVEL and EM are double scalars. 
%
%   Example
%   -------
%       I = imread('coins.png');
%       level = graythresh(I);
%       BW = im2bw(I,level);
%       figure, imshow(BW)
%
%   See also IM2BW.
 
%   Copyright 1993-2009 The MathWorks, Inc.
%   $Revision: 1.9.4.10 $  $Date: 2009/11/09 16:24:24 $
 
% Reference:
% N. Otsu, "A Threshold Selection Method from Gray-Level Histograms,"
% IEEE Transactions on Systems, Man, and Cybernetics, vol. 9, no. 1,
% pp. 62-66, 1979.
 
% One input argument required.
narginchk(1,1);%验证输入参数数目
validateattributes(I,{'uint8','uint16','double','single','int16'},{'nonsparse'});%对函数输入进行检查
% iptchecknargin(1,1,nargin,mfilename);
% iptcheckinput(I,{'uint8','uint16','double','single','int16'},{'nonsparse'}, ...
%               mfilename,'I',1);
 
if ~isempty(I)
  % Convert all N-D arrays into a single column.  Convert to uint8 for
  % fastest histogram computation.
  I = im2uint8(I(:));%将输入转换为无符号8位整型
  num_bins = 256;%设置灰度级为256级
  counts = imhist(I,num_bins);
  %imhist(I,n)其中，I为灰度的输入图像，n为指定的灰度级数目，缺省值为256；
  %imhist(X,map)就算和显示索引色图像X的直方图，map为调色板。
  %[counts,x]=imhist()
  %用stem(x,counts)同样可以显示直方图。counts和x分别为返回直方图数据向量和相应的彩色向量。
  % Variables names are chosen to be similar to the formulas in
  % the Otsu paper.
  p = counts / sum(counts);%每一个灰度级下的像素点的个数除以总的像素点得到该灰度级发生的概率
  omega = cumsum(p);%求累加和。按行累加，即概率分布
  mu = cumsum(p .* (1:num_bins)');%灰度级的累加和
  %PS：跟香农公式计算的开头差不多，只是不排序
  mu_t = mu(end);%整个图像的平均灰度即mu的最后一个值
  %%求类间方差
  sigma_b_squared = (mu_t * omega - mu).^2 ./ (omega .* (1 - omega));
 
  % Find the location of the maximum value of sigma_b_squared.
  % The maximum may extend over several bins, so average together the
  % locations.  If maxval is NaN, meaning that sigma_b_squared is all NaN,
  % then return 0.
  maxval = max(sigma_b_squared);
  isfinite_maxval = isfinite(maxval);
  if isfinite_maxval
    idx = mean(find(sigma_b_squared == maxval));
    % Normalize the threshold to the range [0, 1].
    level = (idx - 1) / (num_bins - 1);
  else
    level = 0.0;
  end
else
  level = 0.0;
  isfinite_maxval = false;
end
% compute the effectiveness metric
if nargout > 1
  if isfinite_maxval
    em = maxval/(sum(p.*((1:num_bins).^2)') - mu_t^2);
  else
    em = 0;
  end
end