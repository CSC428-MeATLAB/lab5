sb_h = [];
sb_s = [];
sb_v = [];
bg_h = [];
bg_s = [];
bg_v = [];

for i = 1:20
    img_file = strcat('Data_resized_part_a\s', int2str(i), '_resize.jpg');
    mask_file = strcat('Data_resized_masks_a\s', int2str(i), '_mask.bmp');
    im1 = imread(img_file);
    mask1 = imread(mask_file);
    [sb_h_new, sb_s_new, sb_v_new, bg_h_new, bg_s_new, bg_v_new] = hsv(im1, mask1);
    sb_h = [sb_h;sb_h_new];
    sb_s = [sb_s;sb_s_new];
    sb_v = [sb_v;sb_v_new];
    bg_h = [bg_h;bg_h_new];
    bg_s = [bg_s;bg_s_new];
    bg_v = [bg_v;bg_v_new];
end

figure;
subplot(2,3,1);
imhist(sb_h);
title('Strawberry Hue');
subplot(2,3,2);
imhist(sb_s);
title('Strawberry Saturation');
subplot(2,3,3);
imhist(sb_v);
title('Strawberry Value');
subplot(2,3,4);
imhist(bg_h);
title('Background Hue');
subplot(2,3,5);
imhist(bg_s);
title('Background Saturation');
subplot(2,3,6);
imhist(bg_v);
title('Background Value');

function [sb_h,sb_s,sb_v,bg_h,bg_s,bg_v]=hsv(img, mask)
    hsv_img = rgb2hsv(img);
    h = hsv_img(:,:,1);
    s = hsv_img(:,:,2);
    v = hsv_img(:,:,3);
    % Shift all the Hue values by 180 degrees
    h = h + 0.5;
    for row=1:size(h,1)
        for col=1:size(h,2)
            if h(row, col) > 1
                h(row,col) = h(row,col) - 1;
            end
        end
    end
    sb_h = h(mask==1);
    sb_s = s(mask==1);
    sb_v = v(mask==1);
    bg_h = h(mask==0);
    bg_s = s(mask==0);
    bg_v = v(mask==0);
end

