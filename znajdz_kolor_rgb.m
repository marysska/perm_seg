function [color] = znajdz_kolor_rgb(pixList, Image)
 siz=size(pixList);
 x=siz(1);
 r=0;
 g=0;
 b=0;
   
 for i=1:1:x
    r=r+int32(Image(int32(pixList(i, 2)), int32(pixList(i,1)), 1));
    g=g+int32(Image(int32(pixList(i, 2)), int32(pixList(i,1)), 2));
    b=b+int32(Image(int32(pixList(i, 2)), int32(pixList(i,1)), 3));
 end
r=r/x;
g=g/x;
b=b/x;

if (r+b+g)>550
    color='bialy';
elseif (r+g+b)<100
    color='czarny';
elseif (r>110 && r<140) && (g>110 && g<140) && (b>110 && b<140)
    color='szary';
elseif r>125 && g<60 && b<60
    color='czerwony';
elseif (r>170 && r<190) && (g>110 && g<140) && b<70
    color='pomaranczowy';
elseif r>160 && b<80  && (g>120 && g<200)
    color='zolty';
elseif g>70 && r<80  && b<90
    color='zielony';
elseif b>90
    color='niebieski';
else
    color='nieznany';
end

end

