% ��ѯ�������Ƿ�֧��ĳ������
% configs �����ļ�����
% key ĳ������
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