function [configs] = getConfig()
f = fopen('config.config');
configs = textscan(f,'%s %d');
end

