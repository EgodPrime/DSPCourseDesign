function export_data(data,data_type,extra)
    if ~ exist('output','dir')
        mkdir 'output'
    end
    if strcmp(data_type,"IMG")
       if max(max(max(data)))>10
           data = data/256;
       end
       imwrite(data,'output/hsource.png'); 
       fprintf('�����ļ�%s��outputĿ¼\n','hsource.png');
    elseif strcmp(data_type,"AUDIO")
       audiowrite("output/hsource.wav",data,extra(1));
    end
end