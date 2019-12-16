% --------------------��������--------------------
% method    : ������Ϣ�ķ���(LSB,ECHO,DCT)
% op_type   : ��������([IMG/AUDIO/TXT]_IN_[IMG/AUDIO])
% file1     : �����ļ�
% file2     : �����ļ�
% --------------------example--------------------
% hide("DCT","IMG_IN_IMG","cat.jpg","dog.jpg")
function hide(method,op_type,file1,file2)
%% ��������������Ͳ�����Ƿ�֧��
full_op = strcat(method,"_",op_type);
if ~ifSupport(full_op)
    error("�ݲ�֧�ָ����͵���Ϣ���أ�");
end
%% ���ݼ���
% �ļ����ͷ���
tokens = strsplit(op_type,"_");
source_type = tokens(3);
info_type = tokens(1);
[source,info,extra] = load_data(source_type,info_type,file1,file2);
%% ִ�������㷨
fprintf("��%s��%s����%s����Ϣ���ز���\n",file1,file2,method);
args = {method,source_type,info_type,source,info,extra};
doTask(args);
end