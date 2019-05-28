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


objects=struct('color',[], 'x', [], 'y', [], 'type', [], 'size_x', [], 'size_y', [], 'orientation', []);
k=1;
   
for i=1:1:n_ele
   if(properties(i).Area> 500) 
        typ=znajdz_typ(properties(i).Eccentricity)
        if typ ~= 'nieznany'
            objects(k).type=typ;
             %[objects(k).color, objects(k).x, objects(k).y]=znajdz_kolor(properties(i).PixelList, I); 
             [objects(k).size_x, objects(k).size_y]=znajdz_rozmiar(properties(i).Image, properties(i).Orientation, typ);
            k=k+1;
        end
   end
end


