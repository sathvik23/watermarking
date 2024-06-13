clc; 
close all; 
clear all;

img= imread("bird.jpeg"); 


img = im2gray(img);
img = imresize(img, [256 256]);

[rows, columns] = size(img);  %fins rows and columns


figure;
imshow(img); title("Original Image");%Reading the image
img1 = double(img);

[u,s,v ] = svd(img1);
s_temp = s;

watermark = imread("flower.jpeg");
watermark = im2gray(watermark);
watermark = imresize(watermark, [256 256]);

figure;
imshow(watermark); title("Image used for Watermark Values");

alpha = 0.1;
[watx,waty ] = size(watermark);
w = double(watermark);

for i = 1:watx
    for j = 1:waty
        s(i,j) = s(i,j) + alpha*w;
    end 
end 

wimg = u*s*v;

wimg = rescale(wimg);
figure;
imshow(wimg); title("Watemarked Image");



