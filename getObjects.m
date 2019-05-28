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


objects=struct('color',[], 'x', [], 'y', [], 'type', [], 'size_x', [], 'size_y', [], 'orientation', [], 'size_x_mm', [], 'size_y_mm', []);
k=1;
scale=0;
for i=1:1:n_ele
   if(properties(i).Area> 500) 
        typ=znajdz_typ(properties(i).Eccentricity);
        if ~strcmp(typ, 'nieznane')
            objects(k).type=typ;
             objects(k).color=znajdz_kolor_rgb(properties(i).PixelList, I); 
             [objects(k).size_x, objects(k).size_y,objects(k).orientation]=znajdz_rozmiar(properties(i).Image, properties(i).Orientation, typ, properties(i).EquivDiameter);
             objects(k).x=properties(i).Centroid(1);
             objects(k).y=properties(i).Centroid(2);
             if strcmp(typ, 'okrag') && objects(k).size_x>scale
                 scale=objects(k).size_x;
             end
            k=k+1;
        end
   end
end

n_el=size(objects);
n_elem=n_el(2);
scale=scale/8.7; %taki jest przelicznik?

for i=1:1:n_elem
    objects(i).size_x_mm=objects(i).size_x/scale;
    objects(i).size_y_mm=objects(i).size_y/scale;
end



