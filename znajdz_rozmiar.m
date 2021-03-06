function [x,y, ori] = znajdz_rozmiar(im, or, typ, dia)
    if strcmp(typ, 'okrag')
        x=dia; y=dia;
        ori=0;
    else
        imr=imrotate(im, -1*or);
        props=regionprops(imr, {'BoundingBox'});
        %imshow(imr);
        X = props.BoundingBox;
        sort(X);
        x1 = X(3);
        x2 = X(4);
        
        x=min(x1, x2);
        y=max(x1, x2);
        size_imr=size(imr);
        vect_count=zeros(1, size_imr(2));
        for i=1:1:size_imr(2)
            for k=1:1:size_imr(1)
                vect_count(i)=vect_count(i)+double(imr(k, i));
            end
        end
% poszukiwanie orientacji - zliczanie w oknie 20 -> wybierany jest ten
% koniec, ktory ma mniej pixeli jesli lewy to trzeba obrocic o 180 stopni
        k=1;
        while(vect_count(k)==0)
           k=k+1; 
        end
        left=0; right=0;
        for t=k: 1: k+19
            left=left+vect_count(t);
        end
        k=size_imr(2);
        while(vect_count(k)==0)
           k=k-1; 
        end  
        for t=k: -1: k-19
            right=right+vect_count(t);
        end
        if right<left
            ori=or;
        else
            ori=or+180;
            if(ori>180)
                ori=ori-360;
            end
        end
        
    end
    
    
end

