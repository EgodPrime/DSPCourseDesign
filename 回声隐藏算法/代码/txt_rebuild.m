function[binmark]=txt_rebuild(bintxt,ori_sample,es1)
%����
binmark=decode(length(bintxt),ori_sample,es1);
binmark=bin2txt(binmark);
end
% disp(bin2txt(binmark));
