im = imread("s20_resize.bmp");
%imshow(im)
poly=roipoly(im)
poly=poly+roipoly(im)
imwrite(poly, "s20_mask.bmp")