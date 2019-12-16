% --------------------参数介绍--------------------
% method    : 隐藏信息的方法(LSB,ECHO,DCT)
% op_type   : 隐藏种类([IMG/AUDIO/TXT]_IN_[IMG/AUDIO])
% file1     : 宿主文件
% --------------------example--------------------
% extract("DCT","IMG_IN_IMG","cat_in_dog.jpg")
function extract(method,op_type,file1)
full_op = strcat(method,"_",op_type);
if ~ifSupport(full_op)
    error("暂不支持该类型的信息隐藏！");
end
fprintf("对%s进行%s的信息提取操作\n",file1,full_op);
end