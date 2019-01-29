function [H_unrot,x,y] = autocalib(image)
    % black&white
    im_BW = (image(:,:,1)/3 + image(:,:,2)/3 + image(:,:,3)/3);
    % crop & threshold
    threshold = 0.8*255;
    crop = 30;
    im_thres = im_BW(crop:size(im_BW,1)-crop,crop:size(im_BW,2)-crop)<threshold;
    % erode & dilate
    im_er = single(imopen(im_thres,strel('disk',3)));
    % apply Gaussian filter
    sigma = 5;
    im_gauss = imgaussfilt(im_er,sigma);
    % find peaks
    peaks = imregionalmax(im_gauss);
    [y,x] = find(peaks);
    y = y + crop - 1;
    x = x + crop - 1;
    % sort peaks (approx. sort +-5px)
    [~,I] = sortrows(round([y x]/5));
    x = x(I);
    y = y(I);
    % reduce the number of peaks
    xsize = size(x,1);
    while (xsize>64)
        xdiff = diff(x);
        ydiff = diff(y);
        p_dist = xdiff.^2 + ydiff.^2;
        [~,idx] = min(p_dist);
        new_x = zeros(size(x,1)-1,1);
        new_y = zeros(size(x,1)-1,1);
        if (idx>1)
            new_x(1:idx-1) = x(1:idx-1);
            new_y(1:idx-1) = y(1:idx-1);
        end
        new_x(idx) = (x(idx)+x(idx+1))/2;
        new_y(idx) = (y(idx)+y(idx+1))/2;
        new_x(idx+1:end) = x(idx+2:end);
        new_y(idx+1:end) = y(idx+2:end);
        x = new_x;
        y = new_y;
        xsize = xsize-1;
    end
    
    x_trans_real = [-1*(-0.035:0.01:0.035),-1*(-0.035:0.01:0.035),-1*(-0.035:0.01:0.035),-1*(-0.035:0.01:0.035),-1*(-0.035:0.01:0.035),-1*(-0.035:0.01:0.035),-1*(-0.035:0.01:0.035),-1*(-0.035:0.01:0.035)];
    y_trans_real = [0.035*ones(1,8),0.025*ones(1,8),0.015*ones(1,8),0.005*ones(1,8),-0.005*ones(1,8),-0.015*ones(1,8),-0.025*ones(1,8),-0.035*ones(1,8)] ;
    zs1 = [x'; y'];
    zs2 = [x_trans_real; y_trans_real];

    H_unrot = vgg_H_from_x_lin(zs1,zs2);