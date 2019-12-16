function [type,shape] = searchFile(filePath,si)
    imgs = {'jpg','png','bmp'};
    audios = {'mp3','wav'};
    txt = 'txt';
    outs = {'source.txt','info.txt'};
    
    type = "";
    shape = "";
    
    if endsWith(filePath,imgs,'IgnoreCase',true)
        type = "IMG";
        data = imread(filePath);
        shape = strjoin(string(size(data)));
    elseif endsWith(filePath,audios,'IgnoreCase',true)
        type = "AUDIO";
        [data,~] = audioread(filePath);
        shape = strjoin(string(size(data)));
    elseif endsWith(filePath,txt,'IgnoreCase',true)
        type = "TXT";
        f = fopen(filePath);
        data = fread(f);
        shape = strjoin(string(size(data)));
    end

    f = fopen(outs{si},'w','n','UTF-8');
    fprintf(f,"%s-%s\n",type,shape);
    fclose(f);

end