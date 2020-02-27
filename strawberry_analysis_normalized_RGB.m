R_sb = [];
G_sb = [];
B_sb = [];
R_bg = [];
G_bg = [];
B_bg = [];
for i = 1:20
    mask = imread("masks/s" + i + "_mask.bmp");
    im = imread("part1resized/s" + i + "_resize.jpg");
    
    % normalize RGB
    im_r = cast(im(:,:,1), 'double');
    im_g = cast(im(:,:,2), 'double');
    im_b = cast(im(:,:,3), 'double');
    
    im_sum = im_r + im_g + im_b;
    im_r_norm = im_r ./ im_sum;
    im_g_norm = im_g ./ im_sum;
    im_b_norm = im_b ./ im_sum;
    
    R_sb = [R_sb; im_r_norm(mask == 1)];
    G_sb = [G_sb; im_g_norm(mask == 1)];
    B_sb = [B_sb; im_b_norm(mask == 1)];
    
    R_bg = [R_bg; im_r_norm(mask == 0)];
    G_bg = [G_bg; im_g_norm(mask == 0)];
    B_bg = [B_bg; im_b_norm(mask == 0)];
end

subplot(2,3,1);
imhist(R_sb);
title("Strawberry R");

subplot(2,3,2);
imhist(G_sb);
title("Strawberry G");

subplot(2,3,3);
imhist(B_sb);
title("Strawberry B");

subplot(2,3,4);
imhist(R_bg);
title("Background R");

subplot(2,3,5);
imhist(G_bg);
title("Background G");

subplot(2,3,6);
imhist(B_bg);
title("Background B");