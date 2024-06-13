clc;
close all;
clear all;


A = imread("flower.jpeg"); B1 = bitget(A,1)*2^0;
 B2 = bitget(A,2)*2^1 ;
 B3 = bitget(A,3)*2^2 ;
 B4 = bitget(A,4)*2^3 ;
 B5 = bitget(A,5)*2^4 ;
 B6 = bitget(A,6)*2^5 ;
 B7 = bitget(A,7)*2^6 ;
 B8 = bitget(A,8)*2^7 ;
%figure;
imshow(B8);


A = A(:,:,1);
drawnow;figure; 
imshow(A,[]); title("Original Image");



 watermark_size = 1000;

 [rows, columns] = size(A);   %Find the size of the image
 D = dct2(A);    % Obtain DCT Coeffecients 
 D_Row_Vector = reshape(D,1,rows*columns);  %Make it a row vector
 [D_Sorted, Idx ] = sort(abs(D_Row_Vector),'descend'); %Sort

 watermark_values = randn(1,watermark_size);
 Idx2 = Idx(2:watermark_size+1);
 IND = zeros(watermark_size,2);

 for k = 1:watermark_size
     x = floor(Idx2(k)/rows )+1;
     y = mod(Idx2(k),rows);
     IND(k,1) = y;
     IND(k,2) = x;
 end 
D_w = D;
  for k = 1:watermark_size
     D_w(IND(k,1),IND(k,2)) = D_w(IND(k,1),IND(k,2)) + 0.1*D_w(IND(k,1),IND(k,2)).*watermark_values(k);

  end 


  I2 = idct2(D_w);
  I2 = rescale(I2);
  drawnow;figure;
  imshow(I2);title("Watermarked Image");
  
 w2 = [];
  for k = 1:watermark_size
      w2 = [w2 (D_w(IND(k,1),IND(k,2))/D(IND(k,1),IND(k,2))-1)*10];
  end 
  %1.575
  disp(watermark_values(1:10));
  disp(w2(1:10));




     


     
 



