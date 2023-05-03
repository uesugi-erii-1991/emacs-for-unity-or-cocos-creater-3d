@echo off
set PARAM1=value1
set PARAM2=value2
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
        echo %%a
        set file_name=%%a
        @REM pause
    )
    set file_name=%%a
    
)
pause

:for_end

echo %file_name%   ---11
@REM @REM pause
@REM echo %3
@REM @REM pause
@REM @REM 下面注释掉
@REM set line_num=+%3
@REM echo %3 3---
@REM set "%3=%%3:"=%"
@REM if "%3"=="-1" (echo %3 ss00s) else (echo %3 ff2f)
@REM if "%3"=="-1" (set line_num=+1) else (set line_num=+%3)
@REM @REM if "%3"==-1 (set linnum=+1) else (set line_num=+%3)
@REM if "%3" == "-1" (echo %3 ss00s) else (echo %3 ff2f)

@REM echo %line_num%  

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
@REM pause
rem 使用 emacsclient 打开文件
@REM call emacsclient --server-file %server_name% -n %line_num%  %file_path%  
@REM call emacsclient --server-file %server_name% -n %file_path%  
call emacsclient --server-file %server_name% -n %file_path%  
echo %file_path%
echo %%2%
@REM call emacsclient %2

pause
@REM echo 成功打开文件 %file_path% ，指定行号为：%line_num%
@REM 



