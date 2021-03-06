function [BW,maskedImage] = segmentImage(X)
%segmentImage Segment image using auto-generated code from imageSegmenter App
%  [BW,MASKEDIMAGE] = segmentImage(X) segments image X using auto-generated
%  code from the imageSegmenter App. The final segmentation is returned in
%  BW, and a masked image is returned in MASKEDIMAGE.

% Auto-generated by imageSegmenter app on 14-May-2019
%----------------------------------------------------


% Threshold image - global threshold
BW = imbinarize(X);

% Close mask with disk
radius = 12;
decomposition = 4;
se = strel('disk', radius, decomposition);
BW = imclose(BW, se);

% Erode mask with disk
radius = 3;
decomposition = 4;
se = strel('disk', radius, decomposition);
BW = imerode(BW, se);

% Create masked image.
maskedImage = X;
maskedImage(~BW) = 0;