function y= watermark(A,B)
%{
A=Original image;
B=Watermark image;

 Example:
watermark('E:\watermark\lena.png','E:\watermark\wm.png')
%}

A = 'C:\watermark\got7.png';
B = 'C:\watermark\17 again.png';

host=imread(A);
[m n p]=size(host);
figure;
imshow(host);
title('Original Image');

[host_LL,host_LH,host_HL,host_HH]=dwt2(host,'haar');

water_mark=imread(B);
water_mark=imresize(water_mark,[m n]);
figure;
imshow(water_mark)
title('Watermark');

[water_mark_LL,water_mark_LH,water_mark_HL,water_mark_HH]=dwt2(water_mark,'haar');

water_marked_LL = host_LL + (0.03*water_mark_LL);
watermarked=idwt2(water_marked_LL,host_LH,host_HL,host_HH,'haar');
figure;
imshow(uint8(watermarked));
title('Watermarked image');
imwrite(uint8(watermarked),'Watermarked.png');
y='Watermarked succesfully';
end