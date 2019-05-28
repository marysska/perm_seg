function [color, h, var] = znajdz_kolor(pixList, Image)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% pixList Xx2 
% 
 siz=size(pixList);
 x=siz(1);

hs=0.0;
ss=0.0;


s=0;
v=0;
h=0;
for i=1:1:x
   hsv=rgb2hsv(Image(int32(pixList(i, 2)), int32(pixList(i,1)), :));
   
%    hs=hs+sind(double(hsv(1, 1, 1))*360);
%    hc=hc+cosd(double(hsv(1, 1, 1))*360);
   h=h+double(hsv(1, 1, 1));
   s=s+double(hsv(1, 1, 2));
   v=v+double(hsv(1, 1, 3));
end


% 
% for i=-3:1:3
%    for j=-3:1:3
%        hsv=rgb2hsv(Image(int32(centroid(2))+i, int32(centroid(1))+j, :));
%        h=h+double(hsv(1, 1, 1));
%        s=s+double(hsv(1, 1, 2));
%        v=v+double(hsv(1, 1, 3));
%    end
% end
h=h/x*360;
s=s/x*100;
v=v/x*100;
 var=0;   
  %odchylenie
for i=1:1:x
    hsv=rgb2hsv(Image(int32(pixList(i, 2)), int32(pixList(i,1)), :));
   hsv=rgb2hsv(Image(int32(pixList(i, 2)), int32(pixList(i,1)), :));
   var=var+(hsv(1, 1, 1)*360-h)^2;
end
var=sqrt(var);

  
    
%        hsv=double(Image(int32(centroid(1)), int32(centroid(2)), :));
%        r=r+double(Image(int32(centroid(1)), int32(centroid(2)), 1));
%        g=g+double(Image(int32(centroid(1)), int32(centroid(2)), 2));
%        b=b+double(Image(int32(centroid(1)), int32(centroid(2)), 3));
;
if s<16 && h>80;
    color='bialy';
elseif s<30.0 && v>20
    color='szary';
elseif v<20
    color='czarny';
elseif h<15 || h>330
    color='czerwony';
elseif h>15 && h<40
    color='pomaranczowy';
elseif h>40 && h<60
    color='zolty';
elseif h<175 && h>60
    color='zielony';
else
    color='niebieski';

end

