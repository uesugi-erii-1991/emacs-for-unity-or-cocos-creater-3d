@echo off
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



rem 检测 Emacs server 是否正在运行
call wsl /root/.nix-profile/bin/emacsclient --server-file %server_name% --eval "(+ 2 2)"
if %errorlevel% neq 0 (
    rem 如果Emacs server未运行，则启动之
    @REM call wsl emacs -nw --daemon=%server_name% 
    call wsl /root/.nix-profile/bin/emacs --daemon=%server_name% 
    @REM --with-x-toolkit=lucid
)

rem Convert Windows file path to WSL file path
wsl wslpath  %file_path%
echo 000
echo a1 "%file_path%"
set "file_path=%file_path:"=%"
echo "a2 %file_path%"
echo %wslpath%
echo 1111
@REM for /f "delims=" %%i in ('wslpath "%file_path%"') do set wsl_file_path=%%i
echo ---
echo %server_name% -n %line_num% %wslpath%  
echo %server_name% -n %line_num% %file_path%  
echo ====
rem 使用 emacsclient 打开文件
@REM call wsl /root/.nix-profile/bin/emacsclient  --server-file %server_name% -n %line_num% %file_path% 
call wsl /root/.nix-profile/bin/emacsclient  -s %server_name% -n %line_num% %file_path%   
@REM call wsl /root/.nix-profile/bin/emacs %file_path%  
pause