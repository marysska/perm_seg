function [color] = znajdz_kolor(centroid, Image)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% pixList Xx2 
% 
% siz=size(pixList);
% x=siz(1);

h=0.0;
s=0.0;
v=0.0;

% for i=1:1:x
%    hsv=rgb2hsv(Image(int32(pixList(i, 1)), int32(pixList(i,2)), :));
%    h=h+double(hsv(1, 1, 1));
%    s=s+double(hsv(1, 1, 2));
%    v=v+double(hsv(1, 1, 3));
% end

for i=-3:1:3
   for j=-3:1:3
       hsv=rgb2hsv(Image(int32(centroid(1))+i, int32(centroid(2))+j, :));
       h=h+double(hsv(1, 1, 1));
       s=s+double(hsv(1, 1, 2));
       v=v+double(hsv(1, 1, 3));
   end
end
    h=h/49*360;
    s=s/49*100;
    v=v/49*100;
    
%        hsv=double(Image(int32(centroid(1)), int32(centroid(2)), :));
%        r=r+double(Image(int32(centroid(1)), int32(centroid(2)), 1));
%        g=g+double(Image(int32(centroid(1)), int32(centroid(2)), 2));
%        b=b+double(Image(int32(centroid(1)), int32(centroid(2)), 3));

    color='sraka';

end
