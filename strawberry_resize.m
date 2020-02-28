
for i=1:20
    name = "s" + i + ".JPG";
    im = imread(name);
    % resize image
    scale = sqrt((259*194) / (size(im,1)*size(im,2)));
    im = imresize(im, [size(im,1)*scale,size(im,2)*scale]);
    imwrite(im, "s"+i+"_resize.jpg");
end