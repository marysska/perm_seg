figure(1)
hold on
for i=1:1:34
    plot(properties(i).PixelList(:, 1), properties(i).PixelList(:, 2)); 
end

hold off;