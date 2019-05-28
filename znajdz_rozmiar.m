function [x,y, ori] = znajdz_rozmiar(im, or, typ, dia)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    if strcmp(typ, 'okrag')
        x=dia; y=dia;
        ori=0;
    else
        imr=imrotate(im, -1*or);
        props=regionprops(imr, {'BoundingBox'});
        imshow(imr);
        x1=props.BoundingBox(3);
        x2=props.BoundingBox(4);
        x=min(x1, x2);
        y=max(x1, x2);
        size_imr=size(imr);
        vect_count=zeros(1, size_imr(2));
        for i=1:1:size_imr(2)
            for k=1:1:size_imr(1)
                vect_count(i)=vect_count(i)+double(imr(k, i));
            end
        end

        k=1;
        while(vect_count(k)==0)
           k=k+1; 
        end
        left=0; right=0;
        for t=k: 1: k+9
            left=left+vect_count(t);
        end
        k=size_imr(2);
        while(vect_count(k)==0)
           k=k-1; 
        end  
        for t=k: -1: k-9
            right=right+vect_count(t);
        end
        if right>left
            ori=or;
        else
            ori=or+180;
            if(ori>360)
                ori=ori-360;
            end
        end
        
    end
    
    
end

