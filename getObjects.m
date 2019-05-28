print=1;

%sciezka pliku do znalezienia obiektow
I = imread('IMG_20190514_122346.jpg');
if print==1
    figure (1);
    imshow(I);
end
%maski
[BW2,image2] = mask2(I);
[BW5,image5] = mask_odwroc(I);
[BW6,image6] = mask_white(I);
[BW8,image8] = mask_proba2(I);
[BW11,image11] = mask_only_white(I);
[BW12,image12] = mask_empty(I);
[BW13,image13] = mask_something(I);


BW_logical = ~BW5|BW2;
BW_double = im2double(BW_logical);
[BW,maskedImage]=segmentImage(BW_double);
BW=BW | ~BW6|BW8|BW12|BW13;
BW_double2 = im2double(BW);
[BW,maskedImage] = segmentImage2(BW_double2);
BW=BW|BW11;
[BW_out,properties]=filterRegions(BW);
maskedRGBImage = I;
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

if print==1
    figure(2);
    imshow(maskedRGBImage);
end

 n=size(properties);
 n_ele=n(1); % liczba wykrytych elementow przez matlaba


objects=struct('color',[], 'x', [], 'y', [], 'type', [], 'size_x', [], 'size_y', [], 'orientation', [], 'size_x_cm', [], 'size_y_cm', [], 'area', []);
k=1;
scale=0;
for i=1:1:n_ele
   if(properties(i).Area> 5000) % odfiltrowywanie malych elementow
        typ=znajdz_typ(properties(i).Eccentricity);
        if ~strcmp(typ, 'nieznane') %filtracja elementow o dziwnym ksztalcie <- ani nie dlugopisy, ani nie okregi
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
k=k-1;
n_el=size(objects);
n_elem=n_el(2);
scale=scale/8.7; 
for i=1:1:k
    objects(i).size_x_cm=objects(i).size_x/scale;
    objects(i).size_y_cm=objects(i).size_y/scale;
end


if print==1
    for i=1:1:k
        disp(objects(i));
    end
end



