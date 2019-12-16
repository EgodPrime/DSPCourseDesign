function [source,info,extra] = load_data(type1,type2,file1,file2)
fs1 = 0;fs2 = 0;
% ���������ļ�
if strcmp(type1,"IMG")
   try
       source = imread(file1);
   catch
       error("�����ļ�������ָ�����Ͳ�ƥ�䣡");
   end
elseif strcmp(type1,"AUDIO")
   try
       [source,fs1] = audioread(file1);
   catch
       error("�����ļ�������ָ�����Ͳ�ƥ�䣡");
   end 
end
% ���������ļ�
if strcmp(type2,"IMG")
   try
       info = imread(file2);
   catch
       error("�����ļ�������ָ�����Ͳ�ƥ�䣡");
   end
elseif strcmp(type2,"AUDIO")
   try
       [info,fs2] = audioread(file2);
   catch
       error("�����ļ�������ָ�����Ͳ�ƥ�䣡");
   end
elseif strcmp(type2,"TXT")
   try
       info = "";
       f = fopen(file2);
       t = fgetl(f);
       while t ~= -1
           info = strcat(info,t);
           t = fgetl(f);
       end
   catch
       error("�����ļ�������ָ�����Ͳ�ƥ�䣡");
   end 
end
extra = [fs1,fs2];
end