function [x,y] = znajdz_rozmiar(im, or, typ, dia)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    if('typ'=='okrag')
        x=dia; y=dia;
    else
        imr=imrotate(im, or);
        
    end
end

