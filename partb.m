for i = 1:1
    k = 3;
    im = imread("partb/t" + i + ".JPG");
    [m,n,comps] = size(im);
    feature = reshape(im,m*n,comps);
    rng(0);
    idx = kmeans(cast(feature, 'double'),k);
    result = reshape(idx,m,n);
    
    for cluster = 1:k
        out = zeros(m,n);
        %shape = strel('disk', 5);
        %labels = bwlabel(imdilate(result == cluster, shape));
        labels = bwlabel(result == cluster);
        num_labels = max(labels(:));
        for label = 0:num_labels
            mask = cast(labels == label, 'uint8');
            %mask = imerode(mask, shape);
            im_masked = im .* mask;
            num_px = sum(mask(:));

            norm_rgb = to_normalized_rgb(im_masked);
            r_avg = sum(norm_rgb(:,:,1), 'all') / num_px;
            if r_avg > 0.5 && (num_px / (m * n) > 0.01)
                figure;
                imshow(im_masked);
            end
        end
    end
end