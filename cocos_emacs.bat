@echo off
set "file_path=%2"
rem 找到Assets目录的前一层目录
echo %file_path%
set file_name="cocos"

set HOME=%USERPROFILE%\AppData\Roaming

for %%a in ("%file_path:\=" "%") do (
    if "%%a" == ""assets"" (
        echo %%a "true" %file_name%
        goto for_end 
    ) else (

        echo %%a "false" %file_name%
        set file_name=%%a
    )
    set file_name=%%a
    
)
@REM pause

:for_end

echo %file_name%   ---11

set server_name=%file_name%
set "server_name=%server_name:"=%"
echo %server_name%  server_name

rem 检测 Emacs server 是否正在运行
call emacsclient --server-file %server_name% --eval "(+ 2 2)"
if %errorlevel% neq 0 (
    rem 如果Emacs server未运行，则启动之
    call emacs --daemon=%server_name%
)

echo %server_name% -n %line_num%  %file_path%
rem 使用 emacsclient 打开文件
call emacsclient --server-file %server_name% -n %file_path%  
echo %file_path%
echo %%2%
pause


