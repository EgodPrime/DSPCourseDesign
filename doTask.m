function doTask(args)
[method,source_type,info_type,source,info,extra] = args{1:end};
if strcmp(method,"LSB")
    addpath(genpath('./���Ҫλ�����㷨/����'));
    
elseif strcmp(method,"ECHO")
    addpath(genpath('./���������㷨/����'));
    
elseif strcmp(method,"DCT")
    addpath(genpath('./����DCT�������㷨/����'));
    if strcmp(source_type,"IMG") && strcmp(info_type,"IMG")
       source = IMGencodeIMG(source,info); 
    elseif strcmp(source_type,"IMG") && strcmp(info_type,"AUDIO")
       source = IMGencodeAUDIO(source,info); 
    elseif strcmp(source_type,"IMG") && strcmp(info_type,"TXT")
       source = IMGencodeTXT(source,info); 
    end
end
disp('������ɣ�');
export_data(source,source_type,extra);
end