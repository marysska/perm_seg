I = imread('IMG_20190514_122346.jpg');
[BW1,image1] = mask1(I);
[BW2,image2] = mask2(I);

BW_logical = BW1|BW2;
BW_double = im2double(BW_logical);
[BW,maskedImage]=segmentImage(BW_double);

[BW_out,properties]=filterRegions(BW);

maskedRGBImage = I;
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;
%imshow(maskedRGBImage);