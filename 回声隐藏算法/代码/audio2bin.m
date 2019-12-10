% ����Ƶ�ź�ת��Ϊ�����ŵ�8λ�������ź�
% ���룺1������Ƶ���Ƽ�������2������Ƶ
%       ��״��(m,1)��(m,2)
% �������ά�����ƾ���
%       ��״��(m,8)
function bin = audio2bin(au)
% �ϲ�˫����
    if min(size(au))==2
        au = mean(au,2);
    end
    gau = gpuArray(au);
    bin = zeros(length(au),8);
    bin = gpuArray(bin);
    for i = 1:length(au)
        bin(i,:) = float2bin2(gau(i));
    end
    bin = gather(bin);
end