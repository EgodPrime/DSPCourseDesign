@echo off
::被运行代码的路径
set file_dir=E:\GitRepositories\DSPCourseDesign
::待运行的命令
set cmd="add(%1,%2)"

matlab -nojvm -nodesktop -nosplash -sd %file_dir% -r %cmd%

::运行示例
::matlabCMDsample.bat 2.5 3.3