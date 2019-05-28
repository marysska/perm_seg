I = imread('IMG_20190514_122346.jpg');
%[BW1,image1] = mask1(I);
[BW2,image2] = mask2(I);
%[BW3,image3] = mask_blat_2(I);
%[BW4,image4] = mask_white_with_blat(I);
%BW_logical =BW3&BW4;
[BW5,image5] = mask_odwroc(I);
[BW6,image6] = mask_white(I);
%[BW7,image7] = mask_proba(I);
[BW8,image8] = mask_proba2(I);
%[BW9,image9] = mask_zabawa_2(I);
%[BW10,image10] = mask_odwrot_zabawa(I);
[BW11,image11] = mask_only_white(I);
[BW12,image12] = mask_empty(I);
[BW13,image13] = mask_something(I);
%BW_logical = BW_logical|BW1|BW2;

BW_logical = ~BW5|BW2;
BW_double = im2double(BW_logical);
[BW,maskedImage]=segmentImage(BW_double);
BW=BW | ~BW6|BW8|BW12|BW13;
BW_double2 = im2double(BW);
[BW,maskedImage] = segmentImage2(BW_double2);
BW=BW|BW11;
%BW_double2 = im2double(BW);
%[BW,maskedImage] = segmentImage3(BW_double2);
%BW=BW|~BW10;
[BW_out,properties]=filterRegions(BW);

maskedRGBImage = I;
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;
imshow(maskedRGBImage);


 n=size(properties);
 n_ele=n(1);


objects=struct('color',[], 'x', [], 'y', [], 'type', [], 'size_x', [], 'size_y', [], 'orientation', [], 'size_x_mm', [], 'size_y_mm', [], 'area', []);
k=1;
scale=0;
for i=1:1:n_ele
   if(properties(i).Area> 5000) 
        typ=znajdz_typ(properties(i).Eccentricity);
        if ~strcmp(typ, 'nieznane')
            objects(k).area = properties(i).Area;
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



