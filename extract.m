% --------------------��������--------------------
% method    : ������Ϣ�ķ���(LSB,ECHO,DCT)
% op_type   : ��������([IMG/AUDIO/TXT]_IN_[IMG/AUDIO])
% file1     : �����ļ�
% --------------------example--------------------
% extract("DCT","IMG_IN_IMG","cat_in_dog.jpg")
function extract(method,op_type,file1)
full_op = strcat(method,"_",op_type);
if ~ifSupport(full_op)
    error("�ݲ�֧�ָ����͵���Ϣ���أ�");
end
fprintf("��%s����%s����Ϣ��ȡ����\n",file1,full_op);
end