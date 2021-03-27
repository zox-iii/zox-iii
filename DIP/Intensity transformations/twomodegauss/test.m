p = twomodegauss(0.15,0.05, 0.75, 0.05,1, 0.07, 0.002);
RGB=imread('D:\Project_All_Apps\DIP_project\Images\OTHER\kris(1).jpg');%¶ÁÈ¡RGBÍ¼Ïñ
I = rgb2gray(RGB); %Í¼Ïñ×ª»»Îª»ÒÉ«Í¼Ïñ
g = histeq(I, p);  %
figure, imshow(g)
figure, imhist(g)