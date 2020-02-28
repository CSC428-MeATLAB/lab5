
Y_s=[];
Cb_s=[];
Cr_s=[];
Y_ns=[];
Cb_ns=[];
Cr_ns=[];

for i=1:20
    im = imread("s" + i + "_resize.jpg");
    im = rgb2ycbcr(im);
    mask = int8(imread("s" + i + "_mask.bmp"));
    % tally stats
    im_r = im(:,:,1);
    Y_s = [Y_s; im_r(mask==1)];
    Y_ns = [Y_ns; im_r(mask==0)];
 
    im_g = im(:,:,2);
    Cb_s = [Cb_s; im_g(mask==1)];
    Cb_ns = [Cb_ns; im_g(mask==0)];
    
    im_b = im(:,:,3);
    Cr_s = [Cr_s; im_b(mask==1)];
    Cr_ns = [Cr_ns; im_b(mask==0)];
    
end

subplot(2,3,1);
imhist(Y_s)
title("Strawberry Y'");
subplot(2,3,4);
imhist(Y_ns)
title("Background Y'");
subplot(2,3,2);
imhist(Cb_s)
title("Strawberry Cb");
subplot(2,3,5);
imhist(Cb_ns)
title("Background Cb");
subplot(2,3,3);
imhist(Cr_s)
title("Strawberry Cr");
subplot(2,3,6);
imhist(Cr_ns)
title("Background Cr");