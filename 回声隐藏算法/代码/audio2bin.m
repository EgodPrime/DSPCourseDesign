% 将音频信号转换为带符号的8位二进制信号
% 输入：1声道音频（推荐）或者2声道音频
%       形状：(m,1)或(m,2)
% 输出：二维二进制矩阵
%       形状：(m,8)
function bin = audio2bin(au)
% 合并双声道
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