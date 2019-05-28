function [x,y, ori] = znajdz_rozmiar(im, or, typ, dia)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    if strcmp(typ, 'okrag')
        x=dia; y=dia;
    else
        imr=imrotate(im, -1*or);
        props=regionprops(imr, {'BoundingBox'});
        imshow(imr);
        x1=props.BoundingBox(3);
        x2=props.BoundingBox(4);
        x=min(x1, x2);
        y=max(x1, x2);
        size_imr=size(imr)
        vect_count=zeros(1, size_imr(2));
        for i=1:1:size_imr(2)
            for k=1:1:size_imr(1)
                vect_count(i)=vect_count(i)+double(imr(k, i));
            end
        end
        
    end
    
    ori=or;
end

