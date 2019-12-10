% sound1=reshape(es2,8192000,1);
% sound2=ori_sample(8192000:10725744,1);
% sound3=[sound1;sound2];
% sound(sound3,44100)   

sound1=reshape(es1,528000,1);
sound2=ori_sample(528000:10725744,1);
sound3=[sound1;sound2];
sound(sound3,44100)  