% 查询配置中是否支持某种运算
% configs 配置文件对象
% key 某种运算
function bool = ifSupport(key)
    configs = getConfig();
    len = length(configs{1});
    bool = 'not found!';
    for i = 1:len
        if strcmp(key,configs{1}{i})
           bool = boolean(configs{2}(i));
        end
    end
end