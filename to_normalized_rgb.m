function [out] = to_normalized_rgb(im)
    imdouble = cast(im, 'double');
    im_r = imdouble(:,:,1);
    im_g = imdouble(:,:,2);
    im_b = imdouble(:,:,3);
    
    im_sum = im_r + im_g + im_b;
    
    out = imdouble ./ im_sum;
    out(isnan(out)) = 0;
end