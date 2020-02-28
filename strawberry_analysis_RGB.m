
R_s=[];
G_s=[];
B_s=[];
R_ns=[];
G_ns=[];
B_ns=[];

for i=1:20
    im = imread("s" + i + "_resize.jpg");
    mask = int8(imread("s" + i + "_mask.bmp"));
    % tally stats
    im_r = im(:,:,1);
    R_s = [R_s; im_r(mask==1)];
    R_ns = [R_ns; im_r(mask==0)];
 
    im_g = im(:,:,2);
    G_s = [G_s; im_g(mask==1)];
    G_ns = [G_ns; im_g(mask==0)];
    
    im_b = im(:,:,3);
    B_s = [B_s; im_b(mask==1)];
    B_ns = [B_ns; im_b(mask==0)];
    
end

subplot(2,3,1);
imhist(R_s)
title("Strawberry red");
subplot(2,3,4);
imhist(R_ns)
title("Background red");
subplot(2,3,2);
imhist(G_s)
title("Strawberry green");
subplot(2,3,5);
imhist(G_ns)
title("Background green");
subplot(2,3,3);
imhist(B_s)
title("Strawberry blue");
subplot(2,3,6);
imhist(B_ns)
title("Background blue");