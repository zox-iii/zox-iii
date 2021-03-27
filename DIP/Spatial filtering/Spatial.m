%% 噪声
%数字图像在获取、传输的过程中都可能会受到噪声的污染，常见的噪声主要有高斯噪声和椒盐噪声。
%其中，高斯噪声主要是由摄像机传感器元器件内部产生的，椒盐噪声主要是由图像切割所产生的黑白相间的亮暗点噪声，
%“椒”表示黑色噪声，“盐”表示白色噪声。
RGB=imread('D:\Project_All_Apps\DIP_project\Images\OTHER\kris(1).jpg'); %读取RGB图像
I = rgb2gray(RGB);                                                      %把 RGB 图像转换成灰度图像
J=imnoise(I,'salt & pepper',0.06);                                      %给灰度图像添加椒盐噪声
K=imnoise(I,'gaussian',0.05,0.05);                                      %给灰度图像添加高斯噪声  
figure,suptitle('原图+初步处理的图像');                                  %Figure 1
subplot(1, 4, 1), imshow(RGB), title('原RGB图');                        
subplot(1, 4, 2), imshow(I), title('灰色图像');
subplot(1, 4, 3), imshow(J), title('椒盐噪声');
subplot(1, 4, 4), imshow(K), title('高斯噪声');
%% 空域图像去噪
%空域图像去噪用的有均值滤波算法（邻域平均法）和中值滤波算法，主要是对图像像素做邻域的运算来达到去噪结果。
%基于空域像素特征的方法，是通过分析在一定大小的窗口内，即中心点及其周围大小为m×n的邻域，分析中心像素和其他相邻像素之间在灰度空间的直接联系，来获取新的中心像素值的方法。
%imfilter是多维滤波，fspecial('average')是方形平均滤波器，默认为3×3
%而filter2只能二维图像滤波，另外除以255的目的是因为filter2是double型的，图像显示如果是double的，就需要是0-1之间，所以需要除以255
J1 = imfilter(J, fspecial('average'));
J2 = filter2(fspecial('average',5),J)/255;
J3 = filter2(fspecial('average',7),J)/255;
J4 = medfilt2(g, [7,7]);
figure,suptitle('对椒盐噪声进行空域滤波处理的结果');                        %Figure 2
subplot(1, 4, 1), imshow(J1), title('3×3 模板的均值滤波(函数默认)');
subplot(1, 4, 2), imshow(J2), title('5×5 模板的均值滤波');
subplot(1, 4, 3), imshow(J3), title('7×7 模板的均值滤波');
subplot(1, 4, 4), imshow(J4), title('7×7 模板的中值滤波');
K1 = imfilter(K, fspecial('average'));
K2 = filter2(fspecial('average',5),K)/255;
K3 = filter2(fspecial('average',7),K)/255;
K4 = medfilt2(K, [7,7]);
figure,suptitle('对高斯噪声进行空域滤波处理的结果');                        %Figure 3
subplot(1, 4, 1), imshow(K1), title('3×3 模板的均值滤波(函数默认)');
subplot(1, 4, 2), imshow(K2), title('5×5 模板的均值滤波');
subplot(1, 4, 3), imshow(K3), title('7×7 模板的均值滤波');
subplot(1, 4, 4), imshow(K4), title('7×7 模板的中值滤波');
%% 空域滤波是在原图像上直接进行数据运算，对像素的灰度值进行处理。
% 空域滤波是在图像空间中借助模板对图像进行邻域操作，处理图像每一个像素的取值都是根据模板对输入像素相应领域内的像素值进行计算得到的。
% 空域滤波基本上是让图像在频域空间内某个范围的分量受到抑制，同时保证其他分量不变，从而改变输出图像的频率分布，达到增强图像的目的。
% 空域低通滤波器是应用模板卷积方法对图像每一像素进行局部处理。
% 模板就是一个滤波器，使用不同的滤波器可产生不同的滤波效果。
