    function au = bin2audio(bin)
    % ?¡¤¡À?bin?? m x 8 ??¡Á??????¨®
    bin = reshape(bin,[],8);
    
    bin = gpuArray(bin);
    au = gpuArray.rand(size(bin,1),1);
    
    for i = 1:size(bin,1)
        au(i) = bin2float2(bin(i,:));
    end
    
    au = gather(au);
end