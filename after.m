I = imread('IMG_20190514_122346.jpg');
[BW1,image1] = mask1(I);
[BW2,image2] = mask2(I);

BW_logical = BW1|BW2;
BW_double = im2double(BW_logical);
[BW,maskedImage]=segmentImage(BW_double);

[BW_out,properties]=filterRegions(BW);

maskedRGBImage = I;
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;
imshow(maskedRGBImage);


 n=size(properties);
 n_ele=n(1);
% figure(1); hold on;
% for i=1:1:n_ele
%    if(properties(i).Area> 500)       
%     plot(properties(i).PixelList(:, 1), properties(i).PixelList(:, 2)); 
%    end
% end
% hold off;


objects=struct('color',[], 'x', [], 'y', [], 'type', [], 'size_x', [], 'size_y', [], 'orientation', []);
k=1;
   
for i=1:1:n_ele
   if(properties(i).Area> 500)       
    objects(k).color=znajdz_kolor(properties(i).Centroid, I);
    plot(properties(i).PixelList(:, 1), properties(i).PixelList(:, 2));
   
    
    k=k+1;
   end
end


