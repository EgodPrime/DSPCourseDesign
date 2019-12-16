% --------------------参数介绍--------------------
% method    : 隐藏信息的方法(LSB,ECHO,DCT)
% op_type   : 隐藏种类([IMG/AUDIO/TXT]_IN_[IMG/AUDIO])
% file1     : 宿主文件
% file2     : 隐藏文件
% --------------------example--------------------
% hide("DCT","IMG_IN_IMG","cat.jpg","dog.jpg")
function hide(method,op_type,file1,file2)
%% 获得完整操作类型并检查是否支持
full_op = strcat(method,"_",op_type);
if ~ifSupport(full_op)
    error("暂不支持该类型的信息隐藏！");
end
%% 数据加载
% 文件类型分析
tokens = strsplit(op_type,"_");
source_type = tokens(3);
info_type = tokens(1);
[source,info,extra] = load_data(source_type,info_type,file1,file2);
%% 执行隐藏算法
fprintf("对%s和%s进行%s的信息隐藏操作\n",file1,file2,method);
args = {method,source_type,info_type,source,info,extra};
doTask(args);
end