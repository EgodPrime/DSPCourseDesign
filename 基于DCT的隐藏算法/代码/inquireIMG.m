function content = inquireIMG(img)
    [h,w,c] = size(img);
    content = h*w*c/8;
end