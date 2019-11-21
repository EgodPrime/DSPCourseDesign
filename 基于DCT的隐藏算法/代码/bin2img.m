function img = bin2img(bin,shape)
    bin = reshape(bin,4,[]);
    img = zeros(shape(1)*shape(2)*shape(3),1);
    for i = 1:shape(1)*shape(2)*shape(3)
        img(i) = bin2uint8([bin(:,i);0;0;0;0]);
    end
    img = img/255;
    img = reshape(img,shape);
end