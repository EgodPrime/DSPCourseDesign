function[binmark]=txt_rebuild(bintxt,ori_sample,es1)
%½âÂë
binmark=decode(length(bintxt),ori_sample(:,1),es1);
end
% disp(bin2txt(binmark));
