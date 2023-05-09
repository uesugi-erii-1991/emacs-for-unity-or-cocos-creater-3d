@echo on
@REM 有错误,仅供参考
set file_path="%4" 
rem 找到Assets目录的前一层目录
echo %file_path%
set file_name=""

for %%a in ("%file_path:\=" "%") do (
    if "%%a" == ""Assets"" (
        echo %%a "true" %file_name%
        @REM set file_name=%%b
        @REM pause
        goto for_end 
    ) else (

        echo %%a "false" %file_name%
        echo %%a
        set file_name=%%a
        @REM pause
    )
    set file_name=%%a
    @REM echo "%file_name%" %file_name%
@REM   set  "file_name=%a%"
    
)

:for_end

echo %file_name%   ---11
echo %3
set line_num=+%3
if "%3"=="-1" (echo %3 ss00s) else (echo %3 ff2f)
if "%3"=="-1" (set line_num=+1) else (set line_num=+%3)
if "%3" == "-1" (echo %3 ss00s) else (echo %3 ff2f)

echo %line_num%  

set server_name=%file_name%
set "server_name=%server_name:"=%"


set "file_path=%file_path:"=%"
echo "a2 %file_path%"
echo %wslpath%
echo 1111
@REM for /f "delims=" %%i in ('wslpath "%file_path%"') do set wsl_file_path=%%i
echo ---
echo %server_name% -n %line_num% %wslpath%  
echo %server_name% -n %line_num% %file_path%  
@REM echo --server-file /mnt/wslg/runtime-dir/emacs/%server_name% -n %line_num% %file_path% 
echo ====


set "wslpath=%wslpath:"=%"
rem Convert Windows file path to WSL file path
wsl wslpath "%file_path%" > file_path1 2>&1
set /p wsl_file_path=<file_path1

echo %server_name% -n %line_num% %file_path1% 
@REM 根据 which emacsclient输出修改
call wsl /home/hy/.nix-profile/bin/emacsclient  --socket-name %server_name% -n %line_num% %wsl_file_path% 

pause