@echo off

::被运行代码的路径
set file_dir=%1
::待运行的命令
set cmd=%2

matlab -nojvm -nodesktop -nosplash -sd %file_dir% -r %cmd%

